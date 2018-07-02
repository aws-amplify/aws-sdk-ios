There are three ways to import the AWS Mobile SDK for iOS into your project:

* Cocoapods

    Add ==`pod 'AWSCore', '~> 2.6.22'`== to your `Podfile`.

* Carthage

    Add ==`github "aws/aws-sdk-ios" ~> 2.6.22`== to your `Cartfile`.

* Dynamic Frameworks

    Add the ==`AWSCore.framework`== file into your Embedded Binaries section and make sure it is also included in linked frameworks section.

???+warning
    You should use only one of these three ways to import the AWS Mobile SDK. Importing the SDK in multiple ways loads duplicate copies of the SDK into the project and causes compiler errors.

If you are using any of these methods for the first time, please use one of the sections below:

???- question "First time Cocoapods user?"

    1. The AWS Mobile SDK for iOS is available through [CocoaPods](http://cocoapods.org). If you have not installed CocoaPods, install CocoaPods by running the command:

            $ gem install cocoapods
            $ pod setup

        Depending on your system settings, you may have to use `sudo` for installing `cocoapods` as follows:

            $ sudo gem install cocoapods
            $ pod setup

    2. In your project directory (the directory where your `*.xcodeproj` file is), create a plain text file named `Podfile` (without any file extension) and add the lines below. Replace `YOUR_TARGET_NAME_HERE` with your actual target name.

        ```ruby
            source 'https://github.com/CocoaPods/Specs.git'
            
            platform :ios, '9.0'
            use_frameworks!
            
            target :'YOUR_TARGET_NAME_HERE' do
                pod 'AWSCore'
            end
        ```
            
    3. Then run the following command:
        
            $ pod install --repo-update

    4. Open up `*.xcworkspace` with Xcode and start using the SDK.

        ???+Warning
            Do **NOT** use `*.xcodeproj`. If you open up a project file instead of a workspace, you receive an error:

                ld: library not found for -lPods-AWSCore
                clang: error: linker command failed with exit code 1 (use -v to see invocation)

    **Updating the SDK**

    When we release a new version of the SDK, you can pick up the changes using the `pod update` command from your terminal.

    ???+Note "Next Steps" 
        Go the [Application Setup](setup-application.md) after opening the `.xcworkspace` file.

???- question "First time Carthage user?"

    1. Install the latest version of [Carthage](https://github.com/Carthage/Carthage#installing-carthage).

    2. Add the following to your `Cartfile`:

            github "aws/aws-sdk-ios"

    3. Then run the following command:
        
            $ carthage update

    4. With your project open in Xcode, select your **Target**. Under **General** tab, find **Embedded Binaries** and then click the **+** button.

    5. Click the **Add Other...** button, navigate to the `AWS<#ServiceName#>.framework` files under `Carthage` > `Build` > `iOS` and select them. Do not check the **Destination: Copy items if needed** checkbox when prompted.

    6. Under the **Build Phases** tab in your **Target**, click the **+** button on the top left and then select **New Run Script Phase**. Then setup the build phase as follows. Make sure this phase is below the `Embed Frameworks` phase.

            Shell /bin/sh
            
            bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/AWSCore.framework/strip-frameworks.sh"
            
            Show environment variables in build log: Checked
            Run script only when installing: Not checked
            
            Input Files: Empty
            Output Files: Empty

    **Updating the SDK**

    When we release a new version of the SDK, you can pick up the changes by running `carthage update` from your terminal.

???- question "First time Dynamic Frameworks user?"

    1. Download the SDK from our [AWS Mobile SDK](http://aws.amazon.com/mobile/sdk) page. The SDK is stored in a compressed file archive named `aws-ios-sdk-#.#.#` (where `#.#.#` represents the version number, so for version 2.6.22, the filename is `aws-ios-sdk-2.6.22`).

    2. With your project open in Xcode, select your **Target**. Under **General** tab, find **Embedded Binaries** and then click the **+** button.

    3. Click the **Add Other...** button, navigate to the `AWS<#ServiceName#>.framework` files and select them. Check the **Destination: Copy items if needed** checkbox when prompted.

    4. Under the **Buid Phases** tab in your **Target**, click the **+** button on the top left and then select **New Run Script Phase**. Then setup the build phase as follows. Make sure this phase is below the `Embed Frameworks` phase.

            Shell /bin/sh
            
            bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/AWSCore.framework/strip-frameworks.sh"
            
            Show environment variables in build log: Checked
            Run script only when installing: Not checked
            
            Input Files: Empty
            Output Files: Empty

    **Updating the SDK**

    When we release a new version of the SDK, you can pick up the changes as described below.

    1. In Xcode select the frameworks with name `AWS*****.framework` in **Project Navigator** and hit **delete** on your keyboard. Then select **Move to Trash**:

    2. Follow the installation process mentioned above to include the new version of the SDK.