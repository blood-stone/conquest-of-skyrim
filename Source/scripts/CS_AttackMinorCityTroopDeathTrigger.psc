Scriptname CS_AttackMinorCityTroopDeathTrigger extends ReferenceAlias  

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_AttackCityTroopDeath).TroopDeathPlayerMinor(self)
EndEvent