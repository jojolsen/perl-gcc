@echo off

echo locations should be entered as follows: c:\folder1\folder2\...\
set /p loca="Where is the file: "
set /p file1="Enter the .pl file name: "
set /p file2="Enter the name of the new .exe: "
pp -o %loca%%file2% %loca%%file1%
pause