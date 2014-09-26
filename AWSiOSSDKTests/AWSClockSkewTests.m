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

#import <XCTest/XCTest.h>
#import "AWSCore.h"
#import "S3.h"
#import "SimpleDB.h"
#import "DynamoDB.h"
#import "SQS.h"
#import "SNS.h"
#import "CloudWatch.h"
#import "SES.h"
#import "EC2.h"
#import "AutoScaling.h"
#import "ElasticLoadBalancing.h"
#import "Kinesis.h"
#import "AWSKinesis.h"
#import "AWSTestUtility.h"
#import "AWSMobileAnalyticsERS.h"

@import ObjectiveC.runtime;


@interface AWSClockSkewTests : XCTestCase

@end

@implementation AWSClockSkewTests

Method _originalDateMethod;
Method _mockDateMethod;
static char mockDateKey;

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];

    if (![[AWSServiceManager defaultServiceManager] serviceForKey:@"test-sts"]) {
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
        AWSSTS *sts = [[AWSSTS alloc] initWithConfiguration:configuration];
        [[AWSServiceManager defaultServiceManager] setService:sts forKey:@"test-sts"];
    }
    
    // Start by having the mock return the test startup date
    [self setMockDate:[NSDate date]];
    
    // Save these as instance variables so test teardown can swap the implementation back
    _originalDateMethod = class_getClassMethod([NSDate class], @selector(date));
    _mockDateMethod = class_getInstanceMethod([self class], @selector(mockDateSwizzle));
    method_exchangeImplementations(_originalDateMethod, _mockDateMethod);
   
    //make sure current runTimeClockSkew is 0
    [NSDate aws_setRuntimeClockSkew:0];
   

}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    // Revert the swizzle
    method_exchangeImplementations(_mockDateMethod, _originalDateMethod);
    //reset RunTimeClockSkew
    [NSDate aws_setRuntimeClockSkew:0];
}

// Mock Method, replaces [NSDate date]
-(NSDate *)mockDateSwizzle {
    return objc_getAssociatedObject([NSDate class], &mockDateKey);
}

// Convenience method so tests can set want they want [NSDate date] to return
-(void)setMockDate:(NSDate *)aMockDate {
    objc_setAssociatedObject([NSDate class], &mockDateKey, aMockDate, OBJC_ASSOCIATION_RETAIN);
}

// ERS Test
#if !AWS_TEST_BJS_INSTEAD
-(void)testClockSkewERS
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSMobileAnalyticsERS *ers = [AWSMobileAnalyticsERS defaultMobileAnalyticsERS];
    XCTAssertNotNil(ers);
    
    AWSMobileAnalyticsERSPutEventsInput *putEventInput = [AWSMobileAnalyticsERSPutEventsInput new];
    
    
    AWSMobileAnalyticsERSEvent *eventOne = [AWSMobileAnalyticsERSEvent new];
    
    eventOne.attributes = @{};
    eventOne.version = @"v2.0";
    eventOne.eventType = @"_session.start";
    eventOne.timestamp = [[NSDate date] aws_stringValue:AWSDateISO8601DateFormat3];
    
    AWSMobileAnalyticsERSSession *serviceSession = [AWSMobileAnalyticsERSSession new];
    serviceSession.id = @"SMZSP1G8-21c9ac01-20140604-171714026";
    serviceSession.startTimestamp = [[NSDate date] aws_stringValue:AWSDateISO8601DateFormat3];
    
    eventOne.session = serviceSession;
    
    putEventInput.events = @[eventOne];
    
    NSDictionary *clientContext = @{@"client": @{@"app_package_name": @"MT3T3XMSMZSP1G8",
                                                 @"app_version_name":@"v1.2",
                                                 @"app_version_code":@"3",
                                                 @"app_title":[NSNull null],
                                                 @"client_id":@"0a877e9d-c7c0-4269-b138-cb3f21c9ac01"
                                                 },
                                    @"env" : @{@"model": @"iPhone Simulator",
                                               @"make":@"Apple",
                                               @"platform":@"IOS",
                                               @"platform_version":@"4.3.1",
                                               @"locale":@"en-US"},
                                    @"custom" : @{},
                                    };
    NSString *clientContextJsonString = [[NSString alloc] initWithData: [NSJSONSerialization dataWithJSONObject:clientContext options:0 error:nil] encoding:NSUTF8StringEncoding];
    
    putEventInput.clientContext = clientContextJsonString;
    
    [[[ers putEvents:putEventInput] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        
        return nil;
        
    }] waitUntilFinished ];

    
}
#endif
// S3 Test
-(void)testClockSkewS3
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
   
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    
    [[[s3 listBuckets:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListBucketsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListBucketsOutput class]));

        return nil;
    }] waitUntilFinished];
   
}

