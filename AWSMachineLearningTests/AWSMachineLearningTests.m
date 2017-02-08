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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSMachineLearning.h"
#import "AWSTestUtility.h"

@interface AWSMachineLearningTests : XCTestCase

@end

@implementation AWSMachineLearningTests

- (void)setUp {
    [super setUp];

    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPredict {
    AWSMachineLearning *MachineLearning = [AWSMachineLearning defaultMachineLearning];

    NSString *MLModelId = @"ml-UJdLGgO6l44";

    AWSMachineLearningGetMLModelInput *getMLModelInput = [AWSMachineLearningGetMLModelInput new];
    getMLModelInput.MLModelId = MLModelId;
    
    [[[[MachineLearning getMLModel:getMLModelInput] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSMachineLearningGetMLModelOutput *getMLModelOutput = task.result;

        AWSMachineLearningPredictInput *predictInput = [AWSMachineLearningPredictInput new];
        predictInput.predictEndpoint = getMLModelOutput.endpointInfo.endpointUrl;
        predictInput.MLModelId = MLModelId;
        predictInput.record = @{};

        return [MachineLearning predict:predictInput];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertEqual([task.result class], [AWSMachineLearningPredictOutput class]);
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
}

- (void)testPredictWithExtraSlashEndpoint {
    AWSMachineLearning *MachineLearning = [AWSMachineLearning defaultMachineLearning];

    NSString *MLModelId = @"ml-UJdLGgO6l44";

    AWSMachineLearningGetMLModelInput *getMLModelInput = [AWSMachineLearningGetMLModelInput new];
    getMLModelInput.MLModelId = MLModelId;

    [[[[MachineLearning getMLModel:getMLModelInput] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSMachineLearningGetMLModelOutput *getMLModelOutput = task.result;

        AWSMachineLearningPredictInput *predictInput = [AWSMachineLearningPredictInput new];
        NSString *endpointUrl = getMLModelOutput.endpointInfo.endpointUrl;
        if (![endpointUrl hasSuffix:@"/"]) {
            endpointUrl = [NSString stringWithFormat:@"%@/", endpointUrl];
        }
        predictInput.predictEndpoint = endpointUrl;
        predictInput.MLModelId = MLModelId;
        predictInput.record = @{};

        return [MachineLearning predict:predictInput];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertEqual([task.result class], [AWSMachineLearningPredictOutput class]);
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
}

@end
