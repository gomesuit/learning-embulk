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
RUN embulk gem install embulk-input-bigquery

WORKDIR /app

CMD [ "bash" ]
