#!/bin/bash

# This script generates a private spec repo in your $HOME/.aws-amplify
# directory, to enable `pod lib lint`. It also makes it easier to do
# development against unreleased versions of the AWS Mobile SDK, at least until
# we start releasing nightly builds.

set -e

declare -r LOCAL_SPEC_GIT_ROOT="$HOME/.aws-amplify/aws-sdk-ios/aws-sdk-ios-podspecs.git"
declare -r LOCAL_SPEC_REPO_NAME="aws-sdk-ios-local-specs"
declare -r COCOAPODS_REPO_DIR="${HOME}/.cocoapods/repos/${LOCAL_SPEC_REPO_NAME}"

function init_spec_git_root {
  # If directory exists, assume it's correctly set up; don't attempt any
  # repairs or validation
  if [[ -d "${LOCAL_SPEC_GIT_ROOT}" ]] ; then
    return 0
  fi

  mkdir -p "${LOCAL_SPEC_GIT_ROOT}"
  old_pwd="${PWD}"
  cd "${LOCAL_SPEC_GIT_ROOT}"
  git init --bare
  cd "${old_pwd}"
}

function init_spec_repo {
  # If repo exists, assume it's correctly set up; don't attempt any
  # repairs or validation
  if [[ -n "$(pod repo list | grep ${LOCAL_SPEC_REPO_NAME})" ]] ; then
    return 0
  fi

  init_spec_git_root

  pod repo add --silent "${LOCAL_SPEC_REPO_NAME}" "${LOCAL_SPEC_GIT_ROOT}"

  old_pwd="${PWD}"
  cd "${COCOAPODS_REPO_DIR}"
  git commit --allow-empty -m "Empty commit"
  git push
  cd "${old_pwd}"

  if [[ -z "$(pod repo list | grep ${LOCAL_SPEC_REPO_NAME})" ]] ; then
    pod repo add --silent "${LOCAL_SPEC_REPO_NAME}" "${LOCAL_SPEC_GIT_ROOT}"
  else
    pod repo update --silent "${LOCAL_SPEC_REPO_NAME}"
  fi
}

function update_spec_repo {
  old_pwd="${PWD}"
  cd "${COCOAPODS_REPO_DIR}"

  git add .
  git commit --allow-empty -m "Update specs"
  git push

  cd "${old_pwd}"
}

function write_munged_podspec {
  declare -r src_file=$1
  declare -r dst_file=$2
  ruby -e "puts ARGF.read.gsub('$old_version', '$new_version').gsub!(/s.source *=.*?\}/m,'s.source = { :git => \'file://${src_dir}\' }')" "${src_file}" \
    > "${dst_file}"
}

function resolve_version_for_pod {
  echo "${new_version}"
}

declare -r old_version="$1"
if [[ -z $old_version ]] ; then
  echo "Must specify old_version" >&2
  exit 1
fi

declare -r new_version="$2"
if [[ -z $new_version ]] ; then
  echo "Must specify new_version" >&2
  exit 1
fi

init_spec_repo

declare -r src_dir="$PWD"

podspec_file_names=()

while read -r podspec_file ; do
  podspec_file_name=$( basename "$podspec_file" )
  podspec_file_names+=("$podspec_file_name")
  pod_name=$( basename "$podspec_file_name" .podspec )

  resolved_version=$( resolve_version_for_pod "${pod_name}" )

  dst_dir="${COCOAPODS_REPO_DIR}/${pod_name}/${resolved_version}"
  dst_file="${dst_dir}/${podspec_file_name}"

  mkdir -p "${dst_dir}"

  write_munged_podspec "$podspec_file" "$dst_file"
done < <( find "${src_dir}" -maxdepth 1 -mindepth 1 -name "*.podspec" | sort --ignore-case )

update_spec_repo

echo "Done. You may now validate podspec files by running:"
echo
echo "pod cache clean --all"
echo -n "pod lib lint --sources=${LOCAL_SPEC_REPO_NAME},trunk"
for podspec_file_name in "${podspec_file_names[@]}" ; do
  echo -n " ${podspec_file_name}"
done
echo

echo
echo "To use the private specs in a local project, add the following lines to your Podfile:"
echo "source '${LOCAL_SPEC_GIT_ROOT}'"
echo "source 'https://cdn.cocoapods.org'"
echo
echo "Then do a 'pod cache clean --all && pod install' to install from the private repo"

