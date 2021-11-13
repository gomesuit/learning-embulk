FROM openjdk:8-slim

ENV LANG=C.UTF-8

RUN apt-get update && \
    apt-get install -y curl

# Embulk install
ARG PATH_TO_EMBULK=/opt/embulk
ARG EMBULK_VERSION=0.9.23
RUN mkdir -p ${PATH_TO_EMBULK} \
    && curl --create-dirs -o ${PATH_TO_EMBULK}/embulk -L "https://dl.embulk.org/embulk-${EMBULK_VERSION}.jar" \
    && chmod +x ${PATH_TO_EMBULK}/embulk
ENV PATH=${PATH}:/opt/embulk

# https://github.com/medjed/embulk-input-bigquery
# ENV DEBUG_RESOLVER=true
RUN embulk gem install --verbose google-cloud-env -v 1.2.1
RUN embulk gem install --verbose google-cloud-core -v 1.3.2
RUN embulk gem install --verbose googleauth -v 0.9.0
RUN embulk gem install --verbose signet -v 0.11.0
RUN embulk gem install --verbose representable -v 3.0.4
RUN embulk gem install --verbose google-api-client -v 0.32.1
RUN embulk gem install --verbose embulk-input-bigquery -v 0.0.9

# https://github.com/embulk/embulk-output-s3
RUN embulk gem install --verbose embulk-output-s3 -v 1.7.0

# https://github.com/takei-yuya/embulk-formatter-jsonl
RUN embulk gem install --verbose embulk-formatter-jsonl -v 0.1.4

# https://github.com/civitaspo/embulk-output-s3_parquet
RUN embulk gem install --verbose embulk-output-s3_parquet -v 0.5.2

WORKDIR /app

CMD [ "bash" ]
