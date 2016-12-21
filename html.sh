mkdir build

cd ./zh-cn/workflow
gitbook build
mv _book ../../build/workflow-zh-cn

cd ../../

cd ./en-us/workflow
gitbook build
mv _book ../../build/workflow-en-us

cd ../../

cd ./zh-cn/drive
gitbook build
mv _book ../../build/drive-zh-cn

cd ../../
