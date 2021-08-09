# GitHub Action for notify in curl

Usando o comando curl CLI para notificações via Discord, Telegram e Slack ao executar o GitHub Actions.

*OBS.: Não usar a vírgula no **args**, pois ocorrerá erros.*


## Usage

### GitHub Actions
```
on: push
jobs:
  notify-all:
    runs-on: ubuntu-latest
    steps:
    - name: notify all in curl
      uses: roanfranklin/action-notify@master
      env:
        DISCORD_WEBHOOK_ID: ${{ secrets.DISCORD_WEBHOOK_ID }}
        DISCORD_WEBHOOK_TOKEN: ${{ secrets.DISCORD_WEBHOOK_TOKEN }}
        TELEGRAM_WEBHOOK_ID: ${{ secrets.TELEGRAM_WEBHOOK_ID }}
        TELEGRAM_WEBHOOK_TOKEN: ${{ secrets.TELEGRAM_WEBHOOK_TOKEN }}
        TELEGRAM_DISABLE_NOTIFICATION: true
        SLACK_WEBHOOK_ID: ${{ secrets.SLACK_WEBHOOK_ID }}
        TEXT_MESSAGE: |
          A T E N Ç Ã O #

          Usuário: ${{ github.actor }}
          Repositório: ${{ github.repository }}
          Referência: ${{ github.ref }}
          Namespace: PRODUTION
```

```
on: push
jobs:
  notify-discord:
    runs-on: ubuntu-latest
    steps:
    - name: notify discord in curl
      uses: roanfranklin/action-notify@master
      env:
        DISCORD_WEBHOOK_ID: ${{ secrets.DISCORD_WEBHOOK_ID }}
        DISCORD_WEBHOOK_TOKEN: ${{ secrets.DISCORD_WEBHOOK_TOKEN }}
        TEXT_MESSAGE: |
          A T E N Ç Ã O #

          Usuário: ${{ github.actor }}
          Repositório: ${{ github.repository }}
          Referência: ${{ github.ref }}
          Namespace: PRODUTION
```

```
on: push
jobs:
  notify-telegram:
    runs-on: ubuntu-latest
    steps:
    - name: notify telegram in curl
      uses: roanfranklin/action-notify@master
      env:
        TELEGRAM_WEBHOOK_ID: ${{ secrets.TELEGRAM_WEBHOOK_ID }}
        TELEGRAM_WEBHOOK_TOKEN: ${{ secrets.TELEGRAM_WEBHOOK_TOKEN }}
        TEXT_MESSAGE: |
          A T E N Ç Ã O #

          Usuário: ${{ github.actor }}
          Repositório: ${{ github.repository }}
          Referência: ${{ github.ref }}
          Namespace: PRODUTION
```

```
on: push
jobs:
  notify-slack:
    runs-on: ubuntu-latest
    steps:
    - name: notify slack in curl
      uses: roanfranklin/action-notify@master
      env:
        SLACK_WEBHOOK_ID: ${{ secrets.SLACK_WEBHOOK_ID }}
        TEXT_MESSAGE: |
          A T E N Ç Ã O #

          Usuário: ${{ github.actor }}
          Repositório: ${{ github.repository }}
          Referência: ${{ github.ref }}
          Namespace: PRODUTION
```
**OBS.: Ainda não testado a notificação para o slack.**


### Docker
```
docker run --rm $(docker build -q .) \
  https://httpbin.org/get
```


## Author
[Roan Franklin](https://github.com/roanfranklin) _roanfranklin@gmail.com_