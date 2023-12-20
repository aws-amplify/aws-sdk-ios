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

@interface AWSService (AWSServiceTests)

+ (NSString *)regionNameFromType:(AWSRegionType)regionType;

@end

@interface NSString (AWSServiceTests)

- (AWSRegionType)aws_regionTypeValue;

@end

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

- (void)testEndpointInit {
    XCTAssertThrows([AWSEndpoint new]);
}

- (void)testEndpointWithException {
    XCTAssertThrows([[AWSEndpoint alloc] initWithRegion:AWSRegionUnknown
                                                service:AWSServiceUnknown
                                           useUnsafeURL:NO]);
}

- (void)verifyServiceEndpointWith:(AWSEndpoint *)endpoint
                       regionType:(AWSRegionType)regionType
                          service:(AWSServiceType)serviceType
                       regionName:(NSString *)regionName
                      serviceName:(NSString *)serviceName
                       serviceURL:(NSURL *)url
                  serviceHostName:(NSString *)hostName
                     useUnsafeURL:(BOOL)useUnsafeURL {
    XCTAssertEqual(endpoint.regionType, regionType);
    XCTAssertEqualObjects(endpoint.regionName, regionName);
    XCTAssertEqual(endpoint.serviceType, serviceType);
    XCTAssertEqualObjects(endpoint.serviceName, serviceName);
    XCTAssertEqualObjects(endpoint.URL, url);
    XCTAssertEqualObjects(endpoint.hostName, hostName);
    XCTAssertEqual(endpoint.useUnsafeURL, useUnsafeURL);
}

- (void)verifyServiceEndpointWithRegion:(AWSRegionType)regionType
                                service:(AWSServiceType)serviceType
                             regionName:(NSString *)regionName
                            serviceName:(NSString *)serviceName
                             serviceURL:(NSURL *)url
                        serviceHostName:(NSString *)hostName
                           useUnsafeURL:(BOOL)useUnsafeURL {
    AWSEndpoint *endpoint = [[AWSEndpoint alloc] initWithRegion:regionType
                                                        service:serviceType
                                                   useUnsafeURL:useUnsafeURL];
    [self verifyServiceEndpointWith:endpoint
                         regionType:regionType
                            service:serviceType
                         regionName:regionName
                        serviceName:serviceName
                         serviceURL:url
                    serviceHostName:hostName
                       useUnsafeURL:useUnsafeURL];
}

- (void)verifyServiceEndpointWithRegion:(AWSRegionType)regionType
                                service:(AWSServiceType)serviceType
                             regionName:(NSString *)regionName
                            serviceName:(NSString *)serviceName
                             serviceURL:(NSURL *)url
                        serviceHostName:(NSString *)hostName{
    [self verifyServiceEndpointWithRegion:regionType
                                  service:serviceType
                               regionName:regionName
                              serviceName:serviceName
                               serviceURL:url
                          serviceHostName:hostName
                             useUnsafeURL:NO];
}

- (void)testLocalEndpointForS3 {
    AWSEndpoint *endpoint = [[AWSEndpoint alloc] initLocalEndpointWithRegion:AWSRegionUSEast1
                                                                     service:AWSServiceS3
                                                                useUnsafeURL:YES];
    [self verifyServiceEndpointWith:endpoint
                         regionType:AWSRegionUSEast1
                            service:AWSServiceS3
                         regionName:@"us-east-1"
                        serviceName:@"s3"
                         serviceURL:[NSURL URLWithString:@"http://localhost:20005/"]
                    serviceHostName:@"localhost"
                       useUnsafeURL:YES];
    XCTAssertEqual(endpoint.portNumber.integerValue, 20005);
    
    // Test that when we create service endpoint in non local testing setup, the port number is nil
    AWSEndpoint *nonLocalTestingEndpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                                                       service:AWSServiceS3
                                                                  useUnsafeURL:NO];
    XCTAssertNil(nonLocalTestingEndpoint.portNumber);
}

