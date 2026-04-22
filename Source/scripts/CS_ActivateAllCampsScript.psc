Scriptname CS_ActivateAllCampsScript extends Quest  

FormList Property CampsImp  Auto  

FormList Property CampsSons  Auto  

Function ActivateCamps()
	int i = 0
	while i < CampsImp.GetSize()
		(CampsImp.GetAt(i) as ObjectReference).enable()
		(CampsSons.GetAt(i) as ObjectReference).enable()
		i += 1
	endwhile
EndFunction

Function DeActivateCamps()
	int i = 0
	while i < CampsSons.GetSize()
		(CampsSons.GetAt(i) as ObjectReference).disable()
		i += 1
	endwhile
EndFunction