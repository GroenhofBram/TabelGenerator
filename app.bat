@echo off
REM Optioneel: activeer eerst je virtuele omgeving als je die gebruikt
REM call "C:\pad\naar\je\venv\Scripts\activate.bat"

REM Zorg dat we in de map van dit .bat-bestand werken
cd /d "%~dp0"

echo Controleer of Streamlit aanwezig is...
py -c "import streamlit" >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Streamlit niet gevonden. Installeren...
    py -m pip install streamlit
    IF %ERRORLEVEL% NEQ 0 (
        echo Fout bij installatie van Streamlit. Controleer internet/rechten en probeer opnieuw.
        pause
        exit /b 1
    )
) ELSE (
    echo Streamlit is al geïnstalleerd.
)

echo.
echo Start Streamlit-app...
py -m streamlit run app.py ^
    --server.address=127.0.0.1 ^
    --server.port=8501 ^
    --browser.gatherUsageStats=false

pause