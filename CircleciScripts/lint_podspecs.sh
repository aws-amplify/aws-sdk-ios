#!/bin/sh

# This script should be run from the root of the package.
# ./CircleciScripts/lint_podspecs.sh

die()
{
    MESSAGE=$1
    >&2 echo "${MESSAGE}" && exit 1
}

POD=$(which pod)
if [ -z "${POD}" ]; then
    die "Required tool, pod, was not found."
fi

PYTHON=$(which python3)
if [ -z "${PYTHON}" ]; then
    die "Required tool, python3, was not found."
fi

get_list()
{
    # the Python list puts the pods in the required order
    "${PYTHON}" ./CircleciScripts/list_podspecs.py
}

lint_podspec()
{
    PODSPEC=$1
    if [ ! -f "${PODSPEC}" ]; then
        die "Unable to find podspec: ${PODSPEC}"
    else
        "${POD}" lib lint "${PODSPEC}" --allow-warnings --verbose || die "Failed to lint podspec: ${PODSPEC}"
    fi
}

lint_podspecs()
{
    # update CocoaPods repo before starting
    ${POD} repo update
    
    PODSPECS=$(get_list)

    for PODSPEC in ${PODSPECS}; do
        echo "${PODSPEC}"
        lint_podspec "${PODSPEC}"
    done

    exit 0
}

lint_podspecs
