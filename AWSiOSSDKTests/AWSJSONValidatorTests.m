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

#if AWS_TEST_JSON_VALIDATOR

#import <XCTest/XCTest.h>

#import "AWSCore.h"

#define INVALID_TABLE_NAME @"anInvalidTableName%#@$}"
#define INVALID_TABLE_NAME2 @"anInvalidTableName2%#@$}"
#define VALID_TABLE_NAME @"aValidTableName"
#define VALID_TABLE_NAME2 @"aValidTableName2"

@interface AWSJSONValidatorTests : XCTestCase

@end

@implementation AWSJSONValidatorTests {
    NSDictionary *rules;
}

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.

    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"DynamoDB_20120810" ofType:@"json"];
    rules = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:kNilOptions error:nil];

}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

-(void)testRequiredParameterValidation {
    //-----Test BatchGetItem API-----
    NSString *testAPIName = @"BatchGetItem";
    NSDictionary *rule = [[[rules objectForKey:@"operations"] objectForKey:testAPIName] objectForKey:@"input"];
    NSError *error = nil;

    //RequestItems is empty.
    [AWSJSONValidator validateParams:@{@"RequestItems" :@{}} byRule:rule error:&error];
    XCTAssertEqual(error.code,AWSValidationMissingRequiredParameter);

    //No Keys list
    error = nil;
    [AWSJSONValidator validateParams:@{@"RequestItems" : @{VALID_TABLE_NAME : @{@"ConsistentRead": @YES,@"Keys" : @[]}}}byRule:rule error:&error];
    XCTAssertEqual(error.code,AWSValidationMissingRequiredParameter);


    //----Test BatchGetItem API------

    //TODO: may need to add more test for other APIs
}
-(void)testGeneralValidation {

    //-----Test BatchGetItem API-----
    NSString *testAPIName = @"BatchGetItem";
    NSDictionary *rule = [[[rules objectForKey:@"operations"] objectForKey:testAPIName] objectForKey:@"input"];

    //Has everything
    NSError *error = nil;
    NSString *string1 = @"Amazon DynamoDB";
    NSString *string2 = @"Amazon RDS";
    NSArray *stringSet = @[string1,string2];
    NSString *numberString = @"543";
    NSArray *numberSet = @[numberString,@"323",@"234"];
    NSArray *keysToGet = @[@{@"keyName":@{@"S":string1}},
                           @{@"keyName":@{@"S":string2}},
                           @{@"keyName":@{@"SS":stringSet}},
                           @{@"keyName":@{@"N":numberString}},
                           @{@"keyName":@{@"NS":numberSet}},
                           ];
    NSArray *attributesToGet = @[@"Name",@"Threads",@"Messages",@"Views"];
    NSDictionary *keysAndAttributes = @{@"ConsistentRead": @YES,
                                        @"Keys" : keysToGet,
                                        @"AttributesToGet" : attributesToGet};

    NSDictionary *parametersForBatchGet = @{@"ReturnConsumedCapacity":@"TOTAL",
                                            @"RequestItems" :
                                                @{VALID_TABLE_NAME:keysAndAttributes,
                                                  VALID_TABLE_NAME2:keysAndAttributes}
                                            };
    [AWSJSONValidator validateParams:parametersForBatchGet byRule:rule error:&error];
    if (error) {
        XCTFail(@"valid parameters returns error:%@",error);
    }

}
-(void)testParamsTypeValidation {
    //----Test BatchGetItem API------
    NSString *key1 = @"putItemForBatch1";
    NSString *key2 = @"putItemForBatch2";
    NSArray *keysToGet = @[@{@"hashKey":@{@"S":key1}},@{@"hashKey":@{@"S":key2}}];

    NSString *testAPIName = @"BatchGetItem";
    NSDictionary *rule = [[[rules objectForKey:@"operations"] objectForKey:testAPIName] objectForKey:@"input"];
    NSError *error = nil;

    //RequestItems should be diciontary but set to array
    [AWSJSONValidator validateParams:@{@"RequestItems" :@[@"someValue1",@"somevalue2"]} byRule:rule error:&error];
    XCTAssertEqual(error.code,AWSValidationInvalidParameterType);

    error = nil;
    //ConsistentRead should be NSNumber(boolean) but set the String
    [AWSJSONValidator validateParams:@{@"RequestItems" : @{VALID_TABLE_NAME : @{@"ConsistentRead": @"true",@"Keys" : keysToGet}}} byRule:rule error:&error];
    XCTAssertEqual(error.code,AWSValidationInvalidParameterType);
}
-(void)testUnexpectedParams{
    //-----Test BatchGetItem API-----
    NSString *testAPIName = @"BatchGetItem";
    NSDictionary *rule = [[[rules objectForKey:@"operations"] objectForKey:testAPIName] objectForKey:@"input"];


    NSString *string1 = @"Amazon DynamoDB";
    NSString *string2 = @"Amazon RDS";
    NSArray *stringSet = @[string1,string2];
    NSString *numberString = @"543";
    NSArray *numberSet = @[numberString,@"323",@"234"];
    NSArray *keysToGet = @[@{@"keyName":@{@"S":string1}},
                           @{@"keyName":@{@"S":string2}},
                           @{@"keyName":@{@"SS":stringSet}},
                           @{@"keyName":@{@"N":numberString}},
                           @{@"keyName":@{@"NS":numberSet}},
                           ];
    NSArray *attributesToGet = @[@"Name",@"Threads",@"Messages",@"Views"];
    NSDictionary *keysAndAttributes = @{@"UP": @"UV", //This is a unexpected parameter
                                        @"ConsistentRead": @YES,
                                        @"Keys" : keysToGet,
                                        @"AttributesToGet" : attributesToGet};

    NSDictionary *parametersForBatchGet = @{@"ReturnConsumedCapacity":@"TOTAL",
                                            @"RequestItems" :
                                                @{VALID_TABLE_NAME:keysAndAttributes,
                                                  VALID_TABLE_NAME2:keysAndAttributes}
                                            };


    NSError *error = nil;
    [AWSJSONValidator validateParams:parametersForBatchGet byRule:rule error:&error];
    XCTAssertEqual(error.code, AWSValidationUnexpectedParameter);

    keysAndAttributes = @{@"ConsistentRead": @YES,
                          @"Keys" : keysToGet,
                          @"AttributesToGet" : attributesToGet};
    parametersForBatchGet = @{@"ReturnConsumedCapacity":@"UNPXPECTED", //the capacity value is not in enum list
                              @"RequestItems" :
                                  @{VALID_TABLE_NAME:keysAndAttributes,
                                    VALID_TABLE_NAME2:keysAndAttributes}
                              };
    error = nil;
    [AWSJSONValidator validateParams:parametersForBatchGet byRule:rule error:&error];
    XCTAssertEqual(error.code, AWSValidationUnexpectedStringParameter);


}

