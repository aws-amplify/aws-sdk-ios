from __future__ import print_function

import argparse
import logging
import os
import sys

from common import LOG_FORMAT
from semantic_version import SemanticVersion
from version_writer import VersionWriter


class WriteVersionCLI:

    class ArgumentError(RuntimeError):
        pass

    def __init__(self):
        self._parser = None
        self._command_name = "write_version"

        self.log_level = None
        self.sdk_version = None
        self.root_dir = None
        self.file_types = None

    def run(self, argv):
        self._command_name = os.path.basename(argv[0])
        args = self.parse_args(argv[1:])
        self.process_args(args)

        logging.debug(f"sdk_version: {self.sdk_version}, root_dir: {self.root_dir}")

        self.write_new_version()

    def setup_parser(self):
        self._parser = argparse.ArgumentParser(
            description="Write SDK version",
            usage=f"{self._command_name} <args>",
        )

        self._parser.add_argument(
            "-v",
            "--version",
            dest="sdk_version",
            help="the SDK version string to write",
        )

        self._parser.add_argument(
            "-l",
            "--log-level",
            dest="log_level",
            help="set log level (defaults to WARNING)",
            choices=["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],
            default="WARNING",
        )

        self._parser.add_argument(
            "-r",
            "--root",
            dest="root_dir",
            help="root directory of the SDK project (defaults to current working directory)",
            default=os.getcwd()
        )

        self._parser.add_argument(
            "-t",
            "--file-type",
            help="""
            bump version in the specified file type. Can be specified multiple times.
            (Defaults to all if not specified.)
            """,
            action="append",
            choices=[file_type.value for file_type in VersionWriter.FileType],
        )

    def parse_args(self, args):
        if self._parser is None:
            self.setup_parser()
        return self._parser.parse_args(args)

    def process_args(self, args):
        self.log_level = args.log_level
        logging.basicConfig(level=self.log_level, format=LOG_FORMAT)

        self.root_dir = args.root_dir
        self.sdk_version = args.sdk_version
        self.resolve_file_types(args)

    def resolve_file_types(self, args):
        if args.file_type and len(args.file_type) > 0:
            self.file_types = map(VersionWriter.FileType, args.file_type)
        else:
            self.file_types = [file_type for file_type in VersionWriter.FileType]

    def write_new_version(self):
        semantic_version = SemanticVersion.fromstring(self.sdk_version)
        version_writer = VersionWriter(
            root=self.root_dir,
            sdk_version=semantic_version,
            file_types=self.file_types
        )
        version_writer.write_sdk_version()


def main(argv):
    WriteVersionCLI().run(argv)


if __name__ == "__main__":
    main(sys.argv)
