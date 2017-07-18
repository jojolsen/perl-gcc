@echo off

set /p toOpen="What do you want to open?"
if %toOpen%==A (
	start chrome 
	pause )
Else (
pause )
