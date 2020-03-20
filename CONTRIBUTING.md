# AWS iOS SDK Contributing Guide

Thank you for your interest in contributing to our project! <3 Whether it's a bug report, new feature, correction, or additional documentation, we greatly value feedback and contributions from our community. The following is our contribution guide, which we hope you will read through carefully prior to submitting a pull-request (PR) or issue. In the event that our guide is not up to date, feel free to let us know by opening an issue (or even better, submit a PR with your proposed corrections ;)).

- [Getting Started](#getting-started)
- [Tools](#tools)
  - [Integration Testing Set Up](#integration-testing-setup)
- [Integrated Frameworks](#integrated-frameworks)
- [Workflows](#workflows)
  - [New Features or Bug Fixes](#New-Features-or-Bug-Fixes)
- [Debugging](#debugging)
  - [Running Cocoapods Locally](#running-cocoapods-locally)
- [Pull Requests](#pull-requests)
  - [Pull Request Checklist](#pull-request-checklist)
  - [Step 1: Open Issue](#step-1-open-issue)
  - [Step 2: Design (optional)](#step-2-design-optional)
  - [Step 3: Fork The Repo](#step-3-fork-the-repo)
  - [Step 4: Work your Magic](#step-3-work-your-magic)
  - [Step 5: Commit](#step-4-commit)
  - [Step 6: Pull Request](#step-5-pull-request)
  - [Step 7: Merge](#step-6-merge)
- [Troubleshooting](#troubleshooting)
- [Related Repositories](#related-repositories)
- [Finding Contributions](#finding-contributions-to-work-on)
- [Code of Conduct](#code-of-conduct)
- [Security Issue Notifications](#security-issue-notifications)
- [Licensing](#licensing)

## Getting Started

To start contributing to the AWS iOS SDK, first make sure you have the latest version of [Xcode](https://developer.apple.com/xcode/) installed. There are many different ways to build frameworks for iOS developers but we love to use [Cocoapods](https://guides.cocoapods.org/using/getting-started.html) and these instructions will include how to get started with Cocoapods so make sure that is installed as well if you'd like to follow along. You can install Cocoapods by simply running:

```bash
sudo gem install cocoapods
```

Then make sure you fork the project and then clone your fork by running:

```bash
# change your GITHUBUSERNAME to your github username before running this command.
git clone git@github.com:GITHUBUSERNAME/aws-sdk-ios.git
```
The project is broken into two major Xcode Projects:

- Individual SDKs that target AWS services- AWSiOSSDKv2.xcodeproj located under / (root)
- Higher-level SDKs that deal with Authorization (including AWSMobileClient) - AWSAuthSDK.xcodeproj located under /AWSAuthSDK

 Example of commands to open the main SDK project that lives at the root of the repo  below:

```bash
cd aws-sdk-ios
xed .
```

Conversely if you wanted to make a change to our Auth SDK's the initial workflow might be:

```bash
cd aws-sdk-ios
cd AWSAuthSDK
xed .
```

## Tools

[Xcode](https://developer.apple.com/xcode/) and [Cocoapods](https://guides.cocoapods.org/using/getting-started.html) are used for all build and dependency management.

## Integrated Frameworks

Some widely used dependencies that have been copied into our project are:

[Mantle](https://github.com/Mantle/Mantle) is what we use for deserialization and serialization and any modeling with JSON in our AWS iOS SDK.

[SocketRocket](https://github.com/facebook/SocketRocket) is used for web socket connections.

[Bolts-ObjC](https://github.com/facebookarchive/Bolts-ObjC) is used for "Tasks", which make organization of complex asynchronous code more manageable. A task is kind of like a JavaScript Promise but available for Objective C.

### Integration Testing Setup

Our integration tests are designed to execute on your development machine and talk to live AWS services. You may want to create these resources in a separate AWS account or at least tag them to not affect any resources you are using in production or confuse them. These tests are based on XCTest and require a json file with your credentials. If you are looking to run any of the integration tests in the main Xcode project, you will need to create a file named `credentials.json` located in AWSCoreTests> Resources>credentials.json and it should have the following format:

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

This is the full JSON object of keys and values ( in case you would like to make future contributions later on ;) ) which would be quite a bit of AWS resource creation. However, for the purpose of running majority of our tests (as you can see some of the keys are very specific to the tests they are affecting aka. textract-s3-bucket-name is affecting textract integration tests) you probably just need to fill out the below keys and you should be able to run the integration tests just fine:
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

**Policy 2**

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

If you are looking to run integration tests inside the Auth project, you will need to create a `awsconfiguration.json` file in AWSAuthSDK/AWSMobileClientTests that looks like this:

```
{
    "UserAgent": "aws-amplify/cli",
    "Version": "0.1.0",
    "Auth0FederationProviderName": "xxxxxxxx.auth0.com",
    "IdentityManager": {
        "Default": {}
    },
    "CredentialsProvider": {
        "CognitoIdentity": {
            "Default": {
                "PoolId": "REGION:XXXXXXXXXXXXXXXXXXXXXX",
                "Region": "REGION"
            }
        }
    },
    "CognitoUserPool": {
        "Default": {
            "PoolId": "REGION_XXXXXX",
            "AppClientId": "XXXXXXXXXXXXXXXXXXXX",
            "AppClientSecret": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "HostedUI": {
                "WebDomain": "https://XXXXXXXXXXXX.com",
                "AppClientId": "XXXXXXXXXXXXXXXXXXXXXXXXXX",
                "AppClientSecret": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                "SignInRedirectURI": "myapp://",
                "SignOutRedirectURI": "myapp://",
                "Scopes": ["openid", "email"]
            },
            "Region": "REGION"
        }
    },
    "S3TransferUtility": {
        "Default": {
            "Bucket": "BUCKETNAME",
            "Region": "REGION"
        }
    },
    "Auth": {
        "Default": {
            "OAuth": {
                "WebDomain": "XXXXXXXXXXXXXXXXXXXXX",
                "AppClientId": "XXXXXXXXXXXXXXXXXXXXXXXXXX",
                "AppClientSecret": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                "SignInRedirectURI": "myapp://",
                "SignOutRedirectURI": "myapp://",
                "Scopes": ["openid", "email"]
            }
        },
        "Default1": {
            "OAuth": {
                "AppClientId": "XXXXXXXXXXXXXXXXXXXXXXXXXX"",
                "AppClientSecret": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                "WebDomain": "XXXXXXXXXX.auth0.com",
                "TokenURI": "https://XXXXXXXXXX.auth0.com/oauth/token",
                "SignInURI": "https://XXXXXXXXXX.auth0.com/authorize",
                "SignInRedirectURI": "com.amazonaws.AWSAuthSDKTestApp://XXXXXXXXX.auth0.com/ios/com.amazonaws.AWSAuthSDKTestApp/callback",
                "SignOutURI": "https://XXXXXXXXXX.auth0.com/v2/logout",
                "SignOutRedirectURI": "com.amazonaws.AWSAuthSDKTestApp://XXXXXXXXXXXX.auth0.com/ios/com.amazonaws.AWSAuthSDKTestApp/callback",
                "SignOutQueryParameters": {
                    "client_id" : "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                    "returnTo" : "com.amazonaws.AWSAuthSDKTestApp://XXXXXXXXXXX.auth0.com/ios/com.amazonaws.AWSAuthSDKTestApp/callback"
                },
                "Scopes": ["openid", "email"]
            }
        }
    }
}

```

You will also need another file called `credentials-mc.json` that looks like this:

```
{
    "accessKey":"XXXXXXXXXXXXXXXXXX",
    "secretKey":"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    "mc-email":"aws-mobile-sdk-dev+mc-integ-tests@amazon.com",
    "mc-userpool_id":"REGION_XXXXXXXX",
    "mc-pool_id_dev_auth": "us-west-2:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    "mc-region": "REGION",
    "GoogleUsername": "XXXXXXXXXX",
    "GooglePassword": "XXXXXXXXXXXXX",
    "FacebookUsername": "XXXXXXXXXXXXXXXXXXXXXXX",
    "FacebookPassword": "XXXXXXXXXX",
    "UserpoolUsername": "XXXXXXXXXX",
    "UserpoolPassword": "XXXXXXXXXX"
}

```

## Workflows

### New Features or Bug Fixes

A significant portion of the AWS SDK for iOS is Objective-C code which has been generated from an internal/proprietary interface definition language (IDL). This generated code exposes AWS Service APIs. Given that these low-level service APIs can be difficult/complex to work with, we built a couple of high-level clients which remove some of the complexities of managing these service API calls. These higher level clients include:

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

You could go into any of these files and start adding new interfaces you see in the generated files to these higher level clients or fixing bugs as this is mostly likely where they would occur since it is not code generated code based off of models given to us by the service teams themselves.

Once you have made your code change, make sure you can build and run both the Tests Folder and the UnitTests folder usually listed below the service folder. The Tests folder will be where the integration tests are and setting up your evironment to run the integration tests is detailed [above](#integration-testing-setup). Unit tests and/or integration tests are required for all features being added to the code-base. Updating existing tests is also required as well. Running tests in this project is the same as any other project in Xcode -> Set the scheme to be the service folder of the service you are editing. Then head to the tests tab on the left hand side of Xcode and run the tests you need to. If I was running Transcribe tests, Xcode would look like this:

![image](readme-images/xcode-tests.png?raw=true)


## Debugging

### Running Cocoapods Locally

Framework development is quite different from typical app development when it comes to debugging and being able to test your code. First you will want to create a new app that uses the pods you changed. For instance, if you changed something in the `AWSS3TransferUtility` to test to see if it works, you will need to create a new app and run `pod init` and edit the `Podfile` to use the local version of the SDK you have. This is done by editing the `Podfile` of the new application to take a path to the pod instead of a version number like below:

```ruby

target 'MySampleApp' do
  
  use_frameworks!
  # with :path I can direct my project to use a local path for the pod
  pod 'AWSCore', :path => '~/Projects/aws-sdk-ios'       
  pod 'AWSS3TransferUtility', :path => '~/Projects/aws-sdk-ios'           
  
end
```
Then you want to run `pod update` at the root of your sample app to make sure it is using the local version of the pods. When you open the workspace, under the Pods project, then you'll see a folder called Development Pods. This where our pods under local development were installed and if you want to change code here to debug, it will change in the other repo, just make sure you clean and re-build before testing your code again.

## Pull Requests

### Pull Request Checklist
- Testing
    - Unit test added or updated
    - Integration test added or updated
- Changelog
    - Update Changelog with your updates in accordance with our pattern under the new version. Example below:

    ```markdown
    ## Unreleased
      - Please place a note with your updates HERE. :)
    ## 2.xx.x

    ### Bug Fixes

    ### Misc. Updates

    ```

### Step 1: Open Issue

If there isn't one already, open an issue describing what you intend to contribute. It's useful to communicate in advance, because sometimes, someone is already working in this space, so maybe it's worth collaborating with them instead of duplicating the efforts.

### Step 2: Design (optional)

In some cases, it is useful to seek for feedback on the design of your planned implementation. This is useful when you plan a big change or feature, or you want advice on what would be the best path forward.

The GitHub issue is sufficient for such discussions, and can be sufficient to get clarity on what you plan to do. Make sure you tag the AWS Mobile SDK Team with @aws-amplify/amplify-native handle so we can help guide you.

### Step 3: Fork the Repo

First, create a fork of aws-sdk-ios. Clone it, and make changes to this fork.

```
# change your GITHUBUSERNAME to your github username before running this command.
git clone git@github.com:GITHUBUSERNAME/aws-sdk-ios.git 

```

### Step 4: Work your magic

Work your magic. Here are some guidelines:

- Coding style (abbreviated):
    - In general, follow the style of the code around you
    - 4 space indentation
    - 120 characters wide
    - Every change requires a new or updated unit test/integ test
    - If you change customer facing APIs, make sure to update the documentation above the interface and include a reason for the breaking change in your PR comments
    - Try to maintain a single feature/bugfix per pull request. It's okay to introduce a little bit of housekeeping changes along the way, but try to avoid conflating multiple features. Eventually all these are going to go into a single commit, so you can use that to frame your scope.

### Step 5: Commit

Create a commit with the proposed change changes:

- Commit message.
- The message must be descriptive to the specific change.
- Commit message should describe motivation. Think about your code reviewers and what information they need in order to understand what you did. If it's a big commit (hopefully not), try to provide some good entry points so it will be easier to follow.


### Step 6: Pull Request

- Push your changes to your GitHub fork
- Submit a Pull Requests on the aws-sdk-ios repo to the `develop` branch and add the Amplify Native team using @aws-amplify/amplify-native so we can approve/provide feedback.
- The title of your PR must be descriptive to the specific change.
- No period at the end of the title.
- Pull Request message should indicate which issues are fixed: `fixes #<issue>` or `closes #<issue>`.
- PR messaged should include shout out to collaborators.
- If not obvious (i.e. from unit tests), describe how you verified that your change works.
- If this PR includes breaking changes, they must be listed at the top of the changelog as described above in the Pull Request Checklist.
- Discuss review comments and iterate until you get at least one “Approve”. When iterating, push new commits to the same branch. 
- Usually all these are going to be squashed when you merge to master.
- Make sure to update the PR title/description if things change. 
- Rebase with master if the master branch has commits ahead of your fork.
- Please use the [seven rules of good commit messages](https://chris.beams.io/posts/git-commit/) to create your commit messages.

### Step 7: Merge
Once your PR has been approved and tested, we will merge it into `develop` and it will be released in the next SDK release which we try to do biweekly on Thursday's. Yay!! 

## Troubleshooting

Most build issues can be solved by [removing your derived data](https://iosdevcenters.blogspot.com/2015/12/how-to-delete-derived-data-and-clean.html) and doing a clean and build. 

## Related Repositories

This project is part of the AWS Mobile SDKs. AWS SDKs are a
toolkit for interacting with AWS backend resources. Other AWS Mobile SDKs include:

1. [AWS SDK for Android](https://github.com/aws-amplify/aws-sdk-android)
2. [AWS SDK for JavaScript](https://github.com/aws/aws-sdk-js)

We are building a higher level framework that is built on top of the AWS SDKs to make real use cases easier for mobile developers, make sure you check them out!

1. [AWS Amplify for iOS](https://github.com/aws-amplify/amplify-ios)
2. [AWS Amplify for Android](https://github.com/aws-amplify/amplify-android)
3. [AWS Amplify for JS](https://github.com/aws-amplify/amplify-js)


Not officially part of the AWS SDKs, [AppSync](https://aws.amazon.com/appsync/) is an opinionated,
mobile-oriented GraphQL management service. It is used by Amplify's
DataStore and API plugins.

1. [Android AppSync Client](https://github.com/awslabs/aws-mobile-appsync-sdk-android)
2. [iOS AppSync Client](https://github.com/awslabs/aws-mobile-appsync-sdk-ios)
3. [JavaScript AppSync Client](https://github.com/awslabs/aws-mobile-appsync-sdk-js)


## Finding contributions to work on
Looking at the existing issues is a great way to find something to contribute on. As our projects, by default, use the default GitHub issue labels (enhancement/bug/duplicate/help wanted/invalid/question/wontfix), looking at any ['help wanted'](https://github.com/awslabs/amplify-ios/labels/help%20wanted) issues is a great place to start.


## Code of Conduct
This project has adopted the [Amazon Open Source Code of Conduct](https://aws.github.io/code-of-conduct).
For more information see the [Code of Conduct FAQ](https://aws.github.io/code-of-conduct-faq) or contact
opensource-codeofconduct@amazon.com with any additional questions or comments.


## Security issue notifications
If you discover a potential security issue in this project we ask that you notify AWS/Amazon Security via our [vulnerability reporting page](http://aws.amazon.com/security/vulnerability-reporting/). Please do **not** create a public github issue.


## Licensing

See the [LICENSE](https://github.com/aws-amplify/aws-sdk-ios/blob/master/LICENSE) file for our project's licensing. We will ask you to confirm the licensing of your contribution.

We may ask you to sign a [Contributor License Agreement (CLA)](http://en.wikipedia.org/wiki/Contributor_License_Agreement) for larger changes.