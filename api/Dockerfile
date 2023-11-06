FROM python:3.10-buster

# TMP
RUN set -e; \
    mkdir -p /var/run/secrets/waas.uxsignals.hops.run; \
    echo "[]" > /var/run/secrets/waas.uxsignals.hops.run/allowed-webhooks.json

WORKDIR /workspace
RUN set -eu; \
    apt-get update --yes; \
    apt-get install --yes \
      ffmpeg \
      git \
    ;
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

ENV WHISPER_WEBHOOKS "[]"
ENV ALLOWED_WEBHOOKS_FILE "allowed_webhooks.json"
COPY api/entrypoint.sh /docker-entrypoint.sh

COPY src src
COPY worker-settings.py download_models.py gunicorn.conf.py /workspace/

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD [ "gunicorn", "-w", "2", "-b", "0.0.0.0:9000", "--log-file=/dev/stdout", "src.main:app"]
