#!/bin/bash  

echo 'Building application'
cd frontend/

echo 'Installing node packages'

npm install

echo 'Building application with grunt'

grunt 

echo 'done'

echo '==================='
echo 'To build frontend use "grunt" or "grunt server" commands'
echo '==================='

