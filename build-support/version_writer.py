from __future__ import print_function

import glob
import logging
import os
import re
from enum import Enum, unique

from lxml import etree

from file_utils.replace import replace_files
from version_file import write_version


class VersionWriter:

    @unique
    class FileType(Enum):
        """
        The type of file to be updated
        """
        CHANGELOG = "changelog"
        PLIST = "plist"
        PODSPEC = "podspec"
        SCRIPT = "script"
        SERVICE = "service"
        VERSION_FILE = "version_file"

    MODULE_LIST = [
        "AWSAPIGateway",
        "AWSAutoScaling",
        "AWSCloudWatch",
        "AWSCognitoAuth",
        "AWSCognitoIdentityProvider",
        "AWSComprehend",
        "AWSConnect",
        "AWSConnectParticipant",
        "AWSCore",
        "AWSDynamoDB",
        "AWSEC2",
        "AWSElasticLoadBalancing",
        "AWSIoT",
        "AWSKMS",
        "AWSKinesis",
        "AWSKinesisVideo",
        "AWSKinesisVideoArchivedMedia",
        "AWSKinesisVideoSignaling",
        "AWSLambda",
        "AWSLex",
        "AWSLocation",
        "AWSLogs",
        "AWSMachineLearning",
        "AWSPinpoint",
        "AWSPolly",
        "AWSRekognition",
        "AWSS3",
        "AWSSES",
        "AWSSNS",
        "AWSSQS",
        "AWSSageMakerRuntime",
        "AWSSimpleDB",
        "AWSTextract",
        "AWSTranscribe",
        "AWSTranscribeStreaming",
        "AWSTranslate",
        "AWSAuthSDK/Sources/AWSAuthCore",
        "AWSAuthSDK/Sources/AWSAuthUI",
        "AWSAuthSDK/Sources/AWSAppleSignIn",
        "AWSAuthSDK/Sources/AWSFacebookSignIn",
        "AWSAuthSDK/Sources/AWSGoogleSignIn",
        "AWSAuthSDK/Sources/AWSMobileClient",
        "AWSAuthSDK/Sources/AWSMobileClientXCF",
        "AWSAuthSDK/Sources/AWSUserPoolsSignIn",
    ]

    def __init__(self, root, sdk_version, file_types=None):
        self.root_dir = root
        self.sdk_version = sdk_version
        self.file_types = file_types

    def write_sdk_version(self):
        logging.info(f"Updating to new SDK version {self.sdk_version.prerelease_version_str}")

        for file_type in self.file_types:
            if file_type is VersionWriter.FileType.PLIST:
                self.bump_plists()
            if file_type is VersionWriter.FileType.SERVICE:
                self.bump_services()
            if file_type is VersionWriter.FileType.PODSPEC:
                self.bump_podspecs()
            if file_type is VersionWriter.FileType.CHANGELOG:
                self.bump_changelog()
            if file_type is VersionWriter.FileType.SCRIPT:
                self.bump_generate_docs()
            if file_type is VersionWriter.FileType.VERSION_FILE:
                self.overwrite_version_file()

    def bump_plists(self):
        for module in VersionWriter.MODULE_LIST:
            filename = os.path.join(self.root_dir, module, "Info.plist")
            self.bump_plist(filename)

    def bump_plist(self, filename):
        logging.debug(f"Updating {filename}")
        tree = etree.parse(filename)
        root_node = tree.getroot()
        namespaces = root_node.nsmap
        dict_node = root_node.find("./dict", namespaces)
        set_version = False
        for child in dict_node:
            if child.tag == "key" and child.text == "CFBundleShortVersionString":
                set_version = True
            else:
                if set_version:
                    child.text = self.sdk_version.prerelease_version_str
                    break

        plist_string = VersionWriter.format_plist(tree)
        plist = open(filename, "w")
        plist.write(plist_string)
        plist.close()

    @staticmethod
    def format_plist(tree):
        """
        Adjusts lxml's pretty-printed XML format to match Xcode's default and avoid
        semantically uninteresting diffs

        :param tree: the lxml tree to format
        :return: a pretty-printed string matching Xcode's plist format
        """
        plist_string = VersionWriter.tree_to_string(tree)

        flags = re.MULTILINE | re.IGNORECASE

        # Prepend XML prolog. This could be partially done with `lxml.tostring`'s
        # xml_declaration option, but that returns single-quoted attributes
        formatted_plist = '<?xml version="1.0" encoding="UTF-8"?>\n' + plist_string

        # Replace self-closing '<string/>' tags with explicitly closed tags
        formatted_plist = re.sub(r"<string/>", "<string></string>", formatted_plist, flags=flags)

        # Adjust lxml's default space-based indentation to Xcode's tab-based. Use the
        # multiline flag and match beginning of each line.
        formatted_plist = re.sub(r"^\s+<", "\t<", formatted_plist, flags=flags)

        return formatted_plist

    @staticmethod
    def tree_to_string(tree):
        plist_bytes = etree.tostring(
            tree, pretty_print=True, xml_declaration=False, encoding="UTF-8"
        )
        plist_string = plist_bytes.decode("utf-8")
        return plist_string

    def bump_services(self):
        service_pattern = {
            "match": r'(NSString[[:space:]]+\*const[[:space:]]+AWS.+SDKVersion[[:space:]]*=[[:space:]]+@")[0-9]+\.[0-9]+\.[0-9]+"',  # noqa: E501
            "replace": r'\1{version}"'.format(version=self.sdk_version.prerelease_version_str),
            "files": [],
        }

        # Add files for each module
        for module in VersionWriter.MODULE_LIST:
            path = "{0}/{0}Service.m".format(module)
            if os.path.isfile(os.path.join(self.root_dir, path)):
                service_pattern["files"].append(path)

        # Add files for special modules
        service_pattern["files"].extend(
            [
                "AWSAPIGateway/AWSAPIGatewayClient.m",
                "AWSCognitoAuth/AWSCognitoAuth.m",
                "AWSCore/Service/AWSService.m",
                "AWSIoT/AWSIoTDataService.m",
                "AWSKinesis/AWSFirehoseService.m",
                "AWSLex/AWSLexInteractionKit.m",
                "AWSPinpoint/AWSPinpointTargeting/AWSPinpointTargetingService.m",
                "AWSPolly/AWSPollySynthesizeSpeechURLBuilder.m",
                "AWSS3/AWSS3PreSignedURL.m",
            ]
        )
        replace_files(self.root_dir, service_pattern)

    def bump_podspecs(self):
        podspec_pattern1 = {
            "match": r"(dependency[[:space:]]+'AWS.+'[[:space:]]*,[[:space:]]*')[0-9]+\.[0-9]+\.[0-9]+(')",  # noqa: E501
            "replace": r"\1{version}\2".format(version=self.sdk_version.prerelease_version_str),
            "files": [],
        }

        podspec_pattern2 = {
            "match": r"(s\.version[[:space:]]+=[[:space:]]*')[0-9]+\.[0-9]+\.[0-9]+(')",
            "replace": r"\1{version}\2".format(version=self.sdk_version.prerelease_version_str),
            "files": [],
        }

        for file in glob.glob(os.path.join(self.root_dir, "*.podspec")):
            podspec_pattern1["files"].append(file)
            podspec_pattern2["files"].append(file)

        replace_files(self.root_dir, podspec_pattern1)
        replace_files(self.root_dir, podspec_pattern2)

    def bump_changelog(self):
        changelog_pattern = {
            "match": r"## Unreleased",
            "replace": "## Unreleased\\\n\\\n-Features for next release\\\n\\\n## {version}".format(
                version=self.sdk_version.prerelease_version_str
            ),
            "files": ["CHANGELOG.md"],
        }
        replace_files(self.root_dir, changelog_pattern)

    def bump_generate_docs(self):
        generate_documentation_pattern = {
            "match": r'VERSION="[0-9]+\.[0-9]+\.[0-9]+"',
            "replace": r'VERSION="{version}"'.format(
                version=self.sdk_version.prerelease_version_str
            ),
            "files": ["CircleciScripts/generate_documentation.sh"],
        }
        replace_files(self.root_dir, generate_documentation_pattern)

    def overwrite_version_file(self):
        logging.info("Writing new version to version_file")
        write_version(self.root_dir, self.sdk_version)
