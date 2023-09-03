
[주석]: # (이것은 여러 문서에서 사용하기위한 포함 파일입니다)

- `-h` 또는 `--help` 도움말 텍스트 표시
- `-i` 또는 `--inifile` 초기화 파일의 위치 설정(기본값을 재정의합니다. macOS에서는 구성 파일을
  `/Users/<username>/Library/Containers/io.jamulus에서만 읽을 수 있으므로 파일 이름만
  제공합니다. .Jamulus/Data/`. 서버의 경우 `io.jamulus.Jamulus`를
  `io.jamulus.JamulusServer`로 바꿉니다. 이 폴더를 보려면 Finder의 "보기 옵션 보기"에서 "라이브러리 폴더
  보기"를 켭니다.)
- `-n` 또는 `--nogui` GUI 비활성화(헤드리스 모드에서 사용)
- `-p` 또는 `--port` 로컬 UDP 포트 번호를 설정합니다. 기본값: 22124
- `--jsonrpcport` JSON-RPC API 서버를 활성화하여 앱을 제어하고 TCP 포트 번호를 설정합니다(실험적, API가
  변경될 수 있음, localhost에서만 액세스 가능). [JSON-RPC API 문서
  파일](https://github.com/jamulussoftware/jamulus/blob/main/docs/JSON-RPC.md)을
  참조하십시오.
- `--jsonrpcsecretfile` `--jsonrpcport`를 사용할 때 필요합니다. JSON-RPC API에 액세스하기 위한
  인증 문자열이 포함된 텍스트 파일의 경로를 설정합니다.
- `--jsonrpcbindip` JSON-RPC 서버가 바인딩해야 하는 IP 주소입니다. (선택 사항, 기본값은 127.0.0.1)
- `-Q` 또는 `--qos` 서비스 품질 DS 필드 바이트를 설정합니다. 기본값: 128(DSCP/CS4). QoS는
  Windows에서 무시됩니다. 활성화하려면 [이 페이지 참조](QOS-Windows)
- `-t` 또는 `--notranslation` UI 언어 번역 비활성화
- `-6` 또는 `--enableipv6` IPv6 주소 지정 활성화(IPv4는 항상 활성화됨)
- `-v` 또는 `--version` 버전 정보 출력하고 종료