//The Test has been turned off because server response failed to pass this test thus rangeValidation has been temporarily turned off.
    e.g. server returns a value of 0, with type of "long" and "min_length" of 1 which failed the rangeValidation.
 
-(void)_testOutOfRangeRarameters{
    //-----Test BatchGetItem API-----
    NSString *testAPIName = @"BatchGetItem";
    NSDictionary *rule = [[[rules objectForKey:@"operations"] objectForKey:testAPIName] objectForKey:@"input"];

    //Has everything
    NSString *string1 = @"Amazon DynamoDB";
    NSString *string2 = @"Amazon RDS";
    NSArray *stringSet = @[string1,string2];
    NSString *numberString = @"543";
    NSArray *numberSet = @[numberString,@"323",@"234"];
    NSArray *keysToGet = @[@{@"keyName":@{@"S":string1}},
                           @{@"keyName":@{@"S":string2}},
                           @{@"keyName":@{@"SS":stringSet}},
                           @{@"keyName":@{@"N":numberString}},
                           @{@"keyName":@{@"NS":numberSet}},
                           ];
    NSArray *attributesToGet = @[@"Name",@"Threads",@"Messages",@"Views"];
    NSDictionary *keysAndAttributes = @{@"ConsistentRead": @YES,
                                        @"Keys" : keysToGet,
                                        @"AttributesToGet" : attributesToGet};
    NSMutableDictionary *requestedItems = [NSMutableDictionary dictionaryWithCapacity:150];
    for (int i =0;i<120;i++){
        [requestedItems setObject:keysAndAttributes forKey:[NSString stringWithFormat:@"%@%d",VALID_TABLE_NAME,i]];
    }

    NSDictionary *parametersForBatchGet = @{@"ReturnConsumedCapacity":@"TOTAL",
                                            @"RequestItems" : requestedItems //number of items outOfRange:larger than 100
                                            };
    NSError *error = nil;
    [AWSJSONValidator validateParams:parametersForBatchGet byRule:rule error:&error];
    XCTAssertEqual(error.code,AWSValidationOutOfRangeParameter); // Test failed is expected behavior since we temporarily turned off rangeValidation for maps and int.

    keysToGet = @[@{@"keyName":@{@"S":string1}},
                  @{@"keyName":@{@"S":string2}},
                  @{@"keyName":@{@"SS":stringSet}},
                  @{@"keyName":@{@"N":numberString}},
                  @{@"keyName":@{@"NS":numberSet}},
                  ];
    NSMutableArray *keysToGetArray = [NSMutableArray arrayWithCapacity:120];
    for (int i=0; i<120; i++) {
        [keysToGetArray addObject:@{@"keyName":@{@"S":string1}}];
    }

    keysAndAttributes = @{@"ConsistentRead": @YES,
                          @"Keys" : keysToGetArray, //number of keys is out of range
                          @"AttributesToGet" : attributesToGet};
    parametersForBatchGet = @{@"ReturnConsumedCapacity":@"TOTAL",
                              @"RequestItems" :
                                  @{VALID_TABLE_NAME:keysAndAttributes,
                                    VALID_TABLE_NAME2:keysAndAttributes}
                              };

    error = nil;
    [AWSJSONValidator validateParams:parametersForBatchGet byRule:rule error:&error];
    XCTAssertEqual(error.code,AWSValidationOutOfRangeParameter);



    keysAndAttributes = @{@"ConsistentRead": @YES,
                          @"Keys" : keysToGet,
                          @"AttributesToGet" : attributesToGet};
    parametersForBatchGet = @{@"ReturnConsumedCapacity":@"TOTAL",
                              @"RequestItems" :
                                  @{@"ab":keysAndAttributes,  //table name is too short
                                    VALID_TABLE_NAME2:keysAndAttributes}
                              };
    error = nil;
    [AWSJSONValidator validateParams:parametersForBatchGet byRule:rule error:&error];
    XCTAssertEqual(error.code,AWSValidationOutOfRangeParameter);

    parametersForBatchGet = @{@"ReturnConsumedCapacity":@"TOTAL",
                              @"RequestItems" :
                                  @{@"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz":keysAndAttributes,  //table name is too long
                                    VALID_TABLE_NAME2:keysAndAttributes}
                              };
    error = nil;
    [AWSJSONValidator validateParams:parametersForBatchGet byRule:rule error:&error];
    XCTAssertEqual(error.code,AWSValidationOutOfRangeParameter);

}

