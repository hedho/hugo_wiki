#!/bin/sh
doas hugo -D
doas cp -r public/* /var/www/htdocs/wiki/
