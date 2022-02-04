---
title: "How to Install Kissmo Paste"
date: 2022-02-04T02:47:37+01:00
slug: 2022-02-04-how-to-install-kissmo-paste
author: monaco
type: posts
categories:
  - HTTPD
  - Linux
  - OpenBSD
tags:
  - KISSmo
---
Go to the desired directory with commands as follow:

**cd /var/www/websiteyouwant**  - This can be any location you put you're web.

**wget  [https://gitlab.com/hedho/KISSmo/-/archive/main/KISSmo-main.zip](https://gitlab.com/hedho/KISSmo/-/archive/main/KISSmo-main.zip)**

Then unzip:

**unzip KISSmo-main.zip**

Edit index.php:

Replace line  **7**  where you will find:

**$ncsite="paste.oddprotocol.org 7777";**

Edit it to:

$ncsite="yourweb.tld 7777";

Replace line  **60**  where you will find:

**$sitename = "[https://paste.oddprotocol.org/p](https://paste.oddprotocol.org/p)";**

Edit it to:

**$sitename = "[https://youreweb.tld/p](https://youreweb.tld/p)";**

If you're using  **OpenHTTPD**  you will need to add this to  **/etc/httpd.conf**:

Under you're specific site that you're looking to run KISSmo add this:

	location "/test/p/*" { 
		directory { auto index, index "index.txt" }
	}

If you're using  **Nginx**  you will need to add this to /etc/nginx.conf or if you're running specific nginx conf for a specific site you know where it is:
```php
    location /p/ {
   alias /home/admin/web/paste.oddprotocol.org/public_html/p/;
   index index.txt;
   autoindex on;

}
```

Running KISSmo actually:

[https://paste.oddprotocol.org](https://paste.oddprotocol.org/)

About KISSmo:  [https://paste.oddprotocol.org/about.html](https://paste.oddprotocol.org/about.html)
