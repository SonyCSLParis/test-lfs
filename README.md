# Dataset storage using Git LFS

A simple utility to upload and download (very) large files with CLI using Git LFS.

## Requirements

- **Upload:** `git`
- **Download:** `wget`



## Usage

### Upload a new dataset

1. `git pull` this repository
2. If not done already, type `git lfs install`
3. Put all your dataset in a folder named `<dataset>`
4. Type `./upload.sh <dataset>`

### Download a distant dataset

In practice we directly use `wget` to retrieve the elements from the repository. In order to download a dataset `<dataset>`, just type:

```bash
wget -nc https://raw.githubusercontent.com/SonyCSLParis/test-lfs/refs/heads/master/download.sh
chmod u+x download.sh
./download.sh <dataset>
```

That's it!