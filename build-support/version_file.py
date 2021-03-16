import os

from semantic_version import SemanticVersion

VERSION_FILE_NAME = ".version"


def read_version(root_dir):
    version_file_path = get_version_file_path(root_dir)
    version_file = open(version_file_path)
    current_version_string = version_file.read().rstrip()
    version_file.close()
    current_version = SemanticVersion.fromstring(current_version_string)
    return current_version


def write_version(root_dir, new_sdk_version):
    version_file_path = get_version_file_path(root_dir)
    version_file = open(version_file_path, "w")
    version_file.write(new_sdk_version.prerelease_version_str)
    version_file.close()


def get_version_file_path(root_dir):
    return os.path.join(root_dir, VERSION_FILE_NAME)
