/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSMobileAnalyticsSerializerFactory.h"
#import "AWSLogging.h"

@interface AWSDefaultSerializer : NSObject<AWSMobileAnalyticsSerializer>
- (NSData *) writeObject:(id) theObject;
- (NSData *) writeArray:(NSArray *) theArray;
- (void) readObject:(NSData *) theData;
- (NSArray *) readArray:(NSData *) theData;
@end

@implementation AWSDefaultSerializer

- (NSData *) writeObject:(id) theObject
{
    AWSLogWarn( @"Using the DefaultSerializer, only serializing the object's description to NSData");
    if(theObject == nil)
        return nil;
    
    return [[theObject description] dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSData *) writeArray:(NSArray *) theArray
{
    AWSLogWarn( @"Using the DefaultSerializer, only serializing the array's description to NSData");
    if(theArray == nil)
        return nil;
    
    return [[theArray description] dataUsingEncoding:NSUTF8StringEncoding];
}

- (void) readObject:(NSData *) theData
{
    AWSLogWarn( @"Using the DefaultSerializer, do not know how to handle the data. Doing nothing");
}

- (NSArray *) readArray:(NSData *) theData
{
    AWSLogWarn( @"Using the DefaultSerializer, do not know how to handle the data. Doing nothing");
    return nil;
}

@end

@implementation AWSMobileAnalyticsSerializerFactory


+(id<AWSMobileAnalyticsSerializer>) serializerFromFormatType:(FormatType) theFormatType
{
    if(theFormatType == JSON)
    {
        return [[AWSMobileAnalyticsJSONSerializer alloc] init];
    }
    return [[AWSDefaultSerializer alloc] init];
}

@end
