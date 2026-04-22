Scriptname CS_DefendCampDefenderDeathScript extends ReferenceAlias  

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_DefendCampTroopDeathDefender).TroopDeathPlayer(self)
EndEvent