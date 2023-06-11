#! /bin/bash

# This script is used by GitHub Actions to build and test the project.

set -e

# Build the project.
GITHUB_TOKEN=$GITHUB_TOKEN
res=$(curl -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  https://api.github.com/repos/wintrov/test-service/dispatches \
  -d '{"event_type":"build","client_payload":{"service":"'$1'","reviewer_name":"'$reviewer_name'", "discription":"'$discription'", "link_to_pr":"'$link_to_pr'"}}' \
  -w "%{http_code}"
)
echo $res