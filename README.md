### 如何将md文件转换为html、pdf文件？

 ```
 cd 到help文件夹下

 ```

#### 安装     
(全局安装gitbook)
mac／linux终端执行：./install.sh

#### 编译html  
(编译html文件。程序会自动在根目录下创建build文件夹，并把编译后到中文，英文<index.html>放在build文件夹下)
mac/linux终端运行：./html.sh

将'_book'下的html中的
<a href="https://www.gitbook.com" target="blank" class="gitbook-link">
            Published with GitBook
        </a>
替换为
<a href="https://www.steedos.com/cn/help/" target="blank" class="gitbook-link">
            华炎云帮助中心
        </a>
或
<a href="https://www.steedos.com/us/help/" target="blank" class="gitbook-link">
            Steedos Help Center
        </a>


#### 编译pdf
(首先下载gitbook,  https://calibre-ebook.com, 安装好后，
  mac终端执行：$ sudo ln -s ~/Applications/calibre.app/Contents/MacOS/ebook-convert /usr/local/bin
  linux终端执行：$sudo ln -s /usr/bin/nodejs /usr/bin/node
  编译后到文件放在build文件夹下)


mac/linux终端运行：./pdf.sh



注：
官方参考文档：https://github.com/GitbookIO／gitbook／
