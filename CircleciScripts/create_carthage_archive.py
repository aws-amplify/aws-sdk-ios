import os
import shutil

from functions import log

project_dir = os.getcwd()
log(f"Creating Carthage archive in {project_dir}")

xcframework_path = f"{project_dir}/xcframeworks/output/XCF/"
log(f"XCFramework from -  {xcframework_path}")

framework_file_name = "aws-sdk-ios-carthage.framework"

shutil.make_archive(framework_file_name, 'zip', xcframework_path)