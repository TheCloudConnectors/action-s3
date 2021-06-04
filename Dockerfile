FROM python:3.8-alpine

ENV AWSCLI_VERSION='1.18.69'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]