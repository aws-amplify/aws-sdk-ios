#!/bin/bash

# vim: set ts=2 sw=2 sts=2 et:

##################################################
# CANONICAL SOURCE OF THIS FILE IS
#   https://github.com/aws-amplify/amplify-ci-support/blob/main/src/integ_test_resources/common/scripts/generate-test-config.sh
#
# As of this writing (06-May-2020), we manually copy this file into the CI
# support directories for the projects that use it:
# - https://github.com/aws-amplify/aws-sdk-ios/tree/main/Scripts/generate-test-config.sh
# - https://github.com/aws-amplify/aws-sdk-android/tree/main/build-support/generate-test-config.sh
#
# From there, this script will be invoked by the CircleCI build process during
# test setup, or it may be invoked manually for local integration test runs
#


##################################################
# SCRIPT METADATA

readonly SCRIPT_NAME=$(basename "$0")
readonly SUMMARY="Generates a testconfiguration.json file for use in Amplify and AWS mobile SDK integration tests"
readonly SYNOPSIS="${SCRIPT_NAME} <android|ios> [options]"


##################################################
# DEFAULTS & DECLARATIONS
##################################################
readonly LOG_LEVEL_INFO=0
readonly LOG_LEVEL_DEBUG=1
readonly LOG_LEVEL_TRACE=2
LOG_LEVEL=0


##################################################
# FUNCTIONS
##################################################

# Logging. Note that all logging output goes to STDERR

function log {
  msg="$(date) $*"
  echo "$msg" >&2
}

function log_debug {
  if [[ $LOG_LEVEL -lt LOG_LEVEL_DEBUG ]] ; then
    return
  fi

  log "[D]:: $*"
}

# Always logged
function log_error {
  log "[E]:: $*"
}

# Always logged, except in quiet mode
function log_info {
  if [[ $LOG_LEVEL -lt LOG_LEVEL_INFO ]] ; then
    return
  fi

  log "[I]:: $*"
}

function log_trace {
  if [[ $LOG_LEVEL -lt LOG_LEVEL_TRACE ]] ; then
    return
  fi

  log "[T]:: $*"
}

function die {
  log_error "$@"
  exit 1
}

# Usage & help

function print_usage {
  echo "usage: ${SYNOPSIS}"
}

function print_help {
  usage=$(print_usage)
  cat <<EOF
${usage}

SYNOPSIS
    ${SYNOPSIS}

DESCRIPTION
    ${SUMMARY}

REQUIREMENTS
    $SCRIPT_NAME requires the following utilities to be installed
    and available on your PATH:
        - Python - v3.7 or higher, accessible as 'python3'
          (https://www.python.org/)

    If you use the -a option to assume the test execution role prior to
    generating the test configuration file, you must also have the following
    utilities installed:
        - jq - A JSON parsing utility
          (https://stedolan.github.io/jq/)
        - AWS CLI - for retrieving secret values from STS
          (https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

OPTIONS:
    -a
        Assume the test execution role before generating the test configuration
        file. Requires your environment to have exported credentials for a role
        or user that has 'sts:AssumeRole' permissions for the integration test
        execution role. If not specified, temporary role credentials must be
        exported into the environment variables 'AWS_ACCESS_KEY_ID',
        'AWS_SECRET_ACCESS_KEY', and 'AWS_SESSION_TOKEN'.

    -b <branch>
        The branch of the ci-support repo to check out. Defaults to 'main'.

    -p <android|ios>
        Generate configuration file for platform="<val>"

    -r <region>
        Look for resources in <region>. If not present, use the value of the
        environment variable AWS_DEFAULT_REGION. Either the environment
        variable or this flag must be specified.

    STANDARD OPTIONS:
    -h
        Print this help message
    -q
        Quiet mode, only errors will be logged
    -v
        Verbose output. Specify up to 2 times for more debugging output
EOF
}


##################################################
# PARSE ARGUMENTS

assume_role=""
branch="main"
platform=""
region=${AWS_DEFAULT_REGION}

while getopts "ab:p:qr:vh" optchar ; do
  case "$optchar" in
    a)
      assume_role=1
      ;;
    b)
      branch=$OPTARG
      ;;
    p)
      platform=$OPTARG
      ;;
    r)
      region=$OPTARG
      ;;

    q)
      LOG_LEVEL=-1
      ;;
    v)
      ((LOG_LEVEL++))
      ;;
    h)
      print_help
      exit 0
      ;;
    *)
      print_usage >&2
      exit 1
      ;;
  esac
done


##################################################
# VALIDATIONS AND ASSIGNMENTS

# This will be appended to various git and python commands unless log level is
# >= TRACE. Since it is a command argument, it's inappropriate to double-quote
# it on the command line, because the empty case would be interpreted as an
# empty string argument to the command being invoked. Suppress shellcheck
# checks with `# shellcheck disable=SC2086` as needed.
cmd_quiet_flag="--quiet"
[[ $LOG_LEVEL -ge $LOG_LEVEL_TRACE ]] && cmd_quiet_flag=""

