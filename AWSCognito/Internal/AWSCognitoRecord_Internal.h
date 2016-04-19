//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License").
// You may not use this file except in compliance with the
// License. A copy of the License is located at
//
//     http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, express or implied. See the License
// for the specific language governing permissions and
// limitations under the License.
//

#import "AWSCognitoRecord.h"

@interface AWSCognitoRecordMetadata()

@property (nonatomic, strong) NSDate *lastModified;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface AWSCognitoRecord()

/**
 * Initializes a AWSCognitoRecord with the values from a dictionary.
 *
 * @param dictionary The dictionary must contain a mapping of NSStrings to NSStrings.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 * Returns a copy of the AWSCognitoRecord with the last written time updated to the current time and the version number set based on the dirty count.
 *
 */
- (AWSCognitoRecord *)copyForFlush;

@end

@interface AWSCognitoRecordValue()

@property (nonatomic, assign) AWSCognitoRecordValueType type;
@property (nonatomic, strong) NSObject *stringValue;


- (instancetype)initWithString:(NSString *)value
                          type:(AWSCognitoRecordValueType)type;

- (NSString *)toJsonString;
- (instancetype)initWithJson:(NSString *)json
                        type:(AWSCognitoRecordValueType)type;
@end