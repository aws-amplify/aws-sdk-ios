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

#import <XCTest/XCTest.h>
#import "AWSCore.h"
#import "AWSGZIP.h"
#import "AWSSerialization.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSXMLDictionary.h"

@interface AWSJSONResponseSerializer()

@property (nonatomic, assign) Class outputClass;

@end

@interface AWSCoreTests : XCTestCase

@end

@implementation AWSCoreTests

static NSString* const awsConfigurationJsonFileName = @"awsconfiguration.json";

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testCaseInsentitiveDictionary {
    NSDictionary *testDic = @{@"message": @"a value with lowercased key"};
    XCTAssertNotNil([testDic aws_objectForCaseInsensitiveKey:@"Message"]);
    XCTAssertNotNil([testDic aws_objectForCaseInsensitiveKey:@"MeSSage"]);
    XCTAssertNotNil([testDic aws_objectForCaseInsensitiveKey:@"messaGe"]);
    
    NSMutableDictionary *testMutableDic = [NSMutableDictionary new];
    [testMutableDic setObject:@"a value with uppercase key " forKey:@"Message"];
    
    XCTAssertNotNil([testMutableDic aws_objectForCaseInsensitiveKey:@"message"]);
    XCTAssertNotNil([testMutableDic aws_objectForCaseInsensitiveKey:@"meSsage"]);
}
- (void)testDateToString {
    //660096000 is 12/02/1990 hour 0 min 0 sec 0 GMT
    NSDate *testDateAWSDateDateStampFormat = [NSDate dateWithTimeIntervalSince1970:660096000];
    NSString *dateString = [testDateAWSDateDateStampFormat aws_stringValue:AWSDateShortDateFormat1];
    NSString *correctString = @"19901202";

    XCTAssertEqualWithAccuracy([dateString doubleValue], [correctString doubleValue], 10);

    NSDate *testDateAWSDateAmzDateFormat = [NSDate dateWithTimeIntervalSince1970:660096000];
    NSString *dateStringAWSDateAmzDateFormat = [testDateAWSDateAmzDateFormat aws_stringValue:AWSDateISO8601DateFormat2];
    NSString *correctStringAWSDateAmzDateFormat = @"19901202T000000Z";

    XCTAssertTrue([correctStringAWSDateAmzDateFormat isEqualToString:dateStringAWSDateAmzDateFormat], @"DateToString failed. Expecting: %@ , Actual: %@",correctStringAWSDateAmzDateFormat,dateStringAWSDateAmzDateFormat);
}

- (void)testStringToDate {
    NSString *testStringAWSDateDateStampFormat = @"19901202";
    NSDate *testDate = [NSDate aws_dateFromString:testStringAWSDateDateStampFormat format:AWSDateShortDateFormat1];
    double testTime = [testDate timeIntervalSince1970];
    double expectedTime = 660096000;

    XCTAssertEqualWithAccuracy(testTime, expectedTime, 10, "Failed to create a proper date from string usingAWSDateDateStampFormat");

    NSString *testStringAWSDateAmzDateFormat = @"19901202T000000Z";
    NSDate *testDateAmz = [NSDate aws_dateFromString:testStringAWSDateAmzDateFormat format:AWSDateISO8601DateFormat2];
    double testTimeAmz = [testDateAmz timeIntervalSince1970];

    XCTAssertEqualWithAccuracy(testTimeAmz, expectedTime, 10, "Failed to create a proper date from string usingAWSDateAmzDateFormat");
}

- (void)testNumberFormatt {
    XCTAssertEqualObjects([NSNumber aws_numberFromString:@"12345.67"], @12345.67);
    XCTAssertNil([NSNumber aws_numberFromString:@"12345,67"]);
}

- (void)testUrlEncode {
    NSString *inputOne = @"test %";
    NSString *inputTwo = [NSString stringWithFormat:@"test %%"];
    XCTAssertEqualObjects([inputOne aws_stringWithURLEncoding], @"test%20%25");
    XCTAssertEqualObjects([inputTwo aws_stringWithURLEncoding], @"test%20%25");
}

- (void)testAWSJSONRequestSerializer {
    NSString *testURLString = @"http://aws.amazon.com";
    NSURL *testURL = [NSURL URLWithString:testURLString];
    NSMutableURLRequest *testRequest = [NSMutableURLRequest requestWithURL:testURL];
    testRequest.HTTPMethod = @"POST";
    
    NSMutableDictionary *testParams = [NSMutableDictionary new];
    NSString *paramKey1 = @"Key1 oparameters";
    NSString *paramKey2 = @"Key2 of parameters";
    NSString *paramValue1 = @"Value of Key1";
    NSString *paramValue2 = @"Value of Key2";
    
    [testParams setObject:paramValue1 forKey:paramKey1];
    [testParams setObject:paramValue2 forKey:paramKey2];
    
    NSMutableDictionary *testHeaders = [NSMutableDictionary new];
    NSString *contentLengthKey = @"Content-Length";
    NSString *contentTypeKey = @"Content-Type";
    NSString *contentLengthValue = @"283947";
    NSString *contentTypeValue = @"text/plain";
    [testHeaders setObject:contentLengthValue forKey:contentLengthKey];
    [testHeaders setObject:contentTypeValue forKey:contentTypeKey];
    
    AWSJSONRequestSerializer *jsonSerializer = [AWSJSONRequestSerializer new];
    
    [[[[jsonSerializer serializeRequest:testRequest
                                headers:testHeaders
                             parameters:testParams] continueWithSuccessBlock:^id(AWSTask *task) {
        //Assert headers are properly set
        NSDictionary *serializedHeaders = [testRequest allHTTPHeaderFields];
        XCTAssertEqualObjects(testHeaders, serializedHeaders, "JSONSerializer failed to properly attach headers");
        
        //Assert body is properly in JSON
        NSData *jsonData = [testRequest HTTPBody];
        
        NSError *error = nil;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:&error];
        
        if (error){
            XCTFail("Error while parsing JSON created with AWSJSONRequestSerializer %@", error);
        }
        XCTAssertEqualObjects(testParams, jsonDictionary, "Parameters could not be correctly parsed into JSON and re-interpreted");
        
        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail("Error encountered while serializing request to JSON %@", task.error);
        }
        return nil;
    }] waitUntilFinished];
}

