#!/bin/sh

set -e
: #{TELEGRAM_DISABLE_NOTIFICATION:=true}

#if [[ ! -z "$DISCORD_WEBHOOK_ID" ] && [ ! -z "$DISCORD_WEBHOOK_TOKEN" ]]; then
sh -c "curl --silent --show-error --fail -X POST --data '{\"content\": \"${TEXT_MESSAGE}\"}' --header \"Content-Type:application/json\" \"https://discord.com/api/webhooks/${DISCORD_WEBHOOK_ID}/${DISCORD_WEBHOOK_TOKEN}\""
#fi

#if [[ ! -z "$TELEGRAM_WEBHOOK_ID" ] && [ ! -z "$TELEGRAM_WEBHOOK_TOKEN" ]]; then
#    sh -c "curl --silent --show-error --fail -X POST -H 'Content-Type: application/json' -d '{\"chat_id\": \"${TELEGRAM_WEBHOOK_ID}\", \"text\": \"${TEXT_MESSAGE}\", \"disable_notification\": ${TELEGRAM_DISABLE_NOTIFICATION}' https://api.telegram.org/bot${TELEGRAM_WEBHOOK_TOKEN}/sendMessage"
#fi
#
#if [[ ! -z "$SLACK_WEBHOOK_ID" ]]; then
#    sh -c "curl --silent --show-error --fail -H \"Content-type: application/json\" --data '{\"channel\":\"${SLACK_WEBHOOK_ID}\",\"blocks\":[{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"${TEXT_MESSAGE}\"}}]}' -H \"Authorization: Bearer xoxb-not-a-real-token-this-will-not-work\" -X POST https://slack.com/api/chat.postMessage"
#fi

#    sh -c "curl --silent --show-error --fail $*"
