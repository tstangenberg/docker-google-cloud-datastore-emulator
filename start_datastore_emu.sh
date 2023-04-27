#!/bin/sh

if [ "$IN_MEMORY" = "true" ]; then
  gcloud beta emulators datastore start --no-store-on-disk --project="${GCLOUD_PROJECT}" --host-port "0.0.0.0:${HOST_PORT}" --consistency="${CONSISTENCY}"
else
  gcloud beta emulators datastore start --data-dir "${DATA_DIR}" --project="${GCLOUD_PROJECT}" --host-port "0.0.0.0:${HOST_PORT}" --consistency="${CONSISTENCY}"
fi
