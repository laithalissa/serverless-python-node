#!/usr/bin/env bash
# $1 - group namespace, e.g. datalake
# $2 - environment, e.g. dev, prod
read_serverless_build_environment () {
  if [[ -z "$1" || -z "$2" ]]; then
    >&2 echo "Usage: read_serverless_build_environment <group> <env>"
    return
  fi

  # Vault outputs the stderr if something goes wrong, so these will be empyt
  # if, for example, the secrets aren't defined
  export AWS_ACCESS_KEY_ID=$(
    vault read --field value "secret/$1/amazon/serverless/$2/accesskey"
  )
  export AWS_SECRET_ACCESS_KEY=$(
    vault read --field value "secret/$1/amazon/serverless/$2/secretaccesskey"
  )
}
