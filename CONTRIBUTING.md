# AWS iOS SDK Contributing Guide

Thank you for your interest in contributing to our project! <3 Whether it's a bug report, new feature, correction, or additional documentation, we greatly value feedback and contributions from our community. Please read through it carefully before submitting a PR or issue and let us know if it's not up-to-date (or even better, submit a PR with your corrections ;)).

- [Getting Started](#getting-started)
- [Tools](#tools)
  - [Integration Testing Set Up](#integration-testing-setup)
- [Workflows](#workflows)
  - [New Features or Bug Fixes](#New-Features-or-Bug-Fixes)
- [Debugging](#debugging)
  - [Running Cocoapods Locally](#running-cocoapods-locally)
- [Pull Requests](#pull-requests)
  - [Pull Request Checklist](#pull-request-checklist)
  - [Step 1: Open Issue](#step-1-open-issue)
  - [Step 2: Design (optional)](#step-2-design-optional)
  - [Step 3: Work your Magic](#step-3-work-your-magic)
  - [Step 4: Commit](#step-4-commit)
  - [Step 5: Pull Request](#step-5-pull-request)
  - [Step 6: Merge](#step-6-merge)
- [Troubleshooting](#troubleshooting)
- [Related Repositories](#related-repositories)

## Getting Started

To get started with contributing to the AWS iOS SDK, first make sure you have the latest version of [Xcode](https://developer.apple.com/xcode/) installed as well as [cocoapods](https://guides.cocoapods.org/using/getting-started.html). You can install cocoapods by simply running:

```bash
sudo gem install cocoapods
```

Then make sure you clone the project by running:

```bash
git clone https://github.com/aws-amplify/aws-sdk-ios
```

The project itself is broken up into 2 Xcode projects so it's important to understand what you want to change and open the correct project. If you open the project at the root of the repo, that contains most of the individual SDK's, but if you are looking to make a change to our Auth SDK's (including `AWSMobileClient`), head to the folder called `/AWSAuthSDK` and there is another Xcode project in there you can open. Wherever you start, whether its at the root project or in the AWSAuthSDK's project, make sure you run `pod install` and open the workspace. Example of commands to open the main SDK project that lives at the root of the repo  below:

```bash
cd aws-sdk-ios
pod install
xed .
```

Conversely if you wanted to make a change to our Auth SDK's the initial workflow might be:

```bash
cd aws-sdk-ios
cd AWSAuthSDK
pod install
xed .
```

## Tools

[Xcode](https://developer.apple.com/xcode/) and [cocoapods](https://guides.cocoapods.org/using/getting-started.html) are used for all build and dependency management.

Some other widely used dependencies are:

[Mantle](https://github.com/Mantle/Mantle) is what we use for deserialization and serialization and any modeling with JSON in our AWS iOS SDK.

[SocketRocket](https://github.com/facebook/SocketRocket) is used for web socket connections.

### Integration Testing Setup

For our integration tests, which run on your development machine we use XCTest and an aws configuration file to set up to set up credentials. To set it up to build those integration tests on your machine, you will need to create a `credentials.json` file in inside AWSCoreTests> Resources>credentials.json and it should have the following format:

```
{
    "accessKey": "XXXXXXXXXXXXXX",
    "secretKey": "XXXXXXXXXXXXXXXXXXXXXXXXX",
    "accountId": "XXXXXXXXXXXX",
    "identityPoolId": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    "unauthIdentityPoolId": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    "authRoleArn": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", 
    "unauthRoleArn":"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    "amazon-connect-instance-id": "XXXXXXXXXXXXXXXXXXXXX",
    "amazon-connect-destination-dial-in-phone-number": "XXXXXXXXXX",
    "anotherAccountId": "XXXXXXXXXXXXX",
    "apiEndpoint": "XXXXXXXXXXXXXXXXXXXXXXXXX",
    "facebookAppId": "XXXXXXXXXXXX",
    "facebookAppSecret": "XXXXXXXXXXXXXXXXXXXX",
    "iot-custom-authorizer-name": "XXXXXXXXXX",
    "iot-custom-authorizer-token-key-name": "XXXXXXXXXXXX",
    "iot-custom-authorizer-token-signature": "XXXXXXXXXXXXXXXXXXXXXXXX",
    "iot-custom-authorizer-token-value": "allow",
    "iot-us-east1-endpoint": "XXXXXXXXXXXXXXXXXXXXXX",
    "iot-us-east2-endpoint": "XXXXXXXXXXXXXXXXXXXXXX",
    "pinpointAppId": "XXXXXXXXXXXXXXXXXXX",
    "sageMaker-endpoint": "XXXXXXXXXXXXXXXX",
    "snsTestAppArn": "XXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    "textract-s3-bucket-name": "XXXXXXXXXXXXXXXXXXXXX",
    "textract-s3-object-name": "XXXXXXXXXXXXXXXXXXXXXX",
    "verifiedEmailAddress": "XXXXXXXXXXXXXXX"
}
```

This is the full file ( in case you would like to make future contributions later on ;) ) which would be quite a bit of AWS resource creation. However, for the purpose of running majority of our tests (as you can see some of the keys are very specific to the tests they are affecting aka. textract-s3-bucket-name is affecting textract integration tests) you probably just need to fill out the below keys and you should be able to run the integration tests just fine:
```
    "accessKey": "XXXXXXXXXXXXXX",
    "secretKey": "XXXXXXXXXXXXXXXXXXXXXXXXX",
    "accountId": "XXXXXXXXXXXX",
    "identityPoolId": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    "unauthIdentityPoolId": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    "authRoleArn": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", 
    "unauthRoleArn":"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```

The identity pool Id above has two IAM roles attached to it, an auth role and an unauth role and we put both of the ARNS of those roles in our `credentials.json` file above. The policies on those roles are as follows:

For the auth role we have two polices:

**Policy 1**

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "mobileanalytics:PutEvents",
                "cognito-sync:*",
                "cognito-identity:*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```

**Policy 2 **

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "cognito-sync:QueryRecords",
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "cognito-sync:*",
            "Resource": "arn:aws:cognito-sync:*:*:identitypool/*/identity/*"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": "cognito-sync:*",
            "Resource": "arn:aws:cognito-sync:*:*:identitypool/*"
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": "cognito-sync:*",
            "Resource": "arn:aws:cognito-sync:*:*:identitypool/*/identity/*/dataset/*"
        }
    ]
}
```

The unauth role has two policies as well and the first is used for integration tests:

**Policy 1**

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "apigateway:GET",
                "autoscaling:AttachInstances",
                "cloudwatch:DescribeAlarmHistory",
                "ec2:AttachVolume",
                "elasticloadbalancing:ConfigureHealthCheck",
                "execute-api:Invoke",
                "firehose:PutRecord",
                "firehose:PutRecordBatch",
                "kinesis:CreateStream",
                "kinesis:DescribeStream",
                "kinesis:GetRecords",
                "kinesis:GetShardIterator",
                "kinesis:PutRecord",
                "kinesis:PutRecords",
                "kinesisvideo:CreateStream",
                "kinesisvideo:DeleteStream",
                "kinesisvideo:GetDataEndpoint",
                "kinesisvideo:GetHLSStreamingSessionURL",
                "kinesisvideo:GetMediaForFragmentList",
                "kms:CancelKeyDeletion",
                "kms:CreateAlias",
                "kms:Decrypt",
                "kms:DescribeKey",
                "kms:DisableKeyRotation",
                "kms:Encrypt",
                "kms:ScheduleKeyDeletion",
                "lambda:GetFunction",
                "lambda:InvokeFunction",
                "machinelearning:GetMLModel",
                "machinelearning:Predict",
                "rekognition:CreateCollection",
                "rekognition:IndexFaces",
                "s3:GetObject",
                "sagemaker:InvokeEndpoint",
                "sdb:BatchPutAttributes",
                "sdb:CreateDomain",
                "sdb:DeleteDomain",
                "sdb:PutAttributes",
                "sdb:Select",
                "ses:SendEmail",
                "sqs:GetQueueAttributes"
            ],
            "Resource": [
                "arn:aws:apigateway:us-east-1:XXXXXXXXXXX:*",
                "arn:aws:autoscaling:*:*:autoScalingGroup:*:autoScalingGroupName/*",
                "arn:aws:cloudwatch:*:*:alarm:*",
                "arn:aws:ec2:*:*:instance/*",
                "arn:aws:ec2:*:*:volume/*",
                "arn:aws:elasticloadbalancing:*:*:loadbalancer/*",
                "arn:aws:execute-api:us-east-1:XXXXXXXXX:*",
                "arn:aws:firehose:us-east-1:XXXXXXXXXXX:deliverystream/test-permanent-firehose",
                "arn:aws:kinesis:us-east-1:XXXXXXXXXXXX:stream/*",
                "arn:aws:kinesisvideo:us-east-1:XXXXXXXXXXX:stream/*/*",
                "arn:aws:kms:us-east-1:XXXXXXXXXXX:alias/*",
                "arn:aws:kms:us-east-1:XXXXXXXXXXX:key/*",
                "arn:aws:lambda:us-east-1:XXXXXXXXXXX:function:*",
                "arn:aws:machinelearning:us-east-1:XXXXXXXXXXX:mlmodel/ml-UJdLGgO6l44",
                "arn:aws:rekognition:us-east-1:XXXXXXXXXXX:collection/*",
                "arn:aws:s3:::aws-sdk-ios-test-rekognition/family_thumb.jpg",
                "arn:aws:sagemaker:us-east-1:XXXXXXXXXXX:endpoint/xgboost-2019-06-11-20-15-13-355",
                "arn:aws:sdb:us-east-1:XXXXXXXXXXX:domain/*",
                "arn:aws:ses:us-east-1:XXXXXXXXXXX:identity/XXXXXXXXXXX",
                "arn:aws:sqs:us-east-1:XXXXXXXXXXX:*"
            ]
        },
        {
            "Sid": "IoTStreamTest",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:GetObjectVersion",
                "iot:CreateStream",
                "iot:DeleteStream",
                "iot:DescribeStream"
            ],
            "Resource": [
                "arn:aws:s3:::ios-sdk-iot-ota-integ-test/*",
                "arn:aws:s3:::ios-sdk-iot-ota-integ-test*",
                "arn:aws:iot:*:*:stream/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "ses:SendEmail",
            "Resource": "arn:aws:ses:us-east-1:XXXXXXXXXXX:identity/XXXXXXXXXXX:"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "autoscaling:DescribeAccountLimits",
                "cloudwatch:GetMetricStatistics",
                "cloudwatch:ListMetrics",
                "comprehend:BatchDetectEntities",
                "comprehend:DetectDominantLanguage",
                "comprehend:DetectEntities",
                "comprehend:DetectKeyPhrases",
                "comprehend:DetectSentiment",
                "connect:*",
                "dynamodb:*",
                "ec2:DescribeImages",
                "ec2:DescribeInstances",
                "elasticloadbalancing:DescribeLoadBalancers",
                "firehose:ListDeliveryStreams",
                "iot:*",
                "kinesis:ListStreams",
                "kinesisvideo:ListFragments",
                "kinesisvideo:ListStreams",
                "kms:CreateKey",
                "lambda:ListFunctions",
                "mobiletargeting:PutEvents",
                "mobiletargeting:UpdateEndpoint",
                "polly:DeleteLexicon",
                "polly:GetSpeechSynthesisTask",
                "polly:PutLexicon",
                "polly:StartSpeechSynthesisTask",
                "polly:SynthesizeSpeech",
                "s3:*",
                "sdb:ListDomains",
                "ses:GetSendQuota",
                "ses:VerifyEmailIdentity",
                "sns:GetEndpointAttributes",
                "sns:ListTopics",
                "sqs:ListQueues",
                "textract:AnalyzeDocument",
                "transcribe:*",
                "translate:TranslateText"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": "elasticloadbalancing:ConfigureHealthCheck",
            "Resource": "arn:aws:elasticloadbalancing:*:*:loadbalancer/*"
        },
        {
            "Sid": "IoTStreamingTest",
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": "arn:aws:iam::XXXXXXXXXXX:role/OTAIntegTest"
        }
    ]
}
```

**Policy 2**

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "mobileanalytics:PutEvents",
                "cognito-sync:*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```

## Workflows

### New Features or Bug Fixes

The AWS SDK for iOS is mostly code generated off of models written in JSON and each time a new feature or new service at AWS launches, these models get updated and thus our SDK also gets updated. Beyond these low-level generated SDK's, we have built some higher level clients that predate the creation of [Amplify](https://github.com/aws-amplify/amplify-ios) (our high-level libraries built on top of the AWS SDK). These higher level clients include:

- `AWSMobileClient`
- `AWSCognitoAuth`
- `AWSS3TransferUtility`
- `AWSLexInteractionKit`
- `AWSIoTDataManager`
- `AWSPinpointTargetingClient`
- `AWSPinpointAnalyticsClient`
- `AWSPollySynthesizeSpeechURLBuilder`
- `AWSTranscribeStreamingService`
- `AWSMobileAnalyticsEventClient`

You could go into any of these files and start adding new endpoints you see in the generated files to these higher level clients or fixing bugs as this is mostly likely where they would occur since it is not code generated code based off of models given to us by the service teams themselves.

Once you have made your code change, make sure you can build and run both the Tests Folder and the UnitTests folder usually listed below the service folder. The Tests folder will be where the integration tests are and setting up your evironment to run the integration tests is detailed [above](#integration-testing-setup). Unit tests and/or integration tests are required for all features being added to the code-base. Updating existing tests is also required as well. Running tests in this project is the same as any other project in Xcode -> Set the scheme to be the service folder of the service you are editing. Then head to the tests tab on the left hand side of Xcode and run the tests you need to. If I was running Transcribe tests, Xcode would look like this:

![image](readme-images/xcode-tests.png?raw=true)


## Debugging

### Running Cocoapods Locally

Framework development is quite different from typical app development when it comes to debugging and being able to test your code. First you will want to create a new app that uses the pods you changed. For instance, if you changed something in the `AWSS3TransferUtility` to test to see if it works, you will need to create a new app and run `pod init` and edit the `Podfile` to use the local version of the SDK you have. This is done by editing the `Podfile` of the new application to take a path to the pod instead of a version number like below:

```ruby

target 'MySampleApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # with :path I can direct my project to use a local path for the pod
  pod 'AWSCore', :path => '~/Projects/aws-sdk-ios'      # 
  pod 'AWSS3TransferUtility', :path => '~/Projects/aws-sdk-ios'           
  
end
```
Then you want to run `pod install --repo-update` at the root of your sample app to make sure it is using the local version of the pods. When you open the workspace, under the Pods project, the you'll see a section call Development Pods. This where those local pods were installed and if you want to change code here to debug, it will change in the other repo, just make sure you clean and re-build before testing your code again.

## Pull Requests
