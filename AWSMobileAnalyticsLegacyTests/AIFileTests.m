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

#import "AIFileTests.h"
#import "AWSMockFileManager.h"

@implementation AIFileTests

-(void)setUp
{
     
    AWSMobileAnalyticsFile* testDir = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:[NSFileManager defaultManager]
                                           withAbsolutePath:@"/tmp/AmazonInsights-IOS/AIFileTests"];
    [testDir mkdirs];
}

-(void)tearDown
{
    AWSMobileAnalyticsFile* testDir = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:[NSFileManager defaultManager]
                                           withAbsolutePath:@"/tmp/AmazonInsights-IOS/AIFileTests"];
    [testDir deleteFile];
}

-(void)testInstantiateAIFile
{
    AWSMobileAnalyticsFile* testFile = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:[NSFileManager defaultManager]
                                            withAbsolutePath:@"/tmp/AmazonInsights-IOS/AIFileTests/fileName"];
    assertThat(testFile, is(notNilValue()));
    assertThat(testFile.absolutePath, is(@"/tmp/AmazonInsights-IOS/AIFileTests/fileName"));
    assertThat(testFile.fileName, is(@"fileName"));
    assertThatBool(testFile.isDirectory, is(equalToBool(NO)));
    assertThatBool(testFile.isFile, is(equalToBool(NO)));
}

-(void)testFileCreationAndDeletion
{
    AWSMobileAnalyticsFile* testFile = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:[NSFileManager defaultManager]
                                            withAbsolutePath:@"/tmp/AmazonInsights-IOS/AIFileTests/fileName"];
    assertThatBool([testFile createNewFile], is(equalToBool(YES)));
    assertThatBool(testFile.exists, is(equalToBool(YES)));
    assertThatBool([testFile deleteFile], is(equalToBool(YES)));
}

//-(void)testBadFileCreationAndDeletion
//{
//    AWSMobileAnalyticsFile* testFile = nil;
//    NSException* ex = nil;
//    @try
//    {
//        testFile = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:[NSFileManager defaultManager]
//                                        withAbsolutePath:nil];
//    }
//    @catch (NSException* e)
//    {
//        //This should occur due to NSAssert on the path
//        ex = e;
//    }
//    
//    assertThat(ex, is(notNilValue()));
//    assertThatBool([testFile createNewFile], is(equalToBool(NO)));
//    assertThatBool(testFile.exists, is(equalToBool(NO)));
//    assertThatBool([testFile deleteFile], is(equalToBool(NO)));
//}
@end
