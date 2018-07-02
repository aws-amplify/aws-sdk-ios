`AWSS3TransferUtility` is the recommended way to make uploads and downloads from `Amazon S3` to your application. It has the following features:

- Progress Tracking
- Multi-part Uploads
- Background Uploads/ Downloads
- Pause/ Resume/ Cancel functionality
- Retry capabilities

## Setup Dependency

To use `Amazon S3` APIs or `AWS S3 Transfer Utility`, you will have to include a dependency on `AWSS3` framework. To do that, update your `Podfile` to include the following dependency:

    pod 'AWSS3', '~> 2.6.22' # Dependency for AWSS3

Run `pod install --repo-update` to install the dependency.

    ???- question "Using Carthage or Frameworks?"
    Follow the links for [Carthage Setup](../setup/setup-carthage.md) or [Frameworks Setup](../setup/setup-frameworks.md)

## Import the library

Add the following import to the files that use AWSS3 operations:

```swift
import AWSS3
```

## Instantiate the client

AWS Mobile SDK for iOS provides 2 primary ways of instantiating a client. You can either fetch the `default` service client which uses the `defaultServiceConfiguration` configuration or you can register clients with a custom configuration.

???- question "Have you followed the primary setup steps?"
    Perform the steps mentioned in [Setup Dependencies](../setup/setup-dependencies.md) and [Application Setup](../setup/setup-application.md) if you haven't already.

### Get default client

If you have set the default service configuration or have provided a configuration in `awsconfiguration.json`, you can fetch the `default` client using:

```swift
let transferUtility = AWSS3TransferUtility.default()
```

### User custom configuration

If you want to access S3 Bucket in a different region or use different credentials to access a bucket, you will have to use the `register` and `forKey` APIs which are static APIs to create a custom configuration client.

#### Register Client

```swift
// setup custom credential provider
let credentialProvider = AWSCognitoCredentialsProvider(
                            regionType: .USEast1, 
                            identityPoolId: "Your_Identity_PoolId")

// setup service configuration with region of choice
let configuration = AWSServiceConfiguration(
                        region: .USWest2, 
                        credentialsProvider: credentialProvider)

// register client with configuration       
AWSS3TransferUtility.register(with: configuration!, 
                              forKey: "USWest2S3TransferUtility")
```

#### Fetch Client

```swift
let S3TransferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "USWest2S3TransferUtility")
```

???- question "Using awsconfiguration.json?"
    
    Insert the following entry in your `awsconfiguration.json`
    
    ```json
    "S3TransferUtility": {
        "USWest2S3TransferUtility": {
            "Bucket": "S3-BUCKET-NAME",
            "Region": "us-west-2"
        }
    }
    ```

    Fetch the client in code using:

    ```swift
    let S3TransferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "USWest2S3TransferUtility")
    ```

    If you want to use the `default()` client, add the following entry:

    ```json
    "S3TransferUtility": {
        "Default": {
            "Bucket": "S3-BUCKET-NAME",
            "Region": "us-east-1"
        }
    }
    ```

    and retrieve the client in code using:

    ```swift
    let S3TransferUtility = AWSS3TransferUtility.default()
    ```    