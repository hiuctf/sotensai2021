from debian:11-slim

run apt update && apt install -y --no-install-recommends \
      python3 \
      pip

run pip install Flask waitress

run mkdir /opt/web

copy ./serve.py /opt/web/serve.py

copy ./static /opt/web/static

copy ./templates /opt/web/templates

workdir /opt/web

cmd python3 serve.py