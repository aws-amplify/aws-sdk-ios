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

#import "AWSMobileAnalyticsDefaultFileManager.h"
#import "AWSMobileAnalyticsBufferedReader.h"
#import "AWSMobileAnalyticsWriter.h"
#import "AWSMobileAnalyticsSerializerFactory.h"
#import "AWSLogging.h"

NSString * const AWSDefaultFileManagerErrorDomain = @"com.amazon.insights-framework.AWSDefaultFileManagerErrorDomain";

@implementation AWSMobileAnalyticsDefaultFileManager

-(id) initWithFileManager:(NSFileManager*) theFileManager
             withRootFile:(AWSMobileAnalyticsFile *) theRootFile
{
    if(self = [self init])
    {
        self.fileManager = theFileManager;
        self.rootFile = theRootFile;
    }
    return self;
}

-(id) init
{
    if(self = [super init])
    {
        self.fileManager = nil;
    }
    return self;
}

-(BOOL) containsRootPath:(NSString *) thePath
{
    if(thePath == nil)
    {
        return NO;
    }
    return [thePath hasPrefix:[self.rootFile absolutePath]];
}

-(AWSMobileAnalyticsFile*) createDirectory:(NSString*) theDirectoryPath
                     error:(NSError **)theError
{
    NSError *error = nil;
    if([AWSMobileAnalyticsStringUtils isBlank:theDirectoryPath])
    {
        AWSLogWarn( @"The directory path was blank");
        error =[AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                  withDescription: @"The path was blank"
                    withErrorCode:AWSDefaultFileManagerErrorCode_EmptyOrNilPath];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
        
    }
    
    AWSMobileAnalyticsFile* dir = nil;
    if ([self containsRootPath:theDirectoryPath])
    {
        dir = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                   withAbsolutePath:theDirectoryPath];
    }
    else
    {
        dir = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                         withParent:self.rootFile
                                      withChildPath:theDirectoryPath];
    }
    
    if(dir != nil)
    {
        if(![dir mkdirs])
        {
            error = [AWSMobileAnalyticsErrorUtils errorWithDomain: AWSDefaultFileManagerErrorDomain
                                  withDescription: @"Unable to create directory"
                                    withErrorCode:AWSDefaultFileManagerErrorCode_UnableToCreateDirectory];
            [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
            return nil;
        }
    }
    
    [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
    
    return dir;
}

-(AWSMobileAnalyticsFile*) getDirectory:(NSString*) theDirectoryPath
                  error:(NSError **)theError
{
    NSError *error = nil;
    AWSMobileAnalyticsFile* dir = nil;
    if ([self containsRootPath:theDirectoryPath])
    {
        dir = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                   withAbsolutePath:theDirectoryPath];
    }
    else
    {
        dir = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                         withParent:self.rootFile
                                      withChildPath:theDirectoryPath];
    }
    
    if(dir != nil)
    {
        [dir mkdirs];
    }
    else
    {
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain: AWSDefaultFileManagerErrorDomain
                              withDescription: @"Unable to retrieve directory"
                                withErrorCode:AWSDefaultFileManagerErrorCode_DirectoryError];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
    }
    
    [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
    
    return dir;
}

-(NSArray*) listFilesInDirectoryWithPath:(NSString*) theDirectoryPath
                                   error:(NSError **)theError
{
    if([AWSMobileAnalyticsStringUtils isBlank:theDirectoryPath])
    {
        NSError *error = [AWSMobileAnalyticsErrorUtils errorWithDomain: AWSDefaultFileManagerErrorDomain
                                       withDescription: @"The path was blank"
                                         withErrorCode:AWSDefaultFileManagerErrorCode_EmptyOrNilPath];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return [NSArray array];
    }
    
    AWSMobileAnalyticsFile* dir = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                           withAbsolutePath:theDirectoryPath];
    return [self listFilesInDirectory:dir error:theError];
}

