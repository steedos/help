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

cd ./build/workflow-zh-cn
sed -i.bak "s/Published with GitBook/华炎云帮助中心/g" *.html
sed -i.bak "s/www.gitbook.com/www.steedos.com\/cn\/help/g" *.html
rm -r index.html.bak

cd ../../

cd ./build/workflow-en-us

sed -i.bak "s/Published with GitBook/Steedos Help Center/g" *.html
sed -i.bak "s/www.gitbook.com/www.steedos.com\/us\/help/g" *.html
rm -r index.html.bak

cd ../../

cd ./build/drive-zh-cn

sed -i.bak "s/Published with GitBook/华炎云帮助中心/g" *.html
sed -i.bak "s/www.gitbook.com/www.steedos.com\/cn\/help/g" *.html
rm -r index.html.bak