- (void)testJSONRequestPayloadIsGzippedIfSpecifiedInHeaders {
    // We'll assign these inside the continuation block after serialization, and
    // assert on them after the block completes
    __block NSString *requestContentEncoding = nil;
    __block NSData *requestHTTPBody = nil;

    NSString *testURLString = @"http://aws.amazon.com";
    NSURL *testURL = [NSURL URLWithString:testURLString];
    NSMutableURLRequest *testRequest = [NSMutableURLRequest requestWithURL:testURL];
    testRequest.HTTPMethod = @"POST";

    NSDictionary *testParams = @{ @"Key1": @"Value1" };
    NSDictionary *testHeaders = @{
                                  @"Content-Encoding":@"gzip"
                                  };

    AWSJSONRequestSerializer *jsonSerializer = [AWSJSONRequestSerializer new];

    [[[jsonSerializer serializeRequest:testRequest
                               headers:testHeaders
                            parameters:testParams] continueWithSuccessBlock:^id(AWSTask *task) {
        NSDictionary *serializedHeaders = [testRequest allHTTPHeaderFields];
        requestContentEncoding = [serializedHeaders objectForKey:@"Content-Encoding"];
        requestHTTPBody = [testRequest HTTPBody];
        return nil;
    }] waitUntilFinished];

    XCTAssertNotNil(requestContentEncoding, "Content encoding should not be nil");
    XCTAssertEqual(@"gzip", requestContentEncoding);

    XCTAssertNotNil(requestHTTPBody, "Request HTTP Body should not be nil");

    NSData *jsonData = [requestHTTPBody awsgzip_gunzippedData];
    XCTAssertNotNil(jsonData, @"jsonData should not be nil");

    NSError *error = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:NSJSONReadingMutableContainers
                                                                     error:&error];
    XCTAssertNil(error, @"Error serializing unzipped data into JSON: %@", error);

    XCTAssertEqualObjects(jsonDictionary, testParams, @"Unzipped JSON data does not equal incoming data");
}

- (void)testXMLSerializer {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"rest-xml-input" ofType:@"json"];
    
    NSError *error = nil;
    NSMutableArray *xmlTestPackages = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:&error];
    XCTAssertNil(error);
    
    for (int i=0; i<[xmlTestPackages count]; i++) {

        NSMutableDictionary *aTestPak = [xmlTestPackages objectAtIndex:i];
        NSArray *testCases = [aTestPak objectForKey:@"cases"];
        for(int j=0; j<[testCases count]; j++) {
            NSDictionary *aTest = [testCases objectAtIndex:j];
            
            //create mockRequest
            NSMutableURLRequest *mockRequest = [NSMutableURLRequest new];
            mockRequest.URL = [NSURL URLWithString:@""];
            
            //create user input parameters
            NSDictionary *testParameters = aTest[@"params"];
            //create mock ServiceDefinitionJSON
            NSDictionary *mockServiceDefinitionJSON = aTestPak;
            
            
            //construct serviceDefinition dictionary
            if (aTestPak[@"operations"] == nil) {
                aTestPak[@"operations"] = [NSMutableDictionary new];
            }
            if (aTestPak[@"operations"][@"given"]) {
                [aTestPak[@"operations"] removeObjectForKey:@"given"];
            }
            aTestPak[@"operations"][@"given"] = aTest[@"given"];
            // ------------ Perform Serialization ---------------------
            // --------------------------------------------------------
            
            AWSXMLRequestSerializer *testXmlRequestSerializer = [AWSXMLRequestSerializer new];
            [testXmlRequestSerializer setValue:mockServiceDefinitionJSON forKey:@"serviceDefinitionJSON"];
            [testXmlRequestSerializer setValue:@"given" forKey:@"actionName"];
            
            
            AWSTask *resultTask = [testXmlRequestSerializer serializeRequest:mockRequest
                                                                    headers:@{}
                                                                 parameters:testParameters];
            if (resultTask.error) {
                XCTFail(@"(TestPak %d TestCase %d) Serialization Error:%@",i,j,resultTask.error);
                return;
            }
            
            //---------- Validate Result -------------------------------
            
            //validate result
            NSDictionary *resultDic = aTest[@"serialized"];
            
            //validate HTTP URL
            XCTAssertEqualObjects(resultDic[@"uri"], [mockRequest.URL absoluteString], @"(TestPak %d TestCase %d) wrong HTTP URI, expect:%@, but got:%@",i,j,resultDic[@"uri"],[mockRequest.URL absoluteString]);
            
            //validate HTTP Method
            if (resultDic[@"method"]) {
                XCTAssertEqualObjects(resultDic[@"method"], mockRequest.HTTPMethod, @"(TestPak %d TestCase %d) wrong HTTP Method, expect:%@, but got:%@",i,j,resultDic[@"method"],mockRequest.HTTPMethod);
            }
            
            //validate HTTP Body
            NSString* resultBodyStr = [[NSString alloc] initWithData:mockRequest.HTTPBody encoding:NSUTF8StringEncoding];
            NSString* expectedBodyStr = resultDic[@"body"];
            
            AWSXMLDictionaryParser *xmlParser = [AWSXMLDictionaryParser new];
            xmlParser.trimWhiteSpace = YES;
            xmlParser.stripEmptyNodes = NO;
            xmlParser.wrapRootNode = YES; //wrapRootNode for easy process
            xmlParser.nodeNameMode = AWSXMLDictionaryNodeNameModeNever; //do not need rootName anymore since rootNode is wrapped.
            
            NSDictionary *resultBodyDic = [xmlParser dictionaryWithString:resultBodyStr];
            NSDictionary *expectedBodyDic = [xmlParser dictionaryWithString:expectedBodyStr];
            if (!expectedBodyDic) {
                XCTAssertEqualObjects(expectedBodyStr,resultBodyStr , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedBodyStr, resultBodyStr);
            } else {
                XCTAssertEqualObjects(expectedBodyDic,resultBodyDic , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedBodyDic, resultBodyDic);
            }
            
            
            //validate HTTP Headers
            for (NSString *ekey in resultDic[@"headers"]) {
                NSString *evalue = resultDic[@"headers"][ekey];
                
                if ([[[mockRequest allHTTPHeaderFields] allKeys] containsObject:ekey] == NO) {
                    XCTFail(@"(TestPak %d TestCase %d) no %@ in the headers!",i,j,ekey);
                } else {
                    XCTAssertEqualObjects(evalue, [[mockRequest allHTTPHeaderFields] objectForKey:ekey], @"(TestPak %d TestCase %d) wrong value in header. expect key pair %@:%@, but got: %@,%@",i,j,ekey,evalue,ekey,[[mockRequest allHTTPHeaderFields] objectForKey:ekey]);
                }
            }
            
            
        }
        
    }
    
}

