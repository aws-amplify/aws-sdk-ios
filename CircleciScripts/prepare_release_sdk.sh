git config --local user.name AWS
currentcommit="${CIRCLE_SHA1}"
echo $currentcommit
commitmessage=$(git log --format=%B -n 1 ${currentcommit})
echo "commitmessage=$commitmessage"
set +e
release_version=$(echo "$commitmessage" | grep -E "\[bump version [0-9]+.[0-9]+.[0-9]+\]" | sed 's/.*\[bump version \([0-9]*.[0-9]*.[0-9]*\)\].*/\1/')
echo "rellease_version=$release_version"
if [ -z "$release_version" ]
then 
  echo "this is not a bump version commit"
else
  echo "tag branch, start release"
  git tag -a "$release_version"  -m "Release AWS SDK for iOS $release_version. Trigger release from circleci"
  git push --tags -q https://${GITHUB_TOKEN}@github.com/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}.git
fi