-(NSArray*) listFilesInDirectory:(AWSMobileAnalyticsFile*) theFile
                           error:(NSError **) theError
{
    NSError *error = nil;
    if(theFile == nil)
    {
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain: AWSDefaultFileManagerErrorDomain
                              withDescription: @"The path was nil"
                                withErrorCode:AWSDefaultFileManagerErrorCode_EmptyOrNilPath];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return [NSArray array];
    }
    
    AWSMobileAnalyticsFile* dir = nil;
    if ([self containsRootPath:theFile.absolutePath])
    {
        dir = theFile;
    }
    else
    {
        dir = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                         withParent:self.rootFile
                                      withChildPath:theFile.absolutePath];
    }
    
    [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
    
    return [dir listFiles];
}

-(AWSMobileAnalyticsFile*) createFileWithPath:(NSString*) theFilepath
                        error:(NSError **) theError
{
    if([AWSMobileAnalyticsStringUtils isBlank:theFilepath])
    {
        NSError *error = [AWSMobileAnalyticsErrorUtils errorWithDomain: AWSDefaultFileManagerErrorDomain
                                       withDescription: @"The path was blank"
                                         withErrorCode:AWSDefaultFileManagerErrorCode_EmptyOrNilPath];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
    }
    
    AWSMobileAnalyticsFile* file = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                            withAbsolutePath:theFilepath];
    return [self createFile:file error:theError];
}

-(AWSMobileAnalyticsFile*) createFile:(AWSMobileAnalyticsFile*) theFile
                error:(NSError **) theError
{
    NSError *error = nil;
    if(theFile == nil)
    {
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain: AWSDefaultFileManagerErrorDomain
                              withDescription: @"The path was nil"
                                withErrorCode:AWSDefaultFileManagerErrorCode_EmptyOrNilPath];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
    }
    
    AWSMobileAnalyticsFile* file = nil;
    if ([self containsRootPath:theFile.absolutePath])
    {
        file = theFile;
    }
    else
    {
        file = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                          withParent:self.rootFile
                                       withChildPath:theFile.absolutePath];
    }
    
    if(![file createNewFile])
    {
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain: AWSDefaultFileManagerErrorDomain
                              withDescription: @"Unable to create file"
                                withErrorCode:AWSDefaultFileManagerErrorCode_UnableToCreateFile];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
    }
    
    [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
    
    return file;
}


-(BOOL) deleteFileWithPath:(NSString*) theFilepath
                     error:(NSError **) theError
{
    if([AWSMobileAnalyticsStringUtils isBlank:theFilepath])
    {
        NSError *error = [AWSMobileAnalyticsErrorUtils errorWithDomain: AWSDefaultFileManagerErrorDomain
                                       withDescription: @"The path was nil"
                                         withErrorCode:AWSDefaultFileManagerErrorCode_EmptyOrNilPath];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return NO;
    }
    
    AWSMobileAnalyticsFile* file = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                        withAbsolutePath:theFilepath];
    
    return [self deleteFile:file error:theError];
}

-(BOOL) deleteFile:(AWSMobileAnalyticsFile*) theFile
             error:(NSError **) theError
{
    NSError *error = nil;
    if(theFile == nil)
    {
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                              withDescription: @"The path was nil"
                                withErrorCode:AWSDefaultFileManagerErrorCode_EmptyOrNilPath];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return NO;
    }
    
    AWSMobileAnalyticsFile* file = nil;
    if ([self containsRootPath:theFile.absolutePath])
    {
        file = theFile;
    }
    else
    {
        file = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                          withParent:self.rootFile
                                       withChildPath:theFile.absolutePath];
    }
    
    BOOL deleted = [file deleteFile];
    if(!deleted)
    {
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                              withDescription: @"Unable to delete file"
                                withErrorCode:AWSDefaultFileManagerErrorCode_UnableToDeleteFile];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return NO;
    }
    
    [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
    
    return deleted;
}

