#!/usr/bin/env bash

TARGET_APIGEE_ORG=${TARGET_APIGEE_ORG:-demo1337}
TARGET_APIGEE_ENV=${TARGET_APIGEE_ENV:-test}
TARGET_GRAPHQL_BACKEND=${TARGET_GRAPHQL_BACKEND:-}

if [ -z "${TARGET_GRAPHQL_BACKEND}" ] ; then
  echo "Discovering target url from Cloud Run ..."
  TARGET_GRAPHQL_BACKEND=$(gcloud run services  describe graphql-server --platform managed --region us-west1 --format json | jq -r '.status.address.url')/graphql
fi

echo "Parameters ..."
echo "using TARGET_APIGEE_ORG=${TARGET_APIGEE_ORG}"
echo "using TARGET_APIGEE_ENV=${TARGET_APIGEE_ENV}"
echo "using TARGET_GRAPHQL_BACKEND=${TARGET_GRAPHQL_BACKEND}"
echo ""

echo "Pulling Secrets ..."

APIGEE_BUILD_USER=$(gcloud secrets versions access latest --secret apigee_build_user)
APIGEE_BUILD_PASS=$(gcloud secrets versions access latest --secret apigee_build_pass)

echo "Deploying Apigee API Proxy & KVM"
mvn install -Ptest \
  -Dorg=$TARGET_APIGEE_ORG \
  -Denv=$TARGET_APIGEE_ENV \
  -Dusername=$APIGEE_BUILD_USER \
  -Dpassword=$APIGEE_BUILD_PASS \
  -Dtarget_backend=$TARGET_GRAPHQL_BACKEND