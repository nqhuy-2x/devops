###Install Nginx
yum install epel-release
yum install nginx -y 

systemctl start nginx


###Port open Nginx
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload

###Install php
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

yum --disablerepo="*" --enablerepo="remi-safe" list php[7-9][0-9].x86_64

yum-config-manager --enable remi-php74

yum install php php-mysqlnd php-fpm -y

###change www.conf

vim /etc/php-fpm.d/www.conf

user = apache --> user = nginx
group = apache --> group = nginx

listen = /var/run/php-fpm/php-fpm.sock;

listen.owner = nginx
listen.group = nginx
listen.mode = 0660

####Config nginx

cd /etc/nginx/conf.d
echo 'server {
    listen       80;
    server_name  192.168.12.101;

    root   /usr/share/nginx/html;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }
    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;
    
    location = /50x.html {
        root /usr/share/nginx/html;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}' > /etc/nginx/conf.d/default.conf

###Test php with nginx
echo '<?php

phpinfo();' > /usr/share/nginx/html/info.php

###Test
192.168.12.102/info.php