- (void)testXmlDeserializer {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"rest-xml-output" ofType:@"json"];
    NSError *error = nil;
    NSMutableArray *jsonTestPackages = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:&error];
    XCTAssertNil(error);
    

    for (int i=0; i<[jsonTestPackages count]; i++) {
        NSMutableDictionary *aTestPak = [jsonTestPackages objectAtIndex:i];
        NSArray *testCases = [aTestPak objectForKey:@"cases"];
        for(int j=0; j<[testCases count]; j++) {
            NSDictionary *aTest = [testCases objectAtIndex:j];

            //create mockResponse
            NSDictionary *responseHeaders = aTest[@"response"][@"headers"];
            NSInteger statusCode = [aTest[@"response"][@"status_code"] integerValue];
            NSHTTPURLResponse *mockResponse = [[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:@"/"] statusCode:statusCode HTTPVersion:@"HTTP/1.1" headerFields:responseHeaders];

            //construct serviceDefinition dictionary
            if (aTestPak[@"operations"] == nil) {
                aTestPak[@"operations"] = [NSMutableDictionary new];
            }
            if (aTestPak[@"operations"][@"OperationName"]) {
                [aTestPak[@"operations"] removeObjectForKey:@"OperationName"];
            }
            aTestPak[@"operations"][@"OperationName"] = aTest[@"given"];

            //create mock ServiceDefinitionJSON
            NSDictionary *mockServiceDefinitionJSON = aTestPak;


            // ------------ Perform Serialization ---------------------
            // --------------------------------------------------------

            AWSXMLResponseSerializer *testXmlResponseSerializer = [AWSXMLResponseSerializer new];
            [testXmlResponseSerializer setValue:mockServiceDefinitionJSON forKey:@"serviceDefinitionJSON"];
            [testXmlResponseSerializer setValue:@"OperationName" forKey:@"actionName"];
           


            NSString *responseBodyStr = aTest[@"response"][@"body"];
            NSData *responseBodyData = [responseBodyStr dataUsingEncoding:NSUTF8StringEncoding];
             NSError *parseError = nil;
            id responseResult = [[testXmlResponseSerializer responseObjectForResponse:mockResponse originalRequest:nil currentRequest:nil data:responseBodyData error:&parseError] mutableCopy];
            if (parseError) {
                XCTFail(@"(TestPak %d TestCase %d) Serialization Error:%@",i,j,parseError);
                return;
            }

            // ------------Validate Result------------------------------
            if ([responseResult isKindOfClass:[NSDictionary class]] && [responseResult objectForKey:@"Stream"]) {
                NSMutableDictionary *tempResult = [responseResult mutableCopy];
                [tempResult setObject:[[NSString alloc] initWithData:responseResult[@"Stream"] encoding:NSUTF8StringEncoding] forKey:@"Stream"];
                responseResult = tempResult;
            }
            //validate result
            NSDictionary *expectedResult = aTest[@"result"];
            
            [self replaceNSData2NSString:responseResult];

            
            XCTAssertEqualObjects(expectedResult,responseResult , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedResult, responseResult);

        }

    }
}

