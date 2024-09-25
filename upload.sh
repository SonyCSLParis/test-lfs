#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: ./upload.sh <dataset>"
  exit 1
fi

# constants
SIZE_LIMIT=4000m

# pick dataset argument
DATASET=$1

# Zip and upload
echo "Zipping dataset $DATASET"
zip -r -s $SIZE_LIMIT $DATASET.zip $DATASET && \
    ls $DATASET.z* > $DATASET.txt && \
    git lfs track "$DATASET.z*" && \
    git add $DATASET.z* $DATASET.txt && \
    git commit -m "Added dataset $DATASET to the repo using Git LFS" && \
    git push