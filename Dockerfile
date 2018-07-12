FROM python:3.6-slim-stretch
SHELL ["/bin/bash", "-c"]
RUN apt-get update && \
  apt-get install -y curl gnupg unzip && \
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get install -y nodejs && \
  npm install -g serverless && \
  curl https://releases.hashicorp.com/vault/0.10.3/vault_0.10.3_linux_amd64.zip > vault.zip && \
  unzip vault.zip -d /usr/bin && \
  rm vault.zip

COPY ./cloud-toolkit /opt/bin/cloud-toolkit
COPY ./vault-utils.sh /opt/bin/
