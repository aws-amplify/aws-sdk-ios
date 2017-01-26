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

#import "AIDefaultFileManagerTests.h"

NSString *const rootPath = @"/tmp/AmazonInsights-IOS/FileManagerTests";

@interface AIDefaultFileManagerTests()

    @property (nonatomic, readwrite) AWSMobileAnalyticsFile *rootFile;
    @property (nonatomic, readwrite) NSFileManager *nsFileManager;

@end

@implementation AIDefaultFileManagerTests

-(void) setUp
{
    self.nsFileManager = [NSFileManager defaultManager];
    self.rootFile = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.nsFileManager
                                            withAbsolutePath:rootPath];
    [self.rootFile mkdirs];
}

-(void) tearDown
{
    [self.rootFile deleteFile];
    self.rootFile = nil;
}

-(void)testBadFileCreationAndDeletion
{
    id<AWSMobileAnalyticsFileManager> fileManager = [[AWSMobileAnalyticsDefaultFileManager alloc] initWithFileManager:self.nsFileManager withRootFile:self.rootFile];
    
    assertThat(fileManager, is(notNilValue()));
    
    NSError *createFileError;
    AWSMobileAnalyticsFile *outFile = [fileManager createFileWithPath:@"testStream" error:&createFileError];
    
    assertThat(createFileError, is(nilValue()));
    
    NSError *error;
    NSOutputStream *outputStream = [fileManager newOutputStream:outFile appendMode:NO error:&error];
    assertThat(error, is(nilValue()));
    assertThat(outputStream, is(notNilValue()));
    
    NSData *data = [@"Line 1\n" dataUsingEncoding:NSUTF8StringEncoding];
    NSInteger bytesWritten = [outputStream write:[data bytes] maxLength:[data length]];
    assertThatInteger(bytesWritten, is(greaterThan(@0)));
    [outputStream close];
    
    NSInputStream *inputStream = [fileManager newInputStream:outFile error:&error];
    assertThat(error, is(nilValue()));
    assertThat(inputStream, is(notNilValue()));
    
    uint8_t buf[10];
    NSInteger len = 0;
    len = [inputStream read:buf maxLength:10];
    
    assertThatInteger(len, is(equalToInt(7)));

    NSString *readStr = [[NSString alloc] initWithBytes:buf length:len encoding:NSUTF8StringEncoding];
    NSLog(@"%@", readStr);
    assertThat(readStr, is(equalTo(@"Line 1\n")));
    
    [self.rootFile deleteFile];
}

- (void)test_createDirWithNilPath_nilReturned
{
    id<AWSMobileAnalyticsFileManager> fileManager = [[AWSMobileAnalyticsDefaultFileManager alloc] initWithFileManager:self.nsFileManager withRootFile:self.rootFile];
    
    NSError *error = nil;
    AWSMobileAnalyticsFile* dir = [fileManager createDirectory:nil error:&error];
    
    assertThat(dir, is(nilValue()));
    assertThat(error, is(notNilValue()));
    
    [self.rootFile deleteFile];
}

- (void)test_createDirWithAbsoultePath_dirCreated
{
    id<AWSMobileAnalyticsFileManager> fileManager = [[AWSMobileAnalyticsDefaultFileManager alloc] initWithFileManager:self.nsFileManager withRootFile:self.rootFile];
    
    NSString *absolutePath = [rootPath stringByAppendingPathComponent:@"test"];
    NSError *error = nil;
    AWSMobileAnalyticsFile *dir = [fileManager createDirectory:absolutePath error:&error];
    
    assertThatBool(dir.isDirectory, is(equalToBool(YES)));
    assertThatBool(dir.isFile, is(equalToBool(NO)));
    assertThat(dir.absolutePath, is(equalTo(absolutePath)));
    assertThat(dir.fileName, is(@"test"));
    
    assertThatBool([self.nsFileManager fileExistsAtPath:absolutePath], is(equalToBool(YES)));
    
    [self.rootFile deleteFile];
}

- (void)test_createDirWithRelativePath_dirCreated
{
    id<AWSMobileAnalyticsFileManager> fileManager = [[AWSMobileAnalyticsDefaultFileManager alloc] initWithFileManager:self.nsFileManager withRootFile:self.rootFile];
    
    NSString *relativePath = @"test";
    NSString *absolutePath = [rootPath stringByAppendingPathComponent:relativePath];
    NSError *error = nil;
    AWSMobileAnalyticsFile *dir = [fileManager createDirectory:relativePath error:&error];
    
    assertThatBool(dir.isDirectory, is(equalToBool(YES)));
    assertThatBool(dir.isFile, is(equalToBool(NO)));
    assertThat(dir.absolutePath, is(equalTo(absolutePath)));
    assertThat(dir.fileName, is(@"test"));
    
    assertThatBool([self.nsFileManager fileExistsAtPath:absolutePath], is(equalToBool(YES)));
    
    [self.rootFile deleteFile];
}

