//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSMachineLearningResources.h"
#import "AWSLogging.h"

@interface AWSMachineLearningResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSMachineLearningResources

+ (instancetype)sharedInstance {
    static AWSMachineLearningResources *_sharedResources = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token, ^{
        _sharedResources = [AWSMachineLearningResources new];
    });
    
    return _sharedResources;
}
- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @" \
    { \
      \"version\":\"2.0\", \
      \"metadata\":{ \
        \"apiVersion\":\"2014-12-12\", \
        \"endpointPrefix\":\"machinelearning\", \
        \"jsonVersion\":\"1.1\", \
        \"serviceFullName\":\"Amazon Machine Learning\", \
        \"signatureVersion\":\"v4\", \
        \"targetPrefix\":\"AmazonML_20141212\", \
        \"protocol\":\"json\" \
      }, \
      \"documentation\":\"Definition of the public APIs exposed by Amazon Machine Learning\", \
      \"operations\":{ \
        \"GetMLModel\":{ \
          \"name\":\"GetMLModel\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"GetMLModelInput\"}, \
          \"output\":{ \
            \"shape\":\"GetMLModelOutput\", \
            \"documentation\":\"<p>Represents the output of a <a>GetMLModel</a> operation, and provides detailed information about a <code>MLModel</code>.</p>\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidInputException\", \
              \"error\":{\"httpStatusCode\":400}, \
              \"exception\":true, \
              \"documentation\":\"<p>An error on the client occurred. Typically, the cause is an invalid input value.</p>\" \
            }, \
            { \
              \"shape\":\"ResourceNotFoundException\", \
              \"error\":{\"httpStatusCode\":404}, \
              \"exception\":true, \
              \"documentation\":\"<p>A specified resource cannot be located.</p>\" \
            }, \
            { \
              \"shape\":\"InternalServerException\", \
              \"error\":{\"httpStatusCode\":500}, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>An error on the server occurred when trying to process a request.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Returns an <code>MLModel</code> that includes detailed metadata, and data source information as well as the current status of the <code>MLModel</code>.</p> <p><code>GetMLModel</code> provides results in normal or verbose format. </p>\" \
        }, \
        \"Predict\":{ \
          \"name\":\"Predict\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"PredictInput\"}, \
          \"output\":{\"shape\":\"PredictOutput\"}, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidInputException\", \
              \"error\":{\"httpStatusCode\":400}, \
              \"exception\":true, \
              \"documentation\":\"<p>An error on the client occurred. Typically, the cause is an invalid input value.</p>\" \
            }, \
            { \
              \"shape\":\"ResourceNotFoundException\", \
              \"error\":{\"httpStatusCode\":404}, \
              \"exception\":true, \
              \"documentation\":\"<p>A specified resource cannot be located.</p>\" \
            }, \
            { \
              \"shape\":\"LimitExceededException\", \
              \"error\":{\"httpStatusCode\":417}, \
              \"exception\":true, \
              \"documentation\":\"<p>The subscriber exceeded the maximum number of operations. This exception can occur when listing objects such as <code>DataSource</code>.</p>\" \
            }, \
            { \
              \"shape\":\"InternalServerException\", \
              \"error\":{\"httpStatusCode\":500}, \
              \"exception\":true, \
              \"fault\":true, \
              \"documentation\":\"<p>An error on the server occurred when trying to process a request.</p>\" \
            }, \
            { \
              \"shape\":\"PredictorNotMountedException\", \
              \"error\":{\"httpStatusCode\":400}, \
              \"exception\":true, \
              \"documentation\":\"<p>The exception is thrown when a predict request is made to an unmounted <code>MLModel</code>.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Generates a prediction for the observation using the specified <code>MLModel</code>.</p> <note><title>Note</title> <p>Not all response parameters will be populated because this is dependent on the type of requested model.</p></note>\" \
        } \
      }, \
      \"shapes\":{ \
        \"AwsUserArn\":{ \
          \"type\":\"string\", \
          \"pattern\":\"arn:aws:iam::[0-9]+:((user/.+)|(root))\", \
          \"documentation\":\"<p>An Amazon Web Service (AWS) user account identifier. The account identifier can be an AWS root account or an AWS Identity and Access Management (IAM) user.</p>\" \
        }, \
        \"DataSchema\":{ \
          \"type\":\"string\", \
          \"max\":131071, \
          \"documentation\":\"<p>The schema of a <code>DataSource</code>. The <code>DataSchema</code> defines the structure of the observation data in the data file(s) referenced in the <code>DataSource</code>. The DataSource schema is expressed in JSON format.</p> { \\\"version\\\": \\\"1.0\\\", \\\"recordAnnotationFieldName\\\": \\\"F1\\\", \\\"recordWeightFieldName\\\": \\\"F2\\\", \\\"targetFieldName\\\": \\\"F3\\\", \\\"dataFormat\\\": \\\"CSV\\\", \\\"dataFileContainsHeader\\\": true, \\\"variables\\\": [ { \\\"fieldName\\\": \\\"F1\\\", \\\"fieldType\\\": \\\"TEXT\\\" }, { \\\"fieldName\\\": \\\"F2\\\", \\\"fieldType\\\": \\\"NUMERIC\\\" }, { \\\"fieldName\\\": \\\"F3\\\", \\\"fieldType\\\": \\\"CATEGORICAL\\\" }, { \\\"fieldName\\\": \\\"F4\\\", \\\"fieldType\\\": \\\"NUMERIC\\\" }, { \\\"fieldName\\\": \\\"F5\\\", \\\"fieldType\\\": \\\"CATEGORICAL\\\" }, { \\\"fieldName\\\": \\\"F6\\\", \\\"fieldType\\\": \\\"TEXT\\\" }, { \\\"fieldName\\\": \\\"F7\\\", \\\"fieldType\\\": \\\"WEIGHTED_INT_SEQUENCE\\\" }, { \\\"fieldName\\\": \\\"F8\\\", \\\"fieldType\\\": \\\"WEIGHTED_STRING_SEQUENCE\\\" } ], \\\"excludedVariableNames\\\": [ \\\"F6\\\" ] }\" \
        }, \
        \"DetailsAttributes\":{ \
          \"type\":\"string\", \
          \"enum\":[ \
            \"PredictiveModelType\", \
            \"Algorithm\" \
          ], \
          \"documentation\":\"Contains the key values of <code>DetailsMap</code>: PredictiveModelType - Indicates the type of the <code>MLModel</code>. Algorithm - Indicates the algorithm was used for the <code>MLModel</code>.\" \
        }, \
        \"DetailsMap\":{ \
          \"type\":\"map\", \
          \"key\":{\"shape\":\"DetailsAttributes\"}, \
          \"value\":{\"shape\":\"DetailsValue\"}, \
          \"documentation\":\"Provides any additional details regarding the prediction.\" \
        }, \
        \"DetailsValue\":{ \
          \"type\":\"string\", \
          \"min\":1 \
        }, \
        \"EntityId\":{ \
          \"type\":\"string\", \
          \"min\":1, \
          \"max\":64, \
          \"pattern\":\"[a-zA-Z0-9_.-]+\" \
        }, \
        \"EntityStatus\":{ \
          \"type\":\"string\", \
          \"enum\":[ \
            \"PENDING\", \
            \"INPROGRESS\", \
            \"FAILED\", \
            \"COMPLETED\", \
            \"DELETED\" \
          ], \
          \"documentation\":\"<p>Entity status with the following possible values:</p> <ul> <li>PENDING</li> <li>INPROGRESS</li> <li>FAILED</li> <li>COMPLETED</li> <li>DELETED</li> </ul>\" \
        }, \
        \"EpochTime\":{ \
          \"type\":\"timestamp\", \
          \"documentation\":\"<p>A timestamp represented in epoch time.</p>\" \
        }, \
        \"ErrorCode\":{\"type\":\"integer\"}, \
        \"ErrorMessage\":{ \
          \"type\":\"string\", \
          \"max\":2048 \
        }, \
        \"GetMLModelInput\":{ \
          \"type\":\"structure\", \
          \"required\":[\"MLModelId\"], \
          \"members\":{ \
            \"MLModelId\":{ \
              \"shape\":\"EntityId\", \
              \"documentation\":\"<p>The ID assigned to the <code>MLModel</code> at creation.</p>\" \
            }, \
            \"Verbose\":{ \
              \"shape\":\"Verbose\", \
              \"documentation\":\"<p>Specifies whether the <code>GetMLModel</code> operation should return <code>Recipe</code>.</p> <p>If true, <code>Recipe</code> is returned.</p> <p>If false, <code>Recipe</code> is not returned.</p>\" \
            } \
          } \
        }, \
        \"GetMLModelOutput\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"MLModelId\":{ \
              \"shape\":\"EntityId\", \
              \"documentation\":\"<p>The MLModel ID which is same as the <code>MLModelId</code> in the request.</p>\" \
            }, \
            \"TrainingDataSourceId\":{ \
              \"shape\":\"EntityId\", \
              \"documentation\":\"<p>The ID of the training <code>DataSource</code>.</p>\" \
            }, \
            \"CreatedByIamUser\":{ \
              \"shape\":\"AwsUserArn\", \
              \"documentation\":\"<p>The AWS user account from which the <code>MLModel</code> was created. The account type can be either an AWS root account or an AWS Identity and Access Management (IAM) user account.</p>\" \
            }, \
            \"CreatedAt\":{ \
              \"shape\":\"EpochTime\", \
              \"documentation\":\"<p>The time that the <code>MLModel</code> was created. The time is expressed in epoch time.</p>\" \
            }, \
            \"LastUpdatedAt\":{ \
              \"shape\":\"EpochTime\", \
              \"documentation\":\"<p>The time of the most recent edit to the <code>MLModel</code>. The time is expressed in epoch time.</p>\" \
            }, \
            \"Name\":{ \
              \"shape\":\"MLModelName\", \
              \"documentation\":\"<p>A user-supplied name or description of the <code>MLModel</code>.</p>\" \
            }, \
            \"Status\":{ \
              \"shape\":\"EntityStatus\", \
              \"documentation\":\"<p>The current status of the <code>MLModel</code>. This element can have one of the following values:</p> <ul> <li> <code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a request to describe a <code>MLModel</code>.</li> <li> <code>INPROGRESS</code> - The request is processing.</li> <li> <code>FAILED</code> - The request did not run to completion. It is not usable.</li> <li> <code>COMPLETED</code> - The request completed successfully.</li> <li> <code>DELETED</code> - The <code>MLModel</code> is marked as deleted. It is not usable.</li> </ul>\" \
            }, \
            \"SizeInBytes\":{\"shape\":\"LongType\"}, \
            \"EndpointInfo\":{ \
              \"shape\":\"RealtimeEndpointInfo\", \
              \"documentation\":\"<p>The current endpoint of the <code>MLModel</code></p>\" \
            }, \
            \"TrainingParameters\":{ \
              \"shape\":\"TrainingParameters\", \
              \"documentation\":\"<p>A list of the training parameters in the <code>MLModel</code>. The list is implemented as a map of key/value pairs.</p> <p>The following is the current set of training parameters: </p> <ul> <li> <p><code>sgd.l1RegularizationAmount</code> - Coefficient regularization L1 norm. It controls overfitting the data by penalizing large coefficients. This tends to drive coefficients to zero, resulting in a sparse feature set. If you use this parameter, specify a small value, such as 1.0E-04 or 1.0E-08.</p> <p>The value is a double that ranges from 0 to MAX_DOUBLE. The default is not to use L1 normalization. The parameter cannot be used when <code>L2</code> is specified. Use this parameter sparingly.</p> </li> <li> <p><code>sgd.l2RegularizationAmount</code> - Coefficient regularization L2 norm. It controls overfitting the data by penalizing large coefficients. This tends to drive coefficients to small, nonzero values. If you use this parameter, specify a small value, such as 1.0E-04 or 1.0E-08.</p> <p>The value is a double that ranges from 0 to MAX_DOUBLE. The default is not to use L2 normalization. This parameter cannot be used when <code>L1</code> is specified. Use this parameter sparingly.</p> </li> <li><p><code>sgd.maxPasses</code> - The number of times that the training process traverses the observations to build the <code>MLModel</code>. The value is an integer that ranges from 1 to 10000. The default value is 10. </p></li> <li> <p><code>sgd.maxMLModelSizeInBytes</code> - The maximum allowed size of the model. Depending on the input data, the model size might affect performance. </p> <p> The value is an integer that ranges from 100000 to 2147483648. The default value is 33554432. </p> </li> </ul>\" \
            }, \
            \"InputDataLocationS3\":{ \
              \"shape\":\"S3Url\", \
              \"documentation\":\"<p>The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).</p>\" \
            }, \
            \"MLModelType\":{ \
              \"shape\":\"MLModelType\", \
              \"documentation\":\"<p>Identifies the <code>MLModel</code> category. The following are the available types: </p> <ul> <li>REGRESSION -- Produces a numeric result. For example, \\\"What listing price should a house have?\\\"</li> <li>BINARY -- Produces one of two possible results. For example, \\\"Is this an e-commerce website?\\\"</li> <li>MULTICLASS -- Produces more than two possible results. For example, \\\"Is this a HIGH, LOW or MEDIUM risk trade?\\\"</li> </ul>\" \
            }, \
            \"ScoreThreshold\":{ \
              \"shape\":\"ScoreThreshold\", \
              \"documentation\":\"<p>The scoring threshold is used in binary classification <code>MLModel</code>s, and marks the boundary between a positive prediction and a negative prediction.</p> <p>Output values greater than or equal to the threshold receive a positive result from the MLModel, such as <code>true</code>. Output values less than the threshold receive a negative response from the MLModel, such as <code>false</code>.</p>\" \
            }, \
            \"ScoreThresholdLastUpdatedAt\":{ \
              \"shape\":\"EpochTime\", \
              \"documentation\":\"<p>The time of the most recent edit to the <code>ScoreThreshold</code>. The time is expressed in epoch time.</p>\" \
            }, \
            \"LogUri\":{ \
              \"shape\":\"PresignedS3Url\", \
              \"documentation\":\"<p>A link to the file that contains logs of the <code>CreateMLModel</code> operation.</p>\" \
            }, \
            \"Message\":{ \
              \"shape\":\"Message\", \
              \"documentation\":\"<p>Description of the most recent details about accessing the <code>MLModel</code>.</p>\" \
            }, \
            \"Recipe\":{ \
              \"shape\":\"Recipe\", \
              \"documentation\":\"<p>The recipe to use when training the <code>MLModel</code>. The <code>Recipe</code> provides detailed information about the observation data to use during training, as well as manipulations to perform on the observation data during training.</p> <note><title>Note</title> <p>This parameter is provided as part of the verbose format.</p></note>\" \
            }, \
            \"Schema\":{ \
              \"shape\":\"DataSchema\", \
              \"documentation\":\"<p>The schema used by all of the data files referenced by the <code>DataSource</code>.</p> <note><title>Note</title> <p>This parameter is provided as part of the verbose format.</p></note>\" \
            } \
          }, \
          \"documentation\":\"<p>Represents the output of a <a>GetMLModel</a> operation, and provides detailed information about a <code>MLModel</code>.</p>\" \
        }, \
        \"IntegerType\":{ \
          \"type\":\"integer\", \
          \"documentation\":\"<p>Integer type that is a 32-bit signed number.</p>\" \
        }, \
        \"InternalServerException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"ErrorMessage\"}, \
            \"code\":{\"shape\":\"ErrorCode\"} \
          }, \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An error on the server occurred when trying to process a request.</p>\" \
        }, \
        \"InvalidInputException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"ErrorMessage\"}, \
            \"code\":{\"shape\":\"ErrorCode\"} \
          }, \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>An error on the client occurred. Typically, the cause is an invalid input value.</p>\" \
        }, \
        \"Label\":{ \
          \"type\":\"string\", \
          \"min\":1 \
        }, \
        \"LimitExceededException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"ErrorMessage\"}, \
            \"code\":{\"shape\":\"ErrorCode\"} \
          }, \
          \"error\":{\"httpStatusCode\":417}, \
          \"exception\":true, \
          \"documentation\":\"<p>The subscriber exceeded the maximum number of operations. This exception can occur when listing objects such as <code>DataSource</code>.</p>\" \
        }, \
        \"LongType\":{ \
          \"type\":\"long\", \
          \"documentation\":\"<p>Long integer type that is a 64-bit signed number.</p>\" \
        }, \
        \"MLModelName\":{ \
          \"type\":\"string\", \
          \"max\":1024 \
        }, \
        \"MLModelType\":{ \
          \"type\":\"string\", \
          \"enum\":[ \
            \"REGRESSION\", \
            \"BINARY\", \
            \"MULTICLASS\" \
          ] \
        }, \
        \"Message\":{ \
          \"type\":\"string\", \
          \"max\":10240, \
          \"documentation\":\"<p> Description of the most recent details about an entity.</p>\" \
        }, \
        \"PredictInput\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"MLModelId\", \
            \"Record\", \
            \"PredictEndpoint\" \
          ], \
          \"members\":{ \
            \"MLModelId\":{ \
              \"shape\":\"EntityId\", \
              \"documentation\":\"<p>A unique identifier of the <code>MLModel</code>.</p>\" \
            }, \
            \"Record\":{\"shape\":\"Record\"}, \
            \"PredictEndpoint\":{\"shape\":\"VipURL\"} \
          } \
        }, \
        \"PredictOutput\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Prediction\":{\"shape\":\"Prediction\"} \
          } \
        }, \
        \"Prediction\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"predictedLabel\":{ \
              \"shape\":\"Label\", \
              \"documentation\":\"The prediction label for either a BINARY or MULTICLASS <code>MLModel</code>.\" \
            }, \
            \"predictedValue\":{ \
              \"shape\":\"floatLabel\", \
              \"documentation\":\"The prediction value for REGRESSION <code>MLModel</code>.\" \
            }, \
            \"predictedScores\":{\"shape\":\"ScoreValuePerLabelMap\"}, \
            \"details\":{\"shape\":\"DetailsMap\"} \
          }, \
          \"documentation\":\"<p>The output from a <code>Predict</code> operation: </p> <ul> <li> <p> <code>Details</code> - Contains the following attributes: DetailsAttributes.PREDICTIVE_MODEL_TYPE - REGRESSION | BINARY | MULTICLASS DetailsAttributes.ALGORITHM - SGD </p> </li> <li> <p> <code>PredictedLabel</code> - Present for either a BINARY or MULTICLASS <code>MLModel</code> request. </p> </li> <li> <p> <code>PredictedScores</code> - Contains the raw classification score corresponding to each label. </p> </li> <li> <p> <code>PredictedValue</code> - Present for a REGRESSION <code>MLModel</code> request. </p> </li> </ul>\" \
        }, \
        \"PredictorNotMountedException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"ErrorMessage\"} \
          }, \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The exception is thrown when a predict request is made to an unmounted <code>MLModel</code>.</p>\" \
        }, \
        \"PresignedS3Url\":{\"type\":\"string\"}, \
        \"RealtimeEndpointInfo\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"PeakRequestsPerSecond\":{ \
              \"shape\":\"IntegerType\", \
              \"documentation\":\"<p> The maximum processing rate for the real-time endpoint for <code>MLModel</code>, measured in incoming requests per second.</p>\" \
            }, \
            \"CreatedAt\":{ \
              \"shape\":\"EpochTime\", \
              \"documentation\":\"<p>The time that the request to create the real-time endpoint for the <code>MLModel</code> was received. The time is expressed in epoch time.</p>\" \
            }, \
            \"EndpointUrl\":{ \
              \"shape\":\"VipURL\", \
              \"documentation\":\"<p>The URI that specifies where to send real-time prediction requests for the <code>MLModel</code>.</p> <note><title>Note</title> <p>The application must wait until the real-time endpoint is ready before using this URI.</p> </note>\" \
            }, \
            \"EndpointStatus\":{ \
              \"shape\":\"RealtimeEndpointStatus\", \
              \"documentation\":\"<p> The current status of the real-time endpoint for the <code>MLModel</code>. This element can have one of the following values: </p> <ul> <li>NONE - Endpoint does not exist or was previously deleted.</li> <li>READY - Endpoint is ready to be used for real-time predictions.</li> <li>UPDATING - Updating/creating the endpoint. </li> </ul>\" \
            } \
          }, \
          \"documentation\":\"<p> Describes the real-time endpoint information for an <code>MLModel</code>.</p>\" \
        }, \
        \"RealtimeEndpointStatus\":{ \
          \"type\":\"string\", \
          \"enum\":[ \
            \"NONE\", \
            \"READY\", \
            \"UPDATING\", \
            \"FAILED\" \
          ] \
        }, \
        \"Recipe\":{ \
          \"type\":\"string\", \
          \"max\":131071 \
        }, \
        \"Record\":{ \
          \"type\":\"map\", \
          \"key\":{\"shape\":\"VariableName\"}, \
          \"value\":{\"shape\":\"VariableValue\"}, \
          \"documentation\":\"<p>A map of variable name-value pairs that represent an observation.</p>\" \
        }, \
        \"ResourceNotFoundException\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"message\":{\"shape\":\"ErrorMessage\"}, \
            \"code\":{\"shape\":\"ErrorCode\"} \
          }, \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>A specified resource cannot be located.</p>\" \
        }, \
        \"S3Url\":{ \
          \"type\":\"string\", \
          \"max\":2048, \
          \"pattern\":\"s3://([^/]+)(/.*)?\", \
          \"documentation\":\"<p>A reference to a file or bucket on Amazon Simple Storage Service (Amazon S3).</p>\" \
        }, \
        \"ScoreThreshold\":{\"type\":\"float\"}, \
        \"ScoreValue\":{\"type\":\"float\"}, \
        \"ScoreValuePerLabelMap\":{ \
          \"type\":\"map\", \
          \"key\":{\"shape\":\"Label\"}, \
          \"value\":{\"shape\":\"ScoreValue\"}, \
          \"documentation\":\"Provides the raw classification score corresponding to each label.\" \
        }, \
        \"StringType\":{ \
          \"type\":\"string\", \
          \"documentation\":\"<p>String type.</p>\" \
        }, \
        \"TrainingParameters\":{ \
          \"type\":\"map\", \
          \"key\":{\"shape\":\"StringType\"}, \
          \"value\":{\"shape\":\"StringType\"} \
        }, \
        \"VariableName\":{ \
          \"type\":\"string\", \
          \"documentation\":\"<p>The name of a variable. Currently it's used to specify the name of the target value, label, weight, and tags.</p>\" \
        }, \
        \"VariableValue\":{ \
          \"type\":\"string\", \
          \"max\":1024, \
          \"pattern\":\"[a-zA-Z0-9_]*\", \
          \"documentation\":\"<p>The value of a variable. Currently it's used to specify values of the target value, weights, and tag variables and for filtering variable values.</p>\" \
        }, \
        \"Verbose\":{ \
          \"type\":\"boolean\", \
          \"documentation\":\"<p>Specifies whether a describe operation should return exhaustive or abbreviated information.</p>\" \
        }, \
        \"VipURL\":{ \
          \"type\":\"string\", \
          \"max\":2048, \
          \"pattern\":\"https://[a-zA-Z0-9-.]*\\\\.amazon(aws)?\\\\.com[/]?\" \
        }, \
        \"floatLabel\":{\"type\":\"float\"} \
      } \
    } \
     \
    ";
    }

@end
