@echo off

REM ตั้งค่า working directory เป็นตำแหน่งที่คุณต้องการ
set "working_directory=C:\Users\Admin\Documents\GitHub\data-science-bootcamp9\09_Essential Python for Data Analyst\Project - Create and add table to SQL Server Database"

REM เปลี่ยน working directory เป็นตำแหน่งที่คุณต้องการ
cd /d "%working_directory%"

REM เก็บเวลาเริ่มต้นของการรัน
set "start_time=%TIME%"
REM เก็บวันที่และเวลาเริ่มต้นของการรัน
set "start_date=%DATE%"

REM รับชื่อไฟล์ที่จะรัน
set "filename=insert_orders.py"

echo Start running %filename% on %start_date% at %start_time%
echo Start running %filename% on %start_date% at %start_time% >> "runtime_log.txt"

REM รันไฟล์ Python และเก็บ output ไปยังไฟล์ log ใน working directory
"C:\Users\Admin\AppData\Local\Programs\Python\Python312\python.exe" "%filename%" >nul 2>nul

REM เก็บเวลาสิ้นสุดของการรัน
set "end_time=%TIME%"

REM แปลงเวลาเริ่มต้นและเวลาสิ้นสุดเป็นจำนวนวินาที
for /f "tokens=1-3 delims=:." %%a in ("%start_time%") do (
    set /a start_sec=10%%a%%100*3600 + 10%%b%%100*60 + 10%%c%%100
)
for /f "tokens=1-3 delims=:." %%a in ("%end_time%") do (
    set /a end_sec=10%%a%%100*3600 + 10%%b%%100*60 + 10%%c%%100
)

REM คำนวณเวลาที่ไฟล์ทำงานได้
set /a "elapsed_sec=end_sec-start_sec"
set /a "elapsed_hr=elapsed_sec/3600"
set /a "elapsed_min=(elapsed_sec%%3600)/60"
set /a "remainder_sec=elapsed_sec%%60"
echo %filename% Operating Time: %elapsed_hr% hours %elapsed_min% minutes %remainder_sec% seconds >> "runtime_log.txt"
echo Finished running