#!/usr/bin/env bash

set -xe

CONTRIB_DIR=$(dirname $0)
export FORMULAS_DIR=$(dirname $CONTRIB_DIR)/Formulas

mkdir -p ${FORMULAS_DIR}

for file in $(find ${CONTRIB_DIR}/generators -type f); do
  bash -xe $file
done
