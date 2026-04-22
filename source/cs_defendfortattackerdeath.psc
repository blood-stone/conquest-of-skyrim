Scriptname CS_DefendFortAttackerDeath extends ReferenceAlias  

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_DefendFortTroopDeathAttacker).TroopDeathAttacker(self)
EndEvent