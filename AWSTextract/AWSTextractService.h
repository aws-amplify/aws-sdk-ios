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
#import <AWSCore/AWSCore.h>
#import "AWSTextractModel.h"
#import "AWSTextractResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSTextract
FOUNDATION_EXPORT NSString *const AWSTextractSDKVersion;

/**
 <p>Amazon Textract detects and analyzes text in documents and converts it into machine-readable text. This is the API reference documentation for Amazon Textract.</p>
 */
@interface AWSTextract : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let Textract = AWSTextract.default()

 *Objective-C*

     AWSTextract *Textract = [AWSTextract defaultTextract];

 @return The default service client.
 */
+ (instancetype)defaultTextract;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSTextract.register(with: configuration!, forKey: "USWest2Textract")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSTextract registerTextractWithConfiguration:configuration forKey:@"USWest2Textract"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Textract = AWSTextract(forKey: "USWest2Textract")

 *Objective-C*

     AWSTextract *Textract = [AWSTextract TextractForKey:@"USWest2Textract"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerTextractWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerTextractWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSTextract.register(with: configuration!, forKey: "USWest2Textract")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSTextract registerTextractWithConfiguration:configuration forKey:@"USWest2Textract"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Textract = AWSTextract(forKey: "USWest2Textract")

 *Objective-C*

     AWSTextract *Textract = [AWSTextract TextractForKey:@"USWest2Textract"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)TextractForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeTextractForKey:(NSString *)key;

/**
 <p>Analyzes an input document for relationships between detected items. </p><p>The types of information returned are as follows: </p><ul><li><p>Words and lines that are related to nearby lines and words. The related information is returned in two <a>Block</a> objects each of type <code>KEY_VALUE_SET</code>: a KEY Block object and a VALUE Block object. For example, <i>Name: Ana Silva Carolina</i> contains a key and value. <i>Name:</i> is the key. <i>Ana Silva Carolina</i> is the value.</p></li><li><p>Table and table cell data. A TABLE Block object contains information about a detected table. A CELL Block object is returned for each cell in a table.</p></li><li><p>Selectable elements such as checkboxes and radio buttons. A SELECTION_ELEMENT Block object contains information about a selectable element.</p></li><li><p>Lines and words of text. A LINE Block object contains one or more WORD Block objects.</p></li></ul><p>You can choose which type of analysis to perform by specifying the <code>FeatureTypes</code> list. </p><p>The output is returned in a list of <code>BLOCK</code> objects.</p><p><code>AnalyzeDocument</code> is a synchronous operation. To analyze documents asynchronously, use <a>StartDocumentAnalysis</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document Text Analysis</a>.</p>
 
 @param request A container for the necessary parameters to execute the AnalyzeDocument service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTextractAnalyzeDocumentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorInvalidS3Object`, `AWSTextractErrorUnsupportedDocument`, `AWSTextractErrorDocumentTooLarge`, `AWSTextractErrorBadDocument`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInternalServer`, `AWSTextractErrorThrottling`.
 
 @see AWSTextractAnalyzeDocumentRequest
 @see AWSTextractAnalyzeDocumentResponse
 */
- (AWSTask<AWSTextractAnalyzeDocumentResponse *> *)analyzeDocument:(AWSTextractAnalyzeDocumentRequest *)request;

/**
 <p>Analyzes an input document for relationships between detected items. </p><p>The types of information returned are as follows: </p><ul><li><p>Words and lines that are related to nearby lines and words. The related information is returned in two <a>Block</a> objects each of type <code>KEY_VALUE_SET</code>: a KEY Block object and a VALUE Block object. For example, <i>Name: Ana Silva Carolina</i> contains a key and value. <i>Name:</i> is the key. <i>Ana Silva Carolina</i> is the value.</p></li><li><p>Table and table cell data. A TABLE Block object contains information about a detected table. A CELL Block object is returned for each cell in a table.</p></li><li><p>Selectable elements such as checkboxes and radio buttons. A SELECTION_ELEMENT Block object contains information about a selectable element.</p></li><li><p>Lines and words of text. A LINE Block object contains one or more WORD Block objects.</p></li></ul><p>You can choose which type of analysis to perform by specifying the <code>FeatureTypes</code> list. </p><p>The output is returned in a list of <code>BLOCK</code> objects.</p><p><code>AnalyzeDocument</code> is a synchronous operation. To analyze documents asynchronously, use <a>StartDocumentAnalysis</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document Text Analysis</a>.</p>
 
 @param request A container for the necessary parameters to execute the AnalyzeDocument service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorInvalidS3Object`, `AWSTextractErrorUnsupportedDocument`, `AWSTextractErrorDocumentTooLarge`, `AWSTextractErrorBadDocument`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInternalServer`, `AWSTextractErrorThrottling`.
 
 @see AWSTextractAnalyzeDocumentRequest
 @see AWSTextractAnalyzeDocumentResponse
 */
- (void)analyzeDocument:(AWSTextractAnalyzeDocumentRequest *)request completionHandler:(void (^ _Nullable)(AWSTextractAnalyzeDocumentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects text in the input document. Amazon Textract can detect lines of text and the words that make up a line of text. The input document must be an image in JPG or PNG format. <code>DetectDocumentText</code> returns the detected text in an array of <a>Block</a> objects. </p><p>Each document page has as an associated <code>Block</code> of type PAGE. Each PAGE <code>Block</code> object is the parent of LINE <code>Block</code> objects that represent the lines of detected text on a page. A LINE <code>Block</code> object is a parent for each word that makes up the line. Words are represented by <code>Block</code> objects of type WORD.</p><p><code>DetectDocumentText</code> is a synchronous operation. To analyze documents asynchronously, use <a>StartDocumentTextDetection</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document Text Detection</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetectDocumentText service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTextractDetectDocumentTextResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorInvalidS3Object`, `AWSTextractErrorUnsupportedDocument`, `AWSTextractErrorDocumentTooLarge`, `AWSTextractErrorBadDocument`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInternalServer`, `AWSTextractErrorThrottling`.
 
 @see AWSTextractDetectDocumentTextRequest
 @see AWSTextractDetectDocumentTextResponse
 */
- (AWSTask<AWSTextractDetectDocumentTextResponse *> *)detectDocumentText:(AWSTextractDetectDocumentTextRequest *)request;

/**
 <p>Detects text in the input document. Amazon Textract can detect lines of text and the words that make up a line of text. The input document must be an image in JPG or PNG format. <code>DetectDocumentText</code> returns the detected text in an array of <a>Block</a> objects. </p><p>Each document page has as an associated <code>Block</code> of type PAGE. Each PAGE <code>Block</code> object is the parent of LINE <code>Block</code> objects that represent the lines of detected text on a page. A LINE <code>Block</code> object is a parent for each word that makes up the line. Words are represented by <code>Block</code> objects of type WORD.</p><p><code>DetectDocumentText</code> is a synchronous operation. To analyze documents asynchronously, use <a>StartDocumentTextDetection</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document Text Detection</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetectDocumentText service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorInvalidS3Object`, `AWSTextractErrorUnsupportedDocument`, `AWSTextractErrorDocumentTooLarge`, `AWSTextractErrorBadDocument`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInternalServer`, `AWSTextractErrorThrottling`.
 
 @see AWSTextractDetectDocumentTextRequest
 @see AWSTextractDetectDocumentTextResponse
 */
- (void)detectDocumentText:(AWSTextractDetectDocumentTextRequest *)request completionHandler:(void (^ _Nullable)(AWSTextractDetectDocumentTextResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the results for an Amazon Textract asynchronous operation that analyzes text in a document.</p><p>You start asynchronous text analysis by calling <a>StartDocumentAnalysis</a>, which returns a job identifier (<code>JobId</code>). When the text analysis operation finishes, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's registered in the initial call to <code>StartDocumentAnalysis</code>. To get the results of the text-detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetDocumentAnalysis</code>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentAnalysis</code>.</p><p><code>GetDocumentAnalysis</code> returns an array of <a>Block</a> objects. The following types of information are returned: </p><ul><li><p>Words and lines that are related to nearby lines and words. The related information is returned in two <a>Block</a> objects each of type <code>KEY_VALUE_SET</code>: a KEY Block object and a VALUE Block object. For example, <i>Name: Ana Silva Carolina</i> contains a key and value. <i>Name:</i> is the key. <i>Ana Silva Carolina</i> is the value.</p></li><li><p>Table and table cell data. A TABLE Block object contains information about a detected table. A CELL Block object is returned for each cell in a table.</p></li><li><p>Selectable elements such as checkboxes and radio buttons. A SELECTION_ELEMENT Block object contains information about a selectable element.</p></li><li><p>Lines and words of text. A LINE Block object contains one or more WORD Block objects.</p></li></ul><p>Use the <code>MaxResults</code> parameter to limit the number of blocks returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetDocumentAnalysis</code>, and populate the <code>NextToken</code> request parameter with the token value that's returned from the previous call to <code>GetDocumentAnalysis</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document Text Analysis</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetDocumentAnalysis service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTextractGetDocumentAnalysisResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInvalidJobId`, `AWSTextractErrorInternalServer`, `AWSTextractErrorThrottling`.
 
 @see AWSTextractGetDocumentAnalysisRequest
 @see AWSTextractGetDocumentAnalysisResponse
 */
- (AWSTask<AWSTextractGetDocumentAnalysisResponse *> *)getDocumentAnalysis:(AWSTextractGetDocumentAnalysisRequest *)request;

/**
 <p>Gets the results for an Amazon Textract asynchronous operation that analyzes text in a document.</p><p>You start asynchronous text analysis by calling <a>StartDocumentAnalysis</a>, which returns a job identifier (<code>JobId</code>). When the text analysis operation finishes, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's registered in the initial call to <code>StartDocumentAnalysis</code>. To get the results of the text-detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetDocumentAnalysis</code>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentAnalysis</code>.</p><p><code>GetDocumentAnalysis</code> returns an array of <a>Block</a> objects. The following types of information are returned: </p><ul><li><p>Words and lines that are related to nearby lines and words. The related information is returned in two <a>Block</a> objects each of type <code>KEY_VALUE_SET</code>: a KEY Block object and a VALUE Block object. For example, <i>Name: Ana Silva Carolina</i> contains a key and value. <i>Name:</i> is the key. <i>Ana Silva Carolina</i> is the value.</p></li><li><p>Table and table cell data. A TABLE Block object contains information about a detected table. A CELL Block object is returned for each cell in a table.</p></li><li><p>Selectable elements such as checkboxes and radio buttons. A SELECTION_ELEMENT Block object contains information about a selectable element.</p></li><li><p>Lines and words of text. A LINE Block object contains one or more WORD Block objects.</p></li></ul><p>Use the <code>MaxResults</code> parameter to limit the number of blocks returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetDocumentAnalysis</code>, and populate the <code>NextToken</code> request parameter with the token value that's returned from the previous call to <code>GetDocumentAnalysis</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document Text Analysis</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetDocumentAnalysis service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInvalidJobId`, `AWSTextractErrorInternalServer`, `AWSTextractErrorThrottling`.
 
 @see AWSTextractGetDocumentAnalysisRequest
 @see AWSTextractGetDocumentAnalysisResponse
 */
- (void)getDocumentAnalysis:(AWSTextractGetDocumentAnalysisRequest *)request completionHandler:(void (^ _Nullable)(AWSTextractGetDocumentAnalysisResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the results for an Amazon Textract asynchronous operation that detects text in a document. Amazon Textract can detect lines of text and the words that make up a line of text.</p><p>You start asynchronous text detection by calling <a>StartDocumentTextDetection</a>, which returns a job identifier (<code>JobId</code>). When the text detection operation finishes, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's registered in the initial call to <code>StartDocumentTextDetection</code>. To get the results of the text-detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetDocumentTextDetection</code>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentTextDetection</code>.</p><p><code>GetDocumentTextDetection</code> returns an array of <a>Block</a> objects. </p><p>Each document page has as an associated <code>Block</code> of type PAGE. Each PAGE <code>Block</code> object is the parent of LINE <code>Block</code> objects that represent the lines of detected text on a page. A LINE <code>Block</code> object is a parent for each word that makes up the line. Words are represented by <code>Block</code> objects of type WORD.</p><p>Use the MaxResults parameter to limit the number of blocks that are returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetDocumentTextDetection</code>, and populate the <code>NextToken</code> request parameter with the token value that's returned from the previous call to <code>GetDocumentTextDetection</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document Text Detection</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetDocumentTextDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTextractGetDocumentTextDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInvalidJobId`, `AWSTextractErrorInternalServer`, `AWSTextractErrorThrottling`.
 
 @see AWSTextractGetDocumentTextDetectionRequest
 @see AWSTextractGetDocumentTextDetectionResponse
 */
- (AWSTask<AWSTextractGetDocumentTextDetectionResponse *> *)getDocumentTextDetection:(AWSTextractGetDocumentTextDetectionRequest *)request;

/**
 <p>Gets the results for an Amazon Textract asynchronous operation that detects text in a document. Amazon Textract can detect lines of text and the words that make up a line of text.</p><p>You start asynchronous text detection by calling <a>StartDocumentTextDetection</a>, which returns a job identifier (<code>JobId</code>). When the text detection operation finishes, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's registered in the initial call to <code>StartDocumentTextDetection</code>. To get the results of the text-detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetDocumentTextDetection</code>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentTextDetection</code>.</p><p><code>GetDocumentTextDetection</code> returns an array of <a>Block</a> objects. </p><p>Each document page has as an associated <code>Block</code> of type PAGE. Each PAGE <code>Block</code> object is the parent of LINE <code>Block</code> objects that represent the lines of detected text on a page. A LINE <code>Block</code> object is a parent for each word that makes up the line. Words are represented by <code>Block</code> objects of type WORD.</p><p>Use the MaxResults parameter to limit the number of blocks that are returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetDocumentTextDetection</code>, and populate the <code>NextToken</code> request parameter with the token value that's returned from the previous call to <code>GetDocumentTextDetection</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document Text Detection</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetDocumentTextDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInvalidJobId`, `AWSTextractErrorInternalServer`, `AWSTextractErrorThrottling`.
 
 @see AWSTextractGetDocumentTextDetectionRequest
 @see AWSTextractGetDocumentTextDetectionResponse
 */
- (void)getDocumentTextDetection:(AWSTextractGetDocumentTextDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSTextractGetDocumentTextDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts asynchronous analysis of an input document for relationships between detected items such as key and value pairs, tables, and selection elements.</p><p><code>StartDocumentAnalysis</code> can analyze text in documents that are in JPG, PNG, and PDF format. The documents are stored in an Amazon S3 bucket. Use <a>DocumentLocation</a> to specify the bucket name and file name of the document. </p><p><code>StartDocumentAnalysis</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When text analysis is finished, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that you specify in <code>NotificationChannel</code>. To get the results of the text analysis operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetDocumentAnalysis</a>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentAnalysis</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document Text Analysis</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartDocumentAnalysis service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTextractStartDocumentAnalysisResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorInvalidS3Object`, `AWSTextractErrorUnsupportedDocument`, `AWSTextractErrorDocumentTooLarge`, `AWSTextractErrorBadDocument`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInternalServer`, `AWSTextractErrorIdempotentParameterMismatch`, `AWSTextractErrorThrottling`, `AWSTextractErrorLimitExceeded`.
 
 @see AWSTextractStartDocumentAnalysisRequest
 @see AWSTextractStartDocumentAnalysisResponse
 */
- (AWSTask<AWSTextractStartDocumentAnalysisResponse *> *)startDocumentAnalysis:(AWSTextractStartDocumentAnalysisRequest *)request;

/**
 <p>Starts asynchronous analysis of an input document for relationships between detected items such as key and value pairs, tables, and selection elements.</p><p><code>StartDocumentAnalysis</code> can analyze text in documents that are in JPG, PNG, and PDF format. The documents are stored in an Amazon S3 bucket. Use <a>DocumentLocation</a> to specify the bucket name and file name of the document. </p><p><code>StartDocumentAnalysis</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When text analysis is finished, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that you specify in <code>NotificationChannel</code>. To get the results of the text analysis operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetDocumentAnalysis</a>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentAnalysis</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document Text Analysis</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartDocumentAnalysis service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorInvalidS3Object`, `AWSTextractErrorUnsupportedDocument`, `AWSTextractErrorDocumentTooLarge`, `AWSTextractErrorBadDocument`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInternalServer`, `AWSTextractErrorIdempotentParameterMismatch`, `AWSTextractErrorThrottling`, `AWSTextractErrorLimitExceeded`.
 
 @see AWSTextractStartDocumentAnalysisRequest
 @see AWSTextractStartDocumentAnalysisResponse
 */
- (void)startDocumentAnalysis:(AWSTextractStartDocumentAnalysisRequest *)request completionHandler:(void (^ _Nullable)(AWSTextractStartDocumentAnalysisResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the asynchronous detection of text in a document. Amazon Textract can detect lines of text and the words that make up a line of text.</p><p><code>StartDocumentTextDetection</code> can analyze text in documents that are in JPG, PNG, and PDF format. The documents are stored in an Amazon S3 bucket. Use <a>DocumentLocation</a> to specify the bucket name and file name of the document. </p><p><code>StartTextDetection</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When text detection is finished, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that you specify in <code>NotificationChannel</code>. To get the results of the text detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetDocumentTextDetection</a>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentTextDetection</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document Text Detection</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartDocumentTextDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSTextractStartDocumentTextDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorInvalidS3Object`, `AWSTextractErrorUnsupportedDocument`, `AWSTextractErrorDocumentTooLarge`, `AWSTextractErrorBadDocument`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInternalServer`, `AWSTextractErrorIdempotentParameterMismatch`, `AWSTextractErrorThrottling`, `AWSTextractErrorLimitExceeded`.
 
 @see AWSTextractStartDocumentTextDetectionRequest
 @see AWSTextractStartDocumentTextDetectionResponse
 */
- (AWSTask<AWSTextractStartDocumentTextDetectionResponse *> *)startDocumentTextDetection:(AWSTextractStartDocumentTextDetectionRequest *)request;

/**
 <p>Starts the asynchronous detection of text in a document. Amazon Textract can detect lines of text and the words that make up a line of text.</p><p><code>StartDocumentTextDetection</code> can analyze text in documents that are in JPG, PNG, and PDF format. The documents are stored in an Amazon S3 bucket. Use <a>DocumentLocation</a> to specify the bucket name and file name of the document. </p><p><code>StartTextDetection</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When text detection is finished, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that you specify in <code>NotificationChannel</code>. To get the results of the text detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetDocumentTextDetection</a>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentTextDetection</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document Text Detection</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartDocumentTextDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSTextractErrorDomain` domain and the following error code: `AWSTextractErrorInvalidParameter`, `AWSTextractErrorInvalidS3Object`, `AWSTextractErrorUnsupportedDocument`, `AWSTextractErrorDocumentTooLarge`, `AWSTextractErrorBadDocument`, `AWSTextractErrorAccessDenied`, `AWSTextractErrorProvisionedThroughputExceeded`, `AWSTextractErrorInternalServer`, `AWSTextractErrorIdempotentParameterMismatch`, `AWSTextractErrorThrottling`, `AWSTextractErrorLimitExceeded`.
 
 @see AWSTextractStartDocumentTextDetectionRequest
 @see AWSTextractStartDocumentTextDetectionResponse
 */
- (void)startDocumentTextDetection:(AWSTextractStartDocumentTextDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSTextractStartDocumentTextDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
