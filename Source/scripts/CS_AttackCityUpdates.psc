Scriptname CS_AttackCityUpdates extends Quest  

LocationAlias Property City  Auto  

LocationAlias Property Palace  Auto  

ReferenceAlias Property EnemyJarl Auto

Event OnUpdateGameTime()
	If Game.GetPlayer().IsInLocation(City.GetLocation()) == 0
		SetStage(21)
		UnregisterForUpdateGameTime()
	EndIf
EndEvent

