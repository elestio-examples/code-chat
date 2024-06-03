# Code Chat CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/code-chat"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Code Chat server with CI/CD on Elestio

<img src="code-chat.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Code Chat Docs here:

    https://[CI_CD_DOMAIN]/docs

You can open pgAdmin here:

    https://[CI_CD_DOMAIN]:38132/
    Login: [ADMIN_EMAIL]
    password: [ADMIN_PASSWORD]

# Using API

This README provides a basic tutorial on how to send a message in WhatsApp via the Code Chat API.

## Locate your token

Your token can be found in the environment variable located in `/opt/app/.env` with the name `AUTHENTICATION_GLOBAL_AUTH_TOKEN`. Alternatively, you can find it in your Elestio dashboard by clicking on `Update config` in the `Env` tab.

## Create a new instance

In a new terminal, execute the following `curl` command to create a new instance:

    curl -L -X POST 'https://[CI_CD_DOMAIN]/instance/create' \
    -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'apikey: <AUTHENTICATION_GLOBAL_AUTH_TOKEN>' \
    --data-raw '{
    "instanceName": "<YOUR_INSTANCE_NAME>"
    }'

Once done, a new token will be displayed. Store this token for future calls.

## Connecting to your instance

To connect to your instance, use this `curl` command:

    curl -L -X GET 'https://[CI_CD_DOMAIN]/instance/connectionState/<YOUR_INSTANCE_NAME>' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer <YOUR_INSTANCE_TOKEN>'

## Synchronizing

To synchronize your WhatsApp account with your instance, visit:

    https://[CI_CD_DOMAIN]/instance/qrcode/<YOUR_INSTANCE_NAME>

Click on `Generate qrcode` and scan it with your WhatsApp client.

## Adding a number

To add a number to your instance, use this `curl` command:

    curl --request POST \
    --url https://[CI_CD_DOMAIN]/chat/whatsappNumbers/<YOUR_INSTANCE_NAME> \
    --header 'Authorization: Bearer <YOUR_INSTANCE_TOKEN>' \
    --header 'Content-Type: application/json' \
    --data '{
    "numbers": [
        "your-number ex: 33610101010"
    ]
    }'

## Sending a message

To send a message, use this `curl` command:

    curl -L -X POST 'https://[CI_CD_DOMAIN]/message/sendText/<YOUR_INSTANCE_NAME>' \
    -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer <YOUR_INSTANCE_TOKEN>' \
    --data-raw '{
    "number": "your-number ex: 33610101010",
    "textMessage": {
        "text": "Hello, World!"
    },
    "options": {
        "delay": 0,
        "presence": "composing"
    }
    }'

# Documentation

For more information, visit:

- https://[CI_CD_DOMAIN]/docs
- https://docs.codechat.dev/api/v1.2.8
