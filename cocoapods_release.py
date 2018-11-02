from subprocess import Popen, PIPE
import os
podpackages = [
               'AWSCore.podspec', 
               'AWSAPIGateway.podspec',
               'AWSAutoScaling.podspec',
               'AWSCloudWatch.podspec',
               'AWSCognito.podspec',
               'AWSCognitoIdentityProvider.podspec',
               'AWSCognitoSync.podspec',
               'AWSCognitoAuth.podspec',
               'AWSDynamoDB.podspec',
               'AWSEC2.podspec',
               'AWSElasticLoadBalancing.podspec',
               'AWSIoT.podspec',
               'AWSKinesis.podspec',
               'AWSKinesisVideo.podspec',
               'AWSKinesisVideoArchivedMedia.podspec',
               'AWSKMS.podspec',
               'AWSLambda.podspec',
               'AWSLogs.podspec',
               'AWSMachineLearning.podspec',
               'AWSMobileAnalytics.podspec',
               'AWSPinpoint.podspec',
               'AWSS3.podspec',
               'AWSSES.podspec',
               'AWSSimpleDB.podspec',
               'AWSSNS.podspec',
               'AWSSQS.podspec',
               'AWSLex.podspec',
               'AWSPolly.podspec',
               'AWSRekognition.podspec',
               'AWSTranslate.podspec',
               'AWSComprehend.podspec',
               'AWSTranscribe.podspec',
               
               'AWSAuthCore.podspec',
               'AWSUserPoolsSignIn.podspec',
               'AWSFacebookSignIn.podspec',
               'AWSGoogleSignIn.podspec',
               'AWSAuthUI.podspec',
               'AWSAuth.podspec',
               
               'AWSMobileClient.podspec',
               
               'AWSiOSSDKv2.podspec',

               ]
for package in podpackages:
    print ('publishing ' + package + ' ...')
    #   process = Popen(["pod", 'trunk','push',package,'--allow-warnings'], stdout=PIPE)
    process = Popen(["pod", 'repo','push','https://github.com/sunchunqiang/mypod-specs',package,'--allow-warnings'], stdout=PIPE)
    (output, err) = process.communicate()
    exit_code = process.wait()
    if exit_code != 0 :
        if "Unable to accept duplicate entry for:" in str(output):
            print (package +" is already published")
        else:
            print("Failed to publish " + package)
            quit(0);
  
