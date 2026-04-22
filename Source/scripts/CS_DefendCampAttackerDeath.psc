Scriptname CS_DefendCampAttackerDeath extends ReferenceAlias

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_DefendCampTroopDeathAttacker).TroopDeathAttacker(self)
EndEvent