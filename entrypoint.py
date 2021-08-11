import argparse
import requests
import pytz
from datetime import datetime


parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('-type', type=str, required=True, help='Example Positional Argument')
parser.add_argument('-text', type=str, required=True, help='Example Positional Argument')
parser.add_argument('-actor', type=str, required=True, help='Example Positional Argument')
parser.add_argument('-repository', type=str, required=True, help='Example Optional Argument')
parser.add_argument('-branch', type=str, required=True, help='Example Optional Argument')
parser.add_argument('-reference', type=str, required=True, help='Example Positional Argument')
parser.add_argument('-namespace', type=str, required=True, help='Example Positional Argument')

parser.add_argument('-json', type=str, help='Example Positional Argument')

parser.add_argument('-discord_webhook_id', type=str, help='Example Positional Argument')
parser.add_argument('-discord_webhook_token', type=str, help='Example Positional Argument')

args = parser.parse_args()


yellow = 15258703
blue = 3447003
red = 16711680
green = 65280


if args.type is None:
    setcolor = green
elif args.type.upper() == "WARNING" or args.type.upper() == "ALERT":
    setcolor = yellow
elif args.type.upper() == "DANGER" or args.type.upper() == "ERROR":
    setcolor = red
elif args.type.upper() == "INFORMATION" or args.type.upper() == "INFO":
    setcolor = blue
else:
    setcolor = green


url = "https://discord.com/api/webhooks/{0}/{1}".format(args.discord_webhook_id, args.discord_webhook_token)


embed = {
    "title": args.repository,
    "description": "",
    "color": setcolor,
    "fields": [
        {
          "name": "Branch",
          "value": args.branch,
          "inline": True
        },
        {
          "name": "Reference",
          "value": args.reference,
          "inline": True
        },
        {
          "name": "Actor",
          "value": args.actor
        },
        {
          "name": "Namespace",
          "value": args.namespace
        }
      ],
    "footer": {
        "text": "{0}".format(datetime.now(pytz.timezone("America/Sao_Paulo")).strftime("%H:%M:%S %d/%m/%Y")),
    }
}

data = {
    "content": "{}".format(args.text),
    "username": "GitHub",
    "embeds": [
        embed
    ]
}

headers = {
    "Content-Type": "application/json"
}


result = requests.post(url, json=data, headers=headers)
if 200 <= result.status_code < 300:
    print("Webhook sent {0}".format(result.status_code))
else:
    print("Not sent with {0}, response:\n{1}".format(result.status_code, result.json()))
