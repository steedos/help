#!/bin/sh

mkdir build

gitbook pdf ./zh-cn/workflow ./build/workflow-zh-cn.pdf

gitbook pdf ./en-us/workflow ./build/workflow-en-us.pdf

gitbook pdf ./zh-cn/drive ./build/drive-zh-cn.pdf

gitbook pdf ./zh-cn/calendar ./build/calendar-zh-cn.pdf

gitbook pdf ./zh-cn/creator ./build/creator-zh-cn.pdf