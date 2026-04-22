Scriptname CS_AttackCampFortAttackerDeath   extends ReferenceAlias

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_AttackFortCampTroopDeathAttacker).TroopDeathPlayer(self)
EndEvent