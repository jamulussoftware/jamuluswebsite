- `-M` 또는 `--mutestream` 서버의 다른 사용자들이 내가 연주하는 것을 듣지 못하도록 차단하기
- `--mutemyown` 서버 믹스에서 내가 연주하는 것을 듣지 못하도록 차단하기 (헤드리스만 해당)
-  `-c` 또는 `--connect` 시작 시 지정된 서버 주소에 연결하고, `address[:port]` 형식 지정
-  `-j` 또는 `--nojackconnect` 자동 JACK 연결 비활성화
-  `--ctrlmidich` MIDI channel to listen on, Jamulus control + MIDI control
   number and count of consecutive CC numbers (or Jamulus channels), pick-up
   mode, device selection option. Format:
   `channel[;fn[*n]][;pn[*n]][;sn[*n]][;mn[*n]][;on][;u][;dDeviceName]` See
   [Tips &
   Tricks](Tips-Tricks-More#using---ctrlmidich-for-midi-controllers).
- `--clientname` 창 제목 및 JACK 클라이언트 이름
