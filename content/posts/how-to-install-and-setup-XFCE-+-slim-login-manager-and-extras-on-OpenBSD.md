---
title: "How to Install and Setup XFCE + Slim Login Manager and Extras on OpenBSD"
author: "monaco"
date: 2022-02-04T01:46:40+01:00
slug: 2022-02-04-how-to-install-and-setup-xfce-+-slim-login-manager-and-extras-on-openbsd
type: posts
categories:
  - OpenBSD
  - XFCE
tags:
  - OpenBSD
  - XFCE
---

This is a step by step how-to Install XFCE on OpenBSD and setup it.

So we start by applying thise commands at terminal:

```
usermod -G wheel user
usermod -G operator user
usermod -G staff user

```

After you put the permissions at the user you want to use follow this:

```
pkg_add nano
nano /etc/doas.conf
permit persist keepenv user

```

Start installing xfce packages and necessary packages needed for XFCE:

```
pkg_add xfce consolekit2
pkg_add slim dbus avahi

```

Add thise lines at /root/.xinitrc and at the specific user you want to use:

```
nano /root/.xinitrc
"exec ck-launch-session startxfce4"
nano /home/user/.xinitrc
"exec ck-launch-session startxfce4"

```

Add slim to rc.local for autostart after boot:

```
nano /etc/rc.local
"/usr/local/bin/slim -d"

```

Enable other services needed for xfce via rcctl:

```
rcctl enable messagebus
rcctl enable avahi_daemon
rcctl disable xenodm

```

And in the end restart:

```
reboot

```

Have a great time at the end :) enjoying:

![](https://i.ibb.co/Bnh952y/openbsdxfce.jpg)
