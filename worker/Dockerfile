FROM python:3.10-buster

WORKDIR /workspace
RUN apt-get update
RUN apt-get install -y git ffmpeg
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY worker/entrypoint.sh /docker-entrypoint.sh
COPY worker/runner.sh /docker-runner.sh
COPY src src

ENV WHISPER_WEBHOOKS "[]"
ENV ALLOWED_WEBHOOKS_FILE "allowed_webhooks.json"

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/docker-runner.sh"]