-(void)testPatternConstraint{
    //-----Test BatchGetItem API-----
    NSString *testAPIName = @"BatchGetItem";
    NSDictionary *rule = [[[rules objectForKey:@"operations"] objectForKey:testAPIName] objectForKey:@"input"];

    //Has everything
    NSError *error = nil;
    NSString *string1 = @"Amazon DynamoDB";
    NSString *string2 = @"Amazon RDS";
    NSArray *stringSet = @[string1,string2];
    NSString *numberString = @"543";
    NSArray *numberSet = @[numberString,@"323",@"234"];
    NSArray *keysToGet = @[@{@"keyName":@{@"S":string1}},
                           @{@"keyName":@{@"S":string2}},
                           @{@"keyName":@{@"SS":stringSet}},
                           @{@"keyName":@{@"N":numberString}},
                           @{@"keyName":@{@"NS":numberSet}},
                           ];
    NSArray *attributesToGet = @[@"Name",@"Threads",@"Messages",@"Views"];
    NSDictionary *keysAndAttributes = @{@"ConsistentRead": @YES,
                                        @"Keys" : keysToGet,
                                        @"AttributesToGet" : attributesToGet};

    NSDictionary *parametersForBatchGet = @{@"ReturnConsumedCapacity":@"TOTAL",
                                            @"RequestItems" :
                                                @{@"tablename*&^":keysAndAttributes, //invalid table name pattern:"[a-zA-Z0-9_.-]+"
                                                  VALID_TABLE_NAME2:keysAndAttributes}
                                            };
    [AWSJSONValidator validateParams:parametersForBatchGet byRule:rule error:&error];
    XCTAssertEqual(error.code,AWSValidationInvalidStringParameter);

}

-(void)testBase64BinaryData{
    //-----Test BatchGetItem API-----
    NSString *testAPIName = @"BatchGetItem";
    NSDictionary *rule = [[[rules objectForKey:@"operations"] objectForKey:testAPIName] objectForKey:@"input"];

    //Has everything
    NSError *error = nil;
    NSString *string1 = @"Amazon DynamoDB";
    NSString *string2 = @"Amazon RDS";
    NSArray *stringSet = @[string1,string2];
    NSString *numberString = @"543";
    NSArray *numberSet = @[numberString,@"323",@"234"];

    NSString *wrongBase64String = @"abc+de2";
    NSArray *wrongBase64StringArray = @[@"YWJjZGU=",wrongBase64String];

    NSArray *keysToGet = @[@{@"keyName":@{@"S":string1}},
                           @{@"keyName":@{@"S":string2}},
                           @{@"keyName":@{@"SS":stringSet}},
                           @{@"keyName":@{@"N":numberString}},
                           @{@"keyName":@{@"NS":numberSet}},
                           @{@"keyName":@{@"BS":wrongBase64StringArray}}, //BS includes invalid base64String
                           ];
    NSArray *attributesToGet = @[@"Name",@"Threads",@"Messages",@"Views"];
    NSDictionary *keysAndAttributes = @{@"ConsistentRead": @YES,
                                        @"Keys" : keysToGet,
                                        @"AttributesToGet" : attributesToGet};

    NSDictionary *parametersForBatchGet = @{@"ReturnConsumedCapacity":@"TOTAL",
                                            @"RequestItems" :
                                                @{VALID_TABLE_NAME:keysAndAttributes,
                                                  VALID_TABLE_NAME2:keysAndAttributes}
                                            };
    [AWSJSONValidator validateParams:parametersForBatchGet byRule:rule error:&error];
    XCTAssertEqual(error.code,AWSValidationInvalidBase64Data);
    
}


@end

#endif