//SimpleDB Tests
#if !AWS_TEST_BJS_INSTEAD
-(void)testClockSkewSimpleDB
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSSimpleDB *sdb = [AWSSimpleDB defaultSimpleDB];
    XCTAssertNotNil(sdb);
    
    AWSSimpleDBListDomainsRequest *listDomainsRequest = [AWSSimpleDBListDomainsRequest new];
    [[[sdb listDomains:listDomainsRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            AWSSimpleDBListDomainsResult *listDomainsResult = task.result;
            XCTAssertNotNil(listDomainsResult, @"listDomainsResult should not be nil.");
        }
        
        return nil;
    }] waitUntilFinished];
}
#endif

//DynamoDB Test
-(void)testClockSkewDynamoDB
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];
    XCTAssertNotNil(dynamoDB);
    
    AWSDynamoDBListTablesInput *listTablesInput = [AWSDynamoDBListTablesInput new];
    
    [[[dynamoDB listTables:listTablesInput
       ] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        } else {
            AWSDynamoDBListTablesOutput *listTableOutput = task.result;
            XCTAssertNotNil(listTableOutput, @"AWSDynamoDBListTablesOutput should not be nil");
        }
        
        return nil;
    }] waitUntilFinished];
}

//SQS Test
-(void)testClockSkewSQS
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSSQS *sqs = [AWSSQS defaultSQS];
    XCTAssertNotNil(sqs);
    
    AWSSQSListQueuesRequest *listQueuesRequest = [AWSSQSListQueuesRequest new];
    [[[sqs listQueues:listQueuesRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            AWSSQSListQueuesResult *listQueuesResult = task.result;
            AWSLogDebug(@"[%@]", listQueuesResult);
            XCTAssertNotNil(listQueuesResult.queueUrls);
        }
        
        return nil;
    }] waitUntilFinished];
    
}

//SNS Test
-(void)testClockSkewSNS
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSSNS *sns = [AWSSNS defaultSNS];
    XCTAssertNotNil(sns);
    
    AWSSNSListTopicsInput *listTopicsInput = [AWSSNSListTopicsInput new];
    [[[sns listTopics:listTopicsInput] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSSNSListTopicsResponse class]]);
            AWSSNSListTopicsResponse *listTopicsResponse = task.result;
            XCTAssertTrue([listTopicsResponse.topics isKindOfClass:[NSArray class]]);
        }
        
        return nil;
    }] waitUntilFinished];
}

//CloudWatch Test
-(void)testClockSkewCW
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSCloudWatch *cloudWatch = [AWSCloudWatch defaultCloudWatch];
    XCTAssertNotNil(cloudWatch);
    
    [[[cloudWatch listMetrics:nil] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCloudWatchListMetricsOutput class]]);
            AWSCloudWatchListMetricsOutput *listMetricsOutput = task.result;
            XCTAssertNotNil(listMetricsOutput.metrics);
        }
        
        return nil;
    }] waitUntilFinished];
}

//SES Test
#if !AWS_TEST_BJS_INSTEAD
-(void)testClockSkewSES
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSSES *ses = [AWSSES defaultSES];
    XCTAssertNotNil(ses);
    
    [[[ses getSendQuota:nil] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSSESGetSendQuotaResponse class]]);
            AWSSESGetSendQuotaResponse *getSendQuotaResponse = task.result;
            XCTAssertTrue(getSendQuotaResponse.max24HourSend > 0);
            XCTAssertTrue(getSendQuotaResponse.maxSendRate > 0);
        }
        
        return nil;
    }] waitUntilFinished];
}
#endif

