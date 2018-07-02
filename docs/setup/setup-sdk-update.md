## Update the SDK to a Newer Version

When we release a new version of the SDK, you can pick up the changes as described below.

### CocoaPods

1. Run the following command in your project directory. CocoaPods automatically picks up the new changes.

        $ pod update

    **Note**: If your pod is having an issue, you can delete `Podfile.lock` and `Pods/` then run `pod install` to cleanly install the SDK.
    
    ![image](readme-images/cocoapods-setup-03.png?raw=true)

### Carthage

1. Run the following command in your project directory. Carthage automatically picks up the new changes.

        $ carthage update

### Frameworks

1. In Xcode select the frameworks with name `AWS*****.framework` in **Project Navigator** and hit **delete** on your keyboard. Then select **Move to Trash**:

2. Follow the installation process mentioned in the Frameworks setup section to include the new version of the SDK.