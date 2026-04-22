Scriptname CS_AttackVillageFailQuest extends Quest  

LocationAlias Property Village  Auto  

Event OnUpdateGameTime()
	If Game.GetPlayer().IsInLocation(Village.GetLocation()) == 0
		SetStage(501)
		UnregisterForUpdateGameTime()
	EndIf
EndEvent