[[ -n $platform ]] || die "'platform' not specified"

[[ -n $region ]] || die "'region' not specified"
export AWS_DEFAULT_REGION=${region}

##################################################
# LOCAL FUNCTIONS

function validate_dependencies {
  [[ -x $(which python3) ]] || die "Cannot find 'python3' in PATH"

  if [[ $assume_role ]] ; then
    declare -ar utilities=(aws jq)
    for cmd in "${utilities[@]}" ; do
      [[ -x $(which "$cmd") ]] || die "Cannot find '$cmd' in PATH"
    done
  fi
}

# shellcheck disable=SC2086
function install_support_repo {
  declare -r working_dir="$1"
  declare -r support_repo_branch="$2"
  declare -r support_repo_name=amplify-ci-support
  declare -r support_repo_url=https://github.com/aws-amplify/${support_repo_name}.git

  if [[ -d ${working_dir}/${support_repo_name} ]] ; then
    log_debug "Support repo exists at '${working_dir}/${support_repo_name}. Fetching latest version."
    cd "$support_repo_name"
    git fetch origin $cmd_quiet_flag
    git checkout -B "$support_repo_branch" origin/"$support_repo_branch" $cmd_quiet_flag
  else
    log_debug "Cloning support repo into '${working_dir}/${support_repo_name}"
    git clone "$support_repo_url" --branch "$support_repo_branch" "$support_repo_name" $cmd_quiet_flag
    cd $support_repo_name
  fi
}

# shellcheck disable=SC2086,SC1091
function install_dependencies {
  cd ./src/integ_test_resources/common/scripts
  log_debug "Setting up and activating python virtual environment"
  python3 -m venv .env

  source ./.env/bin/activate

  log_debug "Installing python requirements"

  pip3 install --upgrade pip $cmd_quiet_flag
  pip3 install -r requirements.txt $cmd_quiet_flag
}

function resolve_credentials {
  if [[ $assume_role ]] ; then
    log_debug "Assuming test execution IAM role"

    # Ensure we don't output credentials
    [[ $LOG_LEVEL -ge $LOG_LEVEL_TRACE ]] && set +x

    local circleci_execution_role
    circleci_execution_role=$(aws ssm get-parameter --name "/mobile-sdk/${platform}/common/circleci_execution_role" 2> /dev/null || echo "")
    readonly circleci_execution_role

    if [ -z "${circleci_execution_role}" ]; then
      die "Role not found for Circle CI in region: ${AWS_DEFAULT_REGION}"
    fi

    local circleci_execution_role_arn
    circleci_execution_role_arn=$(echo "${circleci_execution_role}" | jq -r .Parameter.Value)
    readonly circleci_execution_role_arn

    local assume_role_creds
    assume_role_creds=$(aws sts assume-role --duration-seconds 3600 --role-arn "${circleci_execution_role_arn}" --role-session-name "IntegTest-$(date +%Y%m%d%H%M%S)")
    readonly assume_role_creds

    if [ -z "${assume_role_creds}" ]; then
      die "Failed to assume role credentials for Circle CI"
    fi

    AWS_ACCESS_KEY_ID=$(echo "$assume_role_creds" | jq -r '.Credentials.AccessKeyId')
    readonly AWS_ACCESS_KEY_ID
    export AWS_ACCESS_KEY_ID

    AWS_SECRET_ACCESS_KEY=$(echo "$assume_role_creds" | jq -r '.Credentials.SecretAccessKey')
    readonly AWS_SECRET_ACCESS_KEY
    export AWS_SECRET_ACCESS_KEY

    AWS_SESSION_TOKEN=$(echo "$assume_role_creds" | jq -r '.Credentials.SessionToken')
    readonly AWS_SESSION_TOKEN
    export AWS_SESSION_TOKEN
  else
    log_debug "Using credentials in environment"
  fi

  # Restore verbose logging
  [[ $LOG_LEVEL -lt $LOG_LEVEL_TRACE ]] || set -x
}

function write_config_file {
  log_debug "Generating configuration file"
  python3 device_config_builder.py "$1" > "$2"
  log_info "Wrote configuration file to $2"
}

function clean_up {
  log_debug "Cleaning up"
  deactivate
}


##################################################
# MAIN

validate_dependencies

# Exit if any command fails. Don't set this flag until after argument and
# environment validation, or commands like `which foo` that test for
# dependencies will cause an immediate failure with no error message
set -e

[[ $LOG_LEVEL -lt $LOG_LEVEL_TRACE ]] || set -x

trap exit SIGINT

log_info "Generating configuration file for ${platform}"

declare -r starting_dir=$PWD

# Set up output paths
declare -r dest_dir=$HOME/.aws-amplify/aws-sdk-${platform}
declare -r dest_file="${dest_dir}"/testconfiguration.json
mkdir -p "$dest_dir"

cd "$dest_dir"

install_support_repo "$dest_dir" "$branch"

install_dependencies

resolve_credentials

write_config_file "$platform" "$dest_file"

clean_up

cd "$starting_dir"

log_debug "Done"
