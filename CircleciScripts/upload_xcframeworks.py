import re
import os
import sys
import boto3
import logging

from functions import setup_logging
from framework_list import xcframeworks
from semver_util import validate_version 
from botocore.exceptions import ClientError

def upload_file(file_name, bucket, object_name): 
    s3_client = boto3.client('s3')
    try:
        s3_client.upload_file(file_name, bucket, object_name)
    except ClientError as e:
        logging.error(e)
        sys.exit(e.response['Error']['Code'])

setup_logging()  
project_dir = os.getcwd()
archive_path = f"{project_dir}/xcframeworks/output/archives"

bucket = sys.argv[1]
version = sys.argv[2]
aws_profile = sys.argv[3]

if validate_version(version) == False:
    logging.error("Version is invalid, exiting")
    sys.exit(1)

if not re.match("^[a-zA-Z0-9-]*$", bucket):
    logging.error("Bucket is invalid, exiting")
    sys.exit(1)

if aws_profile is None:
    logging.error("AWS profile should not be none")
    sys.exit(1)

logging.info(f"Uploading xcframeworks from {archive_path}")

boto3.setup_default_session(profile_name=aws_profile)

for framework in xcframeworks:
    filename = f"{framework}-{version}.zip"
    archived_sdk_path = f"{archive_path}/{filename}"
    upload_file(archived_sdk_path, bucket, f"aws-sdk-ios/{filename}")
