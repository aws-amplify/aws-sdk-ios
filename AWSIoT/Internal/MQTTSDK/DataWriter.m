//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "DataWriter.h"
#import "AWSCore.h"

@interface DataWriter ()

@property int counter;
@property dispatch_queue_t writerQueue;

@end

@implementation DataWriter

#pragma mark - Public API

+(BOOL) dataWritingEnabled {
#if DEBUG
    return NO;
#else
    return NO;
#endif
}

-(instancetype) initWithTag:(NSString *)tag {
    if (self = [super init]) {
        _counter = 0;

        _writerQueue = dispatch_queue_create_with_target("com.amazonaws.AWSIoT.DataWriter.writer",
                                                         DISPATCH_QUEUE_SERIAL,
                                                         dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));

        NSString *normalizedTag = [DataWriter normalizedTagForString:tag];

        NSError *error;
        _directory = [DataWriter createDirectoryPathForTag:normalizedTag error:&error];
        if (error) {
            AWSDDLogError(@"Error creating temporary directory: %@", error);
        } else {
            AWSDDLogDebug(@"Created DataWriter directory at %@", _directory);
        }
    }
    return self;
}

-(void) writeData:(NSData *)data {
    dispatch_async(self.writerQueue, ^{
        if (![DataWriter dataWritingEnabled]) {
            return;
        }

        if (!self.directory) {
            return;
        }

        self.counter += 1;
        NSString *fileName = [DataWriter fileNameForCounter:self.counter];
        NSURL *file = [self.directory URLByAppendingPathComponent:fileName];
        if ([data writeToURL:file atomically:NO]) {
            AWSDDLogDebug(@"Wrote %lu bytes to file %@", data.length, file);
        } else {
            AWSDDLogError(@"Error writing data to file %@", file);
        }
    });
}

#pragma mark - Private

+(NSURL *)createDirectoryPathForTag:(NSString *)tag
                              error:(out NSError *__autoreleasing  _Nullable * _Nullable)error {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSURL *path = [[fm temporaryDirectory] URLByAppendingPathComponent:tag];

    NSString *timestamp = [NSString stringWithFormat:@"%lu",
                           (unsigned long)[[NSDate new] timeIntervalSince1970] * 1000];
    path = [path URLByAppendingPathComponent:timestamp];

    [fm createDirectoryAtURL:path withIntermediateDirectories:YES attributes:nil error:error];
    return path;
}

+(NSString *)fileNameForCounter:(int)counter {
    NSDate *now = [NSDate new];
    double timestamp = [now timeIntervalSince1970] * 1000.0;
    NSString *fileName = [NSString stringWithFormat:@"%05d-%lu", counter, (unsigned long)timestamp];
    return fileName;
}

+(NSString *)normalizedTagForString:(NSString *)original {
    NSCharacterSet *allowed = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_+."];

    NSMutableString *normalizedTag = [NSMutableString new];
    for (int i = 0; i < original.length; i++) {
        unichar ch = [original characterAtIndex:i];
        if ([allowed characterIsMember:ch]) {
            [normalizedTag appendFormat:@"%C", ch];
        }
    }

    return normalizedTag;
}

@end
