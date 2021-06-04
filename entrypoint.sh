#!/bin/sh

set -e

if [ -z "$AWS_S3_BUCKET" ]; then
  echo "AWS_S3_BUCKET is not set. Quitting."
  exit 1
fi

if [ -z "$SOURCE_DIR" ]; then
  echo "SOURCE_DIR is not set. Quitting."
  exit 1
fi

if [ -z "$DEST_DIR" ]; then
  echo "DEST_DIR is not set. Quitting."
  exit 1
fi

if [ -z "$AWS_REGION" ]; then
  AWS_REGION="us-east-2"
fi

if [ -z "$EXTRA_ARGS" ]; then
  EXTRA_ARGS=""
fi

sh -c "aws s3 cp ${SOURCE_DIR:-.} s3://${AWS_S3_BUCKET}/${DEST_DIR} $EXTRA_ARGS"
