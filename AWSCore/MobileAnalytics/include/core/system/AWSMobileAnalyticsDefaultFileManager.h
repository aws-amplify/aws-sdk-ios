/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsFileManager.h"
#import "../util/AWSMobileAnalyticsStringUtils.h"
#import "../util/AWSMobileAnalyticsErrorUtils.h"


FOUNDATION_EXPORT NSString * const AWSDefaultFileManagerErrorDomain;

typedef NS_ENUM(NSInteger, AWSDefaultFileManagerErrorCodes) {
    AWSDefaultFileManagerErrorCode_UnableToCreateDirectory = 0,
    AWSDefaultFileManagerErrorCode_EmptyOrNilPath,
    AWSDefaultFileManagerErrorCode_DirectoryError,
    AWSDefaultFileManagerErrorCode_UnableToCreateFile,
    AWSDefaultFileManagerErrorCode_UnableToDeleteFile,
    AWSDefaultFileManagerErrorCode_FileDoesNotExist,
    AWSDefaultFileManagerErrorCode_FailedOutputStreamCreation,
    AWSDefaultFileManagerErrorCode_FailedInputStreamCreation,
    AWSDefaultFileManagerErrorCode_FailedReaderCreation,
    AWSDefaultFileManagerErrorCode_FailedWriterCreation,
    AWSDefaultFileManagerErrorCode_ErrorProcessingFileContents,
    AWSDefaultFileManagerErrorCode_ErrorParsingFileContents,
    AWSDefaultFileManagerErrorCode_NilReader,
    AWSDefaultFileManagerErrorCode_NilWriter
};

@interface AWSMobileAnalyticsDefaultFileManager : NSObject<AWSMobileAnalyticsFileManager>

@property (nonatomic, readwrite) NSFileManager* fileManager;
@property (nonatomic, readwrite) AWSMobileAnalyticsFile* rootFile;

-(id) initWithFileManager:(NSFileManager*) theFileManager
             withRootFile:(AWSMobileAnalyticsFile *) theRootFile;

-(AWSMobileAnalyticsFile*) createDirectory:(NSString*) theDirectoryPath
                     error:(NSError **)theError;

-(AWSMobileAnalyticsFile*) getDirectory:(NSString*) theDirectoryPath
                  error:(NSError **)theError;

-(NSArray*) listFilesInDirectoryWithPath:(NSString*) theDirectoryPath
                                 error:(NSError **)theError;

-(NSArray*) listFilesInDirectory:(AWSMobileAnalyticsFile*) theFile
                         error:(NSError **)theError;

-(AWSMobileAnalyticsFile*) createFileWithPath:(NSString*) theFilepath
                        error:(NSError **)theError;

-(AWSMobileAnalyticsFile*) createFile:(AWSMobileAnalyticsFile*) theFile
                error:(NSError **)theError;

-(BOOL) deleteFileWithPath:(NSString*) theFilepath
                     error:(NSError **)theError;

-(BOOL) deleteFile:(AWSMobileAnalyticsFile*) theFile
             error:(NSError **)theError;

-(NSInputStream*) newInputStreamWithPath:(NSString*) theFilepath
                                   error:(NSError **)theError;

-(NSInputStream*) newInputStream:(AWSMobileAnalyticsFile*) theFile
                           error:(NSError **)theError;

-(NSOutputStream*) newOutputStreamWithPath:(NSString*) theFilepath
                                appendMode:(BOOL)appendMode
                                     error:(NSError **)theError;

-(NSOutputStream*) newOutputStream:(AWSMobileAnalyticsFile*) theFile
                        appendMode:(BOOL)appendMode
                             error:(NSError **)theError;

-(NSDictionary *) readDataFromFile:(AWSMobileAnalyticsFile *) theFile
                        withFormat:(FormatType) theFormatType
                         withError:(NSError **) theError;

-(NSDictionary *) readDataFromFile:(AWSMobileAnalyticsFile *) theFile
                        withFormat:(FormatType) theFormatType
                 withDataProcessor:(AWSDataProcessor) theDataProcessor
                         withError:(NSError **) theError;

-(BOOL) writeData:(id) theData
           toFile:(AWSMobileAnalyticsFile *) theFile
       withFormat:(FormatType) theFormatType
        withError:(NSError **) theError;

-(BOOL) writeData:(id) theData
           toFile:(AWSMobileAnalyticsFile *) theFile
       withFormat:(FormatType) theFormatType
withDataProcessor:(AWSDataProcessor) theDataProcessor
        withError:(NSError **) theError;


@end
