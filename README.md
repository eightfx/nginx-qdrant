
# Table of Contents

1.  [What is this?](#org34a8404)
2.  [What can it do?](#orgdd22e96)
3.  [Strengths](#org7d5734e)
    1.  [Secure API calls with SSL](#org73cd3f5)
    2.  [Automatic SSL renewal](#org2b50f4e)
    3.  [Set your own Qdrant API key](#org031d34b)
    4.  [Automatic API setup on custom domains with Nginx](#orgab88fa6)
4.  [How to use it](#orgcb012c3)
    1.  [Clone the repository with git.](#org982ed8d)
    2.  [Create a .env file](#org72abebb)
    3.  [Edit qdrant/conf.yaml](#orgc7bd778)
    4.  [Deploy](#org828bcd9)


<a id="org34a8404"></a>

# What is this?

This repository contains Docker configuration for running Qdrant with Nginx and SSL.


<a id="orgdd22e96"></a>

# What can it do?

It enables the easy implementation of Qdrant API for custom domains.


<a id="org7d5734e"></a>

# Strengths


<a id="org73cd3f5"></a>

## Secure API calls with SSL

Even if you include a secret key in the Header, it will be encrypted and secure.


<a id="org2b50f4e"></a>

## Automatic SSL renewal

Once you execute docker compose up, the SSL certificate will be automatically renewed internally.


<a id="org031d34b"></a>

## Set your own Qdrant API key

You can set your own API key, so you can expose your API safely.


<a id="orgab88fa6"></a>

## Automatic API setup on custom domains with Nginx

You can implement the Qdrant API for <https://your-domain.com/>.


<a id="orgcb012c3"></a>

# How to use it


<a id="org982ed8d"></a>

## Clone the repository with git.


<a id="org72abebb"></a>

## Create a .env file

Set QDRANT<sub>DOMAIN</sub> to the domain where you want to implement the API.


<a id="orgc7bd778"></a>

## Edit qdrant/conf.yaml

Set the api<sub>key</sub> to your own sufficiently long secret key.


<a id="org828bcd9"></a>

## Deploy

You need to obtain an SSL certificate in advance and save it to this repository. Therefore, execute create<sub>ssl.sh</sub>.

    chmod +x create_ssl.sh
    sudo ./create_ssl.sh
    
    sudo docker-compose up -d

