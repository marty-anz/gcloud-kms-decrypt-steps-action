#!/usr/bin/env bash

KMS_KEY_NAME=$1
CIPHERTEXT=$2

PROJECT=$(echo ${KMS_KEY_NAME} | cut -d'/' -f2)
LOCATION=$(echo ${KMS_KEY_NAME} | cut -d'/' -f4)
KEYRING=$(echo ${KMS_KEY_NAME} | cut -d'/' -f6)
KEY=$(echo ${KMS_KEY_NAME} | cut -d'/' -f8)

echo -n ${CIPHERTEXT} | base64 -d | gcloud kms decrypt \
    --project=${PROJECT} \
    --plaintext-file=- \
    --ciphertext-file=- \
    --location=${LOCATION} \
    --keyring=${KEYRING} \
    --key=${KEY}