- (void)testQueryStringSerializer {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"query-input" ofType:@"json"];
    NSError *error = nil;
    NSMutableArray *queryTestPackages = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:&error];
    XCTAssertNil(error);
    
    for (int i=0; i<[queryTestPackages count]; i++) {
        NSMutableDictionary *aTestPak = [queryTestPackages objectAtIndex:i];
        NSArray *testCases = [aTestPak objectForKey:@"cases"];
        for(int j=0; j<[testCases count]; j++) {
            NSDictionary *aTest = [testCases objectAtIndex:j];
            
            //create mockRequest
            NSMutableURLRequest *mockRequest = [NSMutableURLRequest new];
            mockRequest.URL = [NSURL URLWithString:@"/"];
            mockRequest.HTTPMethod = @"POST";
            
            //create user input parameters
            NSDictionary *testParameters = aTest[@"params"];
            
            
            //construct serviceDefinition dictionary
            if (aTestPak[@"operations"] == nil) {
                aTestPak[@"operations"] = [NSMutableDictionary new];
            }
            if (aTestPak[@"operations"][@"OperationName"]) {
                [aTestPak[@"operations"] removeObjectForKey:@"OperationName"];
            }
            aTestPak[@"operations"][@"OperationName"] = aTest[@"given"];
            
            //create mock ServiceDefinitionJSON
            NSDictionary *mockServiceDefinitionJSON = aTestPak;
            
            
            // ------------ Perform Serialization ---------------------
            // --------------------------------------------------------
            
            AWSQueryStringRequestSerializer *testQueryStringSerializer = [AWSQueryStringRequestSerializer new];
            [testQueryStringSerializer setValue:mockServiceDefinitionJSON forKey:@"serviceDefinitionJSON"];
            [testQueryStringSerializer setValue:@"OperationName" forKey:@"actionName"];
            
            
            AWSTask *resultTask = [testQueryStringSerializer serializeRequest:mockRequest
                                                                     headers:@{}
                                                                  parameters:testParameters];
            if (resultTask.error) {
                XCTFail(@"(TestPak %d TestCase %d) Serialization Error:%@",i,j,resultTask.error);
                return;
            }
            
            // ------------Validate Result------------------------------
            
            //validate result
            NSDictionary *resultDic = aTest[@"serialized"];
            
            //validate HTTP URL
            XCTAssertEqualObjects(resultDic[@"uri"], [mockRequest.URL absoluteString], @"(TestPak %d TestCase %d) wrong HTTP URI, expect:%@, but got:%@",i,j,resultDic[@"uri"],[mockRequest.URL absoluteString]);
            
            //validate HTTP Body
            NSString* resultBodyStr = [[NSString alloc] initWithData:mockRequest.HTTPBody encoding:NSUTF8StringEncoding];
            NSString* expectedBodyStr = resultDic[@"body"];
            
            NSCountedSet *resultBodySet = [NSCountedSet setWithArray:[resultBodyStr componentsSeparatedByString:@"&"]];
            NSCountedSet *expectedBodySet = [NSCountedSet setWithArray:[expectedBodyStr componentsSeparatedByString:@"&"]];
            
            if ([expectedBodySet count] == 0) {
                XCTAssertEqualObjects(expectedBodyStr,resultBodyStr , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedBodyStr, resultBodyStr);
            } else {
                XCTAssertEqualObjects(expectedBodySet,resultBodySet , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedBodySet, resultBodySet);
            }
        }
        
    }
}

- (void)testQueryStringDeserializer {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"query-output" ofType:@"json"];
    
    NSError *error = nil;
    NSMutableArray *queryTestPackages = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:&error];
    XCTAssertNil(error);
    
    for (int i=0; i<[queryTestPackages count]; i++) {
        NSMutableDictionary *aTestPak = [queryTestPackages objectAtIndex:i];
        NSArray *testCases = [aTestPak objectForKey:@"cases"];
        for(int j=0; j<[testCases count]; j++) {
            NSDictionary *aTest = [testCases objectAtIndex:j];
            
            //create mockResponse
            NSDictionary *responseHeaders = aTest[@"response"][@"headers"];
            NSInteger statusCode = [aTest[@"response"][@"status_code"] integerValue];
            NSHTTPURLResponse *mockResponse = [[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:@"/"] statusCode:statusCode HTTPVersion:@"HTTP/1.1" headerFields:responseHeaders];
            
            //construct serviceDefinition dictionary
            if (aTestPak[@"operations"] == nil) {
                aTestPak[@"operations"] = [NSMutableDictionary new];
            }
            if (aTestPak[@"operations"][@"OperationName"]) {
                [aTestPak[@"operations"] removeObjectForKey:@"OperationName"];
            }
            aTestPak[@"operations"][@"OperationName"] = aTest[@"given"];
            
            //create mock ServiceDefinitionJSON
            NSDictionary *mockServiceDefinitionJSON = aTestPak;
            
            
            // ------------ Perform Serialization ---------------------
            // --------------------------------------------------------
            
            AWSXMLResponseSerializer *testXmlResponseSerializer = [AWSXMLResponseSerializer new];
            [testXmlResponseSerializer setValue:mockServiceDefinitionJSON forKey:@"serviceDefinitionJSON"];
            [testXmlResponseSerializer setValue:@"OperationName" forKey:@"actionName"];
            
            
            
            NSString *responseBodyStr = aTest[@"response"][@"body"];
            NSData *responseBodyData = [responseBodyStr dataUsingEncoding:NSUTF8StringEncoding];
            NSError *parseError = nil;
            id responseResult = [[testXmlResponseSerializer responseObjectForResponse:mockResponse originalRequest:nil currentRequest:nil data:responseBodyData error:&parseError] mutableCopy];
            if (parseError) {
                XCTFail(@"(TestPak %d TestCase %d) Serialization Error:%@",i,j,parseError);
                return;
            }
            
            // ------------Validate Result------------------------------
            if ([responseResult isKindOfClass:[NSDictionary class]] && [responseResult objectForKey:@"Stream"]) {
                NSMutableDictionary *tempResult = [responseResult mutableCopy];
                [tempResult setObject:[[NSString alloc] initWithData:responseResult[@"Stream"] encoding:NSUTF8StringEncoding] forKey:@"Stream"];
                responseResult = tempResult;
            }
            //validate result
            NSDictionary *expectedResult = aTest[@"result"];
            [self replaceNSData2NSString:responseResult];
            
            XCTAssertEqualObjects(expectedResult,responseResult , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedResult, responseResult);
            
        }
        
    }
}

