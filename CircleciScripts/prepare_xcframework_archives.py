import os
import sys
import shutil
import re

from framework_list import xcframeworks
from functions import log, run_command

def create_archives(xcframework_path, archive_path, version):
    os.makedirs(archive_path, exist_ok=True)
    for framework in xcframeworks:

        finalZipName = f"{framework}-{version}"
        log(f"Creating zip file for {finalZipName}")

        xcframework_sdk_path = f"{xcframework_path}/{framework}.xcframework"
        temp_path = f"{xcframework_path}/{framework}/{framework}.xcframework"

        log(f"Copying the zip to a temp location {temp_path}")
        shutil.copytree(xcframework_sdk_path, temp_path)  

        log(f"Make the archive and move to the archives dir")
        shutil.make_archive(finalZipName, 'zip', root_dir=xcframework_path, base_dir=f"{framework}")
        shutil.move(f"{framework}-{version}.zip", f"{archive_path}/{framework}-{version}.zip")  

        log(f"Cleanup the files")
        shutil.rmtree(f"{xcframework_path}/{framework}")

def create_checksum(archive_path, spm_manifest_repo, version):
    framework_to_checksum = {}
    for framework in xcframeworks:
        zipfile_path = f"{archive_path}/{framework}-{version}.zip"
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