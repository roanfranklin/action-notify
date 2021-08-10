FROM python:3.6.14-alpine

LABEL "com.github.actions.name"="Github Action for notify"
LABEL "com.github.actions.description"="Notify (Discord, Telegram and Slack) used in Github Actions"
LABEL "com.github.actions.icon"="download-cloud"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="http://github.com/roanfranklin/action-notify"
LABEL "homepage"="http://github.com/roanfranklin"
LABEL "maintainer"="Roan Franklin <roanfranklin@gmail.com>"

RUN pip3 install requests pytz

ADD entrypoint.py . 

ENTRYPOINT ["python","entrypoint.py"]