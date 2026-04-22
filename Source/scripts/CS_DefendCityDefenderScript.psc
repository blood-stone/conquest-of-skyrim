Scriptname CS_DefendCityDefenderScript   extends ReferenceAlias

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_DefendCityTroopDeathDefender).TroopDeathPlayer(self)
EndEvent