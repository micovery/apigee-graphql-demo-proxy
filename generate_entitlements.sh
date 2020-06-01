#!/usr/bin/env bash

FILES_DIR=./resources/files
TARGET_GRAPHQL_SCHEMA=${TARGET_GRAPHQL_SCHEMA:-../apigee-graphql-demo-server/resources/schema.graphql}

gql-s2e $TARGET_GRAPHQL_SCHEMA > $FILES_DIR/schema_entitlements.json

./merge.js $FILES_DIR/base_entitlements.json $FILES_DIR/schema_entitlements.json
rm $FILES_DIR/schema_entitlements.json