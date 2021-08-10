# A list of frameworks/packages for the AWS iOS SDK. As of now, order on these
# packages is important, since we don't model dependencies in code that we
# consume for the release process. Packages toward the bottom of the list
# depend on packages toward the top of the list.

# Note that this list isn't a comprehensive list of Xcode schemas or targets
# that need to be built and tested, only a model of dependencies for cocoapods.

grouped_frameworks = [
    # No dependencies
    ["AWSCore", "AWSCognitoIdentityProviderASF"],
    [
        # Depends only on AWSCognitoIdentityProviderASF
        "AWSCognitoAuth",
        # Depends on AWSCore and AWSCognitoIdentityProviderASF
        "AWSCognitoIdentityProvider",
        # Depends only on AWSCore
        "AWSAuthCore",
        # Service-API packages depend only on AWSCore
        "AWSAPIGateway",
        "AWSAutoScaling",
        "AWSChimeSDKIdentity",
        "AWSChimeSDKMessaging",
        "AWSCloudWatch",
        "AWSComprehend",
        "AWSConnect",
        "AWSConnectParticipant",
        "AWSDynamoDB",
        "AWSEC2",
        "AWSElasticLoadBalancing",
        "AWSIoT",
        "AWSKMS",
        "AWSKinesis",
        "AWSKinesisVideo",
        "AWSKinesisVideoArchivedMedia",
        "AWSKinesisVideoSignaling",
        "AWSLambda",
        "AWSLex",
        "AWSLocation",
        "AWSLogs",
        "AWSMachineLearning",
        "AWSPinpoint",
        "AWSPolly",
        "AWSRekognition",
        "AWSS3",
        "AWSSES",
        "AWSSNS",
        "AWSSQS",
        "AWSSageMakerRuntime",
        "AWSSimpleDB",
        "AWSTextract",
        "AWSTranscribe",
        "AWSTranscribeStreaming",
        "AWSTranslate",
    ],
    [
        # Depends on AWSCore and AWSAuthCore
        "AWSAuthUI",
        # Depends only on AWSAuthCore (and possibly external Pods, but nothing else
        # built locally)
        "AWSAppleSignIn",
        "AWSFacebookSignIn",
        "AWSGoogleSignIn",
        # Depends only on AWSAuthCore and AWSCognitoIdentityProvider
        "AWSMobileClient",
        "AWSUserPoolsSignIn",
    ],
    [
        # Depends on most previous packages except auth
        "AWSiOSSDKv2",
        # Depends on AWSAuthCore, AWSAppleSignIn, AWSFacebookSignIn, AWSGoogleSignIn,
        # AWSUserPoolsSignIn and AWSAuthUI
        "AWSAuth",
    ],
]

excluded_from_xcframeworks = [
    # This isn't a real framework
    "AWSiOSSDKv2",
    # Legacy frameworks not built or packaged
    "AWSAuth",
    # AWSMobileClient is named as AWSMobileClientXCF and will be added later.
    "AWSMobileClient",
    # AWSLocation is named as AWSLocationXCF and will be added later.
    "AWSLocation"
]

def is_framework_included(framework):
    return framework not in excluded_from_xcframeworks

# flatten the grouped frameworks
frameworks = [framework for group in grouped_frameworks for framework in group]

xcframeworks = list(filter(is_framework_included, frameworks)) + ["AWSMobileClientXCF", "AWSLocationXCF"]
