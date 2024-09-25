#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: ./download.sh <dataset>"
  exit 1
fi

# constants
REPO=SonyCSLParis/test-lfs
RAW_URL=https://raw.githubusercontent.com/$REPO/refs/heads/master
MEDIA_URL=https://media.githubusercontent.com/media/$REPO/refs/heads/master

# pick dataset argument and create a temporary file for the archive
DATASET=$1
TEMPFILE=$(mktemp /tmp/XXXX.zip)

# retrieve the list of zip files
wget -qO- $RAW_URL/$DATASET.txt | while IFS= read -r ZIPFILE; do
  wget -c --no-check-certificate $MEDIA_URL/$ZIPFILE
done

# remove created temporary archive at the end of the script
trap 'rm $TEMPFILE' EXIT

# merge the split archive and unzip it
zip -F $DATASET.zip --out $TEMPFILE && unzip $TEMPFILE && rm $DATASET.z*