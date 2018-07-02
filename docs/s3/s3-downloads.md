You can use `AWSS3TransferUtility` to download your data from `Amazon S3`. It internally uses `NSURLSession` to facilitate that the downloads continue even when the app goes into background.

## Download raw data

You can pass in a `Data` object to the `uploadUsingMultiPart` API to upload data which will be store in `S3`.

```swift  linenums="2"

   // Fetch the transfer utility client
   let transferUtility = AWSS3TransferUtility.default()

   // Initialize the completion handler which will be called when the upload completes
   var completionHandler: AWSS3TransferUtilityDownloadCompletionHandlerBlock?

   completionHandler = { (task, location, data, error) -> Void in
            DispatchQueue.main.async(execute: {
                if let error = error {
                    // Handle error here. Indicates download failed.
                } else {
                    // `data` object contains the downloaded data
                }
            })
        }

   // The download task contains information about your download and can be used for activities like pause, resume, cancel.
   let downloadTask = transferUtility.downloadData(
                        fromBucket: "YourBucket",
                        key: "YourFileName",
                        expression: nil,
                        completionHandler: completionHandler)
```

## Download to File

```swift  linenums="2"

    // Fetch the transfer utility client
    let transferUtility = AWSS3TransferUtility.default()

    // Initialize the completion handler which will be called when the upload completes
    var completionHandler: AWSS3TransferUtilityDownloadCompletionHandlerBlock?

    completionHandler = { (task, location, data, error) -> Void in
            DispatchQueue.main.async(execute: {
                if let error = error {
                    // Handle error here. Indicates download failed.
                } else {
                    // `location` object contains the location of downloaded data
                }
            })
        }

    // Determine the file location where you want the download to happen
    let downloadLocation: URL = URL(....)

    // The download task contains information about your download and can be used for activities like pause, resume, cancel.
    let downloadTask = transferUtility.download(to: downloadLocation
                        fromBucket: "YourBucket",
                        key: "YourFileName",
                        expression: nil,
                        completionHandler: completionHandler)
```

## Progress Tracking

To enable progress tracking, we will use the `expression` parameter in the `download` API call as highlighted below. We will update the example above to include progress tracking.

```swift  hl_lines="4 5 6 7 8 9 10 32"  linenums="2"

    // Fetch the transfer utility client
    let transferUtility = AWSS3TransferUtility.default()

    // Create progress tracking expression
    let expression = AWSS3TransferUtilityDownloadExpression()
    expression.progressBlock = {(task, progress) in
         DispatchQueue.main.async(execute: {
           // Do something e.g. Update a progress bar.
        })
    }

    // Initialize the completion handler which will be called when the upload completes
    var completionHandler: AWSS3TransferUtilityDownloadCompletionHandlerBlock?

    completionHandler = { (task, location, data, error) -> Void in
            DispatchQueue.main.async(execute: {
                if let error = error {
                    // Handle error here. Indicates download failed.
                } else {
                    // `location` object contains the location of downloaded data
                }
            })
        }

    // Determine the file location where you want the download to happen
    let downloadLocation: URL = URL(....)

    // The download task contains information about your download and can be used for activities like pause, resume, cancel.
    let downloadTask = transferUtility.download(to: downloadLocation
                        fromBucket: "YourBucket",
                        key: "YourFileName",
                        expression: expression,
                        completionHandler: completionHandler)
```

## Pause / Resume / Cancel

We use the `downloadTask` object which we get back from the `download` call to perform the pause, resume and cancel operations.

### Pause

    downloadTask.suspend()

### Resume

    downloadTask.resume()

### Cancel

    downloadTask.cancel()