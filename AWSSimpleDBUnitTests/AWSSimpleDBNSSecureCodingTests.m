//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSSimpleDBModel.h"

@interface AWSSimpleDBNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSSimpleDBAttribute API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBBatchDeleteAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBBatchPutAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBCreateDomainRequest API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBDeletableItem API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBDeleteAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBDeleteDomainRequest API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBDomainMetadataRequest API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBDomainMetadataResult API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBGetAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBGetAttributesResult API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBItem API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBListDomainsRequest API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBListDomainsResult API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBPutAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBReplaceableAttribute API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBReplaceableItem API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBSelectRequest API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBSelectResult API_AVAILABLE(ios(11));
- (void) test_AWSSimpleDBUpdateCondition API_AVAILABLE(ios(11));

@end

@implementation AWSSimpleDBNSSecureCodingTests

- (void) test_AWSSimpleDBAttribute {
    [self validateSecureCodingForClass:[AWSSimpleDBAttribute class]];
}

- (void) test_AWSSimpleDBBatchDeleteAttributesRequest {
    [self validateSecureCodingForClass:[AWSSimpleDBBatchDeleteAttributesRequest class]];
}

- (void) test_AWSSimpleDBBatchPutAttributesRequest {
    [self validateSecureCodingForClass:[AWSSimpleDBBatchPutAttributesRequest class]];
}

- (void) test_AWSSimpleDBCreateDomainRequest {
    [self validateSecureCodingForClass:[AWSSimpleDBCreateDomainRequest class]];
}

- (void) test_AWSSimpleDBDeletableItem {
    [self validateSecureCodingForClass:[AWSSimpleDBDeletableItem class]];
}

- (void) test_AWSSimpleDBDeleteAttributesRequest {
    [self validateSecureCodingForClass:[AWSSimpleDBDeleteAttributesRequest class]];
}

- (void) test_AWSSimpleDBDeleteDomainRequest {
    [self validateSecureCodingForClass:[AWSSimpleDBDeleteDomainRequest class]];
}

- (void) test_AWSSimpleDBDomainMetadataRequest {
    [self validateSecureCodingForClass:[AWSSimpleDBDomainMetadataRequest class]];
}

- (void) test_AWSSimpleDBDomainMetadataResult {
    [self validateSecureCodingForClass:[AWSSimpleDBDomainMetadataResult class]];
}

- (void) test_AWSSimpleDBGetAttributesRequest {
    [self validateSecureCodingForClass:[AWSSimpleDBGetAttributesRequest class]];
}

- (void) test_AWSSimpleDBGetAttributesResult {
    [self validateSecureCodingForClass:[AWSSimpleDBGetAttributesResult class]];
}

- (void) test_AWSSimpleDBItem {
    [self validateSecureCodingForClass:[AWSSimpleDBItem class]];
}

- (void) test_AWSSimpleDBListDomainsRequest {
    [self validateSecureCodingForClass:[AWSSimpleDBListDomainsRequest class]];
}

- (void) test_AWSSimpleDBListDomainsResult {
    [self validateSecureCodingForClass:[AWSSimpleDBListDomainsResult class]];
}

- (void) test_AWSSimpleDBPutAttributesRequest {
    [self validateSecureCodingForClass:[AWSSimpleDBPutAttributesRequest class]];
}

- (void) test_AWSSimpleDBReplaceableAttribute {
    [self validateSecureCodingForClass:[AWSSimpleDBReplaceableAttribute class]];
}

- (void) test_AWSSimpleDBReplaceableItem {
    [self validateSecureCodingForClass:[AWSSimpleDBReplaceableItem class]];
}

- (void) test_AWSSimpleDBSelectRequest {
    [self validateSecureCodingForClass:[AWSSimpleDBSelectRequest class]];
}

- (void) test_AWSSimpleDBSelectResult {
    [self validateSecureCodingForClass:[AWSSimpleDBSelectResult class]];
}

- (void) test_AWSSimpleDBUpdateCondition {
    [self validateSecureCodingForClass:[AWSSimpleDBUpdateCondition class]];
}

@end

