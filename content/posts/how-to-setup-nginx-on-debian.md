---
title: "How to Setup Nginx on Debian"
author: monaco
date: 2022-02-04T02:41:42+01:00
slug: 2022-02-04-how-to-setup-nginx-on-debian
type: posts
categories:
  - Linux
  - Debian
tags:
  - Linux
  - Debian
---
How to setup Nginx on Debian

First of all you would need to "ssh" to you're server:

    ssh user@127.0.0.1

After successfully loged in on you're server:

    sudo apt install nginx

Start Nginx:

    sudo systemctl start nginx

Enable to start at reboot:

    sudo systemctl enable nginx

Check Nginx status:

    systemctl status nginx  

> Output should be similar to:

    init@init ~ % systemctl status nginx
    ● nginx.service - A high performance web server and a reverse proxy server
         Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset:>
         Active: active (running) since Fri 2021-10-29 14:02:24 CEST; 1min 22s ago
           Docs: man:nginx(8)
        Process: 3813 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_proce>
        Process: 3815 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (c>
       Main PID: 3816 (nginx)
          Tasks: 3 (limit: 2201)
         Memory: 6.2M
            CPU: 49ms
         CGroup: /system.slice/nginx.service
                 ├─3816 "nginx: master process /usr/sbin/nginx -g daemon on; master>
                 ├─3817 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "">
                 └─3818 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "">
    init@init ~ % 

You're default web root path is:

    cd /var/www/html/

 `ls`

Output:

    init@init /var/www/html % ls
    index.nginx-debian.html
    init@init /var/www/html %

Curl you're server IP address should give you the output of "Welcome to nginx."

    curl 127.0.0.1

Output >

    init@init /var/www/html % curl 127.0.0.1
    <!DOCTYPE html>
    <html>
    <head>
    <title>Welcome to nginx!</title>
    <style>
        body {
            width: 35em;
            margin: 0 auto;
            font-family: Tahoma, Verdana, Arial, sans-serif;
        }
    </style>
    </head>
    <body>
    <h1>Welcome to nginx!</h1>
    <p>If you see this page, the nginx web server is successfully installed and
    working. Further configuration is required.</p>

    <p>For online documentation and support please refer to
    <a href="[http://nginx.org/](http://nginx.org/)">nginx.org</a>.<br/>
    Commercial support is available at
    <a href="[http://nginx.com/](http://nginx.com/)">nginx.com</a>.</p>

    <p><em>Thank you for using nginx.</em></p>
    </body>
    </html>
    init@init /var/www/html %

Edit or setup specific domain names on Nginx:

    cd /etc/nginx/sites-enabled/

Copy the default

    cp default example.domain

You will find there a helpful documentacion how to do that as example:

vim example.domain
```java
    server {
           listen 80;
           listen [::]:80;

           server_name example.domain;

           root /var/www/example.domain;
           index index.html;

           location / {
                   try_files $uri $uri/ =404;
           }
    }
```
