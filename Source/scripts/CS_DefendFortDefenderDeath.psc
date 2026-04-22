Scriptname CS_DefendFortDefenderDeath   extends ReferenceAlias

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_DefendFortTroopDeathDefender).TroopDeathPlayer(self)
EndEvent