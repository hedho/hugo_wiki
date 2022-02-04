---
title: "How to Setup Weechat Relay on Openbsd"
author: monaco
date: 2022-02-04T01:21:18+01:00
author: monaco
slug: 2022-02-04-how-to-setup-weechat-relay-on-openbsd
type: posts
categories:
  - OpenBSD
  - Weechat
tags:
  - OpenBSD
  - Weechat
---
This document is the specification of WeeChat Relay protocol: the protocol used to relay WeeChat data to clients, which are mostly remote interfaces.

In this document, relay means WeeChat with relay plugin, which acts as “server” and allows clients to connect. Client mean the program you used to connect to your relay.

To use Weechat and Weechat Relay on OpenBSD you would need to follow those steps:

Note: Start this on tmux then you can detach from it and use it as a relay from glowing bear web interface

`$ weechat`

Note: Before you start setup Weechat Relay you will need to disable Listening to Ipv6 for it to work, at the moment it has an issue if Ipv6 is enabled for relay it binds only on Ipv6, it won’t be an issue if you do own an Ipv6.

For this after you open weechat you would need to run:

`/set relay.network.ipv6 off`

Relay setup

On the server’s instance of weechat:

```
/relay add ssl.irc 8001
/secure set relay WHATEVER_PASSWORD
/set relay.network.password "${sec.data.relay}"

```

On the server, to generate the ssl certificate using OpenSSL:

```
mkdir -p ~/.weechat/ssl
cd ~/.weechat/ssl
openssl req -nodes -newkey rsa:2048 -keyout relay.pem -x509 -days 365 -out relay.pem

```

Note: you can use acme-client as well

On the client’s instance of weechat:

```
/server add ircnow irc.ircnow.org
/connect ircnow
```
