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

#import "AWSMobileAnalyticsJSONSerializer.h"
#import "AWSMobileAnalyticsDefaultEvent.h" // add this import to prevent "undeclared selector 'toDictionary'" warnings
@implementation AWSMobileAnalyticsJSONSerializer

- (NSData *) writeObject:(id) theObject
{
    if (theObject == nil)
        return [NSData data];
    
    NSDictionary *objDictionary = nil;
    if([theObject isKindOfClass:[NSDictionary class]])
    {
        objDictionary = theObject;
    } else if([theObject respondsToSelector:@selector(toDictionary)])
    {
        objDictionary = [theObject performSelector:@selector(toDictionary)];
    }
    if(objDictionary == nil)
    {
        return [NSData data];
    }
    
    return [NSJSONSerialization dataWithJSONObject:objDictionary options:0 error:NULL];
}

- (NSData *) writeArray:(NSArray *) theArray
{
    if (theArray == nil)
        return [NSData data];
    
    return [NSJSONSerialization dataWithJSONObject:theArray options:0 error:NULL];
}

- (NSDictionary *) readObject:(NSData *) theData
{
    if (theData == nil)
        return [NSDictionary dictionary];
    
    return [NSJSONSerialization JSONObjectWithData:theData options:0 error:NULL];
}

- (NSArray *) readArray:(NSData *) theData
{
    if (theData == nil)
        return [NSArray array];
    
    return [NSJSONSerialization JSONObjectWithData:theData options:0 error:NULL];
}

@end
