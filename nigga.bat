@echo off
chcp 65001 >nul
setlocal

:: =============================================
:: НАСТРОЙКИ — ИЗМЕНИТЕ ПОД СЕБЯ
:: =============================================

:: Токен вашего бота
set "BOT_TOKEN=6473970044:AAG82BXeNwdWLIYgS5qEEqKnc9ITjHzRVmE"

:: ID чата или пользователя, куда отправлять сообщение
set "CHAT_ID=5430443231"

:: Текст сообщения (можно с переносами и эмодзи)
set "MESSAGE=Привет! Этот батник только что запустился! 
Время: %DATE% %TIME%
Компьютер: %COMPUTERNAME%
Пользователь: %USERNAME%"

:: URL Telegram Bot API
set "URL=https://api.telegram.org/bot%BOT_TOKEN%/sendMessage"

:: =============================================
:: ОТПРАВКА СООБЩЕНИЯ
:: =============================================

curl -s -X POST "%URL%" ^
     -d chat_id=%CHAT_ID% ^
     -d text="%MESSAGE%" ^
     -d parse_mode=HTML ^
     --ssl-no-revoke >nul 2>&1

:: Если хотите видеть ответ API (для отладки) — раскомментируйте строку ниже:
:: curl -X POST "%URL%" -d chat_id=%CHAT_ID% -d text="%MESSAGE%" -d parse_mode=HTML

echo Сообщение отправлено в Telegram!
timeout /t 3 >nul
endlocal
exit /b
