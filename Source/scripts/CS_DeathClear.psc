Scriptname CS_DeathClear extends ReferenceAlias  

Event OnDying(Actor akKiller)
	GetOwningQuest().Stop()
EndEvent