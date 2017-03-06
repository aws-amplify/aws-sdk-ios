# Contributing to the AWS SDK for iOS

We work hard to provide a high-quality and useful SDK, and we greatly value feedback and contributions from our
community. Whether it's a new feature, correction, or additional documentation, we welcome your pull requests.
Please submit any [issues][issues] or [pull requests][pull-requests] through GitHub.

## What you should keep in mind

1. The SDK is released under license as described in [license] file in the root directory. Any code you submit will be released under that license. For substantial contributions, we may ask you to sign a [Contributor License Agreement (CLA)][cla].
2. We try to maintain a high percentage of code coverage in our unit tests. If you make changes to the code, please add, update, and/or remove unit tests as appropriate.
3. We may choose not to accept pull requests that change core services, such as the master header files e.g `AWSDynamoDB.h`, the service files `AWSDynamoDBResources.*` , `AWSDynamoDBServices.*`, `AWSDynamoDBModel.*`. 
   We generate these files based on our internal knowledge of the AWS services. If there is something incorrect
   with or missing from a service description, it may be more appropriate to [submit an issue][issues].
4. If your code does not include adequate tests, we may ask you to update your pull requests before we accept them. We also reserve the right to deny any pull requests that do not align with our standards or goals.
5. If you would like to implement support for a significant feature that is not yet available in the SDK, please talk to us beforehand to avoid any duplication of effort.

## What we are looking for

We are open to anything that improves the SDK and doesn't unnecessarily cause backwards-incompatible changes. If you are unsure if your idea is something we would be open to, please ask us; Open an issue, send us an email. Specifically, here are a few things that we would
appreciate help on:

1. **Docs** – We  greatly appreciate contributions to our documentation. The API reference docs are written as code comments. The [developer guide][dev-guide] are written as markdown templates.
2. **Tests** – We maintain high code coverage, but if there are any tests you feel are missing, please add them.
3. **Convenience features** – Are there any features you feel would add value to the SDK? Contributions in this area would be greatly appreciated.
4. If you have some other ideas, please let us know!

[issues]: https://github.com/aws/aws-sdk-ios/issues
[pull-requests]: https://github.com/aws/aws-sdk-ios/pulls
[license]: https://github.com/aws/aws-sdk-ios/blob/master/LICENSE.txt
[cla]: http://en.wikipedia.org/wiki/Contributor_License_Agreement
[dev-guide]: https://github.com/awsdocs/aws-ios-developer-guide