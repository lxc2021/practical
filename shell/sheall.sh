#!/bin/bash
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
clear
green "
—————————————————————————————————————————————————————————————
               欢迎使用Linux便民工具箱
—————————————————————————————————————————————————————————————
"

[[ $(id -u) != 0 ]] && green "检测到当前环境非root用户，请先执行sudo su切换root用户执行脚本" && exit 1

green "1.一键DD系统"
green "2.一键换源安装docker"
green "3.一键cloudflare内网穿透"

read -p "请输入序号: " yn
 if [[ $yn == "1" ]];then
  bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/YYWO/practical/main/shell/InstallNET.sh') -u 20.04 -v 64 -a -firmware -p practical
 elif [[ $yn == "2" ]];then
  bash <(curl -sSL https://raw.githubusercontent.com/YYWO/practical/main/shell/DockerInstallation.sh)
 elif [[ $yn == "3" ]];then
  bash <(curl -sSL https://raw.githubusercontent.com/YYWO/practical/main/shell/Tunnel.sh)
else
   green "输入有误，脚本退出，如有需要请重新运行"
   exit 1
fi