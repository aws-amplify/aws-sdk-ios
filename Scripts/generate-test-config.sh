#!/bin/bash

# vim: set ts=2 sw=2 sts=2 et:

##################################################
# SCRIPT METADATA

SCRIPT_NAME=$(basename $0)
SUMMARY="Generates a testconfiguration.json file for use in Amplify and AWS mobile SDK integration tests"
SYNOPSIS="${SCRIPT_NAME} <android|ios> [options]"


##################################################
# DEFAULTS & DECLARATIONS
##################################################
LOG_LEVEL_INFO=0
LOG_LEVEL_DEBUG=1
LOG_LEVEL_TRACE=2
LOG_LEVEL=0


##################################################
# FUNCTIONS
##################################################

# Logging. Note that all logging output goes to STDERR

function log {
  msg="$(date) $*"
  echo $msg >&2
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
  log_error $*
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

$SCRIPT_NAME generates a test configuration file for AWS SDK and
Amplify integration tests.

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
platform=""
region=${AWS_DEFAULT_REGION}

while getopts "ap:qvh" optchar ; do
  case "$optchar" in
    a)
      assume_role=1
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
      LOG_LEVEL+=1
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

cmd_quiet_flag="--quiet"
if [[ $LOG_LEVEL -gt 1 ]] ; then
  cmd_quiet_flag=""
fi

if [[ -z $platform ]] ; then
  die "'platform' not specified"
fi

if [[ -z $region ]] ; then
  die "'region' not specified"
fi

python_cmd=$(which python3)
if [[ -z $python_cmd ]] ; then
  die "Cannot find 'python3' in PATH"
fi

if [[ $assume_role ]] ; then
  aws_cli_cmd=$(which aws)
  if [[ -z $aws_cli_cmd ]] ; then
    die "Cannot find 'aws' in PATH"
  fi

  jq_cmd=$(which jq)
  if [[ -z $jq_cmd ]] ; then
    die "Cannot find 'jq' in PATH"
  fi
fi


##################################################
# MAIN

# Exit if any command fails. Don't set this flag until after argument and
# environment validation, or commands like `which foo` that test for
# dependencies will cause an immediate failure with no error message
set -e

trap exit SIGINT

log_info "Generating configuration file for ${platform}"

starting_dir=$PWD

# Set up output paths
dest_dir=$HOME/.aws-amplify/aws-sdk-${platform}
dest_file=${dest_dir}/testconfiguration.json
mkdir -p $dest_dir

# Set up support repo
support_repo_name=amplify-ci-support
support_repo_branch=palpatim/build_testconfig
support_repo_url=https://github.com/aws-amplify/${support_repo_name}.git

cd $dest_dir

# Install CI support repo

if [[ -d ${dest_dir}/${support_repo_name} ]] ; then
  log_debug "Support repo exists at '${dest_dir}/${support_repo_name}. Fetching latest version."
  cd $support_repo_name
  git fetch origin $cmd_quiet_flag
  git checkout -B $support_repo_branch $cmd_quiet_flag
else
  log_debug "Cloning support repo into '${dest_dir}/${support_repo_name}"
  git clone $support_repo_url --branch $support_repo_branch $support_repo_name $cmd_quiet_flag
  cd $support_repo_name
fi

# Install dependencies
cd ./src/integ_test_resources/common/scripts
log_debug "Setting up and activating python virtual environment"
$python_cmd -m venv .env
source ./.env/bin/activate $cmd_quiet_flag

log_debug "Installing python requirements"
pip3 install --upgrade pip $cmd_quiet_flag
pip3 install -r requirements.txt $cmd_quiet_flag

# Assume test execution role and export those values so the builder script can pick them up from the environment
if [[ $assume_role ]] ; then
  log_debug "Assuming test execution IAM role"
  circleci_execution_role_arn=$(aws ssm get-parameter --name '/mobile-sdk/ios/common/circleci_execution_role' | jq -r .Parameter.Value)
  assume_role_creds=$(aws sts assume-role --duration-seconds 3600 --role-arn "${circleci_execution_role_arn}" --role-session-name "IntegTest-$(date +%Y%m%d%H%M%S)")
  export AWS_ACCESS_KEY_ID=$(echo $assume_role_creds | jq -r '.Credentials.AccessKeyId')
  export AWS_SECRET_ACCESS_KEY=$(echo $assume_role_creds | jq -r '.Credentials.SecretAccessKey')
  export AWS_SESSION_TOKEN=$(echo $assume_role_creds | jq -r '.Credentials.SessionToken')
fi

export AWS_DEFAULT_REGION=${region}

# Write config file content
log_debug "Generating configuration file"
python3 device_config_builder.py ${platform} > $dest_file

# Clean up
log_debug "Cleaning up"
deactivate
cd $starting_dir

log_info "Generated configuration file at ${dest_file}"

