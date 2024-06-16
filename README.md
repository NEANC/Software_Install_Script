# Software Install Script

基于 Winget 包管理器的 Windows 的软件批量安装脚本。

本项目目的为：为了**快速装机/重装系统**提供**便利**。

## 安装列表说明

可根据自己的需求，在终端中使用命令 `winget search 关键词` 来搜索安装包，将 ID 添加到软件安装列表中。

- Ps.可用使用 WingetUI 进行查询，但是您都使用 WingetUI 了，为什么还要编辑 `software_list.txt` 呢？

## 如何使用

1.将 `software_install.bat` 与 `software_list.txt` 下载到同一文件夹内。

2.运行 `software_install.bat` ，脚本会自动下载并安装在列表文件中的软件。

- Ps.可以手动更换`software_install.bat`中的列表源链接，对 列表拉取 进行加速。

# License

本项目受 **Apache License Version 2.0** 约束
