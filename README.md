# GitHub Action for Notify

Python para notificações via Discord, Telegram e Slack ao executar o GitHub Actions.


## Usage

### URL Webhook Discord
https://discord.com/api/webhooks/<WEBHOOK_ID>/<WEBHOOK_TOKEN>


### GitHub Actions
```
on: push
jobs:
  notify-all:
    runs-on: ubuntu-latest
    steps:
    - name: notify all in curl
      uses: roanfranklin/action-notify@master
      with:
        args:
          --discord_webhook_id="${{ secrets.DISCORD_WEBHOOK_ID }}"
          --discord_webhook_token="${{ secrets.DISCORD_WEBHOOK_TOKEN }}"
          --text="Commit realizado!"
          --type="warning"
          --actor="${{ github.actor }}"
          --repository="${{ github.repository }}"
          --branch="${{ github.head_ref }}"
          --reference="${{ github.sha }}"
          --namespace="PRODUTION"
```


### Docker
```
docker run --rm $(docker build -q .) \
  --discord_webhook_id="0987654321" \
  --discord_webhook_token="tokenTOKENt0k3Ntok3nT0keN-t_0K3nT0KEN" \
  --text="Isso é um teste" \
  --type="warning" \
  --actor="Roan Franklin" \
  --repository="roanfranklin/simplewhale" \
  --branch="develop" \
  --reference="tag/test" \
  --namespace="PRD"
```


## Author
[Roan Franklin](https://github.com/roanfranklin) _roanfranklin@gmail.com_