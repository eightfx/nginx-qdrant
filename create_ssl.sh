#!/bin/bash
source ./.env

# ドメイン変数を設定
mydomain=${QDRANT_DOMAIN}

# プロジェクトのパスとドメイン
myprojectpath="/home/ubuntu/nginx"

chmod +x $myprojectpath/nginx/start_nginx.sh
sudo apt-get -y update
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y universe
sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get -y install certbot python3-certbot-nginx


sudo certbot --nginx -d $mydomain
# フォルダの作成
mkdir -p "$myprojectpath/certbot/conf/live/$mydomain"

# SSL証明書のコピー
sudo cp /etc/letsencrypt/live/$mydomain/fullchain.pem "$myprojectpath/certbot/conf/live/$mydomain/fullchain.pem"
sudo cp /etc/letsencrypt/live/$mydomain/privkey.pem "$myprojectpath/certbot/conf/live/$mydomain/privkey.pem"
sudo cp /etc/letsencrypt/live/$mydomain/chain.pem "$myprojectpath/certbot/conf/live/$mydomain/chain.pem"
sudo nginx -s quit
