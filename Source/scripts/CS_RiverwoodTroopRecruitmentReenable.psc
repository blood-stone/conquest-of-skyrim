Scriptname CS_RiverwoodTroopRecruitmentReenable extends ObjectReference  

ObjectReference Property Marker1  Auto  

ObjectReference Property Marker2  Auto  

ObjectReference Property Marker3  Auto  

GlobalVariable Property Refresh  Auto  

Function TimePassed()
	RegisterForUpdateGameTime(24)
endFunction

Event OnUpdateGameTime()
	If Marker3.IsDisabled() == 1
		Marker1.enable()
		Marker2.enable()
		Marker3.enable()
		UnregisterForUpdateGameTime()
	EndIf
endEvent

