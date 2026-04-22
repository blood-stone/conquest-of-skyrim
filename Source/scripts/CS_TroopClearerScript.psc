Scriptname CS_TroopClearerScript extends ObjectReference  

Faction Property AllyFaction  Auto  

Event OnTrigger(ObjectReference akTriggerRef)
	Actor TriggerRefActor = akTriggerRef as actor
	If TriggerRefActor.GetActorBase() == Guard
		TriggerRefActor.kill()
	EndIf
	If TriggerRefActor.GetActorBase() == Guard2
		TriggerRefActor.kill()
	EndIf
EndEvent
ObjectReference Property ThisTriggerBox  Auto  

ActorBase Property Guard  Auto  

ActorBase Property Guard2  Auto  
