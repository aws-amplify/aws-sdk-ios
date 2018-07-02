Using `AWSS3TransferUtility` you can either upload files or raw data. `AWSS3TransferUtility` smartly determines if using multi-part upload needs to be used based on the file size. Multi-part uploads allow uploading a file in parts which facilitates easy resuming in case of errors caused due to bad network availability.

## Upload raw Data

You can pass in a `Data` object to the `uploadUsingMultiPart` API to upload data which will be store in `S3`.

```swift  linenums="2"

   // Fetch the transfer utility client
   let transferUtility = AWSS3TransferUtility.default()

   // Get the data you want to upload.
   let data: Data = "Hello World".data(using: .utf8)! // Data to be uploaded

   // Initialize the completion handler which will be called when the upload completes
   var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?

   completionHandler = { (task, error) -> Void in
      DispatchQueue.main.async(execute: {
         // Do something e.g. Alert a user for transfer completion.
         // On failed uploads, `error` contains the error object.
      })
   }

   // The upload task contains information about your upload and can be used for activities like pause, resume, cancel.
   let uploadTask = transferUtility.uploadUsingMultiPart(data: data,
                        bucket: "YourBucket",
                        key: "YourFileName",
                        contentType: "text/plain",
                        expression: nil,
                        completionHandler: completionHandler)
```

## Upload a file

You can pass in a `URL` object to the `uploadUsingMultiPart` API to upload data which will be store in `S3`.

```swift  linenums="2"

   // Fetch the transfer utility client
   let transferUtility = AWSS3TransferUtility.default()

   // Determine the file you want to upload.
   let fileURL: URL = URL(......) // URL of file to be uploaded

   // Initialize the completion handler which will be called when the upload completes
   var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?

   completionHandler = { (task, error) -> Void in
      DispatchQueue.main.async(execute: {
         // Do something e.g. Alert a user for transfer completion.
         // On failed uploads, `error` contains the error object.
      })
   }

   // The upload task contains information about your upload and can be used for activities like pause, resume, cancel.
   let uploadTask = transferUtility.uploadUsingMultiPart(fileURL: fileURL,
                        bucket: "YourBucket",
                        key: "YourFileName",
                        contentType: "text/plain",
                        expression: nil,
                        completionHandler: completionHandler)
```

## Progress Tracking

To enable progress tracking, we will use the `expression` parameter in the `uploadUsingMultiPart` API call as highlighted below. We will update the example above to include progress tracking.

```swift hl_lines="7 8 9 10 11 12 13 29"  linenums="2"

    // Fetch the transfer utility client
    let transferUtility = AWSS3TransferUtility.default()

    // Determine the file/ data you want to upload.
    let data: Data = "Hello World".data(using: .utf8)! // Data to be uploaded

    // Create progress tracking expression
    let expression = AWSS3TransferUtilityUploadExpression()
    expression.progressBlock = {(task, progress) in
         DispatchQueue.main.async(execute: {
           // Do something e.g. Update a progress bar.
        })
    }

    var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
    completionHandler = { (task, error) -> Void in
        DispatchQueue.main.async(execute: {
           // Do something e.g. Alert a user for transfer completion.
           // On failed uploads, `error` contains the error object.
        })
    }

   let transferUtility = AWSS3TransferUtility.default()

   let uploadTask = transferUtility.uploadUsingMultiPart(data: data,
                        bucket: "YourBucket",
                        key: "YourFileName",
                        contentType: "text/plain",
                        expression: expression,
                        completionHandler: completionHandler)
```

## Pause / Resume / Cancel

We use the `uploadTask` object which we get back from the `uploadUsingMultiPart` call to perform the pause, resume and cancel operations.

### Pause

    uploadTask.suspend()

### Resume

    uploadTask.resume()

### Cancel

    uploadTask.cancel()
