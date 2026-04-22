Scriptname CS_AttackMinorCity extends ObjectReference  

Quest Property AttackQuest  Auto  
Location Property CityLocation Auto
LocationAlias Property CityLocationAlias Auto


Event OnTriggerEnter(ObjectReference akTriggerRef)
	If akTriggerRef == Game.GetPlayer()	
		AttackQuest.Start()
		CityLocationAlias.ForceLocationTo(CityLocation)	
		AttackQuest.SetStage(1)
	EndIf
EndEvent

