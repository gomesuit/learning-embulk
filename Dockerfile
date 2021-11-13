FROM openjdk:8-slim

ENV LANG=C.UTF-8

RUN apt-get update && \
    apt-get install -y curl

# Embulk install
ENV PATH_TO_EMBULK=/opt/embulk
RUN mkdir -p ${PATH_TO_EMBULK} \
    && curl --create-dirs -o ${PATH_TO_EMBULK}/embulk -L "https://dl.embulk.org/embulk-0.9.23.jar" \
    && chmod +x ${PATH_TO_EMBULK}/embulk
ENV PATH=${PATH}:/opt/embulk

RUN embulk gem install embulk-output-td

WORKDIR /app
# COPY ./load.yml.liquid ./

CMD [ "bash" ]
