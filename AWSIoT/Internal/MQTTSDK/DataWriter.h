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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Test utility for writing raw data to the local file system, for debugging decoding errors. Data is written to files
/// within a containing directory, in files named with the convention `<counter>-<timestamp>`, where `counter` is an
/// integer counter that increases for every file written, and `timestamp` is the local timestamp at which the data was
/// written, in millisecond precision
@interface DataWriter : NSObject

/// True if data writing is enabled. Can only be enabled for Debug configurations, and then only if the hardcoded value
/// is overwritten in DataWriter.m.
+(BOOL) dataWritingEnabled;

/// Creates a writer for the specified tag. The output directory will be derived from this tag.
-(instancetype) initWithTag:(NSString *)tag;

    /// The directory path at which the data files will be written. Always a subdirectory of the app's temporary directory.
@property (nonatomic, strong) NSURL *directory;

/// Writes a new data file to `directory`
-(void)writeData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
