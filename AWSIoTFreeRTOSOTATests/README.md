#  OTA Integration Tests

The OTATest uses the IoT OTA system to test receipt of large payloads.

## Prerequisites

### Locally

1. Create a test code signing certificate. This will be used below.

### S3

1. Create a bucket to store the OTA binary, e.g., "ios-sdk-iot-ota-integ-test"
1. Upload a file to use as the "firmware update" for the test. It should be 500KB - 1MB in size to provide a reasonable test. Call it "ota_integ_test.bin"

### IoT Core

1. Create a Thing Group named `OTA_INTEG_TEST`
  - Optionally set an attribute `ota_integ_test` to have a value of `1`
1. Create an IAM role called "OTAIntegTest", with the following inline policy.
  - Replace `ios-sdk-iot-ota-integ-test` in the policy with the bucket name you created above.
  - Replace `<account id>` with your test account's ID
    ```json
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "VisualEditor0",
          "Effect": "Allow",
          "Action": [
            "s3:PutObject",
            "s3:GetObject",
            "s3:GetObjectVersion"
          ],
          "Resource": [
            "arn:aws:s3:::<bucket name>",
            "arn:aws:s3:::<bucket name>*"
          ]
        },
        {
          "Sid": "PassRole",
          "Effect": "Allow",
          "Action": [
            "iam:PassRole"
          ],
          "Resource": [
            "arn:aws:iam::<account id>:role/OTAIntegTest"
          ]
        },
        {
          "Sid": "DeleteJob",
          "Effect": "Allow",
          "Action": [
            "iot:DeleteJob"
          ],
          "Resource": [
            "arn:aws:iot:*:*:job/AFR_OTA*"
          ]
        },
        {
          "Sid": "VisualEditor1",
          "Effect": "Allow",
          "Action": [
            "iot:CreateJob",
            "iot:CreateStream",
            "signer:DescribeSigningJob",
            "signer:GetSigningProfile",
            "signer:PutSigningProfile",
            "signer:StartSigningJob",
            "s3:ListAllMyBuckets",
            "s3:ListBucket",
            "s3:GetBucketLocation"
          ],
          "Resource": "*"
        },
        {
          "Sid": "VisualEditor2",
          "Effect": "Allow",
          "Action": "iot:DeleteStream",
          "Resource": "arn:aws:iot:*:*:stream/AFR_OTA*"
        }
      ]
    }
    ```
1. Create an OTA Job
  1. In IoT Core console, go to Manage > Jobs > "Create a job"
  1. Select "Create OTA update job" from the "Create an Amazon FreeRTOS OTA update job" section
  1. In the "Select devices to update" section, select the `OTA_INTEG_TEST` Thing Group you created above
  1. Select "Sign a new firmware image for me"
  1. Create a code signing profile:
    - **Profile name**: `OTA_INTEG_TEST`
    - **Hardware platform**: Any value is fine, e.g., `Windows Simulator`
    - **Code signing certificate**: Import the code signing certificate created above. If you used a test self-signed certificate, you will also need the self-signed root CA.
    - **Pathname of code signing certificate on device**: Any value is fine, e.g. `/path/to/cert`
  1. **Select your firmware image in S3 or upload it**: select the bucket and "firmware image" you uploaded to S3 above
  1. **Pathname of firmware image on device**: Any value is fine, e.g., `/path/to/firmware`
  1. **IAM role for OTA update job**: Select the role you created above, that gives access to the S3 bucket you created above
  1. Select **Your job will continue deploying to any devices added to the selected groups (continuous)**
  1. **ID**: Select a meaningful ID (e.g. `OTA_INTEG_TEST_<YYYYMMDD>`). The ID is only used for easy identification in the console, so it doesn't have to conform to any particular naming convention. The ID of the job will be *appended* after the string "AFR_OTA".

### IAM

Ensure the Unauth role assumed during the integration test is authorized to perform `iam:PassRole` on the `OTAIntegTest` role created above.

