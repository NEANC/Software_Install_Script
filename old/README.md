# 如何使用

> [!TIP]
> 您应使用新版v3，而不是该版

1. 下载 [Software_Install_Script](https://github.com/NEANC/Software_Install_Script/releases/tag/v2.0)。
2. 运行 `software_install.bat` ，脚本会自动下载并安装在 `software_list.txt` 文件中所列出的软件。
   - Ps1.如打开了`v2rayN`但又不希望走代理的话，请使用`software_install_noproxy.bat`。
   - Ps2.可以手动更换`software_install.bat`中的列表源链接，加速软件列表下载。

## 文件目录及内容

| 文件名                                                       | 说明                             | 备注                                                                                 |
| :----------------------------------------------------------- | :------------------------------- | :----------------------------------------------------------------------------------- |
| [software_install.bat](software_install.bat)                 | 主安装执行脚本                   | 若打开了 `v2rayN`，会申请使用代理，不更改 `v2rayN` 默认端口                          |
| [software_install_proxy.bat](software_install_proxy.bat)     | 基于 `v2rayN` 代理的安装执行脚本 | 需要提前打开 `v2rayN`，且不更改默认端口                                              |
| [software_install_noproxy.bat](software_install_noproxy.bat) | 直连的安装执行脚本               |                                                                                      |
| [software_list.txt](software_list.txt)                       | 软件安装列表                     | 内置：[VisualCppRedist AIO](https://github.com/abbodi1406/vcredist) 和 `.NET 运行时` |
| [extended_list.txt](extended_list.txt)                       | 扩展列表                         |                                                                                      |
| [extended_list_readme.md](extended_list_readme.md)           | 扩展列表说明文件                 |                                                                                      |