- (void)testJsonSerializer {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"json-input" ofType:@"json"];
    NSError *error = nil;
    NSMutableArray *jsonTestPackages = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:&error];
    XCTAssertNil(error);
    
    for (int i=0; i<[jsonTestPackages count]; i++) {
        NSMutableDictionary *aTestPak = [jsonTestPackages objectAtIndex:i];
        NSArray *testCases = [aTestPak objectForKey:@"cases"];
        for(int j=0; j<[testCases count]; j++) {
            NSDictionary *aTest = [testCases objectAtIndex:j];
            
            //create mockRequest
            NSMutableURLRequest *mockRequest = [NSMutableURLRequest new];
            mockRequest.URL = [NSURL URLWithString:@"/"];
            [mockRequest setHTTPMethod:aTest[@"given"][@"http"][@"method"]];
            
            //create user input parameters
            NSDictionary *testParameters = aTest[@"params"];
            
            
            //construct serviceDefinition dictionary
            if (aTestPak[@"operations"] == nil) {
                aTestPak[@"operations"] = [NSMutableDictionary new];
            }
            if (aTestPak[@"operations"][@"OperationName"]) {
                [aTestPak[@"operations"] removeObjectForKey:@"OperationName"];
            }
            aTestPak[@"operations"][@"OperationName"] = aTest[@"given"];
            
            //create mock ServiceDefinitionJSON
            NSDictionary *mockServiceDefinitionJSON = aTestPak;
            
            
            // ------------ Perform Serialization ---------------------
            // --------------------------------------------------------
            
            AWSJSONRequestSerializer *testJsonSerializer = [AWSJSONRequestSerializer new];
            [testJsonSerializer setValue:mockServiceDefinitionJSON forKey:@"serviceDefinitionJSON"];
            [testJsonSerializer setValue:@"OperationName" forKey:@"actionName"];
            
            NSString *amzTarget = [NSString stringWithFormat:@"%@.%@",aTestPak[@"metadata"][@"targetPrefix"],@"OperationName"];
            NSString *contentType = [NSString stringWithFormat:@"application/x-amz-json-%@",[aTestPak[@"metadata"][@"jsonVersion"] stringValue]];
            NSDictionary *headers = @{@"X-Amz-Target": amzTarget,
                                      @"Content-Type": contentType};
            
            AWSTask *resultTask = [testJsonSerializer serializeRequest:mockRequest
                                                              headers:headers
                                                           parameters:testParameters];
            if (resultTask.error) {
                XCTFail(@"(TestPak %d TestCase %d) Serialization Error:%@",i,j,resultTask.error);
                return;
            }
            
            // ------------Validate Result------------------------------
            
            //validate result
            NSDictionary *resultDic = aTest[@"serialized"];
            
            //validate HTTP URL
            XCTAssertEqualObjects(resultDic[@"uri"], [mockRequest.URL absoluteString], @"(TestPak %d TestCase %d) wrong HTTP URI, expect:%@, but got:%@",i,j,resultDic[@"uri"],[mockRequest.URL absoluteString]);
            
            //validate HTTP Body
            NSString* resultBodyStr = [[NSString alloc] initWithData:mockRequest.HTTPBody encoding:NSUTF8StringEncoding];
            NSString* expectedBodyStr = resultDic[@"body"];
            
            NSDictionary *resultBodyDic = [NSJSONSerialization JSONObjectWithData:mockRequest.HTTPBody options:0 error:nil];
            NSDictionary *expectedBodyDic = [NSJSONSerialization JSONObjectWithData:[expectedBodyStr dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
            
            if ([expectedBodyDic count] == 0) {
                XCTAssertEqualObjects(expectedBodyStr,resultBodyStr , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedBodyStr, resultBodyStr);
            } else {
                XCTAssertEqualObjects(expectedBodyDic,resultBodyDic , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedBodyDic, resultBodyDic);
            }
            
            //validate HTTP Headers
            for (NSString *ekey in resultDic[@"headers"]) {
                NSString *evalue = resultDic[@"headers"][ekey];
                
                if ([[[mockRequest allHTTPHeaderFields] allKeys] containsObject:ekey] == NO) {
                    XCTFail(@"(TestPak %d TestCase %d) no %@ in the headers!",i,j,ekey);
                } else {
                    XCTAssertEqualObjects(evalue, [[mockRequest allHTTPHeaderFields] objectForKey:ekey], @"(TestPak %d TestCase %d) wrong value in header. expect key pair %@:%@, but got: %@:%@",i,j,ekey,evalue,ekey,[[mockRequest allHTTPHeaderFields] objectForKey:ekey]);
                }
            }
        }
        
    }
}



- (void)testJsonDeserializer {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"json-output" ofType:@"json"];
    NSError *error = nil;
    NSMutableArray *jsonTestPackages = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:&error];
    XCTAssertNil(error);
    for (int i=0; i<[jsonTestPackages count]; i++) {
        NSMutableDictionary *aTestPak = [jsonTestPackages objectAtIndex:i];
        NSArray *testCases = [aTestPak objectForKey:@"cases"];
        for(int j=0; j<[testCases count]; j++) {
            NSDictionary *aTest = [testCases objectAtIndex:j];
            
            //create mockResponse
            NSDictionary *responseHeaders = aTest[@"response"][@"headers"];
            NSInteger statusCode = [aTest[@"response"][@"status_code"] integerValue];
            NSHTTPURLResponse *mockResponse = [[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:@"/"] statusCode:statusCode HTTPVersion:@"HTTP/1.1" headerFields:responseHeaders];
            
            //construct serviceDefinition dictionary
            if (aTestPak[@"operations"] == nil) {
                aTestPak[@"operations"] = [NSMutableDictionary new];
            }
            if (aTestPak[@"operations"][@"OperationName"]) {
                [aTestPak[@"operations"] removeObjectForKey:@"OperationName"];
            }
            aTestPak[@"operations"][@"OperationName"] = aTest[@"given"];
            
            //create mock ServiceDefinitionJSON
            NSDictionary *mockServiceDefinitionJSON = aTestPak;
            
            
            // ------------ Perform Serialization ---------------------
            // --------------------------------------------------------
            
            AWSJSONResponseSerializer *testJsonResponseSerializer = [AWSJSONResponseSerializer new];
            [testJsonResponseSerializer setValue:mockServiceDefinitionJSON forKey:@"serviceDefinitionJSON"];
            [testJsonResponseSerializer setValue:@"OperationName" forKey:@"actionName"];
            testJsonResponseSerializer.outputClass = nil;
            
           
            NSString *responseBodyStr = aTest[@"response"][@"body"];
            NSData *responseBodyData = [responseBodyStr dataUsingEncoding:NSUTF8StringEncoding];
             NSError *parseError = nil;
            id responseResult = [[testJsonResponseSerializer responseObjectForResponse:mockResponse originalRequest:nil currentRequest:nil data:responseBodyData error:&parseError] mutableCopy];
            if (parseError) {
                XCTFail(@"(TestPak %d TestCase %d) Serialization Error:%@",i,j,parseError);
                return;
            }
            
            // ------------Validate Result------------------------------
            
            //validate result
            NSDictionary *expectedResult = aTest[@"result"];
            [self replaceNSData2NSString:responseResult];
 
            XCTAssertEqualObjects(expectedResult,responseResult , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedResult, responseResult);
           
        }
        
    }
}

