Scriptname CS_DefendCityTroopDeathTrigger extends ReferenceAlias  

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_DefendCityTroopDeath).TroopDeathPlayer(self)
EndEvent