- (void)testEndpointForAutoScaling {
    [self verifyServiceEndpointWithRegion:AWSRegionUSEast1
                                  service:AWSServiceAutoScaling
                               regionName:@"us-east-1"
                              serviceName:@"autoscaling"
                               serviceURL:[NSURL URLWithString:@"https://autoscaling.us-east-1.amazonaws.com"]
                          serviceHostName:@"autoscaling.us-east-1.amazonaws.com"];
}

- (void)testEndpointForMonitoring {
    [self verifyServiceEndpointWithRegion:AWSRegionUSWest1
                                  service:AWSServiceCloudWatch
                               regionName:@"us-west-1"
                              serviceName:@"monitoring"
                               serviceURL:[NSURL URLWithString:@"https://monitoring.us-west-1.amazonaws.com"]
                          serviceHostName:@"monitoring.us-west-1.amazonaws.com"];
}

- (void)testEndpointForCognitoIdentity {
    [self verifyServiceEndpointWithRegion:AWSRegionUSWest2
                                  service:AWSServiceCognitoIdentity
                               regionName:@"us-west-2"
                              serviceName:@"cognito-identity"
                               serviceURL:[NSURL URLWithString:@"https://cognito-identity.us-west-2.amazonaws.com"]
                          serviceHostName:@"cognito-identity.us-west-2.amazonaws.com"];
}

- (void)testEndpointForCognitoSync {
    [self verifyServiceEndpointWithRegion:AWSRegionEUWest1
                                  service:AWSServiceCognitoSync
                               regionName:@"eu-west-1"
                              serviceName:@"cognito-sync"
                               serviceURL:[NSURL URLWithString:@"https://cognito-sync.eu-west-1.amazonaws.com"]
                          serviceHostName:@"cognito-sync.eu-west-1.amazonaws.com"];
}

- (void)testEndpointForDynamoDB {
    [self verifyServiceEndpointWithRegion:AWSRegionEUCentral1
                                  service:AWSServiceDynamoDB
                               regionName:@"eu-central-1"
                              serviceName:@"dynamodb"
                               serviceURL:[NSURL URLWithString:@"https://dynamodb.eu-central-1.amazonaws.com"]
                          serviceHostName:@"dynamodb.eu-central-1.amazonaws.com"];
    
    [self verifyServiceEndpointWithRegion:AWSRegionAPSouth1
                                  service:AWSServiceDynamoDB
                               regionName:@"ap-south-1"
                              serviceName:@"dynamodb"
                               serviceURL:[NSURL URLWithString:@"https://dynamodb.ap-south-1.amazonaws.com"]
                          serviceHostName:@"dynamodb.ap-south-1.amazonaws.com"];
    
}

- (void)testEndpointForEC2 {
    [self verifyServiceEndpointWithRegion:AWSRegionAPSoutheast1
                                  service:AWSServiceEC2
                               regionName:@"ap-southeast-1"
                              serviceName:@"ec2"
                               serviceURL:[NSURL URLWithString:@"https://ec2.ap-southeast-1.amazonaws.com"]
                          serviceHostName:@"ec2.ap-southeast-1.amazonaws.com"];
}

- (void)testEndpointForElasticLoadBalancing {
    [self verifyServiceEndpointWithRegion:AWSRegionAPNortheast1
                                  service:AWSServiceElasticLoadBalancing
                               regionName:@"ap-northeast-1"
                              serviceName:@"elasticloadbalancing"
                               serviceURL:[NSURL URLWithString:@"https://elasticloadbalancing.ap-northeast-1.amazonaws.com"]
                          serviceHostName:@"elasticloadbalancing.ap-northeast-1.amazonaws.com"];
    [self verifyServiceEndpointWithRegion:AWSRegionAPNortheast2
                                  service:AWSServiceElasticLoadBalancing
                               regionName:@"ap-northeast-2"
                              serviceName:@"elasticloadbalancing"
                               serviceURL:[NSURL URLWithString:@"https://elasticloadbalancing.ap-northeast-2.amazonaws.com"]
                          serviceHostName:@"elasticloadbalancing.ap-northeast-2.amazonaws.com"];
}

