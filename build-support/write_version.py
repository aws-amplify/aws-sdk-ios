from __future__ import print_function

import argparse
import logging
import os

from version_writer import VersionWriter


class WriteVersionCLI:

    class ArgumentError(RuntimeError):
        pass

    def __init__(self):
        self._parser = None
        self._command_name = "write_version"

        self.log_level = None
        self.new_sdk_version = None
        self.root_dir = None

    def run(self, argv):
        self._command_name = os.path.basename(argv[0])
        args = self.parse_args(argv[1:])
        self.process_args(args)

        logging.debug(f"sdk_version: {self.new_sdk_version}, root_dir: {self.root_dir}")

        self.write_new_version()

    def setup_parser(self):
        self._parser = argparse.ArgumentParser(
            description="Bump version of the SDK",
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
            dest="file_type",
            help="bump version in the specified file type. Defaults to all if not specified.",
            action="append",
            choices=[file_type.value for file_type in VersionWriter.FileType],
        )

    def parse_args(self, args):
        if self._parser is None:
            self.setup_parser()
        return self._parser.parse_args(args)

    def process_args(self, args):
        self.log_level = args.log_level
        logging.basicConfig(level=self.log_level, format=BumpVersionCLI.LOG_FORMAT)

        self.root_dir = args.root_dir or os.getcwd()

        if args.print_version:
            self.print_version()
            exit(0)

        if args.sdk_version is None:
            if not args.component:
                raise BumpVersionCLI.ArgumentError("Must specify one of --exact or --component")
            self.resolve_new_version(SemanticVersion.Component(args.component))
        else:
            self.new_sdk_version = SemanticVersion.fromstring(args.sdk_version)

