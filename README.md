# Litestream S3 Container

Minimal container for replicating single SQLite database to S3-compatible storage using [Litestream](https://litestream.io).

Based on the official docker image, but allows configuration of more S3 settings by environment variables.
Of particular importance is the ability to set the endpoint URL.
This makes it more flexible to be run as a sidecar without a project-specific config file.

Will automatically attempt to restore before replicating if local database does not exist, similar to the upstream [Docker example repo](https://github.com/benbjohnson/litestream-docker-example).

Very untested, but simple enough that it'll probably work.

## Environment Variables

* `LOCAL_PATH` (path to database file that will be replcated)
* `S3_ACCESS_KEY_ID`
* `S3_SECRET_ACCESS_KEY`
* `S3_BUCKET`
* `S3_PATH` (path of replica within bucket)
* `S3_REGION`
* `S3_ENDPOINT`

These are referenced within `litestream.yml`.

## Usage
Directly build and run in command line:
```
docker build -t litestream-s3-container
docker run \
  --env LOCAL_PATH=/data/database.db
  --env S3_ACCESS_KEY_ID=XXXXXXXX \
  --env S3_SECRET_ACCESS_KEY=XXXXXXXX \
  --env S3_BUCKET=my-bucket \
  --env S3_PATH=db-replica/database.db \
  --env S3_REGION=my-region \
  --env S3_ENDPOINT=https://s3-provider.example.com \
  -v /local/path/to/data:/data \
  litestream-s3-container
```

Docker Compose:
```
services:
  litestream:
    build: .
    environment:
      - LOCAL_PATH=/data/database.db
      - S3_ACCESS_KEY_ID=XXXXXXXX
      - S3_SECRET_ACCESS_KEY=XXXXXXXX
      - S3_BUCKET=my-bucket
      - S3_PATH=db-replica/database.db
      - S3_REGION=my-region
      - S3_ENDPOINT=https://s3-provider.example.com
    volumes:
      - /local/path/to/data:/data
```

Alternatively, build directly from GitHub. Make a fork if you don't trust me.
