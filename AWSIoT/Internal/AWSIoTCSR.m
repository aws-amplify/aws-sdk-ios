//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSIoTCSR.h"
#import "AWSIOTService.h"
#import "AWSIoTKeychain.h"

unsigned char seqTag = 0x30;
unsigned char setTag = 0x31;

@interface AWSIoTCSR () {
    NSString* _commonName;
    NSString* _countryName;
    NSString* _organizationName;
    NSString* _organizationalUnitName;
    
    NSData *_publicKeyBits;
}

@end

@implementation AWSIoTCSR


- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultIOT` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithCommonName:(NSString*)commonName countryName:(NSString*)countryName organizationName:(NSString*)organizationName organizationalUnitName:(NSString*)organizationalUnitName {
    
    if (self = [super init]) {
        _commonName = commonName;
        _countryName = countryName;
        _organizationName = organizationName;
        _organizationalUnitName = organizationalUnitName;
    }
    
    return self;
}

- (NSData*)generateCSRForCertificate:(NSString*)certificateId {
    
    if (!certificateId) {
        return nil;
    }
    
    NSString *publicTag = [AWSIoTKeychain.publicKeyTag stringByAppendingString:certificateId];
    NSString *privateTag = [AWSIoTKeychain.privateKeyTag stringByAppendingString:certificateId];
    
    _publicKeyBits = [AWSIoTKeychain getPublicKeyBits:publicTag];
    SecKeyRef privateKeyRef = [AWSIoTKeychain getPrivateKeyRef:privateTag];

    if (!_publicKeyBits || !privateKeyRef) {
        return nil;
    }
    
    NSMutableData * certRequestData = [self createCertificateRequestData];
    
    CC_SHA1_CTX SHA1Struct;
    CC_SHA1_Init(&SHA1Struct);
    CC_SHA1_Update(&SHA1Struct, [certRequestData mutableBytes], (unsigned int)[certRequestData length]);
    unsigned char SHA1Digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(SHA1Digest, &SHA1Struct);
    
    unsigned char sig[256];
    size_t sigLen = sizeof(sig);
    OSStatus sanityCheck = SecKeyRawSign(privateKeyRef, kSecPaddingPKCS1SHA1, SHA1Digest, sizeof(SHA1Digest), sig, &sigLen);
    if (sanityCheck != noErr) {
        return nil;
    }
    
    NSMutableData * scr = [[NSMutableData alloc] initWithData:certRequestData];
    unsigned char tag[] = {0x30, 0x0D, 0x06, 0x09, 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 1, 1, 5, 0x05, 0x00};
    [scr appendBytes:tag length:sizeof(tag)];
    
    NSMutableData * signdata = [NSMutableData new];
    unsigned char null = 0;
    [signdata appendBytes:&null length:1];
    [signdata appendBytes:sig length:sigLen];
    
    char strBitType = 0x03;
    [scr appendBytes:&strBitType length:1];
    [self appendLength:[signdata length] intoData:scr];
    [scr appendData:signdata];
    
    [self addByte:seqTag intoData:scr];
    
    return [scr copy];
}


- (NSMutableData*)createCertificateRequestData {
   
    NSMutableData *certRequestData = [NSMutableData new];
    
    [self addVersion:certRequestData];
    
    [certRequestData appendData:[self createCertInformation]];
    
    [certRequestData appendData:[self createPublicKeyDataForCSR]];
    
    unsigned char attributes[2] = {0xA0, 0x00};
    [certRequestData appendBytes:attributes length:sizeof(attributes)];
    [self addByte:seqTag intoData:certRequestData];
     
    return certRequestData;
}

- (void)addVersion:(NSMutableData*)certRequestData {
    unsigned char version[3] = {0x02, 0x01, 0x00};
    [certRequestData appendBytes:version length:sizeof(version)];
}

- (NSData*)createCertInformation {
    NSMutableData *certInformationData = [NSMutableData new];
    
    if (_countryName) {
        unsigned char countryType[5] = {0x06, 0x03, 0x55, 0x04, 0x06};
        [self appendInfo:_countryName forType:countryType intoData:certInformationData];
    }
    if (_organizationName) {
        unsigned char organizationType[5] = {0x06, 0x03, 0x55, 0x04, 0x0A};
        [self appendInfo:_organizationName forType:organizationType intoData:certInformationData];
    }
    if (_organizationalUnitName) {
        unsigned char organizationalUnitType[5] = {0x06, 0x03, 0x55, 0x04, 0x0B};
        [self appendInfo:_organizationalUnitName forType:organizationalUnitType intoData:certInformationData];
    }
    if (_commonName) {
        unsigned char commonType[5] = {0x06, 0x03, 0x55, 0x04, 0x03};
        [self appendInfo:_commonName forType:commonType intoData:certInformationData];
    }
    
    [self addByte:seqTag intoData:certInformationData];
    return [certInformationData copy];
}

- (void)appendInfo:(NSString*)info forType:(unsigned char[5])type intoData:(NSMutableData *)data {
    NSMutableData *infoData = [NSMutableData new];
    [infoData appendBytes:type length:5];
    char stringTag = 0x0C;
    [infoData appendBytes:&stringTag length:1];
    [self appendLength:[info lengthOfBytesUsingEncoding:NSUTF8StringEncoding] intoData:infoData];
    [infoData appendData:[info dataUsingEncoding:NSUTF8StringEncoding]];
    
    [self addByte:seqTag intoData:infoData];
    [self addByte:setTag intoData:infoData];
    
    [data appendData:infoData];
}

- (void)addByte:(unsigned char)byte intoData:(NSMutableData *)data {
    NSMutableData* newData = [NSMutableData dataWithBytes:&byte length:1];
    [self appendLength:[data length] intoData:newData];
    [newData appendData:data];
    [data setData:newData];
}

- (void)appendLength:(NSInteger)length intoData:(NSMutableData *)data {
    if (length < 128) {
        unsigned char d[1] = {length};
        [data appendBytes:&d length:1];
    } else if (length < 0x100) {
        unsigned char d[2] = {0x81, length & 0xFF};
        [data appendBytes:&d length:2];
    } else if (length < 0x8000) {
        unsigned char d[3] = {0x82, (length & 0xFF00) >> 8, length & 0xFF};
        [data appendBytes:&d length:3];
    }
}

- (NSData *)createPublicKeyDataForCSR {
    
    NSMutableData *publicKeyData = [NSMutableData new];
    
    unsigned char tag[] = {0x06, 0x09, 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01, 0x01, 0x05, 0x00};
    [publicKeyData appendBytes:tag length:sizeof(tag)];
    [self addByte:seqTag intoData:publicKeyData];
    
    NSMutableData *ASNKeyData = [NSMutableData new];
    
    char integerTag = 0x02;
    [ASNKeyData appendBytes:&integerTag length:1];
    NSData *publicKeyMod = [self getPublicKeyMod];
    [self appendLength:[publicKeyMod length] intoData:ASNKeyData];
    [ASNKeyData appendData:publicKeyMod];
    
    NSData *publicKeyExp = [self getPublicKeyExp];
    [ASNKeyData appendBytes:&integerTag length:1];
    [self appendLength:[publicKeyExp length] intoData:ASNKeyData];
    [ASNKeyData appendData:publicKeyExp];
    
    [self addByte:seqTag intoData:ASNKeyData];
    
    NSMutableData* newData = [NSMutableData new];
    unsigned char byte = 0x00;
    [newData appendBytes:&byte length:1];
    [newData appendData:ASNKeyData];
    [ASNKeyData setData:newData];
    
    char strBitType = 0x03;
    [publicKeyData appendBytes:&strBitType length:1];
    [self appendLength:[ASNKeyData length] intoData:publicKeyData];
    [publicKeyData appendData:ASNKeyData];

    [self addByte:seqTag intoData:publicKeyData];
    
    return [publicKeyData copy];
}


- (NSData*)getPublicKeyExp {
    NSData* pk = _publicKeyBits;
    if (pk == NULL) return NULL;
    
    int iterator = 0;
    
    iterator++; // TYPE - bit stream - mod + exp
    [self derEncodingGetSizeFrom:pk at:&iterator]; // Total size
    
    iterator++; // TYPE - bit stream mod
    int mod_size = [self derEncodingGetSizeFrom:pk at:&iterator];
    iterator += mod_size;
    
    iterator++; // TYPE - bit stream exp
    int exp_size = [self derEncodingGetSizeFrom:pk at:&iterator];
    
    return [pk subdataWithRange:NSMakeRange(iterator, exp_size)];
}

- (NSData*)getPublicKeyMod {
    NSData *pk = _publicKeyBits;
    if (pk == NULL) return NULL;
    
    int iterator = 0;
    
    iterator++; // TYPE - bit stream - mod + exp
    [self derEncodingGetSizeFrom:pk at:&iterator]; // Total size
    
    iterator++; // TYPE - bit stream mod
    int mod_size = [self derEncodingGetSizeFrom:pk at:&iterator];
    
    return [pk subdataWithRange:NSMakeRange(iterator, mod_size)];
}

- (int)derEncodingGetSizeFrom:(NSData*)buf at:(int*)iterator {
    const uint8_t* data = [buf bytes];
    int itr = *iterator;
    int num_bytes = 1;
    int ret = 0;
    
    if (data[itr] > 0x80) {
        num_bytes = data[itr] - 0x80;
        itr++;
    }
    
    for (int i = 0 ; i < num_bytes; i++) ret = (ret * 0x100) + data[itr + i];
    
    *iterator = itr + num_bytes;
    return ret;
}

@end
