//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import "AWSGZIP.h"
#import "AWSMobileAnalyticsEncryptedBufferedReader.h"
#import "AWSMobileAnalyticsBufferedReader.h"
#import "AWSCocoaLumberjack.h"

@interface AWSMobileAnalyticsCrypto : NSObject

@property(nonatomic) NSString *secretKey;

+ (AWSMobileAnalyticsCrypto *)cryptoWithSecretKey:(NSString *)theSecretKey;

+ (AWSMobileAnalyticsCrypto *) cryptoWithSecretKey:(NSString *)theSecretKey
                                  withOptSecretKey:(NSString *)theOptSecretKey
                                        withPrefix:(NSString *)thePrefix;

- (NSData *)encryptData:(NSData *)dataToEncrypt;
- (NSData *)decryptData:(NSData *)dataToDecrypt;

@end

@implementation AWSMobileAnalyticsCrypto


+ (AWSMobileAnalyticsCrypto *)cryptoWithSecretKey:(NSString *)theSecretKey {
    return [[AWSMobileAnalyticsCrypto alloc] initWithSecretKey:theSecretKey];
}

+(AWSMobileAnalyticsCrypto*) cryptoWithSecretKey:(NSString *)theSecretKey
                                withOptSecretKey:(NSString *)theOptSecretKey
                                      withPrefix:(NSString *)thePrefix {
    NSString *key = theOptSecretKey;
    if(theSecretKey != nil) {
        key = theSecretKey;
    }

    NSString *prefix = thePrefix;
    if([prefix length] > 16) {
        prefix = [prefix substringToIndex:16];
    }
    key = [prefix stringByAppendingString:key];

    return [[AWSMobileAnalyticsCrypto alloc] initWithSecretKey:key];
}

-(id) initWithSecretKey:(NSString*)secretKey {
    if(self = [super init]) {
        self.secretKey = secretKey;
    }
    return self;
}

-(NSData *)encryptData:(NSData *)dataToEncrypt {
    //    return dataToEncrypt;
    return [AWSMobileAnalyticsCrypto AES128EncryptDecrypt:dataToEncrypt
                                            withOperation:kCCEncrypt
                                                  withKey:self.secretKey];
}

-(NSData *)decryptData:(NSData *)dataToDecrypt {
    //    return dataToDecrypt;
    return [AWSMobileAnalyticsCrypto AES128EncryptDecrypt:dataToDecrypt
                                            withOperation:kCCDecrypt
                                                  withKey:self.secretKey];
}

+ (NSData *)AES128EncryptDecrypt:(NSData*)theData
                   withOperation:(CCOperation)operation
                         withKey:(NSString*)key {
    // convert to C string...
    NSUInteger keySize = [key length];
    char keyPtr[keySize];
    memset(keyPtr, '\0', keySize);
    [key getCString:keyPtr
          maxLength:sizeof(keyPtr)
           encoding:NSUTF8StringEncoding];

    // encode/decode
    NSUInteger dataLength = [theData length];
    size_t bufferSize = (dataLength / kCCBlockSizeAES128 + 1) * kCCBlockSizeAES128;
    void *buffer = calloc(bufferSize, sizeof(char));

    size_t numBytesOut = 0;
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCKeySizeAES128,
                                          NULL,
                                          [theData bytes],
                                          [theData length],
                                          buffer,
                                          bufferSize,
                                          &numBytesOut);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer
                                    length:numBytesOut
                              freeWhenDone:YES];
    }

    free(buffer);
    return nil;
}

@end

@interface AWSMobileAnalyticsEncryptedBufferedReader()

@property(nonatomic) AWSMobileAnalyticsCrypto *crypto;
@property(nonatomic) AWSMobileAnalyticsBufferedReader *reader;

@end

@implementation AWSMobileAnalyticsEncryptedBufferedReader

+(AWSMobileAnalyticsEncryptedBufferedReader*)readerWithReader:(AWSMobileAnalyticsBufferedReader *)reader
                                                    secretKey:(NSString *)secretKey {
    AWSMobileAnalyticsCrypto *crypto = [AWSMobileAnalyticsCrypto cryptoWithSecretKey:secretKey];
    return [[AWSMobileAnalyticsEncryptedBufferedReader alloc] initWithWithReader:reader
                                                                      withCrypto:crypto];
}

-(id)initWithWithReader:(AWSMobileAnalyticsBufferedReader*)reader
             withCrypto:(AWSMobileAnalyticsCrypto*)crypto {
    if(self = [super init]) {
        self.crypto = crypto;
        self.reader = reader;
    }
    return self;
}

-(BOOL)readLine:(NSString**)line withError:(NSError**)readError {
    NSString *decryptedString = nil;
    NSString *readLine = nil;
    NSError *error = nil;

    BOOL lineReadSuccess = [self.reader readLine:&readLine withError:&error];
    if(lineReadSuccess && readLine != nil) {
        // Decode data into binary form
        NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:readLine options:kNilOptions];

        // Pull off checksum at end to validate with unobfuscated data later
        NSInteger sha1StartIndex = [decodedData length] - CC_SHA1_DIGEST_LENGTH;
        if (sha1StartIndex < 0) {
            AWSDDLogError(@"Checksum length is negative" );
        } else {
            unsigned char expectedDigest[CC_SHA1_DIGEST_LENGTH];
            [decodedData getBytes:expectedDigest
                            range:NSMakeRange(sha1StartIndex, CC_SHA1_DIGEST_LENGTH)];
            NSData *payloadData = [decodedData subdataWithRange:NSMakeRange(0, sha1StartIndex)];

            NSData *toBeDecryptedData = payloadData;
            NSData *decryptedData = [self.crypto decryptData:toBeDecryptedData];

            // Decompressing data
            NSData *originalData = [decryptedData awsgzip_gunzippedData];
            AWSDDLogVerbose(@"Decompressed data from %lu bytes to %lu bytes successfully", (unsigned long)[decryptedData length], (unsigned long)[originalData length]);

            // Getting checksum from deobfuscated data and checking to see it matches
            unsigned char realDigest[CC_SHA1_DIGEST_LENGTH];

            // SHA-1 Can only support 32 bit numbers, must explicitly cast length because 64 bit NSUInteger may be larger than 4 bytes
            if(!CC_SHA1([originalData bytes], (CC_LONG)[originalData length], realDigest) ||
               memcmp(expectedDigest, realDigest, CC_SHA1_DIGEST_LENGTH)) {
                AWSDDLogError(@"Checksum of digest and decrypted data does not match");
            } else {
                decryptedString = [[NSString alloc] initWithData:originalData
                                                        encoding:NSUTF8StringEncoding];
            }
        }
    }

    if(line != nil) {
        *line = decryptedString;
    }

    if(error != nil && readError != nil) {
        *readError = error;
    }
    
    return (error == nil);
}

-(void)close {
    [self.reader close];
}

@end
