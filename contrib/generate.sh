#!/usr/bin/env bash

set -xe

CONTRIB_DIR=$(dirname $0)
export FORMULA_DIR=$(dirname $CONTRIB_DIR)/Formula

mkdir -p ${FORMULA_DIR}

for file in $(find ${CONTRIB_DIR}/generators -type f); do
  bash -xe $file
done
