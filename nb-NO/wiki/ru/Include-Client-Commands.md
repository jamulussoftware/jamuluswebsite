- `-M` или `--mutestream` Запретить другим на сервере слышать то, что я
  играю
- `--mutemyown` Запрещает мне слышать то, что я играю в миксе сервера
  (только для headless)
-  `-c` или `--connect` Подключение к заданному адресу сервера при запуске,
   формат `адрес[:порт]`
-  `-j` or `--nojackconnect` Отключение автоматического подключения JACK
-  `--ctrlmidich` MIDI channel to listen on, Jamulus control + MIDI control
   number and count of consecutive CC numbers (or Jamulus channels), pick-up
   mode, device selection option. Format:
   `channel[;fn[*n]][;pn[*n]][;sn[*n]][;mn[*n]][;on][;u][;dDeviceName]` See
   [Tips &
   Tricks](Tips-Tricks-More#using---ctrlmidich-for-midi-controllers).
- `--clientname` Заголовок окна и имя клиента JACK
