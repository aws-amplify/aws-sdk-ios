echo "hello"
tag="${CIRCLE_TAG}"

tagdescription=$(sed -n '/## '${CIRCLE_TAG}'/,/## [0-9]*\.[0-9]*\.[0-9]/p'  CHANGELOG.md | sed '1d' | sed '$d')
tagname="AWS SDK for iOS "${CIRCLE_TAG}
echo $tagname
echo "$tagdescription"

