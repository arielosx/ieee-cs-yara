@echo off
REM --- Script de Simulacao de Virus ---
REM Autor: Grupo 1
REM Este script e apenas para fins educacionais e e inofensivo.

REM Define uma string unica para a deteccao com Yara
echo ASSINATURA_VIRUS_XYZ789

REM Muda a cor para um classico verde "hacker" sobre preto
color 0a

title Alerta de Sistema!

echo Acessando arquivos principais do sistema...
timeout /t 2 /nobreak > nul

start "Janela 1" cmd /c "color 4f && title Aviso! && echo Falha de seguranca detectada! && timeout /t 10"
start "Janela 2" cmd /c "color cf && title Erro Critico! && echo Iniciando despejo de memoria... && timeout /t 15"

echo.
echo Hackeando em progresso...
echo [¦¦¦                    ] 25%%

timeout /t 3 /nobreak > nul

start "Janela 3" cmd /c "tree C:\"
echo [¦¦¦¦¦¦¦¦¦¦¦¦¦          ] 60%%

timeout /t 3 /nobreak > nul

echo [¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦] 100%%
echo.
echo Hacking completo. Todos os seus arquivos pertencem a nos.

REM Cria um arquivo inofensivo na area de trabalho
echo Voce foi "hackeado"! > "%USERPROFILE%\Desktop\hackeado_pelo_virus.txt"

echo.
echo Seu sistema esta comprometido.
timeout /t 5 /nobreak > nul

exit
