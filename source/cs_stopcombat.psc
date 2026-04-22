Scriptname CS_StopCombat extends ObjectReference  

Event OnTriggerEnter(ObjectReference akTriggerRef)
	Actor ActorRef = akTriggerRef as Actor
	ActorRef.StopCombat()
endEvent