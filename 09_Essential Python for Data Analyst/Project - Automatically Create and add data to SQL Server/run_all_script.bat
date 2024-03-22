@echo off 
echo Start to run all batch script!!!
 for /R %%x in (*.bat) do (
 if not "%%x" == "%~0" call "%%x" 
)
echo Complete to run all batch script!!

timeout /t 5 /nobreak