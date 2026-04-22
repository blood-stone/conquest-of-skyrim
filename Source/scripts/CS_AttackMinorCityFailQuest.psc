Scriptname CS_AttackMinorCityFailQuest extends Quest  

LocationAlias Property City  Auto  

Event OnUpdateGameTime()
	If Game.GetPlayer().IsInLocation(City.GetLocation()) == 0
		SetStage(21)
		UnregisterForUpdateGameTime()
	EndIf
EndEvent