-(NSInputStream*) newInputStreamWithPath:(NSString*) theFilepath
                                   error:(NSError **)theError
{
    if([AWSMobileAnalyticsStringUtils isBlank:theFilepath])
    {
        NSError *error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                                       withDescription: @"The path was nil"
                                         withErrorCode:AWSDefaultFileManagerErrorCode_EmptyOrNilPath];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
    }
    
    AWSMobileAnalyticsFile* file = [[AWSMobileAnalyticsFile alloc] initWithFileMananager: self.fileManager
                                        withAbsolutePath: theFilepath];
    
    return [self newInputStream:file error:theError];
}

-(NSInputStream*) newInputStream:(AWSMobileAnalyticsFile*) theFile
                           error:(NSError **)theError
{
    NSError *error = nil;
    if(theFile == nil)
    {
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                              withDescription: @"The path was nil"
                                withErrorCode:AWSDefaultFileManagerErrorCode_EmptyOrNilPath];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
    }
    
    AWSMobileAnalyticsFile* file = nil;
    if ([self containsRootPath:theFile.absolutePath])
    {
        file = theFile;
    }
    else
    {
        file = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                          withParent:self.rootFile
                                       withChildPath:theFile.absolutePath];
    }
    
    if(![file exists])
    {
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain: AWSDefaultFileManagerErrorDomain
                              withDescription: @"The file doesn't exist"
                                withErrorCode:AWSDefaultFileManagerErrorCode_FileDoesNotExist];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
    }
    
    NSInputStream *inputStream = [NSInputStream inputStreamWithFileAtPath:file.absolutePath];
    
    if(inputStream != nil)
    {
        [inputStream open];
    }
    
    [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
    
    return inputStream;
}

-(NSOutputStream*) newOutputStreamWithPath:(NSString*) theFilepath
                                appendMode:(BOOL)appendMode
                                     error:(NSError **)theError
{
    if([AWSMobileAnalyticsStringUtils isBlank:theFilepath])
    {
        NSError *error = [AWSMobileAnalyticsErrorUtils errorWithDomain: AWSDefaultFileManagerErrorDomain
                                       withDescription: @"The path was nil"
                                         withErrorCode:AWSDefaultFileManagerErrorCode_EmptyOrNilPath];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
    }
    
    AWSMobileAnalyticsFile* file = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                        withAbsolutePath:theFilepath];
    
    return [self newOutputStream:file appendMode:appendMode error:theError];
}

-(NSOutputStream*) newOutputStream:(AWSMobileAnalyticsFile*) theFile
                        appendMode:(BOOL)appendMode
                             error:(NSError **)theError
{
    NSError *error = nil;
    if(theFile == nil)
    {
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain: AWSDefaultFileManagerErrorDomain
                              withDescription: @"The path was nil"
                                withErrorCode:AWSDefaultFileManagerErrorCode_EmptyOrNilPath];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
    }
    
    AWSMobileAnalyticsFile* file = nil;
    if ([self containsRootPath:theFile.absolutePath])
    {
        file = theFile;
    }
    else
    {
        file = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                          withParent:self.rootFile
                                       withChildPath:theFile.absolutePath];
    }
    
    if(![file exists])
    {
        [file createNewFile];
    }
    
    NSOutputStream *outputStream = [NSOutputStream outputStreamToFileAtPath: file.absolutePath
                                                                     append: appendMode];
    
    if(outputStream != nil)
    {
        [outputStream open];
    }
    
    [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
    
    return outputStream;
}

-(AWSMobileAnalyticsWriter *) tryCreateWriterWithFile:(AWSMobileAnalyticsFile *) theFile withError:(NSError **) theError
{
    NSError *error = nil;
    NSOutputStream *stream = [self newOutputStream:theFile appendMode:NO error:&error];
    if(error != nil || stream == nil)
    {
        if(error == nil)
        {
            error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                                  withDescription:@"Failed to create a writer to the file"
                                    withErrorCode:AWSDefaultFileManagerErrorCode_FailedOutputStreamCreation];
        }
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
    }
    
    AWSMobileAnalyticsWriter *writer = [AWSMobileAnalyticsWriter writerWithOutputStream:stream];
    [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
    return writer;
}


