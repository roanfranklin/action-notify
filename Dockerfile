FROM alpine

LABEL "com.github.actions.name"="Github Action for notify in curl"
LABEL "com.github.actions.description"="Wraps the curl CLI to be notify (Discord, Telegram and Slack) used in Github Actions"
LABEL "com.github.actions.icon"="download-cloud"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="http://github.com/roanfranklin/action-notify"
LABEL "homepage"="http://github.com/roanfranklin"
LABEL "maintainer"="Roan Franklin <roanfranklin@gmail.com>"

RUN apk add --no-cache curl ca-certificates

ADD *.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
