# Google Datastore Emulator Docker Image

## Usage

```
$ docker pull docker.io/tomfrom42talents/google-cloud-datastore-emulator:latest
$ docker run --rm -ti --name datastore-emu google-cloud-datastore-emulator
```

Or in a `docker-compose.yml`

```
datastore:
  image: docker.io/tomfrom42talents/google-cloud-datastore-emulator:latest
  environment:
    - CONSISTENCY: 1 # If you omit this, the emulator will emulate eventual consistency.
worker:
  build: .
  environment:
    - DATASTORE_EMULATOR_HOST=datastore:8081
  restart: always
  links:
    - datastore
```


## Options

DATA_DIR

HOST_PORT

CONSISTENCY

IN_MEMORY