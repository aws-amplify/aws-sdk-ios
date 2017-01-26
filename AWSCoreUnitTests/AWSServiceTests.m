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
#import "AWSCore.h"
#import "AWSTestUtility.h"

@interface AWSServiceTests : XCTestCase

@end

@implementation AWSServiceTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupFakeCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testClientContext {
    AWSClientContext *clientContext = [AWSClientContext new];
    clientContext.appVersion = nil;
    clientContext.appBuild = nil;
    clientContext.appPackageName = nil;
    clientContext.appName = nil;
    clientContext.devicePlatformVersion = nil;
    clientContext.devicePlatform = nil;
    clientContext.deviceManufacturer = nil;
    clientContext.deviceModel = nil;
    clientContext.deviceModelVersion = nil;
    clientContext.deviceLocale = nil;

    XCTAssertEqualObjects(clientContext.appVersion, @"Unknown");
    XCTAssertEqualObjects(clientContext.appBuild, @"Unknown");
    XCTAssertEqualObjects(clientContext.appPackageName, @"Unknown");
    XCTAssertEqualObjects(clientContext.appName, @"Unknown");
    XCTAssertEqualObjects(clientContext.devicePlatformVersion, @"Unknown");
    XCTAssertEqualObjects(clientContext.devicePlatform, @"Unknown");
    XCTAssertEqualObjects(clientContext.deviceManufacturer, @"Unknown");
    XCTAssertEqualObjects(clientContext.deviceModel, @"Unknown");
    XCTAssertEqualObjects(clientContext.deviceModelVersion, @"Unknown");
    XCTAssertEqualObjects(clientContext.deviceLocale, @"Unknown");

    clientContext.appVersion = @"appVersion";
    clientContext.appBuild = @"appBuild";
    clientContext.appPackageName = @"appPackageName";
    clientContext.appName = @"appName";
    clientContext.devicePlatformVersion = @"devicePlatformVersion";
    clientContext.devicePlatform = @"devicePlatform";
    clientContext.deviceManufacturer = @"deviceManufacturer";
    clientContext.deviceModel = @"deviceModel";
    clientContext.deviceModelVersion = @"deviceModelVersion";
    clientContext.deviceLocale = @"deviceLocale";

    XCTAssertEqualObjects(clientContext.appVersion, @"appVersion");
    XCTAssertEqualObjects(clientContext.appBuild, @"appBuild");
    XCTAssertEqualObjects(clientContext.appPackageName, @"appPackageName");
    XCTAssertEqualObjects(clientContext.appName, @"appName");
    XCTAssertEqualObjects(clientContext.devicePlatformVersion, @"devicePlatformVersion");
    XCTAssertEqualObjects(clientContext.devicePlatform, @"devicePlatform");
    XCTAssertEqualObjects(clientContext.deviceManufacturer, @"deviceManufacturer");
    XCTAssertEqualObjects(clientContext.deviceModel, @"deviceModel");
    XCTAssertEqualObjects(clientContext.deviceModelVersion, @"deviceModelVersion");
    XCTAssertEqualObjects(clientContext.deviceLocale, @"deviceLocale");

    [clientContext setDetails:@{@"test-key" : @"test-value"}
                   forService:@"some-test-service"];
    XCTAssertEqualObjects(clientContext.serviceDetails, @{@"some-test-service" : @{@"test-key" : @"test-value"}});
}

