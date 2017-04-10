# Resin.io, Homebridge, SmartThings

Resin.io application for Homebridge and SmartThings

## Setting up your repository
Clone this repository and make customizations to the configuration for your site in the
`.homebridge/config.json` file.

1. Replace the username with a unique MAC address in all upper case
1. Replace the pin with a unique code for your installation
1. Make sure that app_url points to the smart things endpoint for your region ... where your developer account is located and hub claimed
1. Add the app_id and access_token from the `homebridge-smarthings` smart app
1. Add and commit your changes in git

```
{
    "bridge": {
        "name": "Homebridge",
        "username": "AA:BB:CC:DD:EE:FF",
        "port": 51826,
        "pin": "333-33-333"
    },
    "description": "Homebridge running on Resin.io",
    "accessories": [
    ],
    "platforms": [
        {
            "platform": "SmartThings",
            "name": "SmartThings",
            "app_url": "https://graph-na02-useast1.api.smartthings.com:443/api/smartapps/installations/",
            "app_id": "YOUR APP ID HERE",
            "access_token": "YOUR ACCESS TOKEN HERE"
        }
    ]
}
```

## Setting up resin.io

Create an account at resin.io if you don't have one and add your ssh key for git pushes.

Make an application called `HomeBridge` or whatever you like at
resin.io and add the git remote to the repository you cloned in the step above.

`git remote add resin yourusername@git.resin.io:yourusername/homebridge.git`

Download a ResinOS 1.x image configured for your network from the application menu
at the resin site and use Etcher to burn it to and SD card. After placing the card
into your RPI, wait a few mins for it to register and show up attached to your
application in the resin.io interface.

Push this version of your application into the resin build system for the first time using:

`git push -u resin master`

The first push will take a fairly long time as it needs to build and cache
the primary layers of the Docker image. Subsequent pushes will be much faster.

## Workflow

From now on, make changes to your configuration file in your repository and
commit them, and push the changes to resin to deploy them.

```
[edit stuff]
git add .
git commit -m "Stuff I changed"
git push resin master
```

Currently this only works with ResinOS 1.x because of an issue with avahi on 2.x

This repo is modified from a project (c) by Glavin Wiechert at https://github.com/Glavin001/resin-homebridge
