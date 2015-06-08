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

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsStringUtils.h"

@interface AWSMobileAnalyticsFile : NSObject

@property (nonatomic, readonly) NSString* fileName;

@property (nonatomic, readonly) NSString* absolutePath;

@property (nonatomic, readonly) BOOL isFile;

@property (nonatomic, readonly) BOOL isDirectory;

-(id) initWithFileMananager:(NSFileManager*) theFileManager
           withAbsolutePath:(NSString*) thePathName;

-(id) initWithFileMananager:(NSFileManager*) theFileManager
             withParentPath:(NSString*) theParentPathName
              withChildPath:(NSString*) theChildPathName;

-(id) initWithFileMananager:(NSFileManager*) theFileManager
             withParent:(AWSMobileAnalyticsFile*) theParent
              withChildPath:(NSString*) theChildPathName;

-(BOOL) createNewFile;

-(BOOL) deleteFile;

-(BOOL) exists;

-(BOOL) mkdirs;

-(unsigned long long) length;

-(NSArray*) listFiles;

-(BOOL) renameTo:(NSString *) theNewFilename;

@end
