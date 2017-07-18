@echo off
:MAIN
echo.
echo.
echo.
echo Welcome to a basic quiz game.
echo.
echo To start the game, type A and press ENTER.
echo To see instructions for the game, type B and press ENTER.
echo To quit, type C and press ENTER.
set /p input=COMMAND?
if %input%==A goto GAME
if %input%==B goto INST
if %input%==C exit
:INST
type INST.txt
echo.
echo.
echo To start the game, type A and press ENTER.
echo To return to the main screen, type B and press ENTER.
echo To quit, type C and press ENTER.
set /p input=COMMAND?
if %input%==A goto GAME
if %input%==B goto MAIN
if %input%==C exit
:GAME
echo In most cars, the engine is located under the...
echo A. Trunk
echo B. Hood
echo C. Roof
echo D. Wheel
set /p input=ANSWER?
if %input%==B goto 2
goto WRONG
:WRONG
echo Sorry, that is incorrect. Press any key to return to the main screen.
pause
REM (this pauses the program until a key is pressed)
goto MAIN
:2
echo The taillights are located on the BLANK end of the car.
echo A. Rear
echo B. Front
echo C. Left
echo D. Right
set /p input=ANSWER?
if %input%==A goto 3
goto WRONG
:3
echo Windshield wipers do what?
echo A. Serve as ballast on submersible cars
echo B. Remove dust from the car by using little fans
echo C. Wipe the windshield of water and/or dirt
echo D. Serve as decoration
set/p input=ANSWER?
if %input%==C goto WIN
goto WRONG
:WIN
type carAscii.txt
echo.
echo.
set/p input=RETURN TO MAIN SCREEN(Y/N)?
if %input%==Y goto MAIN
if %input%==N exit