//EC2 Test
-(void)testClockSkewEC2
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSEC2 *ec2 = [AWSEC2 defaultEC2];
    XCTAssertNotNil(ec2);
    
    AWSEC2DescribeInstancesRequest *describeInstancesRequest = [AWSEC2DescribeInstancesRequest new];
    [[[ec2 describeInstances:describeInstancesRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSEC2DescribeInstancesResult class]]);
            AWSEC2DescribeInstancesResult *describeInstancesResult = task.result;
            XCTAssertNotNil(describeInstancesResult.reservations);
        }
        
        return nil;
    }] waitUntilFinished];
}

//ELB Test
-(void)testClockSkewELB
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    AWSElasticLoadBalancing *elb = [AWSElasticLoadBalancing defaultElasticLoadBalancing];
    XCTAssertNotNil(elb);
    
    AWSElasticLoadBalancingDescribeAccessPointsInput *describeAccessPointsInput = [AWSElasticLoadBalancingDescribeAccessPointsInput new];
    [[[elb describeLoadBalancers:describeAccessPointsInput] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSElasticLoadBalancingDescribeAccessPointsOutput class]]);
            AWSElasticLoadBalancingDescribeAccessPointsOutput *describeAccessPointsOutput = task.result;
            XCTAssertNotNil(describeAccessPointsOutput.loadBalancerDescriptions, @"loadBalancerDescriptions Array should not be nil");
        }
        
        return nil;
    }] waitUntilFinished];
}

//AutoScaling Test
-(void)testClockSkewAS
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSAutoScaling *autoScaling = [AWSAutoScaling defaultAutoScaling];
    XCTAssertNotNil(autoScaling);
    
    [[[autoScaling describeAccountLimits:nil] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSAutoScalingDescribeAccountLimitsAnswer class]]);
            AWSAutoScalingDescribeAccountLimitsAnswer *describeAccountLimitsAnswer = task.result;
            XCTAssertNotNil(describeAccountLimitsAnswer.maxNumberOfAutoScalingGroups);
        }
        
        return nil;
    }] waitUntilFinished];
}

//STS Test
-(void)testClockSkewSTS
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSSTS *sts = (AWSSTS *)[[AWSServiceManager defaultServiceManager] serviceForKey:@"test-sts"];
    XCTAssertNotNil(sts);
    
    AWSSTSGetSessionTokenRequest *getSessionTokenRequest = [AWSSTSGetSessionTokenRequest new];
    getSessionTokenRequest.durationSeconds = @900;
    
    [[[sts getSessionToken:getSessionTokenRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            AWSSTSGetSessionTokenResponse *getSessionTokenResponse = task.result;
            XCTAssertTrue([getSessionTokenResponse.credentials.accessKeyId length] > 0);
            XCTAssertTrue([getSessionTokenResponse.credentials.secretAccessKey length] > 0);
            XCTAssertTrue([getSessionTokenResponse.credentials.sessionToken length] > 0);
            XCTAssertTrue([getSessionTokenResponse.credentials.expiration isKindOfClass:[NSDate class]]);
        }
        
        return nil;
    }] waitUntilFinished];

}

//Kinesis Test
#if !AWS_TEST_BJS_INSTEAD
-(void)testClockSkewKinesis
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];
    XCTAssertNotNil(kinesis);
    
    AWSKinesisListStreamsInput *listStreamsInput = [AWSKinesisListStreamsInput new];
    [[[kinesis listStreams:listStreamsInput] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSKinesisListStreamsOutput class]]);
            AWSKinesisListStreamsOutput *listStreamsOutput = task.result;
            XCTAssertNotNil(listStreamsOutput.streamNames);
        }
        
        return nil;
    }] waitUntilFinished];
}
#endif

//Cognito Identity Service Test
#if !AWS_TEST_BJS_INSTEAD
-(void)testClockSkewCognitoIdentityService
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSCognitoIdentity *cib = [AWSCognitoIdentity defaultCognitoIdentity];
    XCTAssertNotNil(cib);
    
    AWSCognitoIdentityListIdentityPoolsInput *listPools = [AWSCognitoIdentityListIdentityPoolsInput new];
    listPools.maxResults = @10;
    [[[cib listIdentityPools:listPools] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCognitoIdentityListIdentityPoolsResponse class]]);
        }
        
        return nil;
    }] waitUntilFinished];

}
#endif

@end