-(AWSMobileAnalyticsBufferedReader *) tryCreateReaderWithFile:(AWSMobileAnalyticsFile *) theFile withError:(NSError **) theError
{
    NSError *error = nil;
    NSInputStream *inputStream = [self newInputStream:theFile error:&error];
    
    if(error != nil || inputStream == nil)
    {
        if(error == nil)
        {
            error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                                  withDescription:@"Failed to create an input stream to the file"
                                    withErrorCode: AWSDefaultFileManagerErrorCode_FailedInputStreamCreation];
        }
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return nil;
    }
    
    AWSMobileAnalyticsBufferedReader *reader = [AWSMobileAnalyticsBufferedReader readerWithInputStream:inputStream];

    [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
    return reader;
}


-(NSDictionary *) readDataFromFile:(AWSMobileAnalyticsFile *) theFile
                        withFormat:(FormatType) theFormatType
                         withError:(NSError **) theError
{
    return [self readDataFromFile:theFile withFormat:theFormatType withDataProcessor:nil withError:theError];
}

-(NSDictionary *) readDataFromFile:(AWSMobileAnalyticsFile *) theFile
                        withFormat:(FormatType) theFormatType
                 withDataProcessor:(AWSDataProcessor) theDataProcessor
                         withError:(NSError **) theError
{
    
    AWSMobileAnalyticsBufferedReader *reader = [self tryCreateReaderWithFile:theFile withError:theError];
    return [self readDataFromFile:theFile withReader:reader withDataProcessor:theDataProcessor withFormat:theFormatType withError:theError];
}


-(NSDictionary *) readDataFromFile:(AWSMobileAnalyticsFile *) theFile
                        withReader:(id) theReader
                 withDataProcessor:(AWSDataProcessor) theDataProcessor
                        withFormat:(FormatType) theFormatType
                         withError:(NSError **) theError
{
    NSError *error = nil;
    
    if(![theFile exists])
    {
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                              withDescription:@"Failed to create an input stream to the file"
                                withErrorCode: AWSDefaultFileManagerErrorCode_FileDoesNotExist];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return [NSDictionary dictionary];
    }
    
    NSMutableString *contents = [NSMutableString string];
    
    if(theReader == nil)
    {
        AWSLogError( @"The reader provided was nil.");
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                              withDescription:@"Nil reader"
                                withErrorCode: AWSDefaultFileManagerErrorCode_NilReader];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return [NSDictionary dictionary];
    }
    
    @try
    {
        NSMutableString *line = [NSMutableString string];
        while([theReader readLine:&line withError:&error] && line != nil && error == nil)
        {
            [contents appendString:line];
        }
    }
    @finally
    {
        [theReader close];
    }
    
    if(error != nil)
    {
        AWSLogError( @"There was an error while reading the contents from the file %@. %@", theFile.absolutePath, [error localizedDescription]);
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        if([theFile exists])
        {
            NSError *deleteError = nil;
            [self deleteFile:theFile error:&deleteError];
        }
        return [NSDictionary dictionary];
    }
    
    [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:nil];
    
    NSData* contentData = [contents dataUsingEncoding:NSUTF8StringEncoding];
    if(theDataProcessor)
    {
        contentData = theDataProcessor(contentData, &error);
        if(error != nil || contentData == nil)
        {
            if(error == nil)
            {
                error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                                      withDescription:@"Failed to process file contents"
                                        withErrorCode: AWSDefaultFileManagerErrorCode_ErrorProcessingFileContents];
            }
            [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
            if([theFile exists])
            {
                NSError *deleteError = nil;
                [self deleteFile:theFile error:&deleteError];
            }
            return [NSDictionary dictionary];
        }
    }
    
    id<AWSMobileAnalyticsSerializer> serializer = [AWSMobileAnalyticsSerializerFactory serializerFromFormatType:theFormatType];
    NSDictionary *dictionary = [serializer readObject:contentData];
    
    if(error != nil || dictionary == nil)
    {
        if(error == nil)
        {
            error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                                  withDescription:@"Failed to parse file contents"
                                    withErrorCode: AWSDefaultFileManagerErrorCode_ErrorParsingFileContents];
        }
        
        AWSLogWarn( @"Not able to parse the contents from the file %@. %@. It is common if that file hasn't been created yet.", theFile.absolutePath, [error localizedDescription]);
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        if([theFile exists])
        {
            NSError *deleteError = nil;
            [self deleteFile:theFile error:&deleteError];
        }
        return [NSDictionary dictionary];
    }

    return dictionary;
}

