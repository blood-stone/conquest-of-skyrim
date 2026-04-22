Scriptname CS_AttackMinorCityDefenderDeath extends ReferenceAlias  

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_AttackCityTroopDeath).TroopDeathMinor(self)
EndEvent