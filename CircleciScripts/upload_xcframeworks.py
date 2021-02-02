import boto3
from botocore.exceptions import ClientError
from framework_list import xcframeworks
from functions import log

def upload_file(file_name, bucket, object_name): 
    s3_client = boto3.client('s3')
    try:
        s3_client.upload_file(file_name, bucket, object_name)
    except ClientError as e:
        logging.error(e)
        sys.exit(e.response['Error']['Code'])
    
        
project_dir = os.getcwd()
archive_path = f"{project_dir}/xcframeworks/output/archives"

bucket = sys.argv[1]
version = sys.argv[2]

log(f"Uploading xcframeworks from {archive_path}")
for framework in xcframeworks:
    filename = f"{framework}-{version}.zip"
    archived_sdk_path = f"{archive_path}/{filename}"
    upload_file(archived_sdk_path, bucket, filename)