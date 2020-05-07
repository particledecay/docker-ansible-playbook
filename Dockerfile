FROM alpine:3.10.2

COPY . /app

RUN apk update && \
    apk add --no-cache \
      ansible \
      bash \
      curl \
      git \
      jq \
      openssh-client \
      py3-pip \
      sshpass \
      tar

RUN apk add --no-cache --virtual .build-deps \
      build-base \
      dbus-dev \
      dbus-glib \
      dbus-glib-dev \
      gcc \
      libc-dev \
      libxml2-dev \
      libxslt-dev \
      python3-dev \
    && python3 -m pip install --no-cache-dir -r /app/requirements.txt \
    && apk del .build-deps

WORKDIR /app

ENTRYPOINT [ "/usr/bin/ansible-playbook" ]
