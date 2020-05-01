#!/bin/bash

DESTINATION=$1

if [[ -z $DESTINATION ]] ; then
  echo "Destination not specified" >&2
  exit 1
fi

TEMP_FILE=$(mktemp aws-sdk-ios.testconfiguration.json)
echo '{"credentials":{"accessKey":"EMPTY","secretKey":"EMPTY","sessionToken":"EMPTY"},"packages":{"common":{"region":"us-west-2"}}}' > $TEMP_FILE
cp $TEMP_FILE $DESTINATION
rm $TEMP_FILE

