FROM python:3.12-alpine
LABEL maintainer="Damien Baud"

# prevent Python from wirting .pyc files
ENV PYTHONDONTWRITEBYTECODE 1
# ensure Python output is sent directly to the terminal without buffering
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN python -m pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user