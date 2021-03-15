from __future__ import print_function

import argparse
import logging

import os
import sys

from semver_utils import SemanticVersionComponent, bump_version_component
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
            help="specify the version component (major, minor, patch) to bump",
            choices=["MAJOR", "MINOR", "PATCH"],
            default="PATCH",
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
            "-r",
            "--root",
            dest="root_dir",
            help="root directory of the SDK project (defaults to current working directory)"
        )

    def parse_args(self, args):
        if self._parser is None:
            self.setup_parser()
        return self._parser.parse_args(args)

    def process_args(self, args):
        self.log_level = args.log_level
        logging.basicConfig(
            level=self.log_level, format=BumpVersionCLI.LOG_FORMAT
        )

        self.root_dir = args.root_dir or os.getcwd()

        if args.new_sdk_version is None:
            if not args.component:
                raise BumpVersionCLI.ArgumentError(
                    "Must specify one of --exact or --component"
                )
            self.resolve_new_version(args.component)
        else:
            self.new_sdk_version = args.new_sdk_version

    def resolve_new_version(self, component):
        current_version = read_version(self.root_dir)
        self.new_sdk_version = bump_version_component(
            current_version, SemanticVersionComponent(component)
        )

    def write_new_version(self):
        writer = VersionWriter(self.root_dir, self.new_sdk_version)
        writer.write_sdk_version()


def main(argv):
    BumpVersionCLI().run(argv)


if __name__ == "__main__":
    main(sys.argv)
