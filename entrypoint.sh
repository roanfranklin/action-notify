#!/bin/sh

set -e
: ${TELEGRAM_DISABLE_NOTIFICATION:=true} ${TYPE_MESSAGE:=information}

case "$(echo ${TYPE_MESSAGE} | tr '[:lower:]' '[:upper:]')" in
    WARNING) TYPE_MESSAGE="[ A T E N Ç Ã O ]\n" ;;
    DANGER) TYPE_MESSAGE="[ P E R I G O ]\n" ;;
    *) TYPE_MESSAGE="[ I N F O R M A Ç Ã O ]\n" ;;
esac

TXT_MSG="${TYPE_MESSAGE}"

sh -c "echo ${TXT_MSG}"

if [ ! -z "${TEXT_MESSAGE}" ]; then
    TXT_MSG="{TXT_MSG}\nMessage: ${TEXT_MESSAGE}"
fi

if [ ! -z "${ACTOR}" ]; then
    TXT_MSG="{TXT_MSG}\nActor: ${ACTOR}"
fi

if [ ! -z "${REPOSITORY}" ]; then
    TXT_MSG="{TXT_MSG}\nRepository: ${REPOSITORY}"
fi

if [ ! -z "${REFERENCE}" ]; then
    TXT_MSG="{TXT_MSG}\nReference: ${REFERENCE}"
fi

if [ ! -z "${NAMESPACE}" ]; then
    TXT_MSG="{TXT_MSG}\nNAMESPACE: ${NAMESPACE}"
fi

#sh -c "curl --silent --show-error --fail -X POST --data '{\"content\": \"${TXT_MSG}\"}' --header \"Content-Type:application/json\" \"https://discord.com/api/webhooks/${DISCORD_WEBHOOK_ID}/${DISCORD_WEBHOOK_TOKEN}\""
sh -c "echo \"${TXT_MSG}\n\nURL: https://discord.com/api/webhooks/${DISCORD_WEBHOOK_ID}/${DISCORD_WEBHOOK_TOKEN}\""

#if [[ ! -z "$DISCORD_WEBHOOK_ID" ] && [ ! -z "$DISCORD_WEBHOOK_TOKEN" ]]; then
#sh -c "curl --silent --show-error --fail -X POST --data '{\"content\": \"${TXT_MSG}\"}' --header \"Content-Type:application/json\" \"https://discord.com/api/webhooks/${DISCORD_WEBHOOK_ID}/${DISCORD_WEBHOOK_TOKEN}\""
#fi

#if [[ ! -z "$TELEGRAM_WEBHOOK_ID" ] && [ ! -z "$TELEGRAM_WEBHOOK_TOKEN" ]]; then
#    sh -c "curl --silent --show-error --fail -X POST -H 'Content-Type: application/json' -d '{\"chat_id\": \"${TELEGRAM_WEBHOOK_ID}\", \"text\": \"${TEXT_MESSAGE}\", \"disable_notification\": ${TELEGRAM_DISABLE_NOTIFICATION}' https://api.telegram.org/bot${TELEGRAM_WEBHOOK_TOKEN}/sendMessage"
#fi
#
#if [[ ! -z "$SLACK_WEBHOOK_ID" ]]; then
#    sh -c "curl --silent --show-error --fail -H \"Content-type: application/json\" --data '{\"channel\":\"${SLACK_WEBHOOK_ID}\",\"blocks\":[{\"type\":\"section\",\"text\":{\"type\":\"mrkdwn\",\"text\":\"${TEXT_MESSAGE}\"}}]}' -H \"Authorization: Bearer xoxb-not-a-real-token-this-will-not-work\" -X POST https://slack.com/api/chat.postMessage"
#fi

#    sh -c "curl --silent --show-error --fail $*"
