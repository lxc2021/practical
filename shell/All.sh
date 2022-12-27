#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    clear
    echo "错误：本脚本需要 root 权限执行。" 1>&2
    exit 1
fi

DD() {
    echo "一键DD系统"
    read -p "请选择系统 Ubuntu输入u debian输入d：" xt 
    read -p "请选择系统版本号：" bb
    read -p "请输入系统密码：" password
    echo "系统为$D,$DD,账号为root,密码为$password"
    bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/YYWO/practical/main/shell/InstallNET.sh') -$xt $bb -v 64 -a -firmware -p $password
    
}
docker() {
    echo "一键换源安装docker"
    bash <(curl -sSL https://raw.githubusercontent.com/YYWO/practical/main/shell/DockerInstallation.sh)
    shon_online
}

cloudflare() {
    echo "一键cloudflare内网穿透"
    bash <(curl -sSL https://raw.githubusercontent.com/YYWO/practical/main/shell/Tunnel.sh)
    shon_online
    }

nodejs1() {
    echo "安装/更新 最新长期支持版nodejs"
    bash <(curl -L https://raw.githubusercontent.com/YYWO/practical/main/shell/nodejs.sh)
    node -v
    shon_online
    }
nodejs2() {
    echo "安装/更新 最新当前发布版nodejs"
    bash <(curl -L https://raw.githubusercontent.com/YYWO/practical/main/shell/nodejs.sh) -l
    node -v
    shon_online
}
nodejs3() {
    echo "安装/更新 指定版本nodejs"
    read -p "请输入版本号：" node
    bash <(curl -L https://raw.githubusercontent.com/YYWO/practical/main/shell/nodejs.sh) -v $node
    node -v
    shon_online
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

shon_online() {
    echo ""
    echo ""
    echo "一键脚本出现任何问题请手动安装"
    echo ""
    echo ""
    echo "请选择您需要进行的操作:"
    echo "  1) 一键DD系统"
    echo "  2) 一键换源安装docker"
    echo "  3) 一键cloudflare内网穿透"
    echo "  4) 安装/更新 最新长期支持版nodejs"
    echo "  5) 安装/更新 最新当前发布版nodejs"
    echo "  6) 安装/更新 指定版本nodejs"
    echo "  7) docker安装filebrowser"
    echo "  8) 退出脚本"
    echo ""
    echo -n "请输入编号: "
    read N
    case $N in
    1) DD ;;
    2) docker ;;
    3) cloudflare ;;
    4) nodejs1 ;;
    5) nodejs2 ;;
    6) nodejs3 ;;
    7) filebrowser ;;
    8) exit ;;
    *) echo "Wrong input!" ;;
    esac
}
shon_online