import os
import sys
import shutil
import re

from framework_list import xcframeworks
from functions import log, run_command

def create_archives(xcframework_path, archive_path, version):
    os.makedirs(archive_path, exist_ok=True)
    for framework in xcframeworks:
        
        xcframework_sdk = f"{framework}.xcframework"
        xcframework_sdk_path = os.path.join(xcframework_path, xcframework_sdk)
        
        archive_name = f"{framework}-{version}"
        final_archive_name_with_ext = f"{framework}-{version}.zip"
        log(f"Creating zip file for {archive_name}")
        
        temp_folder = os.path.join(xcframework_path, framework)
        log(f"Copying the zip to a temp location {temp_folder}")
        shutil.copytree(xcframework_sdk_path, os.path.join(temp_folder, xcframework_sdk))  

        log(f"Generate the archive and move it to the archive directory")
        final_archived_path = os.path.join(archive_path, final_archive_name_with_ext)
        shutil.make_archive(archive_name, "zip", root_dir=xcframework_path, base_dir=framework)
        shutil.move(f"{framework}-{version}.zip", final_archived_path)  

        log(f"Remove the temp folder")
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
            log(f"Created check sum for archive {framework} {out}")
        else:
            log(cmd)
            log(f"Could not create checksum for archive: {framework} output: {out}; error: {err}")
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

version = str(sys.argv[1])

project_dir = os.getcwd()
xcframework_path = f"{project_dir}/xcframeworks/output/XCF"
archive_path = f"{project_dir}/xcframeworks/output/archives"
spm_manifest_repo = '../aws-sdk-ios-spm'

log(f"Creating archives from {xcframework_path}")
create_archives(xcframework_path, archive_path, version)

log(f"Calculating checksum from {archive_path}")
framework_to_checksum = create_checksum(archive_path, spm_manifest_repo, version)

log(f"Updating checksum to {spm_manifest_repo}")
update_spm_manifest(framework_to_checksum, spm_manifest_repo, version)