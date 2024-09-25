#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: ./upload.sh <dataset>"
  exit 1
fi

# constants
SIZE_LIMIT=2000m

# pick dataset argument
DATASET=$1

# git branch $DATASET 2>/dev/null || echo "Branch $DATASET already exists"

# Zip and upload
echo "Zipping dataset $DATASET"
zip -r -s $SIZE_LIMIT $DATASET.zip $DATASET && \
    ls $DATASET.z* > $DATASET.txt && \
    # git checkout $DATASET && \
    git lfs track "$DATASET.z*" && \
    git add $DATASET.z* $DATASET.txt && \
    git commit -m "Added dataset $DATASET to the repo using Git LFS" && \
    git push