- (void)testEndpoint {
    @try {
        AWSEndpoint *endpoint = [AWSEndpoint new];
        XCTFail(@"An exception should have been thrown. %@", endpoint);
    } @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }

    AWSEndpoint *endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                                        service:AWSServiceAutoScaling
                                                   useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSEast1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-east-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceAutoScaling);
    XCTAssertEqualObjects(endpoint.serviceName, @"autoscaling");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://autoscaling.us-east-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"autoscaling.us-east-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSWest1
                                           service:AWSServiceCloudWatch
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSWest1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-west-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceCloudWatch);
    XCTAssertEqualObjects(endpoint.serviceName, @"monitoring");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://monitoring.us-west-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"monitoring.us-west-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSWest2
                                           service:AWSServiceCognitoIdentity
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSWest2);
    XCTAssertEqualObjects(endpoint.regionName, @"us-west-2");
    XCTAssertEqual(endpoint.serviceType, AWSServiceCognitoIdentity);
    XCTAssertEqualObjects(endpoint.serviceName, @"cognito-identity");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://cognito-identity.us-west-2.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"cognito-identity.us-west-2.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionEUWest1
                                           service:AWSServiceCognitoSync
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionEUWest1);
    XCTAssertEqualObjects(endpoint.regionName, @"eu-west-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceCognitoSync);
    XCTAssertEqualObjects(endpoint.serviceName, @"cognito-sync");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://cognito-sync.eu-west-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"cognito-sync.eu-west-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionEUCentral1
                                           service:AWSServiceDynamoDB
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionEUCentral1);
    XCTAssertEqualObjects(endpoint.regionName, @"eu-central-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceDynamoDB);
    XCTAssertEqualObjects(endpoint.serviceName, @"dynamodb");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://dynamodb.eu-central-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"dynamodb.eu-central-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionAPSoutheast1
                                           service:AWSServiceEC2
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionAPSoutheast1);
    XCTAssertEqualObjects(endpoint.regionName, @"ap-southeast-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceEC2);
    XCTAssertEqualObjects(endpoint.serviceName, @"ec2");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://ec2.ap-southeast-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"ec2.ap-southeast-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionAPNortheast1
                                           service:AWSServiceElasticLoadBalancing
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionAPNortheast1);
    XCTAssertEqualObjects(endpoint.regionName, @"ap-northeast-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceElasticLoadBalancing);
    XCTAssertEqualObjects(endpoint.serviceName, @"elasticloadbalancing");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://elasticloadbalancing.ap-northeast-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"elasticloadbalancing.ap-northeast-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionAPNortheast2
                                           service:AWSServiceElasticLoadBalancing
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionAPNortheast2);
    XCTAssertEqualObjects(endpoint.regionName, @"ap-northeast-2");
    XCTAssertEqual(endpoint.serviceType, AWSServiceElasticLoadBalancing);
    XCTAssertEqualObjects(endpoint.serviceName, @"elasticloadbalancing");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://elasticloadbalancing.ap-northeast-2.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"elasticloadbalancing.ap-northeast-2.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionAPSoutheast2
                                           service:AWSServiceKinesis
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionAPSoutheast2);
    XCTAssertEqualObjects(endpoint.regionName, @"ap-southeast-2");
    XCTAssertEqual(endpoint.serviceType, AWSServiceKinesis);
    XCTAssertEqualObjects(endpoint.serviceName, @"kinesis");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://kinesis.ap-southeast-2.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"kinesis.ap-southeast-2.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionSAEast1
                                           service:AWSServiceLambda
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionSAEast1);
    XCTAssertEqualObjects(endpoint.regionName, @"sa-east-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceLambda);
    XCTAssertEqualObjects(endpoint.serviceName, @"lambda");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://lambda.sa-east-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"lambda.sa-east-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionCNNorth1
                                           service:AWSServiceMachineLearning
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionCNNorth1);
    XCTAssertEqualObjects(endpoint.regionName, @"cn-north-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceMachineLearning);
    XCTAssertEqualObjects(endpoint.serviceName, @"machinelearning");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://machinelearning.cn-north-1.amazonaws.com.cn"]);
    XCTAssertEqualObjects(endpoint.hostName, @"machinelearning.cn-north-1.amazonaws.com.cn");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                           service:AWSServiceMobileAnalytics
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSEast1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-east-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceMobileAnalytics);
    XCTAssertEqualObjects(endpoint.serviceName, @"mobileanalytics");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://mobileanalytics.us-east-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"mobileanalytics.us-east-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);
    
    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                           service:AWSServiceSES
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSEast1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-east-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceSES);
    XCTAssertEqualObjects(endpoint.serviceName, @"email");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://email.us-east-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"email.us-east-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                           service:AWSServiceSNS
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSEast1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-east-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceSNS);
    XCTAssertEqualObjects(endpoint.serviceName, @"sns");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://sns.us-east-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"sns.us-east-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                           service:AWSServiceSQS
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSEast1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-east-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceSQS);
    XCTAssertEqualObjects(endpoint.serviceName, @"sqs");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://sqs.us-east-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"sqs.us-east-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionAPSouth1
                                           service:AWSServiceDynamoDB
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionAPSouth1);
    XCTAssertEqualObjects(endpoint.regionName, @"ap-south-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceDynamoDB);
    XCTAssertEqualObjects(endpoint.serviceName, @"dynamodb");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://dynamodb.ap-south-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"dynamodb.ap-south-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);
    
    // ===== Special cases =====
    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                           service:AWSServiceSTS
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSEast1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-east-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceSTS);
    XCTAssertEqualObjects(endpoint.serviceName, @"sts");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://sts.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"sts.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionCNNorth1
                                           service:AWSServiceSTS
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionCNNorth1);
    XCTAssertEqualObjects(endpoint.regionName, @"cn-north-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceSTS);
    XCTAssertEqualObjects(endpoint.serviceName, @"sts");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://sts.cn-north-1.amazonaws.com.cn"]);
    XCTAssertEqualObjects(endpoint.hostName, @"sts.cn-north-1.amazonaws.com.cn");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSGovWest1
                                           service:AWSServiceSTS
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSGovWest1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-gov-west-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceSTS);
    XCTAssertEqualObjects(endpoint.serviceName, @"sts");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://sts.us-gov-west-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"sts.us-gov-west-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                           service:AWSServiceSimpleDB
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSEast1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-east-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceSimpleDB);
    XCTAssertEqualObjects(endpoint.serviceName, @"sdb");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://sdb.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"sdb.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSWest2
                                           service:AWSServiceSimpleDB
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSWest2);
    XCTAssertEqualObjects(endpoint.regionName, @"us-west-2");
    XCTAssertEqual(endpoint.serviceType, AWSServiceSimpleDB);
    XCTAssertEqualObjects(endpoint.serviceName, @"sdb");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://sdb.us-west-2.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"sdb.us-west-2.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                           service:AWSServiceS3
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSEast1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-east-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceS3);
    XCTAssertEqualObjects(endpoint.serviceName, @"s3");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://s3.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"s3.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSWest2
                                           service:AWSServiceS3
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSWest2);
    XCTAssertEqualObjects(endpoint.regionName, @"us-west-2");
    XCTAssertEqual(endpoint.serviceType, AWSServiceS3);
    XCTAssertEqualObjects(endpoint.serviceName, @"s3");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://s3-us-west-2.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"s3-us-west-2.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSWest2
                                           service:AWSServiceS3
                                      useUnsafeURL:YES];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSWest2);
    XCTAssertEqualObjects(endpoint.regionName, @"us-west-2");
    XCTAssertEqual(endpoint.serviceType, AWSServiceS3);
    XCTAssertEqualObjects(endpoint.serviceName, @"s3");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"http://s3-us-west-2.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"s3-us-west-2.amazonaws.com");
    XCTAssertTrue(endpoint.useUnsafeURL);

    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSGovWest1
                                           service:AWSServiceS3
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSGovWest1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-gov-west-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceS3);
    XCTAssertEqualObjects(endpoint.serviceName, @"s3");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://s3-us-gov-west-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"s3-us-gov-west-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);
    
    
    endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                           service:AWSServiceMobileTargeting
                                      useUnsafeURL:NO];
    XCTAssertEqual(endpoint.regionType, AWSRegionUSEast1);
    XCTAssertEqualObjects(endpoint.regionName, @"us-east-1");
    XCTAssertEqual(endpoint.serviceType, AWSServiceMobileTargeting);
    XCTAssertEqualObjects(endpoint.serviceName, @"mobiletargeting");
    XCTAssertEqualObjects(endpoint.URL, [NSURL URLWithString:@"https://pinpoint.us-east-1.amazonaws.com"]);
    XCTAssertEqualObjects(endpoint.hostName, @"pinpoint.us-east-1.amazonaws.com");
    XCTAssertFalse(endpoint.useUnsafeURL);

    __block BOOL didThrowException = NO;
    @try {
        endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUnknown
                                               service:AWSServiceUnknown
                                          useUnsafeURL:NO];
    }
    @catch (NSException *exception) {
        didThrowException = YES;
    }
    @finally {
        XCTAssertTrue(didThrowException);
    }
}

- (void)testServiceConfiguration {
    @try {
        AWSServiceConfiguration *serviceConfiguration = [AWSServiceConfiguration new];
        XCTFail(@"An exception should have been thrown. %@", serviceConfiguration);
    } @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }
    AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:@""
                                                                                                      secretKey:@""];
    AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                                credentialsProvider:credentialsProvider];
    XCTAssertEqual(serviceConfiguration.regionType, AWSRegionUSWest2);
    XCTAssertEqualObjects(serviceConfiguration.credentialsProvider, credentialsProvider);
}

@end
