# Software Install Script

基于 Winget 包管理器的 Windows 的软件批量安装脚本。  
本项目仅有**中文版本**。

> [!NOTE]
> 本项目宗旨：为了装机/重装系统提供便利。
> > 本项目会尽量避免使用 `msstore源` 或其他源的软件包

## 安装列表说明

可根据需要，在 `extended_list_readme.md` 中搜索软件，后将**软件包 ID** 添加到 `software_list.txt` 列表中。
或在 `CMD` 中使用命令: `winget search 关键词` 来搜索软件。

- Ps.也可用使用 WingetUI 进行查询，更方便:)

## 如何使用

1. 下载 [Software_Install_Script](https://github.com/NEANC/Software_Install_Script/releases/tag/v3.0)。
2. 运行 `start.bat` ，脚本会自动下载并安装在 `software_list.txt` 文件中所列出的软件。
   - Ps.可手动更换`software_install.bat`中的列表源链接，加速软件列表下载。

# License

本项目受 **Apache License Version 2.0** 约束
