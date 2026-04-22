Scriptname CS_DefendCityAttackerScript   extends ReferenceAlias

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_DefendCityTroopDeathAttacker).TroopDeathAttacker(self)
EndEvent
