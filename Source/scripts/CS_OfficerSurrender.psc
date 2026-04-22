Scriptname CS_OfficerSurrender extends ReferenceAlias  

Faction Property EnemyFaction1 Auto
Faction Property EnemyFaction2 Auto
ReferenceAlias Property POW1 Auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if (akTarget == Game.GetPlayer())
		if (aeCombatState == 1)
			RegisterForUpdate(1)
		endif
	endif
EndEvent
	
Event OnUpdate()
	if Self.GetActorRef().IsBleedingOut() == 1
		debug.notification("Surrender Script Triggered")
		Self.GetActorRef().RemoveFromFaction(EnemyFaction1)
		Self.GetActorRef().RemoveFromFaction(EnemyFaction2)
		Self.GetActorRef().StopCombat()
		UnRegisterForUpdate()
	endif
endEvent


Idle Property OffsetBoundStandingStart  Auto  
