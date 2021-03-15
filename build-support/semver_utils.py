import logging
from enum import Enum, unique


# These values must be kept in sync with the arguments to the bump_version script
@unique
class SemanticVersionComponent(Enum):
    MAJOR = "MAJOR"
    MINOR = "MINOR"
    PATCH = "PATCH"


def bump_version_component(version_str, component):
    logging.debug(f"Bumping {component} of {version_str}")

    major, minor, patch = split_version(version_str)

    if component is SemanticVersionComponent.MAJOR:
        major = bump_component(major)
        minor = "0"
        patch = "0"
    elif component is SemanticVersionComponent.MINOR:
        minor = bump_component(minor)
        patch = "0"
    else:
        patch = bump_component(patch)

    return ".".join([major, minor, patch])


def bump_component(component_str):
    component_int = int(component_str)
    component_int += 1
    return str(component_int)


def split_version(version_str):
    (major, minor, patch_plus_extension) = version_str.split(".", 3)
    patch_plus_extension = patch_plus_extension.split("-", 1)
    patch = patch_plus_extension[0]
    return major, minor, patch