- (void)testEndpointForKinesis {
    [self verifyServiceEndpointWithRegion:AWSRegionAPSoutheast2
                                  service:AWSServiceKinesis
                               regionName:@"ap-southeast-2"
                              serviceName:@"kinesis"
                               serviceURL:[NSURL URLWithString:@"https://kinesis.ap-southeast-2.amazonaws.com"]
                          serviceHostName:@"kinesis.ap-southeast-2.amazonaws.com"];
}

- (void)testEndpointForLambda {
    [self verifyServiceEndpointWithRegion:AWSRegionSAEast1
                                  service:AWSServiceLambda
                               regionName:@"sa-east-1"
                              serviceName:@"lambda"
                               serviceURL:[NSURL URLWithString:@"https://lambda.sa-east-1.amazonaws.com"]
                          serviceHostName:@"lambda.sa-east-1.amazonaws.com"];
}

- (void)testEndpointForMachineLearning {
    [self verifyServiceEndpointWithRegion:AWSRegionCNNorth1
                                  service:AWSServiceMachineLearning
                               regionName:@"cn-north-1"
                              serviceName:@"machinelearning"
                               serviceURL:[NSURL URLWithString:@"https://machinelearning.cn-north-1.amazonaws.com.cn"]
                          serviceHostName:@"machinelearning.cn-north-1.amazonaws.com.cn"];
}

- (void)testEndpointForMobileAnalytics {
    [self verifyServiceEndpointWithRegion:AWSRegionUSEast1
                                  service:AWSServiceMobileAnalytics
                               regionName:@"us-east-1"
                              serviceName:@"mobileanalytics"
                               serviceURL:[NSURL URLWithString:@"https://mobileanalytics.us-east-1.amazonaws.com"]
                          serviceHostName:@"mobileanalytics.us-east-1.amazonaws.com"];
}

- (void)testEndpointForSES {
    [self verifyServiceEndpointWithRegion:AWSRegionUSEast1
                                  service:AWSServiceSES
                               regionName:@"us-east-1"
                              serviceName:@"email"
                               serviceURL:[NSURL URLWithString:@"https://email.us-east-1.amazonaws.com"]
                          serviceHostName:@"email.us-east-1.amazonaws.com"];
}

- (void)testEndpointForSNS {
    [self verifyServiceEndpointWithRegion:AWSRegionUSEast1
                                  service:AWSServiceSNS
                               regionName:@"us-east-1"
                              serviceName:@"sns"
                               serviceURL:[NSURL URLWithString:@"https://sns.us-east-1.amazonaws.com"]
                          serviceHostName:@"sns.us-east-1.amazonaws.com"];
}

- (void)testEndpointForSQS {
    [self verifyServiceEndpointWithRegion:AWSRegionUSEast1
                                  service:AWSServiceSQS
                               regionName:@"us-east-1"
                              serviceName:@"sqs"
                               serviceURL:[NSURL URLWithString:@"https://sqs.us-east-1.amazonaws.com"]
                          serviceHostName:@"sqs.us-east-1.amazonaws.com"];
}

- (void)testEndpointForSTS {
    [self verifyServiceEndpointWithRegion:AWSRegionUSEast1
                                  service:AWSServiceSTS
                               regionName:@"us-east-1"
                              serviceName:@"sts"
                               serviceURL:[NSURL URLWithString:@"https://sts.amazonaws.com"]
                          serviceHostName:@"sts.amazonaws.com"];
    
    [self verifyServiceEndpointWithRegion:AWSRegionCNNorth1
                                  service:AWSServiceSTS
                               regionName:@"cn-north-1"
                              serviceName:@"sts"
                               serviceURL:[NSURL URLWithString:@"https://sts.cn-north-1.amazonaws.com.cn"]
                          serviceHostName:@"sts.cn-north-1.amazonaws.com.cn"];
    
    [self verifyServiceEndpointWithRegion:AWSRegionUSGovWest1
                                  service:AWSServiceSTS
                               regionName:@"us-gov-west-1"
                              serviceName:@"sts"
                               serviceURL:[NSURL URLWithString:@"https://sts.us-gov-west-1.amazonaws.com"]
                          serviceHostName:@"sts.us-gov-west-1.amazonaws.com"];
}

