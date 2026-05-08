@echo off
:: Painel de Vendas — Abre Chrome em modo kiosk (TV)
:: Execute este arquivo para iniciar o dashboard na TV

set "CHROME1=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "CHROME2=C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
set "FILE=%~dp0index.html"

:: Detecta onde o Chrome está instalado
if exist "%CHROME1%" (set "CHROME=%CHROME1%") else (set "CHROME=%CHROME2%")

if not exist "%CHROME%" (
  echo Chrome nao encontrado. Instale o Google Chrome e tente novamente.
  pause
  exit /b
)

:: Inicia Chrome em modo kiosk (fullscreen sem barra de endereco)
:: --disable-web-security: permite buscar dados do Google Sheets
:: --autoplay-policy: permite sons automaticos sem clicar
:: --user-data-dir: perfil separado para o kiosk
start "" "%CHROME%" ^
  --kiosk ^
  --disable-web-security ^
  --autoplay-policy=no-user-gesture-required ^
  --disable-features=TranslateUI ^
  --noerrdialogs ^
  --disable-infobars ^
  --user-data-dir="%TEMP%\painel-kiosk" ^
  --app="file:///%FILE:\=/%"
