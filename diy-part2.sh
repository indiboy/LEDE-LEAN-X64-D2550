#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# 修改机器名称
sed -i 's/OpenWrt/D2550/g' package/base-files/files/bin/config_generate

# 修改网关地址
sed -i 's/192.168.1.1/192.168.15.1/g' package/base-files/files/bin/config_generate

# 修改banner
rm -rf package/base-files/files/etc/banner
cp -f ../banner package/base-files/files/etc/

echo '集成diy目录'
ln -s ../../diy ./package/openwrt-packages

# 下载ServerChan
git clone https://github.com/tty228/luci-app-serverchan ../diy/luci-app-serverchan

# 下载AdGuard Home
git clone https://github.com/rufengsuixing/luci-app-adguardhome ../diy/luci-app-adguardhome

# 首页增加CPU频率动态显示
cp -f ../diy/mod-index.htm ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

# 更改默认主题为Argon
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' package/feeds/luci/luci/Makefile
# git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06 package/mine/luci-theme-argon_new
# sed -i 's/luci-theme-bootstrap/luci-theme-argon_new/g' package/feeds/luci/luci/Makefile

# 复杂的AdGuardHome的openwrt的luci界面
# git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/mine/luci-app-adguardhome

# DiskMan for LuCI (WIP)
# git clone https://github.com/lisaac/luci-app-diskman.git package/mine/luci-app-diskman
# mkdir -p package/mine/parted && cp -i package/mine/luci-app-diskman/Parted.Makefile package/mine/parted/Makefile

# HelloWorld
# sed -i 's/#src-git helloworld/src-git helloworld/g' feeds.conf.default

# KPR plus+
# git clone https://github.com/project-openwrt/luci-app-koolproxyR.git package/mine/luci-app-koolproxyR

# Server酱
# git clone https://github.com/tty228/luci-app-serverchan.git package/mine/luci-app-serverchan

# FileBrowser
# git clone https://github.com/project-openwrt/FileBrowser.git package/mine/FileBrowser

# 网易云音乐
# git clone https://github.com/project-openwrt/luci-app-unblockneteasemusic.git package/mine/luci-app-unblockneteasemusic

# OpenClash
# git clone https://github.com/vernesong/OpenClash.git package/mine/OpenClash

# 网易云音乐GoLang版本
# git clone https://github.com/project-openwrt/luci-app-unblockneteasemusic-go.git package/mine/luci-app-unblockneteasemusic-go

# 网易云音乐mini
# git clone https://github.com/project-openwrt/luci-app-unblockneteasemusic-mini.git package/mine/luci-app-unblockneteasemusic-mini

# disable usb3.0
# git clone https://github.com/rufengsuixing/luci-app-usb3disable.git package/mine/luci-app-usb3disable

# 管控上网行为
# git clone https://github.com/destan19/OpenAppFilter.git package/mine/OpenAppFilter

# Rclone-OpenWrt
# git clone https://github.com/ElonH/Rclone-OpenWrt.git package/mine/Rclone-OpenWrt