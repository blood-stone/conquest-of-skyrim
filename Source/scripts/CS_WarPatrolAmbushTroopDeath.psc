Scriptname CS_WarPatrolAmbushTroopDeath extends ReferenceAlias  

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_WarPatrolAmbushScript).PatrolTroopDeath(self, akKiller)
EndEvent