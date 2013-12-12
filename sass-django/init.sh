echo 'install requirements'

pip install -r requirements.txt


cd djangoproject/djangoproject/frontend

echo '=============================================='
echo 'Installing node packages'
echo '=============================================='

npm install

echo '=============================================='
echo 'Installing bower packages'
echo '=============================================='

bower install

echo '=============================================='
echo 'Building application with grunt'
echo '=============================================='

grunt 

echo 'done'

echo '=============================================='
echo 'To build frontend use "grunt" or "grunt server" commands'
echo '=============================================='



echo '=============================================='

cd ../../../
./local-server.sh