- (void)testRestJsonSerializer {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"rest-json-input" ofType:@"json"];
    NSError *error = nil;
    NSMutableArray *jsonTestPackages = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:&error];
    XCTAssertNil(error);
    
    for (int i=0; i<[jsonTestPackages count]; i++) {
        NSMutableDictionary *aTestPak = [jsonTestPackages objectAtIndex:i];
        NSArray *testCases = [aTestPak objectForKey:@"cases"];
        for(int j=0; j<[testCases count]; j++) {
            NSDictionary *aTest = [testCases objectAtIndex:j];
            
            //create mockRequest
            NSMutableURLRequest *mockRequest = [NSMutableURLRequest new];
            mockRequest.URL = [NSURL URLWithString:@""];
            //[mockRequest setHTTPMethod:aTest[@"given"][@"http"][@"method"]];
            [mockRequest setHTTPMethod:@"POST"]; //serailizer will remove body if it is a GET request.
            
            //create user input parameters
            NSDictionary *testParameters = aTest[@"params"];
            
            
            //construct serviceDefinition dictionary
            if (aTestPak[@"operations"] == nil) {
                aTestPak[@"operations"] = [NSMutableDictionary new];
            }
            if (aTestPak[@"operations"][@"OperationName"]) {
                [aTestPak[@"operations"] removeObjectForKey:@"OperationName"];
            }
            aTestPak[@"operations"][@"OperationName"] = aTest[@"given"];
            
            //create mock ServiceDefinitionJSON
            NSDictionary *mockServiceDefinitionJSON = aTestPak;
            
            
            // ------------ Perform Serialization ---------------------
            // --------------------------------------------------------
            
            AWSJSONRequestSerializer *testJsonSerializer = [AWSJSONRequestSerializer new];
            [testJsonSerializer setValue:mockServiceDefinitionJSON forKey:@"serviceDefinitionJSON"];
            [testJsonSerializer setValue:@"OperationName" forKey:@"actionName"];
            
            NSString *amzTarget = [NSString stringWithFormat:@"%@.%@",aTestPak[@"metadata"][@"targetPrefix"],@"OperationName"];
            NSString *contentType = [NSString stringWithFormat:@"application/x-amz-json-%@",[aTestPak[@"metadata"][@"jsonVersion"] stringValue]];
            NSDictionary *headers = @{@"X-Amz-Target": amzTarget,
                                      @"Content-Type": contentType};
            
            AWSTask *resultTask = [testJsonSerializer serializeRequest:mockRequest
                                                              headers:headers
                                                           parameters:testParameters];
            if (resultTask.error) {
                XCTFail(@"(TestPak %d TestCase %d) Serialization Error:%@",i,j,resultTask.error);
                return;
            }
            
            // ------------Validate Result------------------------------
            
            //validate result
            NSDictionary *resultDic = aTest[@"serialized"];
            
            //validate HTTP URL
            XCTAssertEqualObjects(resultDic[@"uri"], [mockRequest.URL absoluteString], @"(TestPak %d TestCase %d) wrong HTTP URI, expect:%@, but got:%@",i,j,resultDic[@"uri"],[mockRequest.URL absoluteString]);
            
            //validate HTTP Body
            
            //try stream first, then body
            NSString* resultBodyStr = nil;
            NSDictionary *resultBodyDic =nil;
            if (mockRequest.HTTPBodyStream) {
                [mockRequest.HTTPBodyStream open];
                NSInteger BUFFER_LEN = 32000;
        
                uint8_t buffer[BUFFER_LEN];
                long len = [mockRequest.HTTPBodyStream read:buffer maxLength:BUFFER_LEN];
                if (len > 0) {
                    NSData *httpStreamData = [NSData dataWithBytes:buffer length:len];
                    
                    resultBodyStr = [[NSString alloc] initWithData:httpStreamData encoding:NSUTF8StringEncoding];
                    resultBodyDic = [NSJSONSerialization JSONObjectWithData:httpStreamData options:0 error:nil];
                }
            } else {
                if (mockRequest.HTTPBody) {
                    resultBodyStr = [[NSString alloc] initWithData:mockRequest.HTTPBody encoding:NSUTF8StringEncoding];
                    resultBodyDic = [NSJSONSerialization JSONObjectWithData:mockRequest.HTTPBody options:0 error:nil];
                } else {
                    resultBodyStr = @"{}";
                    resultBodyDic = nil;
                }
            }
            
            NSString* expectedBodyStr = resultDic[@"body"];
            if ([expectedBodyStr length] == 0) {
                expectedBodyStr = @"{}";
            }
            NSDictionary *expectedBodyDic = [NSJSONSerialization JSONObjectWithData:[expectedBodyStr dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
            
            if ([expectedBodyDic count] == 0) {
                XCTAssertEqualObjects(expectedBodyStr,resultBodyStr , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedBodyStr, resultBodyStr);
            } else {
                XCTAssertEqualObjects(expectedBodyDic,resultBodyDic , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedBodyDic, resultBodyDic);
            }
            
            //validate HTTP Headers
            for (NSString *ekey in resultDic[@"headers"]) {
                NSString *evalue = resultDic[@"headers"][ekey];
                
                if ([[[mockRequest allHTTPHeaderFields] allKeys] containsObject:ekey] == NO) {
                    XCTFail(@"(TestPak %d TestCase %d) no %@ in the headers!",i,j,ekey);
                } else {
                    XCTAssertEqualObjects(evalue, [[mockRequest allHTTPHeaderFields] objectForKey:ekey], @"(TestPak %d TestCase %d) wrong value in header. expect key pair %@:%@, but got: %@:%@",i,j,ekey,evalue,ekey,[[mockRequest allHTTPHeaderFields] objectForKey:ekey]);
                }
            }
        }
        
    }
}



- (void)testRestJsonDeserializer {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"rest-json-output" ofType:@"json"];
    NSError *error = nil;
    NSMutableArray *jsonTestPackages = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:&error];
    
    XCTAssertNil(error);
    
    for (int i=0; i<[jsonTestPackages count]; i++) {
        NSMutableDictionary *aTestPak = [jsonTestPackages objectAtIndex:i];
        NSArray *testCases = [aTestPak objectForKey:@"cases"];
        for(int j=0; j<[testCases count]; j++) {
            NSDictionary *aTest = [testCases objectAtIndex:j];
            
            //create mockResponse
            NSDictionary *responseHeaders = aTest[@"response"][@"headers"];
            NSInteger statusCode = [aTest[@"response"][@"status_code"] integerValue];
            NSHTTPURLResponse *mockResponse = [[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:@"/"] statusCode:statusCode HTTPVersion:@"HTTP/1.1" headerFields:responseHeaders];
            
            //construct serviceDefinition dictionary
            if (aTestPak[@"operations"] == nil) {
                aTestPak[@"operations"] = [NSMutableDictionary new];
            }
            if (aTestPak[@"operations"][@"OperationName"]) {
                [aTestPak[@"operations"] removeObjectForKey:@"OperationName"];
            }
            aTestPak[@"operations"][@"OperationName"] = aTest[@"given"];
            
            //create mock ServiceDefinitionJSON
            NSDictionary *mockServiceDefinitionJSON = aTestPak;
            
            
            // ------------ Perform Serialization ---------------------
            // --------------------------------------------------------
            
            AWSJSONResponseSerializer *testJsonResponseSerializer = [AWSJSONResponseSerializer new];
            [testJsonResponseSerializer setValue:mockServiceDefinitionJSON forKey:@"serviceDefinitionJSON"];
            [testJsonResponseSerializer setValue:@"OperationName" forKey:@"actionName"];
            testJsonResponseSerializer.outputClass = nil;
            
            
            NSString *responseBodyStr = aTest[@"response"][@"body"];
            NSData *responseBodyData = [responseBodyStr dataUsingEncoding:NSUTF8StringEncoding];
            NSError *parseError = nil;
            id responseResult = [[testJsonResponseSerializer responseObjectForResponse:mockResponse originalRequest:nil currentRequest:nil data:responseBodyData error:&parseError] mutableCopy];
            if (parseError) {
                XCTFail(@"(TestPak %d TestCase %d) Serialization Error:%@",i,j,parseError);
                return;
            }
            
            // ------------Validate Result------------------------------
            
            //validate result
            NSDictionary *expectedResult = aTest[@"result"];
            [self replaceNSData2NSString:responseResult];
            
            XCTAssertEqualObjects(expectedResult,responseResult , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedResult, responseResult);
            
        }
        
    }
}


