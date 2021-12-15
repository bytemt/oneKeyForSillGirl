#!/bin/bash
color()
{
    green='\e[1;32m'
    res='\e[0m'
    yellow='\e[1;33m'
    echo -e ${green}
    clear
}

hello(){
    echo 1.debian/kali
    echo 2.centos
    echo 3.android
    echo 4.退出
    read -p "配置Golang环境到什么系统：" i
    echo -e ${res}
}
change()
{
    if [[ $i -eq 1 ]];then
        apt-get install wget -y
        url=https://dl.google.com/go/go1.16.7.linux-amd64.tar.gz
        wget $url
        tar -C /usr/local -xzf go1.16.7.linux-amd64.tar.gz
    elif [[ $i -eq 2 ]];then
        yum install wget -y
        url=https://dl.google.com/go/go1.16.7.linux-amd64.tar.gz
        wget $url
        tar -C /usr/local -xzf go1.16.7.linux-amd64.tar.gz
    elif [[ $i -eq 3 ]];then
        apt-get install wget -y
        url=https://dl.google.com/go/go1.16.7.linux-arm64.tar.gz
        wget $url
        tar -C /usr/local -xzf go1.16.7.linux-amd64.tar.gz
    elif [[ $i -eq 4 ]];then
        exit 1
    else
        exit 1
    fi
}

maingo()
{
    color
    GOROOT=/usr/local/go/bin
    GOPATH=/root/go
    GOBIN=/root/go/bin
    command='cat .profile|grep $ GOROOT'
    if [-n "$command"];then
        echo -e ${yellow}
        echo -e ${res}
        exit 1
    else
        hello
        change
        mkdir $HOME/go $HOME/go/src
        echo "export GOROOT=${GOROOT}">>$HOME/.profile
        echo "export GOPATH=${GOPATH}">>$HOME/.profile
        echo "export GOBIN=${GOBIN}">>$HOME/.profile
        echo "export PATH=\$PATH:${GOROOT}">>$HOME/.profile
        . $HOME/.profile
        echo -e ${green}
        echo "OK"
        echo -e ${res}
    fi
    sillyGirl
}

sillyGirl()
{
    s=sillyGirl;#检查系统是arm版还是x86_64版
    echo "检查系统是arm版还是x86_64版"
    a=arm64;
    if [[ $(uname -a | grep "x86_64") != "" ]];
        then a=amd64;
    fi ;
    #如果当前系统存在sillyGirl，先杀死
    echo "检查当前系统是否存在sillyGirl"
    pkill -9 $s;
    #检查当前目录有没有sillyGirl文件，如果有进入备份sillyGirl.cache文件

    #克隆sillyGirl库
    echo "开始克隆sillyGirl库"
    git clone https://ghproxy.com/https://github.com/cdle/sillyGirl.git;
    #进入sillyGirl文件夹
    if [[ $? == 0 ]]; then 
        sleep 3s 
        cd $s;
        sleep 3s 
    fi
    echo "进入sillyGirl文件夹"
    #获取dev.go文件
    echo "下载dev.go文件"
    wget https://ghproxy.com/https://raw.githubusercontent.com/hdbjlizhe/oneKeyForSillGirl/main/dev.go
    #进入develop文件夹
    if [[ $? == 0 ]]; then 
        cd develop;
    fi
    echo "进入develop文件夹，开始克隆常用库、返利库"
    #克隆一些必要的库
    git clone https://ghproxy.com/https://github.com/hdbjlizhe/fanli_jd.git;
    git clone https://ghproxy.com/https://github.com/hdbjlizhe/fanli_tb.git;
    git clone https://ghproxy.com/https://github.com/hdbjlizhe/fanli_pdd.git;
    git clone https://ghproxy.com/https://github.com/hdbjlizhe/fanli_vip.git;
    git clone https://ghproxy.com/https://github.com/ufuckee/jd_cookie.git;
    git clone https://ghproxy.com/https://github.com/cdle/jd_price.git;
    #编译
    if [[ $? == 0 ]]; then 
        cd ..;
        sleep 3s 
        echo "开始编译..."
        go build;
        echo "编译完成！！！"
    fi
}

if [ "$GOROOT" != "" ]; then
    echo "系统环境：$GOROOT，已存在"
    echo "当前系统已经安装了Go环境，开始安装sillyGirl，需要飞机！！！"
    sillyGirl
else
    echo "当前系统未安装GO环境，开始安装Go环境，需要飞机！,如果没有飞机请选择退出！！！"
    maingo
fi
