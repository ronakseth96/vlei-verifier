FROM weboftrust/keri:1.2.0-dev13

RUN apk update && apk add --no-cache curl

WORKDIR /usr/local/var

RUN mkdir vlei-verifier
COPY . /usr/local/var/vlei-verifier

WORKDIR /usr/local/var/vlei-verifier/

RUN pip install -r requirements.txt

ENTRYPOINT ["verifier", "server", "start", "--config-dir", "scripts", "--config-file", "verifier-config-rootsid.json"]