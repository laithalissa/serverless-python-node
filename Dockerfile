FROM python:3-slim-stretch
RUN apt-get update && \
  apt-get install -y curl gnupg && \
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get install -y nodejs && \
  npm install -g serverless

ENTRYPOINT ["bash"]
