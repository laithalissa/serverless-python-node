#!/bin/bash
set -xe
TAG=laith/serverless-python-node:latest
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

LOCAL_REPO=cloud-toolkit
REPO=git@github.com:heartysoft/$LOCAL_REPO.git
LOCAL_REPO_VC_DIR=$LOCAL_REPO/.git

if [[ ! -d $LOCAL_REPO_VC_DIR ]]
then
    git clone $REPOSRC $LOCALREPO
else
    pushd $LOCAL_REPO > /dev/null
      git pull $REPO
    popd > /dev/null
fi
docker build -t $TAG .
