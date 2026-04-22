Scriptname CS_AttackCityTroopDeathTrigger extends ReferenceAlias  

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_AttackCityTroopDeathAttacker).TroopDeathPlayer(self)
EndEvent