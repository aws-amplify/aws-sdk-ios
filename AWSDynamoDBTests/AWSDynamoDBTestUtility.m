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

#import "AWSDynamoDBTestUtility.h"

@implementation AWSDynamoDBTestUtility

+ (BOOL)createTable:(NSString *)tableName {
    __block BOOL succeeded = NO;
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
    describeTableInput.tableName = tableName;

    [[[[[dynamoDB describeTable:describeTableInput
         ] continueWithBlock:^id(AWSTask *task) {
        if ([task.error.domain isEqualToString:AWSDynamoDBErrorDomain]
            && task.error.code == AWSDynamoDBErrorResourceNotFound) {
            AWSDynamoDBAttributeDefinition *hashKeyAttributeDefinition = [AWSDynamoDBAttributeDefinition new];
            hashKeyAttributeDefinition.attributeName = @"hashKey1";
            hashKeyAttributeDefinition.attributeType = AWSDynamoDBScalarAttributeTypeS;

            AWSDynamoDBKeySchemaElement *hashKeySchemaElement = [AWSDynamoDBKeySchemaElement new];
            hashKeySchemaElement.attributeName = @"hashKey1";
            hashKeySchemaElement.keyType = AWSDynamoDBKeyTypeHash;

            AWSDynamoDBAttributeDefinition *rangeKeyAttributeDefinition = [AWSDynamoDBAttributeDefinition new];
            rangeKeyAttributeDefinition.attributeName = @"rangeKey1";
            rangeKeyAttributeDefinition.attributeType = AWSDynamoDBScalarAttributeTypeS;

            AWSDynamoDBKeySchemaElement *rangeKeySchemaElement = [AWSDynamoDBKeySchemaElement new];
            rangeKeySchemaElement.attributeName = @"rangeKey1";
            rangeKeySchemaElement.keyType = AWSDynamoDBKeyTypeRange;

            AWSDynamoDBProvisionedThroughput *provisionedThroughput = [AWSDynamoDBProvisionedThroughput new];
            provisionedThroughput.readCapacityUnits = @5;
            provisionedThroughput.writeCapacityUnits = @5;

            AWSDynamoDBCreateTableInput *createTableInput = [AWSDynamoDBCreateTableInput new];
            createTableInput.tableName = tableName;
            createTableInput.attributeDefinitions = @[hashKeyAttributeDefinition, rangeKeyAttributeDefinition];
            createTableInput.keySchema = @[hashKeySchemaElement, rangeKeySchemaElement];
            createTableInput.provisionedThroughput = provisionedThroughput;

            return [dynamoDB createTable:createTableInput];
        }

        return nil;
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        return [self waitForTableToBeActive:tableName];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            succeeded = NO;
        } else {
            succeeded = YES;
        }
        
        return nil;
    }] waitUntilFinished];
    
    return succeeded;
}

+ (AWSTask *)waitForTableToBeActive:(NSString *)tableName {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSTask *task = [AWSTask taskWithResult:nil];
    for(int32_t i = 0; i < 16; i++) {
        task = [task continueWithSuccessBlock:^id(AWSTask *task) {
            if (task.result) {
                AWSDynamoDBDescribeTableOutput *describeTableOutput = task.result;
                AWSDynamoDBTableStatus tableStatus = describeTableOutput.table.tableStatus;
                if (tableStatus == AWSDynamoDBTableStatusActive) {
                    return task;
                }
            }

            sleep(5);

            AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
            describeTableInput.tableName = tableName;
            return [dynamoDB describeTable:describeTableInput];
        }];
    }

    return task;
}

+ (AWSTask *)waitForTableToBeDeleted:(NSString *)tableName {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSTask *task = [AWSTask taskWithResult:nil];
    for(int32_t i = 0; i < 16; i ++) {
        task = [task continueWithSuccessBlock:^id(AWSTask *task) {
            sleep(5);

            AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
            describeTableInput.tableName = tableName;
            return [dynamoDB describeTable:describeTableInput];
        }];
    }

    return task;
}

+ (BOOL)deleteTable:(NSString *)tableName {
    __block BOOL succeeded = NO;
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSDynamoDBDeleteTableInput *deleteTableInput = [AWSDynamoDBDeleteTableInput new];
    deleteTableInput.tableName = tableName;

    [[[[dynamoDB deleteTable:deleteTableInput
        ] continueWithSuccessBlock:^id(AWSTask *task) {
        return [self waitForTableToBeDeleted:tableName];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error
            && (![task.error.domain isEqualToString:AWSDynamoDBErrorDomain]
                || task.error.code != AWSDynamoDBErrorResourceNotFound)) {
                succeeded = NO;
            } else {
                succeeded = YES;
            }

        return nil;
    }] waitUntilFinished];
    
    return succeeded;
}

@end
