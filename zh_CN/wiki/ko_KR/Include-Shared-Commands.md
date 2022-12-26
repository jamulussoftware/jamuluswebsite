
[주석]: # (이것은 여러 문서에서 사용하기위한 포함 파일입니다)

- `-h` 또는 `--help`         도움말 텍스트 표시         
- `-i` 또는 `--inifile`      초기화 파일의 위치 설정하기 (기본값 재정의)
- `-n` 또는 `--nogui`        GUI 비활성화(헤드리스 모드에서 사용)                      
- `-p` 또는 `--port`         로컬 UDP 포트 번호를 설정합니다. 기본값: 22124
- `--jsonrpcport`            JSON-RPC API 서버를 활성화하여 앱을 제어하고 TCP 포트 번호를 설정합니다(실험적, API가 변경될 수 있음, localhost에서만 액세스 가능). [JSON-RPC API 문서 파일](https://github.com/jamulussoftware/jamulus/blob/main/docs/JSON-RPC.md)을 참조하십시오.
- `--jsonrpcsecretfile`      `--jsonrpcport`를 사용할 때 필요합니다. JSON-RPC API에 액세스하기 위한 인증 문자열이 포함된 텍스트 파일의 경로를 설정합니다.
- `-Q` 또는 `--qos`          서비스 품질 DS 필드 바이트를 설정합니다. 기본값: 128(DSCP/CS4). QoS는 Windows에서 무시됩니다. 활성화하려면 [이 페이지 참조](QOS-Windows)
- `-t` 또는 `--notranslation`   UI 언어 번역 비활성화
- `-6` 또는 `--enableipv6`    IPv6 주소 지정 활성화(IPv4는 항상 활성화됨)
- `-v` 또는 `--version`       버전 정보 출력하고 종료
