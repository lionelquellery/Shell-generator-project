#!/bin/bash
# Lucas front-project starter
#author : Lucas Martin
#github: lmarti17
#script use shell services

echo "Salut $USER Welcome in Front-starter generator" 
echo -e "Lucas install Shell: Nom du Projet"
read name
echo "project Name -> $name"

cd ;Sites/

git clone https://github.com/lmarti17/front-end-starter.git $name

cd $name

rm -rf .git
git init
npm install
gulp