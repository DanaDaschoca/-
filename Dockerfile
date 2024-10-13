FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && apt-get clean

COPY . /app

USER root

CMD ["python3", "/app/my_app.py"]
