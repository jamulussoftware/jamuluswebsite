<!-- NOTE: This must apply to both Client and Server, and all operating systems -->

安装并运行后，您可能需要保留设置的副本。备份总是一个好主意，并且设置文件在 Jamulus
版本之间不向后兼容。所以如果你想回到以前的版本，你需要恢复你的设置。

要在 Windows 上查找您的设置文件，请在搜索栏中键入“%APPDATA%”并查找名为“Jamulus”的文件夹。此文件夹中将有一个或多个
`.ini` 文件。现在备份 Jamulus 的设置。

对于所有其他平台，请从命令行运行以下命令以查找其所在的位置并将文件复制到其他位置:

`find ~ -name Jamulus.ini -ls`

如果您使用 `--inifile` 参数将 inifile 保存到其他位置，请不要忘记同时备份这些文件。 **注意事项**

* 在 Jamulus 运行时不要备份或恢复设置文件。
* 不建议手动编辑设置文件(它们不是为此而设计的)。
* 您可以通过删除设置文件(关闭 Jamulus 后)将所有设置恢复为默认值。
