npm install gitbook-cli -g

cd ./zh-cn/workflow
npm rebuild
gitbook install

cd ../../

cd ./zh-cn/driver
npm rebuild
gitbook install
