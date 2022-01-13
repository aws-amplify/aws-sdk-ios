# OCMock

OCMock is used for generating mocks for tests. The dependency can be updated by downloading the `.dmg` from [OCMock Download]. It includes an XCFramework and source code.

* Download `.dmg` disk image file
* Copy disk image to `./AWSCoreTests` to replace the one which is there
* Remove `./AWSCoreTests/OCMock.xcframework`
* Mount the disk image and copy the XCFramework to use as a local dependency
* Copy binary framework to `./AWSCoreTests/OCMock.xcframework`

---
[OCMock Download]: https://ocmock.org/download/
