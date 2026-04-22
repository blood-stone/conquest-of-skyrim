Scriptname CS_AttackCityTriggerNextPhase extends ObjectReference  

Quest Property AttackCityQuest Auto

Faction Property PlayerArmyFaction Auto

int Property NextStage Auto

Event OnTriggerEnter(ObjectReference akTriggerRef)
	if akTriggerRef == Game.GetPlayer() || (akTriggerRef as Actor).IsInFaction(PlayerArmyFaction)
		disable()
		if AttackCityQuest.GetStage() < NextStage
			AttackCityQuest.SetStage(NextStage)
		endif
	endif
EndEvent