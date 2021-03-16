import logging
from enum import Enum, unique

# Lightweight semver utilities. Note that these utilities do not handle build
# numbers, only versions and prerelease identifiers (separated from the main
# version with a hyphen "-")


class SemanticVersion:
    # These values must be kept in sync with the arguments to the bump_version script
    @unique
    class Component(Enum):
        MAJOR = "MAJOR"
        MINOR = "MINOR"
        PATCH = "PATCH"
        PRERELEASE = "PRERELEASE"

    DEFAULT_PRERELEASE_PREFIX = "unstable"

    def __init__(
        self, major, minor, patch, prerelease_prefix=None, prerelease=None
    ):
        self.major = int(major)
        self.minor = int(minor)
        self.patch = int(patch)
        self.prerelease_prefix = prerelease_prefix
        self.prerelease = int(prerelease) if prerelease is not None else None

    @classmethod
    def fromstring(cls, version_str):
        components = version_str.split("-", 3)
        (major, minor, patch) = components[0].split(".", 3)
        prerelease=None
        prerelease_prefix=None
        if len(components) > 1:
            (prerelease_prefix, prerelease) = components[1].split(".", 1)

        return SemanticVersion(
            major=major,
            minor=minor,
            patch=patch,
            prerelease_prefix=prerelease_prefix,
            prerelease=prerelease
        )

    def __str__(self):
        return self.prerelease_version_str

    def __repr__(self):
        return self.prerelease_version_str

    @property
    def release_version_str(self):
        components = [self.major, self.minor, self.patch]
        return ".".join(map(str, components))

    @property
    def prerelease_version_str(self):
        prerelease_identifier = self.prerelease_identifier
        if prerelease_identifier is None:
            return self.release_version_str
        else:
            return "-".join([self.release_version_str, self.prerelease_identifier])

    @property
    def prerelease_identifier(self):
        if self.prerelease is None:
            return None
        else:
            prerelease_prefix =\
                self.prerelease_prefix or SemanticVersion.DEFAULT_PRERELEASE_PREFIX
            return ".".join([prerelease_prefix, str(self.prerelease)])

    def bump_component(self, component):
        logging.debug(f"Bumping {component} of {self.prerelease_version_str}")

        if component is SemanticVersion.Component.MAJOR:
            self.major += 1
            self.minor = 0
            self.patch = 0
            self.prerelease = None
        elif component is SemanticVersion.Component.MINOR:
            self.minor += 1
            self.patch = 0
            self.prerelease = None
        elif component is SemanticVersion.Component.PATCH:
            self.patch += 1
            self.prerelease = None
        else:
            self.bump_prerelease()

    def bump_prerelease(self):
        self.prerelease = self.prerelease + 1 if self.prerelease is not None else 0
