All the service clients, e.g. AWSS3, AWSDynamoDB, AWSTranslate, AWSTranscribe, etc. follow a common usage pattern. All of them have a naming convention of `AWS<ServiceName>` and have methods that correspond directly to the service APIs. To use these service clients follow the below steps:

???- question "Have you followed the primary setup steps?"
    Perform the steps mentioned in [Setup Dependencies](setup/setup-dependencies.md) and [Application Setup](setup/setup-application.md) if you haven't already.

We will use `AWSDynamoDB` client and `listTables` API as an example.

## Setup Dependency

To use any service client APIs, you will have to include a dependency on `AWS<ServiceName>` framework. To do that, update your `Podfile` to include the following dependency:

    pod 'AWSDynamoDB', '~> 2.6.22' # Dependency for AWSDynamoDB


Run `pod install --repo-update` to install the dependency.

???- question "Using Carthage or Frameworks?"
    Follow the links for [Carthage Setup](setup/setup-dependencies.md) or [Frameworks Setup](setup/setup-dependencies.md)

???- info "If using awsconfiguration.json."
    If you are using `awsconfiguration.json` you need add the following entry in it:

    ```json
    "AWSDynamoDB": {
        "Default": {
            "Region": "us-west-2"
        }
    }
    ```

    `awsconfiguration.json` supports adding entries in the form of `AWS<ServiceName>` as the key with `Default` as the key so that it can be retrieved using `AWS<ServiceName>.default()`

## Invoke Service API


1. In the Swift file you want to use the SDK, import the appropriate headers for the services you are using. The framework import convention is `import AWS<ServiceName>`, as in the following examples:

    ```swift
    import AWSDynamoDB
    ```
        
2. Make a call to the AWS services.

    ```swift
    // Fetch the default service client
    let dynamoDB = AWSDynamoDB.default()
    
    // Initialize the request input object
    let listTableInput = AWSDynamoDBListTablesInput()
    listTableInput?.limit = 10

    // Invoke the service API
    dynamoDB.listTables(listTablesInput!) { (output, error) in
        guard error == nil else {
            print("error occurred")
            return
        }
        // output has the server response
    }
    ```
        

???+ note "Note"

    For Swift, most of the service client classes have a singleton method to get a default client. The naming convention is to call `default()` statically (e.g. `AWSDynamoDB.default()` in the above code snippet). This singleton method creates a service client with `defaultServiceConfiguration`, which you set up in `Setup Application` phase, and maintains a strong reference to the client.

## List of all Service Clients

The AWS Mobile SDK for iOS has following `Service Clients` which follow the pattern specified above.

* AWSAutoScaling
* AWSCloudWatch
* AWSComprehend
* AWSDynanmoDB
* AWSEC2
* AWSElasticLoadBalancing
* AWSIoT
* AWSKMS
* AWSKinesis
* AWSLambda
* AWSMachineLearning
* AWSPolly
* AWSRekognition
* AWSS3
* AWSSNS
* AWSSQS
* AWSSimpleDB
* AWSTranscribe
* AWSTranslate