- (void)testSerializersForHTTPMethodAndBodyMismatch {
    NSMutableURLRequest *request = [NSMutableURLRequest new];
    request.URL = [NSURL URLWithString:@"/"];
    request.HTTPMethod = @"GET";

    AWSJSONRequestSerializer *requestSerializer = [AWSJSONRequestSerializer new];

    [[[requestSerializer serializeRequest:request
                                  headers:@{@"some-test-header" : @"some-test-header-value"}
                               parameters:@{@"key1" : @"value1",
                                            @"key2" : @"value2",
                                            @"key3" : @"value3"}] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNil(request.HTTPBody);
        return nil;
    }] waitUntilFinished];

    request.HTTPMethod = @"DELETE";
    [[[requestSerializer serializeRequest:request
                                  headers:@{@"some-test-header" : @"some-test-header-value"}
                               parameters:@{@"key1" : @"value1",
                                            @"key2" : @"value2",
                                            @"key3" : @"value3"}] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNil(request.HTTPBody);
        return nil;
    }] waitUntilFinished];

    request.HTTPMethod = @"POST";
    [[[requestSerializer serializeRequest:request
                                  headers:@{@"some-test-header" : @"some-test-header-value"}
                               parameters:@{@"key1" : @"value1",
                                            @"key2" : @"value2",
                                            @"key3" : @"value3"}] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(request.HTTPBody);
        return nil;
    }] waitUntilFinished];
}

