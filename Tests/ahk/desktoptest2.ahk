#CommentFlag //
// check minimizetest.ahk
// create 2 strings: wingettitle and current window name.
// test to see if the wingettitle is minimized

image1 := "angel_1.jpg"
image2 := "angel_2.jpg"
image3 := "angel_3.jpg"
image4 := "angel_4.jpg"
currentImage = 1
changed := false
WinGetTitle, curWin, A
winName := curWin
didIt := false
Loop
{

	ifWinNotActive, Program Manager
	{
		WinGetTitle, curWin, A
		if(curWin != winName)
		{
			if(didIt = 0)
			{
				if(changed = 0)
				{
					if(currentImage = 1)
					{
						sleep, 500
						DllCall("SystemParametersInfo", UInt, 0x14, UInt, 0, Str, "C:\Users\dunhamjp1\Pictures\doctor who stuffs\" . image1, UInt, 1)
						currentImage := currentImage + 1
						changed = true
						
					}
					else if(currentImage = 2)
					{
						sleep, 500
						DllCall("SystemParametersInfo", UInt, 0x14, UInt, 0, Str, "C:\Users\dunhamjp1\Pictures\doctor who stuffs\" . image2, UInt, 1)
						currentImage := currentImage + 1
						changed = true

					}
					else if(currentImage = 3)
					{
						sleep, 500
						DllCall("SystemParametersInfo", UInt, 0x14, UInt, 0, Str, "C:\Users\dunhamjp1\Pictures\doctor who stuffs\" . image3, UInt, 1)
						currentImage := currentImage + 1
						changed = true


					}
					else
					{
						sleep, 500
						DllCall("SystemParametersInfo", UInt, 0x14, UInt, 0, Str, "C:\Users\dunhamjp1\Pictures\doctor who stuffs\" . image4, UInt, 1)
						currentImage := 1
						changed = true

					}
				}
			}
		}
	}
	else ifWinActive, Program Manager
	{
		changed := false
	}
	
	
}