- (void)testEndpointForSimpleDB {
    [self verifyServiceEndpointWithRegion:AWSRegionUSEast1
                                  service:AWSServiceSimpleDB
                               regionName:@"us-east-1"
                              serviceName:@"sdb"
                               serviceURL:[NSURL URLWithString:@"https://sdb.amazonaws.com"]
                          serviceHostName:@"sdb.amazonaws.com"];
    
    [self verifyServiceEndpointWithRegion:AWSRegionUSWest2
                                  service:AWSServiceSimpleDB
                               regionName:@"us-west-2"
                              serviceName:@"sdb"
                               serviceURL:[NSURL URLWithString:@"https://sdb.us-west-2.amazonaws.com"]
                          serviceHostName:@"sdb.us-west-2.amazonaws.com"];
}

- (void)testGlobalS3Endpoint {
    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com"];
    AWSEndpoint *endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                                        service:AWSServiceS3
                                                            URL:url];
    [self verifyServiceEndpointWith:endpoint
                         regionType:AWSRegionUSEast1
                            service:AWSServiceS3
                         regionName:@"us-east-1"
                        serviceName:@"s3"
                         serviceURL:url
                    serviceHostName:@"s3.amazonaws.com"
                       useUnsafeURL:NO];
}

- (void)testRegionBasedURLConstructorUSEast1S3Endpoint {
    NSURL *url = [NSURL URLWithString:@"https://s3.us-east-1.amazonaws.com"];
    AWSEndpoint *endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSEast1
                                                        service:AWSServiceS3
                                                            URL:url];
    [self verifyServiceEndpointWith:endpoint
                         regionType:AWSRegionUSEast1
                            service:AWSServiceS3
                         regionName:@"us-east-1"
                        serviceName:@"s3"
                         serviceURL:url
                    serviceHostName:@"s3.us-east-1.amazonaws.com"
                       useUnsafeURL:NO];
}

- (void)testRegionBasedURLConstructorUSWest2S3Endpoint {
    NSURL *url = [NSURL URLWithString:@"https://s3.us-west-2.amazonaws.com"];
    AWSEndpoint *endpoint = [[AWSEndpoint alloc] initWithRegion:AWSRegionUSWest2
                                                        service:AWSServiceS3
                                                            URL:url];
    [self verifyServiceEndpointWith:endpoint
                         regionType:AWSRegionUSWest2
                            service:AWSServiceS3
                         regionName:@"us-west-2"
                        serviceName:@"s3"
                         serviceURL:url
                    serviceHostName:@"s3.us-west-2.amazonaws.com"
                       useUnsafeURL:NO];
}

- (void)testCustomEndpoint {
    NSString *urlString = @"https://my-custom-endpoint-for-an-unspecified-service.example.com/";
    NSURL *expectedURL = [NSURL URLWithString:urlString];
    AWSEndpoint *customEndpoint = [[AWSEndpoint alloc]initWithURLString:urlString];
    [self verifyServiceEndpointWith:customEndpoint
                         regionType:AWSRegionUnknown
                            service:AWSServiceUnknown
                         regionName:NULL
                        serviceName:NULL
                         serviceURL:expectedURL
                    serviceHostName:@"my-custom-endpoint-for-an-unspecified-service.example.com"
                       useUnsafeURL:NO];
}

