#!/bin/sh

set -e

if [ -z "$SOURCE" ]; then
  echo "SOURCE is not set. Quitting."
  exit 1
fi

if [ -z "$DEST" ]; then
  echo "DEST is not set. Quitting."
  exit 1
fi

if [ -z "$AWS_REGION" ]; then
  AWS_REGION="us-east-2"
fi

if [ -z "$S3_ACTION" ]; then
  S3_ACTION="cp"
fi

if [ -z "$EXTRA_ARGS" ]; then
  EXTRA_ARGS=""
fi

sh -c "aws s3 ${S3_ACTION} '${SOURCE:-.}' '${DEST}' $EXTRA_ARGS"
