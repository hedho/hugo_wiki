---
title: "How to Setup Nginx Phpfpm"
author: monaco
date: 2022-02-04T02:43:44+01:00
slug: 2022-02-04-how-to-setup-nginx-phpfpm
type: posts
categories:
  - Linux
  - Debian
tags:
  - Linux
  - Debian
---
Install PHP7.4

By default, Debian ships with PHP 7.4 in its upstream repositories. You can install it easily by just running the following command:

    apt-get install php7.4 -y

Once the PHP is installed, verify the installed version with the following command:

    php --version

You should get the following output:

PHP 7.4.3 (cli) (built: Oct 6 2020 15:47:56) ( NTS ) Copyright (c) The PHP Group Zend Engine v3.4.0, Copyright (c) Zend Technologies

    with Zend OPcache v7.4.3, Copyright (c), by Zend Technologies

PHP configurations related to Nginx is stored in /etc/php/7.4/fpm/php.ini file. You can modify it for better performance. Install PHP7.4-FPM and Other Extensions

Nginx does not contain native PHP processing. So you will need to install PHP-FPM for processing the PHP files. FPM is an alternative PHP FastCGI implementation with some additional features useful for heavy-loaded sites.

You can install PHP7.4-FPM with other necessary extensions by running the following command:

    apt-get install php7.4-fpm php7.4-cli php7.4-mysql php7.4-curl php7.4-json -y

Once all the packages are installed, start the PHP7.4-FPM service and enable it to start at system reboot:

    systemctl start php7.4-fpm systemctl enable php7.4-fpm

Configure Nginx to Process PHP Files

Next, you will need to configure Nginx to process PHP files.

To do so, create a new Nginx virtual host configuration file with the following command:

    nano /etc/nginx/sites-available/example

Add the following lines:

    server {
            listen 80;
            server_name test.example.com;
            root /var/www/html;
            index info.php;
    
        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/run/php/php7.4-fpm.sock;
        }
    
    }

Save and close the file then enable the Nginx virtual host configuration file with the following command:

    ln -s /etc/nginx/sites-available/example /etc/nginx/sites-enabled/

Next, verify the Nginx for any syntax error with the following command:

    nginx -t

You should get the following output:

> nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
> nginx: configuration file /etc/nginx/nginx.conf test is successful

Finally, restart the Nginx service to apply the configuration changes:

    systemctl restart nginx

Next, create a info.php file to verify the PHP version:

    nano /var/www/html/info.php

Add the following code:
```php
    <?php phpinfo(); ?>
```
Save and close the file when you are finished. Verify PHP

At this point, Nginx is configured to process PHP files. Its time to test it.
