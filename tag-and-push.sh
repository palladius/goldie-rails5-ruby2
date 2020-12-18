#!/bin/bash

echo todo

source .env 

APPVER=${1:-GIVEME_AN_ARG}

echo docker tag "${APPVER}" "gcr.io/$PROJECT_ID/${APPVER}"
           echo docker push "gcr.io/$PROJECT_ID/${APPVER}"
