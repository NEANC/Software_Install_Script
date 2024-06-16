# Software Install Script

基于 Winget 包管理器的 Windows 的软件批量安装脚本。

本项目目的为：为了**快速装机/重装系统**提供**便利**。

- Ps.本项目仅有中文版本。

## 安装列表说明

可根据需要，在 `extended_list_readme.md` 中搜索软件，后将**软件包 ID** 添加到 `software_list.txt` 列表中。  
或在 `CMD` 中使用命令: `winget search 关键词` 来搜索软件。

- Ps.也可用使用 WingetUI 进行查询，更方便:)

## 如何使用

1.将 `software_install.bat` 与 `software_list.txt` 下载到同一文件夹内。

2.运行 `software_install.bat` ，脚本会自动下载并安装在 `software_list.txt` 文件中所列出的软件。

- Ps.可以手动更换`software_install.bat`中的列表源链接，对 列表拉取 进行加速。

# License

本项目受 **Apache License Version 2.0** 约束
