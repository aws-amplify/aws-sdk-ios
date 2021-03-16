from __future__ import print_function

import argparse
import logging
import os
import sys

from semantic_version import SemanticVersion
from version_file import read_version
from version_writer import VersionWriter


class BumpVersionCLI:

    LOG_FORMAT = "%(asctime)s:%(levelname)s:%(name)s:%(message)s"

    class ArgumentError(RuntimeError):
        pass

    def __init__(self):
        self._parser = None
        self._command_name = "version_bumper"

        self.log_level = None
        self.new_sdk_version = None
        self.root_dir = None

    def run(self, argv):
        self._command_name = os.path.basename(argv[0])
        args = self.parse_args(argv[1:])
        self.process_args(args)

        logging.debug(f"new_sdk_version: {self.new_sdk_version}, root_dir: {self.root_dir}")

        self.write_new_version()

    def setup_parser(self):
        self._parser = argparse.ArgumentParser(
            description="Bump version of the SDK",
            usage=f"{self._command_name} <args>",
        )

        # NOTE: The "choices" allowed by this argument must exactly match the values of
        # the SemanticVersionComponent enum
        self._parser.add_argument(
            "-c",
            "--component",
            help="""
            specify the version component (major, minor, patch, prerelease) to bump
            (defaults to PRERELEASE)
            """,
            choices=[component.value for component in SemanticVersion.Component],
            default="PRERELEASE",
        )

        self._parser.add_argument(
            "-e",
            "--exact",
            dest="new_sdk_version",
            help="set the exact version of the SDK (overrides --component)",
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
            "-p",
            "--print-version",
            help="print current version (from .version file) and exit",
            action="store_true",
        )

        self._parser.add_argument(
            "-r",
            "--root",
            dest="root_dir",
            help="root directory of the SDK project (defaults to current working directory)",
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

        if args.new_sdk_version is None:
            if not args.component:
                raise BumpVersionCLI.ArgumentError("Must specify one of --exact or --component")
            self.resolve_new_version(SemanticVersion.Component(args.component))
        else:
            self.new_sdk_version = SemanticVersion.fromstring(args.new_sdk_version)

    def resolve_new_version(self, component):
        self.new_sdk_version = read_version(self.root_dir)
        self.new_sdk_version.bump_component(component)

    def write_new_version(self):
        writer = VersionWriter(self.root_dir, self.new_sdk_version)
        writer.write_sdk_version()

    def print_version(self):
        current_version = read_version(self.root_dir)
        print(current_version.prerelease_version_str)


def main(argv):
    BumpVersionCLI().run(argv)


if __name__ == "__main__":
    main(sys.argv)