- (void)testEndpointForS3 {

    [self verifyServiceEndpointWithRegion:AWSRegionUSEast1
                                  service:AWSServiceS3
                               regionName:@"us-east-1"
                              serviceName:@"s3"
                               serviceURL:[NSURL URLWithString:@"https://s3.us-east-1.amazonaws.com"]
                          serviceHostName:@"s3.us-east-1.amazonaws.com"];

    [self verifyServiceEndpointWithRegion:AWSRegionUSWest2
                                  service:AWSServiceS3
                               regionName:@"us-west-2"
                              serviceName:@"s3"
                               serviceURL:[NSURL URLWithString:@"https://s3.us-west-2.amazonaws.com"]
                          serviceHostName:@"s3.us-west-2.amazonaws.com"];
    
    [self verifyServiceEndpointWithRegion:AWSRegionUSWest2
                                  service:AWSServiceS3
                               regionName:@"us-west-2"
                              serviceName:@"s3"
                               serviceURL:[NSURL URLWithString:@"http://s3.us-west-2.amazonaws.com"]
                          serviceHostName:@"s3.us-west-2.amazonaws.com"
                             useUnsafeURL:YES];
    
    [self verifyServiceEndpointWithRegion:AWSRegionUSGovWest1
                                  service:AWSServiceS3
                               regionName:@"us-gov-west-1"
                              serviceName:@"s3"
                               serviceURL:[NSURL URLWithString:@"https://s3.us-gov-west-1.amazonaws.com"]
                          serviceHostName:@"s3.us-gov-west-1.amazonaws.com"];
}

- (void)testEndpointForTargeting {
    [self verifyServiceEndpointWithRegion:AWSRegionUSEast1
                                  service:AWSServiceMobileTargeting
                               regionName:@"us-east-1"
                              serviceName:@"mobiletargeting"
                               serviceURL:[NSURL URLWithString:@"https://pinpoint.us-east-1.amazonaws.com"]
                          serviceHostName:@"pinpoint.us-east-1.amazonaws.com"];
}

- (void)testEndpointForTextract {
    [self verifyServiceEndpointWithRegion:AWSRegionUSEast1
                                  service:AWSServiceTextract
                               regionName:@"us-east-1"
                              serviceName:@"textract"
                               serviceURL:[NSURL URLWithString:@"https://textract.us-east-1.amazonaws.com"]
                          serviceHostName:@"textract.us-east-1.amazonaws.com"];
}

- (void)testEndpointForTranscribe {
    [self verifyServiceEndpointWithRegion:AWSRegionUSEast1
                                  service:AWSServiceTranscribe
                               regionName:@"us-east-1"
                              serviceName:@"transcribe"
                               serviceURL:[NSURL URLWithString:@"https://transcribe.us-east-1.amazonaws.com"]
                          serviceHostName:@"transcribe.us-east-1.amazonaws.com"];
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

- (void)testRegionTypeNames {
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionUSEast1], @"us-east-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionUSEast2], @"us-east-2");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionUSWest1], @"us-west-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionUSWest2], @"us-west-2");

    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionEUCentral1], @"eu-central-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionEUCentral2], @"eu-central-2");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionEUNorth1], @"eu-north-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionEUSouth1], @"eu-south-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionEUSouth2], @"eu-south-2");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionEUWest1], @"eu-west-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionEUWest2], @"eu-west-2");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionEUWest3], @"eu-west-3");

    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionAPEast1], @"ap-east-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionAPNortheast1], @"ap-northeast-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionAPNortheast2], @"ap-northeast-2");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionAPSouth1], @"ap-south-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionAPSouth2], @"ap-south-2");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionAPSoutheast1], @"ap-southeast-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionAPSoutheast2], @"ap-southeast-2");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionAPSoutheast3], @"ap-southeast-3");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionAPSoutheast4], @"ap-southeast-4");

    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionCNNorth1], @"cn-north-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionCNNorthWest1], @"cn-northwest-1");

    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionUSGovEast1], @"us-gov-east-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionUSGovWest1], @"us-gov-west-1");

    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionMECentral1], @"me-central-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionMESouth1], @"me-south-1");

    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionAFSouth1], @"af-south-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionCACentral1], @"ca-central-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionCAWest1], @"ca-west-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionILCentral1], @"il-central-1");
    XCTAssertEqualObjects([AWSEndpoint regionNameFromType:AWSRegionSAEast1], @"sa-east-1");
}

