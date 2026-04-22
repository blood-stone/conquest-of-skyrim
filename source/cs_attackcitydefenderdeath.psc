Scriptname CS_AttackCityDefenderDeath extends ReferenceAlias  

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_AttackCityTroopDeathDefender).TroopDeathDefender(self)
EndEvent