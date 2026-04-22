Scriptname CS_RiverwoodNPCCapture extends ObjectReference

ActorBase Property AttackGuard  Auto  

ObjectReference Property CaptureMarker  Auto  

Event OnTriggerEnter(ObjectReference akTriggerRef)
	Actor TriggerRefActor = akTriggerRef as actor
	If TriggerRefActor.IsInFaction(enemyFaction) == 1
		If TriggerRefActor.IsInCombat() == 0
			If TriggerRefActor.IsDead() ==0
				CaptureMarker.disable()
				debug.notification("Riverwood has been captured!")
			EndIf
		EndIf
	EndIf
EndEvent
Activator Property TriggerBox  Auto  

Faction Property enemyFaction  Auto  
