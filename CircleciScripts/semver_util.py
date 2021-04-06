import re

def validate_version(version):
    """
    Validate the version and check if the value is in the right format. This is a custom validation
    and just checks if the version has the major.minor.patch parts. If required we can add more semver 
    specific regex from - https://semver.org/#is-there-a-suggested-regular-expression-regex-to-check-a-semver-string

    :param version: Version to validate
    :return: True if the version is valid
    """
    pattern = re.compile("^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$")
    if pattern.search(version) is None:
        return False
    return True
