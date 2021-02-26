# generate_swift_test_cases

The utility script in this directory generates presigned URL test cases from the cases in the AWS SigV4 test suite at
https://docs.aws.amazon.com/general/latest/gr/signature-v4-test-suite.html. To use it:

```bash
gem install aws-sdk
ruby ./generate_swift_test_cases.rb --root-directory ./aws-sig-v4-test-suite --output-file ../SigV4TestCases.swift
```

Note that this script includes a forked copy of the AWS for Ruby SDK's `Signer` class, which includes a modified `presign_url` method.

## Test cases

Test cases are in the `aws-sig-v4-test-suite` directory. Except for test cases whose name begins with `aws-mobile-sdk...`, the cases are all
from the SigV4 test suite.

The script only cares about the original request, contained in the `.req` files. The other files are only applicable for testing signed
requests, not presigned URLs.

### Changes to standard test suite

The standard test suite fails with the AWS SDK for Ruby, since it includes URLs with spaces or UTF-8 characters in them. These tests have been removed, since
percent encoding the URI results in the test code double-encoding the path in a way that the real code does not.

This change in behavior means that there may be differences in behavior for presigning URLs that represent S3 keys, since those URLs are explicitly *not*
intended to be normalized, as they represent object keys. However, since browsers are the common user-agent of choice for accessing an S3 object, and
browsers transparently percent-encode invalid characters in a URI, the change in this test data seems appropriate.

The AWS SDK for iOS includes other tests that specifically test the behavior of presigned URLs for special cases with S3.

## How it works

The `generate_swift_test_cases` script scans each directory for a `.req` file and uses it to construct a request which it then passes to the
`Aws::Signer::presign_url` method. The script uses a forked version of that module to return additional information besides the URL, including
canonical request, string to sign, and signature, to aid in troubleshooting test failures.