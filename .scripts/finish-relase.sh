#!/usr/bin/env bash

set -eu

function error {
  echo "#----------------------------"
  echo "# ERROR: $1"
  echo "#----------------------------\n"
  exit 1
}

docker build -t eoi-docker-ubuntu-examples .

BRANCH=`git rev-parse --abbrev-ref HEAD`

function check_branch {
  if [[ ${BRANCH} == 'master' ]]; then
      echo "Master branch"
  else
    error "Invalid branch name ${BRANCH}"
   fi
}

function uncommitted_changes {
  if [[ `git status --porcelain` ]]; then
    error "There are uncommitted changes in the working tree."
  fi
}

function upload_image {
  docker push raulanatol/eoi-docker-ubuntu-examples
}

uncommitted_changes
check_branch
upload_image
