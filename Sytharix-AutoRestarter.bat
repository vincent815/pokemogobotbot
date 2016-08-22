@echo off
:begin
start /b PokeMobBot-SytharixEdit.exe
timeout /t 1200 > null
taskkill /f /im PokeMobBot-SytharixEdit.exe > null
goto begin
