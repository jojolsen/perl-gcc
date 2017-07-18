#CommentFlag //
loop
{
	
	WinGet MMX, MinMax, A
	WinGetTitle, curWin, A
	
	if(MMX = -1)
	{
		
		msgbox, %curWin% is minimized - mmx = %mmx%
	}

}