Scriptname CS_StartFactionMenu extends Quest  

Message Property StartFactionMenu  Auto  

Function MenuStart(int Response = 0)
	Response = StartFactionMenu.show()
	if Response == 0
		SetStage(0)
	endif
endFunction