-(BOOL) writeData:(id) theData
           toFile:(AWSMobileAnalyticsFile *) theFile
       withFormat:(FormatType) theFormatType
        withError:(NSError **) theError
{
    return [self writeData:theData toFile:theFile withFormat:theFormatType withDataProcessor:nil withError:theError];
}

-(BOOL) writeData:(id) theData
           toFile:(AWSMobileAnalyticsFile *) theFile
       withFormat:(FormatType) theFormatType
withDataProcessor:(AWSDataProcessor) theDataProcessor
        withError:(NSError **) theError
{
    AWSMobileAnalyticsWriter *writer = [self tryCreateWriterWithFile:theFile withError:theError];
    return [self writeData:theData toFile:theFile withWriter:writer withDataProcessor:theDataProcessor withFormat:theFormatType withError:theError];
}


-(BOOL) writeData:(id) theData
           toFile:(AWSMobileAnalyticsFile *) theFile
       withWriter:(id) theWriter
withDataProcessor:(AWSDataProcessor) theDataProcessor
       withFormat:(FormatType) theFormatType
        withError:(NSError **) theError
{
    if(theData == nil)
    {
        return NO;
    }
    
    if([theData respondsToSelector:@selector(count)])
    {
        if([theData performSelector:@selector(count)] == 0)
        {
            return NO;
        }
    }
    
    NSError *error = nil;
    
    if(![theFile exists])
    {
        if(![theFile createNewFile])
        {
            AWSLogError( @"There was an error while attempting to create the file.");
            error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                                  withDescription:@"Failed to create file to write data to"
                                    withErrorCode: AWSDefaultFileManagerErrorCode_UnableToCreateFile];
            [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
            return NO;
        }
    }
    
    if(theWriter == nil)
    {
        AWSLogError( @"The writer provided was nil.");
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                              withDescription:@"Nil writer"
                                withErrorCode: AWSDefaultFileManagerErrorCode_NilWriter];
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return NO;
    }
    
    id<AWSMobileAnalyticsSerializer> serializer = [AWSMobileAnalyticsSerializerFactory serializerFromFormatType:theFormatType];
    NSData *data = [serializer writeObject:theData];

    @try
    {
        if(theDataProcessor != nil)
        {
            data = theDataProcessor(data, &error);
        }
        
        if(error != nil || data == nil)
        {
            if(error == nil)
            {
                error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSDefaultFileManagerErrorDomain
                                      withDescription:@"Failed to process data"
                                        withErrorCode: AWSDefaultFileManagerErrorCode_ErrorProcessingFileContents];
            }
            [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
            if([theFile exists])
            {
                NSError *deleteError = nil;
                [self deleteFile:theFile error:&deleteError];
            }
            return NO;
        }
        
        BOOL success = [theWriter writeLine:[AWSMobileAnalyticsStringUtils dataToString:data] error:&error];
        if(error != nil || !success)
        {
            if(error != nil)
            {
                AWSLogError( @"There was an error while attempting to write to the file. %@", [error localizedDescription]);
            }
            else
            {
                AWSLogError( @"There was an error while attempting to write to the file.");
            }
        }
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return success;
    }
    @finally
    {
        [theWriter close];
    }
}

@end
