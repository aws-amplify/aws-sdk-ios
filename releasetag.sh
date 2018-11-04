tagdescription=$(sed -n '/## '${CIRCLE_TAG}'/,/## [0-9]*\.[0-9]*\.[0-9]/p'  CHANGELOG.md | sed '1d' | sed '$d')
tagname="AWS SDK for iOS "${CIRCLE_TAG}
github-release release -s ${GITHUB_TOKEN} -u ${CIRCLE_PROJECT_USERNAME} -r ${CIRCLE_PROJECT_REPONAME}  -t ${CIRCLE_TAG} -d "$tagdescription" -n "$tagname"