- (void) replaceNSData2NSString:(id)jsonObject
{
    if ([jsonObject isKindOfClass:[NSArray class]]) {
        
        for (int i = 0 ; i < [jsonObject count] ; i++) {
            id object = jsonObject[i];
            
            if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSDictionary class]]) {
                [self replaceNSData2NSString:object];
            }
            
            if ([object isKindOfClass:[NSData class]]) {
                [jsonObject replaceObjectAtIndex:i withObject:[[NSString alloc] initWithData:object encoding:NSUTF8StringEncoding]];
            }
        }
    }
    
    if ([jsonObject isKindOfClass:[NSDictionary class]]) {
        for (NSString *key in [jsonObject allKeys]) {
            if ([jsonObject[key] isKindOfClass:[NSDictionary class]] || [jsonObject[key] isKindOfClass:[NSArray class]]) {
                [self replaceNSData2NSString:jsonObject[key]];
            }
            
            if ([jsonObject[key] isKindOfClass:[NSData class]]) {
                jsonObject[key] = [[NSString alloc] initWithData:jsonObject[key] encoding:NSUTF8StringEncoding];
            }
        }
    }
}

- (void)testValidAwsConfigurationJsonIfPresent {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"awsconfiguration"
                                                         ofType:@"json"];
    if (!filePath) {
        return;
    }
    
    NSDictionary *awsConfigurationJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                         options:NSJSONReadingMutableContainers
                                                                           error:nil];
    @try {
        NSString *cognitoIdentityPoolId = awsConfigurationJson[@"CredentialsProvider"][@"CognitoIdentity"][@"Default"][@"PoolId"];
        XCTAssertNotNil(cognitoIdentityPoolId);
    } @catch (NSException *exception) {
        XCTFail(@"Cannot read the Cognito Identity Pool Id from the %@.", awsConfigurationJsonFileName);
    }
}

- (void)testAwsInfoInit {
    @try {
        AWSInfo *defaultInfo = [AWSInfo defaultAWSInfo];
        XCTAssertNotNil(defaultInfo);
    } @catch (NSException *exception) {
        XCTFail(@"AWSInfo initilization failed.");
    }
}

- (void)testEmptyAwsConfigurationJsonIfPresent {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"awsconfiguration"
                                                         ofType:@"json"];
    if (!filePath) {
        return;
    }
    NSData *validData = [NSData dataWithContentsOfFile:filePath];
    
    // Clear contents of file
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:[NSData data] attributes:nil];
    
    @try {
        AWSInfo *defaultInfo = [AWSInfo defaultAWSInfo];
        XCTAssertNotNil(defaultInfo, @"AWSInfo should be initialized.");
    } @catch (NSException *exception) {
        XCTFail(@"AWSInfo initilization failed and exception thrown.");
    }
    
    // Write the data back to the file
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:validData attributes:nil];
}

@end
