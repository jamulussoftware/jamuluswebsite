
[comment]: # (这是一个用于多个文档的包含文件)

- `-h` 者 `--help`           显示帮助文本         
- `-i` 或 `--inifile` 设置初始化文件的位置（覆盖默认值）
- `-n` 或 `--nogui` 禁用 GUI（用于 headless 模式）                      
- `-p` 或 `--port` 设置本地 UDP 端口号。默认为 22124
- `--jsonrpcport` 启用 JSON-RPC API 服务器来控制应用程序，设置 TCP 端口号（实验性，API 可能会更改;只能从 localhost 访问）。请参阅 [JSON-RPC API 文档文件](https://github.com/jamulussoftware/jamulus/blob/master/docs/JSON-RPC.md)。
- `--jsonrpcsecretfile` 使用 `--jsonrpcport` 时需要。设置包含用于访问 JSON-RPC API 的身份验证字符串的文本文件的路径。
- `-Q` 或 `--qos` 设置服务质量 DS 字段字节。默认值为 128 (DSCP/CS4)。 QoS 被 Windows 忽略。要启用它，[查看此页面](QOS-Windows)
- `-t` 或 `--notranslation` 禁用 UI 语言翻译
- `-6` 或 `--enableipv6` 启用 IPv6 寻址（始终启用 IPv4）
- `-v` 或 `--version` 输出版本信息并退出
