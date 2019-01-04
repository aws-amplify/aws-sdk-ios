
sdkversion=$1
jazzy \
  --clean \
  --author AWS \
  --author_url https://github.com/aws-amplify/aws-sdk-ios \
  --github_url https://github.com/aws-amplify/aws-sdk-ios \
  --module-version $sdkversion \
  --framework-root AWSAuthSDK/ \
  --exclude=AWSAuthSDK/Sources/AWSMobileClient/AWSUserPoolOperationsHandler.swift \
  --xcodebuild-arguments -project,AWSAuthSDK/AWSAuthSDK.xcodeproj,-scheme,AWSMobileClient \
  --module AWSMobileClient \
  --min-acl public \
  --root-url https://github.com/aws-amplify/aws-sdk-ios/docs/reference/AWSMobileClient \
  --output docs/api

open docs/api/index.html
