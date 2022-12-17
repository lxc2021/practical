#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    clear
    echo "错误：本脚本需要 root 权限执行。" 1>&2
    exit 1
fi

welcome() {
    echo "一键脚本出现任何问题请自行安装！ "
    echo ""
    echo "欢迎使用Linux便民工具"
}

apt_update() {
    echo "正在优化 apt-get . . ."
    apt-get install sudo -y >>/dev/null 2>&1
    apt-get update >>/dev/null 2>&1
}

apt_bash_check() {
    echo "正在检查 bash 安装情况 . . ."
    if command -v bash >>/dev/null 2>&1; then
        echo "bash 似乎存在, 继续 . . ."
    else
        echo "bash 未安装在此系统上，正在进行安装"
        apt-get install bash -y >>/dev/null 2>&1
    fi
}

apt_wget_check() {
    echo "正在检查 wget 安装情况 . . ."
    if command -v wget >>/dev/null 2>&1; then
        echo "wget 似乎存在, 继续 . . ."
    else
        echo "wget 未安装在此系统上，正在进行安装"
        apt-get install wget -y >>/dev/null 2>&1
    fi
}

DD() {
    echo "一键DD系统"
    read -p "请选择系统 Ubuntu输入u debian输入d：" D 
    read $D
    read -p "请选择系统版本号：" DD
    read $DD
    read -p "请输入系统密码：" DD
    echo "系统为$D,$DD,账号为root,密码为$password"
    read $password
    #bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/YYWO/practical/main/shell/InstallNET.sh') -$D $DD -v 64 -a -firmware -p $password
    
}
docker() {
    echo "一键换源安装docker"
    bash <(curl -sSL https://raw.githubusercontent.com/YYWO/practical/main/shell/DockerInstallation.sh)
}

shon_online() {
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
    echo "  7) 强制更新nodejs"
    echo "  8) 退出脚本"
    echo ""
    echo -n "请输入编号: "
    read N
    case $N in
    1) DD ;;
    2) docker ;;
    3) reinstall ;;
    4) cleansession ;;
    5) stop_pager ;;
    6) start_pager ;;
    7) restart_pager ;;
    8) exit ;;
    *) echo "Wrong input!" ;;
    esac
}
shon_online