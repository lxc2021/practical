#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    clear
    echo "错误：本脚本需要 root 权限执行。" 1>&2
    exit 1
fi
a=$(curl --noproxy '*' -sSL https://ip.zhp.asia/)
b="China"
## 统计脚本运行次数
COUNT=$(curl -sm1 "https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https://github.sanling.ml/YYWO/practical&count_bg=#79C83D&title_bg=#555555&icon=&icon_color=#E7E7E7&title=hits&edge_flat=false" 2>&1) &&
TODAY=$(expr "$COUNT" : '.*\s\([0-9]\{1,\}\)\s/.*')
TOTAL=$(expr "$COUNT" : '.*/\s\([0-9]\{1,\}\)\s.*')

DD() {
    echo "一键DD系统"
    read -p "请选择系统 Ubuntu输入u debian输入d：" xt 
    read -p "请选择系统版本号：" bb
    read -p "请输入系统密码：" password
    echo "系统为$D,$DD,账号为root,密码为$password"
if [[ $a == *$b* ]]
    then
    bash <(wget --no-check-certificate -qO- 'https://wget.sanling.ml/https://raw.githubusercontent.com/YYWO/practical/main/shell/InstallNET.sh') -$xt $bb -v 64 -a -firmware -p $password
fi
    bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/YYWO/practical/main/shell/InstallNET.sh') -$xt $bb -v 64 -a -firmware -p $password
    
}
docker() {
    echo "一键换源安装docker"
if [[ $a == *$b* ]]
    then
    bash <(curl -sSL https://wget.sanling.ml/https://raw.githubusercontent.com/YYWO/practical/main/shell/DockerInstallation.sh)
fi
    bash <(curl -sSL https://raw.githubusercontent.com/YYWO/practical/main/shell/DockerInstallation.sh)
    shon_online
}

cloudflare() {
    echo "一键cloudflare内网穿透"
if [[ $a == *$b* ]]
    then
    bash <(curl -sSL https://wget.sanling.ml/https://raw.githubusercontent.com/YYWO/practical/main/shell/Tunnel.sh)
fi
    bash <(curl -sSL https://raw.githubusercontent.com/YYWO/practical/main/shell/Tunnel.sh)
    shon_online
    }

nodejs() {
echo "1.安装/更新 最新长期支持版nodejs"
echo "2.安装/更新 最新当前发布版nodejs"
echo "3.安装/更新 指定版本nodejs"
read -p "请输入序号: " yn
 if [[ $yn == "1" ]];then
  bash <(curl -sSL 'https://github.sanling.ml/YYWO/practical/raw/main/shell/nodejs.sh') 
 elif [[ $yn == "2" ]];then
  bash <(curl -sSL 'https://github.sanling.ml/YYWO/practical/raw/main/shell/nodejs.sh') -l
 elif [[ $yn == "3" ]];then
  read -p "请选择所要安装的版本：" V
  bash <(curl -sSL 'https://github.sanling.ml/YYWO/practical/raw/main/shell/nodejs.sh') -v $V
  node -v
else
   green "输入有误，如有需要请重新运行"
   shon_online
fi


    }

filebrowser() {
    echo "docker安装filebrowser"
    read -p "请输入文件管理目录（默认/root）：" catalogue
	[ -z $catalogue ] && catalogue=/root
    read -p "请输入映射端口（默认80）：" filebrowserport
	[ -z $filebrowserport ] && filebrowserport=80
    sudo docker run -d     -v $catalogue:/srv     -e PUID=$(id -u)     -e PGID=$(id -g)     -p $filebrowserport:80     --name=filebrowser     --privileged=true     --restart always filebrowser/filebrowser
    shon_online
    }
    
frps() {
echo "1.Frps服务端安装"
echo "2.Frps服务端更新"
echo "3.Frps服务端卸载"
read -p "请输入序号: " yn
 if [[ $yn == "1" ]];then
  bash <(curl -sSL 'https://github.sanling.ml/MvsCode/frps-onekey/raw/master/install-frps.sh') install
 elif [[ $yn == "2" ]];then
  bash <(curl -sSL 'https://github.sanling.ml/MvsCode/frps-onekey/raw/master/install-frps.sh') update
 elif [[ $yn == "3" ]];then
  bash <(curl -sSL 'https://github.sanling.ml/MvsCode/frps-onekey/raw/master/install-frps.sh') uninstall
else
   green "输入有误，如有需要请重新运行"
   shon_online
fi
    }
    

shon_online() {
    echo ""
    echo ""
    echo "一键脚本出现任何问题请手动安装"
    echo ""
    echo "今日运行次数：$TODAY   总共运行次数：$TOTAL"
    echo ""
    echo "请选择您需要进行的操作:"
    echo "  0) 退出脚本"
    echo "  1) 一键DD系统"
    echo "  2) 一键换源安装docker"
    echo "  3) 一键cloudflare内网穿透"
    echo "  4) 安装/更新nodejs"
    echo "  5) docker安装filebrowser"
    echo "  6) Frps服务端一键配置脚本"  
    echo ""
    echo -n "请输入编号: "
    read N
    case $N in
    0) exit ;;
    1) DD ;;
    2) docker ;;
    3) cloudflare ;;
    4) nodejs ;;
    5) filebrowser ;;
    6) frps ;;
    *) echo "Wrong input!" ;;
    esac
}
shon_online
