s=sillyGirl;#检查系统是arm版还是x86_64版
echo "检查系统是arm版还是x86_64版"
a=arm64;
if [[ $(uname -a | grep "x86_64") != "" ]];
    then a=amd64;
fi ;
#如果当前系统存在sillyGirl，先杀死
echo "检查当前系统是否存在sillyGirl"
pkill -9 $s;
#$(pwd)/$s；
#进入etc目录
#echo "进入etc目录"
#cd /etc;
#克隆sillyGirl库
echo "开始克隆sillyGirl库"
git clone https://ghproxy.com/https://github.com/cdle/sillyGirl.git;
#进入sillyGirl文件夹
if [[ $? == 0 ]]; then 
    cd $s;
fi
echo "进入sillyGirl文件夹"
#获取dev.go文件
echo "下载dev.go文件"
wget https://raw.githubusercontent.com/hdbjlizhe/oneKeyForSillGirl/main/dev.go
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
    echo "开始编译..."
    cd ..;
    go build;
    echo "编译完成！！！"
fi
