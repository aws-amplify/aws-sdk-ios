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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSHoneycodeErrorDomain;

typedef NS_ENUM(NSInteger, AWSHoneycodeErrorType) {
    AWSHoneycodeErrorUnknown,
    AWSHoneycodeErrorAccessDenied,
    AWSHoneycodeErrorAutomationExecution,
    AWSHoneycodeErrorAutomationExecutionTimeout,
    AWSHoneycodeErrorInternalServer,
    AWSHoneycodeErrorRequestTimeout,
    AWSHoneycodeErrorResourceNotFound,
    AWSHoneycodeErrorServiceUnavailable,
    AWSHoneycodeErrorThrottling,
    AWSHoneycodeErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSHoneycodeFormat) {
    AWSHoneycodeFormatUnknown,
    AWSHoneycodeFormatAuto,
    AWSHoneycodeFormatNumber,
    AWSHoneycodeFormatCurrency,
    AWSHoneycodeFormatDate,
    AWSHoneycodeFormatTime,
    AWSHoneycodeFormatDateTime,
    AWSHoneycodeFormatPercentage,
    AWSHoneycodeFormatText,
    AWSHoneycodeFormatAccounting,
    AWSHoneycodeFormatContact,
    AWSHoneycodeFormatRowlink,
};

@class AWSHoneycodeColumnMetadata;
@class AWSHoneycodeDataItem;
@class AWSHoneycodeGetScreenDataRequest;
@class AWSHoneycodeGetScreenDataResult;
@class AWSHoneycodeInvokeScreenAutomationRequest;
@class AWSHoneycodeInvokeScreenAutomationResult;
@class AWSHoneycodeResultRow;
@class AWSHoneycodeResultSet;
@class AWSHoneycodeVariableValue;

/**
 <p>Metadata for column in the table.</p>
 Required parameters: [name, format]
 */
@interface AWSHoneycodeColumnMetadata : AWSModel


/**
 <p>The format of the column.</p>
 */
@property (nonatomic, assign) AWSHoneycodeFormat format;

/**
 <p>The name of the column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The data in a particular data cell defined on the screen.</p>
 */
@interface AWSHoneycodeDataItem : AWSModel


/**
 <p>The formatted value of the data. e.g. John Smith.</p>
 */
@property (nonatomic, strong) NSString * _Nullable formattedValue;

/**
 <p> The overrideFormat is optional and is specified only if a particular row of data has a different format for the data than the default format defined on the screen or the table. </p>
 */
@property (nonatomic, assign) AWSHoneycodeFormat overrideFormat;

/**
 <p>The raw value of the data. e.g. jsmith@example.com</p>
 */
@property (nonatomic, strong) NSString * _Nullable rawValue;

@end

/**
 
 */
@interface AWSHoneycodeGetScreenDataRequest : AWSRequest


/**
 <p>The ID of the app that contains the screem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The number of results to be returned on a single page. Specify a number between 1 and 100. The maximum value is 100. </p><p> This parameter is optional. If you don't specify this parameter, the default page size is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> This parameter is optional. If a nextToken is not specified, the API returns the first page of data. </p><p> Pagination tokens expire after 1 hour. If you use a token that was returned more than an hour back, the API will throw ValidationException. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the screen.</p>
 */
@property (nonatomic, strong) NSString * _Nullable screenId;

/**
 <p> Variables are optional and are needed only if the screen requires them to render correctly. Variables are specified as a map where the key is the name of the variable as defined on the screen. The value is an object which currently has only one property, rawValue, which holds the value of the variable to be passed to the screen. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSHoneycodeVariableValue *> * _Nullable variables;

/**
 <p>The ID of the workbook that contains the screen.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workbookId;

@end

/**
 
 */
@interface AWSHoneycodeGetScreenDataResult : AWSModel


/**
 <p> Provides the pagination token to load the next page if there are more results matching the request. If a pagination token is not present in the response, it means that all data matching the query has been loaded. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A map of all the rows on the screen keyed by block name.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSHoneycodeResultSet *> * _Nullable results;

/**
 <p> Indicates the cursor of the workbook at which the data returned by this workbook is read. Workbook cursor keeps increasing with every update and the increments are not sequential. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable workbookCursor;

@end

/**
 
 */
@interface AWSHoneycodeInvokeScreenAutomationRequest : AWSRequest


/**
 <p>The ID of the app that contains the screen automation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The request token for performing the automation action. Request tokens help to identify duplicate requests. If a call times out or fails due to a transient error like a failed network connection, you can retry the call with the same request token. The service ensures that if the first call using that request token is successfully performed, the second call will return the response of the previous call rather than performing the action again. </p><p> Note that request tokens are valid only for a few minutes. You cannot use request tokens to dedupe requests spanning hours or days. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p> The row ID for the automation if the automation is defined inside a block with source or list. </p>
 */
@property (nonatomic, strong) NSString * _Nullable rowId;

/**
 <p>The ID of the automation action to be performed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable screenAutomationId;

/**
 <p>The ID of the screen that contains the screen automation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable screenId;

/**
 <p> Variables are optional and are needed only if the screen requires them to render correctly. Variables are specified as a map where the key is the name of the variable as defined on the screen. The value is an object which currently has only one property, rawValue, which holds the value of the variable to be passed to the screen. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSHoneycodeVariableValue *> * _Nullable variables;

/**
 <p>The ID of the workbook that contains the screen automation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workbookId;

@end

/**
 
 */
@interface AWSHoneycodeInvokeScreenAutomationResult : AWSModel


/**
 <p>The updated workbook cursor after performing the automation action.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable workbookCursor;

@end

/**
 <p>A single row in the ResultSet.</p>
 Required parameters: [dataItems]
 */
@interface AWSHoneycodeResultRow : AWSModel


/**
 <p>List of all the data cells in a row.</p>
 */
@property (nonatomic, strong) NSArray<AWSHoneycodeDataItem *> * _Nullable dataItems;

/**
 <p>The ID for a particular row.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rowId;

@end

/**
 <p> ResultSet contains the results of the request for a single block or list defined on the screen. </p>
 Required parameters: [headers, rows]
 */
@interface AWSHoneycodeResultSet : AWSModel


/**
 <p> List of headers for all the data cells in the block. The header identifies the name and default format of the data cell. Data cells appear in the same order in all rows as defined in the header. The names and formats are not repeated in the rows. If a particular row does not have a value for a data cell, a blank value is used. </p><p> For example, a task list that displays the task name, due date and assigned person might have headers [ { "name": "Task Name"}, {"name": "Due Date", "format": "DATE"}, {"name": "Assigned", "format": "CONTACT"} ]. Every row in the result will have the task name as the first item, due date as the second item and assigned person as the third item. If a particular task does not have a due date, that row will still have a blank value in the second element and the assigned person will still be in the third element. </p>
 */
@property (nonatomic, strong) NSArray<AWSHoneycodeColumnMetadata *> * _Nullable headers;

/**
 <p> List of rows returned by the request. Each row has a row Id and a list of data cells in that row. The data cells will be present in the same order as they are defined in the header. </p>
 */
@property (nonatomic, strong) NSArray<AWSHoneycodeResultRow *> * _Nullable rows;

@end

/**
 <p>The input variables to the app to be used by the InvokeScreenAutomation action request.</p>
 Required parameters: [rawValue]
 */
@interface AWSHoneycodeVariableValue : AWSModel


/**
 <p>Raw value of the variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rawValue;

@end

NS_ASSUME_NONNULL_END
