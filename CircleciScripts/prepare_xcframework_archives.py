import os
import sys
import shutil
import re
import logging

from semver_util import validate_version 
from framework_list import xcframeworks
from functions import run_command, setup_logging

def create_archives(xcframework_path, archive_path, version):
    os.makedirs(archive_path, exist_ok=True)
    for framework in xcframeworks:
        
        xcframework_sdk = f"{framework}.xcframework"
        xcframework_sdk_path = os.path.join(xcframework_path, xcframework_sdk)
        
        archive_name = f"{framework}-{version}"
        final_archive_name_with_ext = f"{archive_name}.zip"
        logging.info(f"Creating zip file for {archive_name}")
        
        temp_folder = os.path.join(xcframework_path, framework)
        logging.info(f"Copying the zip to a temp location {temp_folder}")
        shutil.copytree(xcframework_sdk_path, os.path.join(temp_folder, xcframework_sdk))  

        logging.info(f"Generate the archive and move it to the archive directory")
        shutil.make_archive(archive_name, "zip", root_dir=temp_folder, base_dir=xcframework_sdk)
        
        final_archived_path = os.path.join(archive_path, final_archive_name_with_ext)
        shutil.move(final_archive_name_with_ext, final_archived_path)  

        logging.info(f"Remove the temp folder")
        shutil.rmtree(temp_folder)

def create_checksum(archive_path, spm_manifest_repo, version):
    framework_to_checksum = {}
    for framework in xcframeworks:
        final_archive_name_with_ext = f"{framework}-{version}.zip"
        zipfile_path = os.path.join(archive_path, final_archive_name_with_ext)
        cmd = [
            "swift",
            "package",
            "--package-path",
            spm_manifest_repo,
            "compute-checksum",
            zipfile_path
        ] 
        
        (exit_code, out, err) = run_command(cmd, keepalive_interval=300, timeout=7200)
        if exit_code == 0:
            logging.info(f"Created check sum for archive {framework} {out}")
        else:
            logging.error(f"Could not create checksum for archive: {framework} output: {out}; error: {err}")
            sys.exit(exit_code)
        framework_to_checksum[framework] = out.decode("utf-8").rstrip()
    return framework_to_checksum

def update_spm_manifest(framework_to_checksum, spm_manifest_repo, version):
    with open (f"{spm_manifest_repo}/Package.swift", 'r+') as package_manifest_file:
        content = package_manifest_file.read()
        # Update the checksum
        for framework in xcframeworks:  
            checksum = framework_to_checksum[framework]
            content = re.sub('(^ +"'+framework+'"\: ")([\w.]+)', r'\g<1>' + checksum, content, flags=re.M)
        
        # Update the version
        content = re.sub('(^let latestVersion = \")([\w.]+)', r'\g<1>' + version, content, flags=re.M)
        package_manifest_file.seek(0)
        package_manifest_file.write(content)
        package_manifest_file.truncate()

setup_logging()
version = str(sys.argv[1])
if not validate_version(version):
    logging.error("Version is invalid, exiting")
    sys.exit(1)

project_dir = os.getcwd()
xcframework_path = os.path.join(project_dir, "xcframeworks", "output", "XCF")
archive_path =  os.path.join(project_dir, "xcframeworks", "output", "archives")
spm_manifest_repo = './aws-sdk-ios-spm'

logging.info(f"Creating archives from {xcframework_path}")
create_archives(xcframework_path, archive_path, version)

logging.info(f"Calculating checksum from {archive_path}")
framework_to_checksum = create_checksum(archive_path, spm_manifest_repo, version)

logging.info(f"Updating checksum to {spm_manifest_repo}")
update_spm_manifest(framework_to_checksum, spm_manifest_repo, version)
