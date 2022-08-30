from python:3.9-alpine3.13
LABEL maintainer="joshbright.com"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /.pyv && \
    /.pyv/bin/pip install --upgrade pip && \
    /.pyv/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/.pyv/bin:$PATH"

USER django-user
