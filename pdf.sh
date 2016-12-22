#!/bin/sh



mkdir build


gitbook pdf ./zh-cn/workflow ./build/workflow-manual-zh-cn.pdf

gitbook pdf ./en-us/workflow ./build/workflow-manual-en-us.pdf

gitbook pdf ./zh-cn/drive ./build/drive-manual-zh-cn.pdf