- (void)testStringRegionTypeValue {
    XCTAssertEqual([@"AWSRegionUSEast1" aws_regionTypeValue], AWSRegionUSEast1);
    XCTAssertEqual([@"USEast1" aws_regionTypeValue], AWSRegionUSEast1);
    XCTAssertEqual([@"us-east-1" aws_regionTypeValue], AWSRegionUSEast1);
    XCTAssertEqual([@"AWSRegionUSEast2" aws_regionTypeValue], AWSRegionUSEast2);
    XCTAssertEqual([@"USEast2" aws_regionTypeValue], AWSRegionUSEast2);
    XCTAssertEqual([@"us-east-2" aws_regionTypeValue], AWSRegionUSEast2);
    XCTAssertEqual([@"AWSRegionUSWest1" aws_regionTypeValue], AWSRegionUSWest1);
    XCTAssertEqual([@"USWest1" aws_regionTypeValue], AWSRegionUSWest1);
    XCTAssertEqual([@"us-west-1" aws_regionTypeValue], AWSRegionUSWest1);
    XCTAssertEqual([@"AWSRegionUSWest2" aws_regionTypeValue], AWSRegionUSWest2);
    XCTAssertEqual([@"USWest2" aws_regionTypeValue], AWSRegionUSWest2);
    XCTAssertEqual([@"us-west-2" aws_regionTypeValue], AWSRegionUSWest2);

    XCTAssertEqual([@"AWSRegionEUCentral1" aws_regionTypeValue], AWSRegionEUCentral1);
    XCTAssertEqual([@"EUCentral1" aws_regionTypeValue], AWSRegionEUCentral1);
    XCTAssertEqual([@"eu-central-1" aws_regionTypeValue], AWSRegionEUCentral1);
    XCTAssertEqual([@"AWSRegionEUCentral2" aws_regionTypeValue], AWSRegionEUCentral2);
    XCTAssertEqual([@"EUCentral2" aws_regionTypeValue], AWSRegionEUCentral2);
    XCTAssertEqual([@"eu-central-2" aws_regionTypeValue], AWSRegionEUCentral2);
    XCTAssertEqual([@"AWSRegionEUNorth1" aws_regionTypeValue], AWSRegionEUNorth1);
    XCTAssertEqual([@"EUNorth1" aws_regionTypeValue], AWSRegionEUNorth1);
    XCTAssertEqual([@"eu-north-1" aws_regionTypeValue], AWSRegionEUNorth1);
    XCTAssertEqual([@"AWSRegionEUSouth1" aws_regionTypeValue], AWSRegionEUSouth1);
    XCTAssertEqual([@"EUSouth1" aws_regionTypeValue], AWSRegionEUSouth1);
    XCTAssertEqual([@"eu-south-1" aws_regionTypeValue], AWSRegionEUSouth1);
    XCTAssertEqual([@"AWSRegionEUSouth2" aws_regionTypeValue], AWSRegionEUSouth2);
    XCTAssertEqual([@"EUSouth2" aws_regionTypeValue], AWSRegionEUSouth2);
    XCTAssertEqual([@"eu-south-2" aws_regionTypeValue], AWSRegionEUSouth2);
    XCTAssertEqual([@"AWSRegionEUWest1" aws_regionTypeValue], AWSRegionEUWest1);
    XCTAssertEqual([@"EUWest1" aws_regionTypeValue], AWSRegionEUWest1);
    XCTAssertEqual([@"eu-west-1" aws_regionTypeValue], AWSRegionEUWest1);
    XCTAssertEqual([@"AWSRegionEUWest2" aws_regionTypeValue], AWSRegionEUWest2);
    XCTAssertEqual([@"EUWest2" aws_regionTypeValue], AWSRegionEUWest2);
    XCTAssertEqual([@"eu-west-2" aws_regionTypeValue], AWSRegionEUWest2);
    XCTAssertEqual([@"AWSRegionEUWest3" aws_regionTypeValue], AWSRegionEUWest3);
    XCTAssertEqual([@"EUWest3" aws_regionTypeValue], AWSRegionEUWest3);
    XCTAssertEqual([@"eu-west-3" aws_regionTypeValue], AWSRegionEUWest3);

    XCTAssertEqual([@"AWSRegionAPEast1" aws_regionTypeValue], AWSRegionAPEast1);
    XCTAssertEqual([@"APEast1" aws_regionTypeValue], AWSRegionAPEast1);
    XCTAssertEqual([@"ap-east-1" aws_regionTypeValue], AWSRegionAPEast1);
    XCTAssertEqual([@"AWSRegionAPNortheast1" aws_regionTypeValue], AWSRegionAPNortheast1);
    XCTAssertEqual([@"APNortheast1" aws_regionTypeValue], AWSRegionAPNortheast1);
    XCTAssertEqual([@"ap-northeast-1" aws_regionTypeValue], AWSRegionAPNortheast1);
    XCTAssertEqual([@"AWSRegionAPNortheast2" aws_regionTypeValue], AWSRegionAPNortheast2);
    XCTAssertEqual([@"APNortheast2" aws_regionTypeValue], AWSRegionAPNortheast2);
    XCTAssertEqual([@"ap-northeast-2" aws_regionTypeValue], AWSRegionAPNortheast2);
    XCTAssertEqual([@"AWSRegionAPSouth1" aws_regionTypeValue], AWSRegionAPSouth1);
    XCTAssertEqual([@"APSouth1" aws_regionTypeValue], AWSRegionAPSouth1);
    XCTAssertEqual([@"ap-south-1" aws_regionTypeValue], AWSRegionAPSouth1);
    XCTAssertEqual([@"AWSRegionAPSouth2" aws_regionTypeValue], AWSRegionAPSouth2);
    XCTAssertEqual([@"APSouth2" aws_regionTypeValue], AWSRegionAPSouth2);
    XCTAssertEqual([@"ap-south-2" aws_regionTypeValue], AWSRegionAPSouth2);
    XCTAssertEqual([@"AWSRegionAPSoutheast1" aws_regionTypeValue], AWSRegionAPSoutheast1);
    XCTAssertEqual([@"APSoutheast1" aws_regionTypeValue], AWSRegionAPSoutheast1);
    XCTAssertEqual([@"ap-southeast-1" aws_regionTypeValue], AWSRegionAPSoutheast1);
    XCTAssertEqual([@"AWSRegionAPSoutheast2" aws_regionTypeValue], AWSRegionAPSoutheast2);
    XCTAssertEqual([@"APSoutheast2" aws_regionTypeValue], AWSRegionAPSoutheast2);
    XCTAssertEqual([@"ap-southeast-2" aws_regionTypeValue], AWSRegionAPSoutheast2);
    XCTAssertEqual([@"AWSRegionAPSoutheast3" aws_regionTypeValue], AWSRegionAPSoutheast3);
    XCTAssertEqual([@"APSoutheast3" aws_regionTypeValue], AWSRegionAPSoutheast3);
    XCTAssertEqual([@"ap-southeast-3" aws_regionTypeValue], AWSRegionAPSoutheast3);
    XCTAssertEqual([@"AWSRegionAPSoutheast4" aws_regionTypeValue], AWSRegionAPSoutheast4);
    XCTAssertEqual([@"APSoutheast4" aws_regionTypeValue], AWSRegionAPSoutheast4);
    XCTAssertEqual([@"ap-southeast-4" aws_regionTypeValue], AWSRegionAPSoutheast4);

    XCTAssertEqual([@"AWSRegionCNNorth1" aws_regionTypeValue], AWSRegionCNNorth1);
    XCTAssertEqual([@"CNNorth1" aws_regionTypeValue], AWSRegionCNNorth1);
    XCTAssertEqual([@"cn-north-1" aws_regionTypeValue], AWSRegionCNNorth1);
    XCTAssertEqual([@"AWSRegionCNNorthWest1" aws_regionTypeValue], AWSRegionCNNorthWest1);
    XCTAssertEqual([@"CNNorthWest1" aws_regionTypeValue], AWSRegionCNNorthWest1);
    XCTAssertEqual([@"cn-northwest-1" aws_regionTypeValue], AWSRegionCNNorthWest1);

    XCTAssertEqual([@"AWSRegionUSGovEast1" aws_regionTypeValue], AWSRegionUSGovEast1);
    XCTAssertEqual([@"USGovEast1" aws_regionTypeValue], AWSRegionUSGovEast1);
    XCTAssertEqual([@"us-gov-east-1" aws_regionTypeValue], AWSRegionUSGovEast1);
    XCTAssertEqual([@"AWSRegionUSGovWest1" aws_regionTypeValue], AWSRegionUSGovWest1);
    XCTAssertEqual([@"USGovWest1" aws_regionTypeValue], AWSRegionUSGovWest1);
    XCTAssertEqual([@"us-gov-west-1" aws_regionTypeValue], AWSRegionUSGovWest1);

    XCTAssertEqual([@"AWSRegionMECentral1" aws_regionTypeValue], AWSRegionMECentral1);
    XCTAssertEqual([@"MECentral1" aws_regionTypeValue], AWSRegionMECentral1);
    XCTAssertEqual([@"me-central-1" aws_regionTypeValue], AWSRegionMECentral1);
    XCTAssertEqual([@"AWSRegionMESouth1" aws_regionTypeValue], AWSRegionMESouth1);
    XCTAssertEqual([@"MESouth1" aws_regionTypeValue], AWSRegionMESouth1);
    XCTAssertEqual([@"me-south-1" aws_regionTypeValue], AWSRegionMESouth1);

    XCTAssertEqual([@"AWSRegionAFSouth1" aws_regionTypeValue], AWSRegionAFSouth1);
    XCTAssertEqual([@"AFSouth1" aws_regionTypeValue], AWSRegionAFSouth1);
    XCTAssertEqual([@"af-south-1" aws_regionTypeValue], AWSRegionAFSouth1);

    XCTAssertEqual([@"AWSRegionCACentral1" aws_regionTypeValue], AWSRegionCACentral1);
    XCTAssertEqual([@"CACentral1" aws_regionTypeValue], AWSRegionCACentral1);
    XCTAssertEqual([@"ca-central-1" aws_regionTypeValue], AWSRegionCACentral1);
    
    XCTAssertEqual([@"AWSRegionCAWest1" aws_regionTypeValue], AWSRegionCAWest1);
    XCTAssertEqual([@"CAWest1" aws_regionTypeValue], AWSRegionCAWest1);
    XCTAssertEqual([@"ca-west-1" aws_regionTypeValue], AWSRegionCAWest1);

    XCTAssertEqual([@"AWSRegionILCentral1" aws_regionTypeValue], AWSRegionILCentral1);
    XCTAssertEqual([@"ILCentral1" aws_regionTypeValue], AWSRegionILCentral1);
    XCTAssertEqual([@"il-central-1" aws_regionTypeValue], AWSRegionILCentral1);

    XCTAssertEqual([@"AWSRegionSAEast1" aws_regionTypeValue], AWSRegionSAEast1);
    XCTAssertEqual([@"SAEast1" aws_regionTypeValue], AWSRegionSAEast1);
    XCTAssertEqual([@"sa-east-1" aws_regionTypeValue], AWSRegionSAEast1);
}

@end
