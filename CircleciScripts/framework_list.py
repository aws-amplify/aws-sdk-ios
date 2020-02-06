# A list of frameworks/packages for the AWS iOS SDK. As of now, order on these
# packages is important, since we don't model dependencies in code that we
# consume for the release process. Packages toward the bottom of the list
# depend on packages toward the top of the list.

grouped_frameworks = [
    # No dependencies
    [
        'AWSCore',
        'AWSCognitoIdentityProviderASF',
    ],

    # Depends only on AWSCognitoIdentityProviderASF
    ['AWSCognitoAuth'],

    # Depends on AWSCore and AWSCognitoIdentityProviderASF
    ['AWSCognitoIdentityProvider'],

    # Depends only on AWSCore
    ['AWSAuthCore'],

    # Service-API packages depend only on AWSCore
    [
        'AWSAPIGateway',
        'AWSAutoScaling',
        'AWSCloudWatch',
        'AWSCognito',
        'AWSComprehend',
        'AWSConnect',
        'AWSConnectParticipant',
        'AWSDynamoDB',
        'AWSEC2',
        'AWSElasticLoadBalancing',
        'AWSIoT',
        'AWSKMS',
        'AWSKinesis',
        'AWSKinesisVideo',
        'AWSKinesisVideoArchivedMedia',
        'AWSKinesisVideoSignaling',
        'AWSLambda',
        'AWSLex',
        'AWSLogs',
        'AWSMachineLearning',
        'AWSMobileAnalytics',
        'AWSPinpoint',
        'AWSPolly',
        'AWSRekognition',
        'AWSS3',
        'AWSSES',
        'AWSSNS',
        'AWSSQS',
        'AWSSageMakerRuntime',
        'AWSSimpleDB',
        'AWSTextract',
        'AWSTranscribe',
        'AWSTranscribeStreaming',
        'AWSTranslate',
    ],

    # Depends only on AWSCognito service-api package
    ['AWSCognitoSync'],

    # Depends on AWSCore and AWSAuthCore
    ['AWSAuthUI'],

    # Depends only on AWSAuthCore (and possibly external Pods, but nothing else
    # built locally)
    [
        'AWSFacebookSignIn',
        'AWSGoogleSignIn',
    ],

    # Depends only on AWSAuthCore and AWSCognitoIdentityProvider
    [
        'AWSMobileClient',
        'AWSUserPoolsSignIn',
    ],

    # Depends on most previous packages except auth
    ['AWSiOSSDKv2'],

    # Depends on AWSAuthCore, AWSFacebookSignIn, AWSGoogleSignIn,
    # AWSUserPoolsSignIn and AWSAuthUI
    ['AWSAuth'],

]

# flatten the grouped frameworks
frameworks = [framework for group in grouped_frameworks for framework in group]