- (void)test_createFilesInVariousWaysAndThenListFilesInDir_correctListReturned
{
    id<AWSMobileAnalyticsFileManager> fileManager = [[AWSMobileAnalyticsDefaultFileManager alloc] initWithFileManager:self.nsFileManager withRootFile:self.rootFile];
    
    NSError *error = nil;
    AWSMobileAnalyticsFile *file1 = [fileManager createFileWithPath:@"file1" error:&error];
    assertThatBool(file1.isDirectory, is(equalToBool(NO)));
    assertThatBool(file1.isFile, is(equalToBool(YES)));
    assertThat(file1.absolutePath, is(equalTo([rootPath stringByAppendingPathComponent:@"file1"])));
    assertThat(file1.fileName, is(@"file1"));
    
    assertThatBool([self.nsFileManager fileExistsAtPath:[rootPath stringByAppendingPathComponent:@"file1"]], is(equalToBool(YES)));
    
    AWSMobileAnalyticsFile *file2 = [fileManager createFileWithPath:[rootPath stringByAppendingPathComponent:@"file2.txt"] error:&error];
    assertThatBool(file2.isDirectory, is(equalToBool(NO)));
    assertThatBool(file2.isFile, is(equalToBool(YES)));
    assertThat(file2.absolutePath, is(equalTo([rootPath stringByAppendingPathComponent:@"file2.txt"])));
    assertThat(file2.fileName, is(@"file2.txt"));
    
    assertThatBool([self.nsFileManager fileExistsAtPath:[rootPath stringByAppendingPathComponent:@"file2.txt"]], is(equalToBool(YES)));
    
    AWSMobileAnalyticsFile *file3 = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.nsFileManager
                                           withParentPath:rootPath
                                            withChildPath:@"file3.xml"];
    [fileManager createFile:file3 error:&error];
    
    assertThatBool(file3.isDirectory, is(equalToBool(NO)));
    assertThatBool(file3.isFile, is(equalToBool(YES)));
    assertThat(file3.absolutePath, is(equalTo([rootPath stringByAppendingPathComponent:@"file3.xml"])));
    assertThat(file3.fileName, is(@"file3.xml"));
    
    assertThatBool([self.nsFileManager fileExistsAtPath:[rootPath stringByAppendingPathComponent:@"file3.xml"]], is(equalToBool(YES)));
    
    NSArray *files = [fileManager listFilesInDirectoryWithPath:rootPath error:&error];
    assertThatInteger([files count], is(equalToInt(3)));
    
    BOOL foundFile1 = NO;
    BOOL foundFile2 = NO;
    BOOL foundFile3 = NO;
    for (AWSMobileAnalyticsFile* file in files)
    {
        if (file.isFile == YES && [file.absolutePath isEqualToString:[rootPath stringByAppendingPathComponent:@"file1"]])
        {
            foundFile1 = YES;
        }
        if (file.isFile == YES && [file.absolutePath isEqualToString:[rootPath stringByAppendingPathComponent:@"file2.txt"]])
        {
            foundFile2 = YES;
        }
        if (file.isFile == YES && [file.absolutePath isEqualToString:[rootPath stringByAppendingPathComponent:@"file3.xml"]])
        {
            foundFile3 = YES;
        }
    }
    assertThatBool(foundFile1 && foundFile2 && foundFile3, is(equalToBool(YES)));
    
    [self.rootFile deleteFile];
}

- (void)test_deleteFilesInVariousWaysAndThenListFilesInDir_correctListReturned
{
    id<AWSMobileAnalyticsFileManager> fileManager = [[AWSMobileAnalyticsDefaultFileManager alloc] initWithFileManager:self.nsFileManager withRootFile:self.rootFile];
    
    NSError *error = nil;
    [fileManager createFileWithPath:@"file1" error:&error];
    AWSMobileAnalyticsFile *file2 = [fileManager createFileWithPath:[rootPath stringByAppendingPathComponent:@"file2.txt"] error:&error];
    AWSMobileAnalyticsFile *file3 = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.nsFileManager
                                           withParentPath:rootPath
                                            withChildPath:@"file3.xml"];
    [fileManager createFile:file3 error:&error];
    
    NSArray *files = [fileManager listFilesInDirectoryWithPath:rootPath error:&error];
    assertThatInteger([files count], is(equalToInt(3)));
    
    [fileManager deleteFileWithPath:[rootPath stringByAppendingPathComponent:@"file1"] error:&error];
    [fileManager deleteFile:file2 error:&error];
    
    files = [fileManager listFilesInDirectory:self.rootFile error:&error];
    assertThatInteger([files count], is(equalToInt(1)));
    
    [self.rootFile deleteFile];
}

@end
