from __future__ import print_function

import argparse
import logging
import os
import sys

from common import LOG_FORMAT
from semantic_version import SemanticVersion
from version_file import read_version


class BumpVersionCLI:

    class ArgumentError(RuntimeError):
        pass

    def __init__(self):
        self._parser = None
        self._command_name = "bump_version"

        self.log_level = None
        self.sdk_version = None
        self.root_dir = None

    def run(self, argv):
        self._command_name = os.path.basename(argv[0])
        args = self.parse_args(argv[1:])
        self.process_args(args)

        logging.debug(f"reading version from {self.root_dir}")
        self.sdk_version = read_version(self.root_dir)
        logging.debug(f"current version is {self.sdk_version}")

        if args.version_component:
            component = SemanticVersion.Component(args.version_component)
            self.sdk_version.bump_component(component)
            logging.debug(f"new version is {self.sdk_version}")

        self.print_version()

    def setup_parser(self):
        self._parser = argparse.ArgumentParser(
            description="Bump and print current version of the SDK",
            usage=f"{self._command_name} <args>",
        )

        self._parser.add_argument(
            "-c",
            "--version-component",
            help="""
            specify the version component to bump (if not specified, prints current version)
            """,
            choices=[component.value for component in SemanticVersion.Component]
        )

        self._parser.add_argument(
            "-l",
            "--log-level",
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

    def parse_args(self, args):
        if self._parser is None:
            self.setup_parser()
        return self._parser.parse_args(args)

    def process_args(self, args):
        self.log_level = args.log_level
        logging.basicConfig(level=self.log_level, format=LOG_FORMAT)

        self.root_dir = args.root_dir

    def print_version(self):
        print(self.sdk_version.prerelease_version_str)


def main(argv):
    BumpVersionCLI().run(argv)


if __name__ == "__main__":
    main(sys.argv)
