Once you have setup the dependencies, the next step is to setup the client.

AWS Mobile SDK for iOS provides 2 primary ways of setting up and instantiating the client. You can either initialize your configuration in your app's source code or use a `awsconfiguration.json` file which contains your backend configuration.

???- question "Not setup your backend yet?"
    If you have not setup your backend yet, consider using [AWS Mobile Hub](https://aws.amazon.com/mobile/) or [Getting Started](https://docs.aws.amazon.com/aws-mobile/latest/developerguide/getting-started.html) documentation.

???+ example "Initialize configuration through code"

    1. Import the AWSCore framework in the application delegate.

        ```swift
        import AWSCore
        ```

    2. Create a default service configuration by adding the following code snippet in the `application:didFinishLaunchingWithOptions:` application delegate method.

        ```swift
        let credentialsProvider = AWSCognitoCredentialsProvider(
            regionType: .USEast1, // update region to your region
            identityPoolId: "YOUR_POOL_ID_HERE")

        let configuration = AWSServiceConfiguration(
            region: .USEast1, // your region here
            credentialsProvider: credentialsProvider)

        AWSServiceManager.default().defaultServiceConfiguration = configuration
        ```

        That's it! You can now move to a integrating a service of your choice from the left side of the page.


???+ example "Initialize configuration through awsconfiguration.json"

    If you configured your backed using `AWS Mobile Hub` or have a `awsconfiguration.json` file which you want to integrate into your app, follow the below steps:

    1. Place the `awsconfiguration.json` into the folder containing your info.plist file in your Xcode project. Select **Copy items if needed** and **Create groups** in the options dialog. Choose Next.

    2. Import the AWSCore framework in the application delegate or the file where you want to use the AWS SDKs.

        ```swift
        import AWSCore
        ```