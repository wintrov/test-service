#!/usr/bin/env bash

# send a message to slack and get the service name from the command line
function send_slack_message() {
    service=$1
    reviewer_name=${2:-"unknown"}
    description=${3:-"unknown"}
    link_to_PR=${4:-"unknown"}
    msg="Deploying ${service} (reviewed by ${reviewer_name}) - ${description} (${link_to_PR})"
    slack_webhook_url="https://hooks.slack.com/services/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"
    echo "Sending slack message: ${msg}"
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${msg}\"}" ${slack_webhook_url} -w "%{http_code}"
}

function trigger_github_actions() {
    res=$(curl -X POST \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    https://api.github.com/repos/wintrov/test-service/dispatches \
    -d '{"event_type":"build","client_payload":{"service":"'$1'","reviewer_name":"'$reviewer_name'", "discription":"'$discription'", "link_to_pr":"'$link_to_pr'"}}' \
    -w "%{http_code}"
    )
    echo $res
}

function deploy() {
  deploy_result=$(jot -r 1  0 1)
}

# send_slack_message $1
trigger_github_actions $1
echo ""
deploy
echo "Deploying $1" # replace this line with your code