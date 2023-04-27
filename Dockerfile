FROM eclipse-temurin:17-jre-jammy

LABEL org.opencontainers.image.authors="thorben.stangenberg@42talents.com"
LABEL app="datastore-emulator"

ENV IN_MEMORY "false"
ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV DATA_DIR "/opt/datastore"
ENV HOST_PORT 8081
ENV CONSISTENCY 0.9
ENV GCLOUD_PROJECT "test-project"

# RUN apk add --no-cache curl bash python
RUN apt-get update \
    && apt-get -y install gnupg python3 \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
	&& apt-get update && apt-get install -y google-cloud-cli google-cloud-cli-datastore-emulator \
	&& gcloud config set disable_usage_reporting true

RUN mkdir -p ${DATA_DIR}
EXPOSE $HOST_PORT

ADD start_datastore_emu.sh /opt
RUN chmod +x /opt/start_datastore_emu.sh

CMD ["/opt/start_datastore_emu.sh"]
