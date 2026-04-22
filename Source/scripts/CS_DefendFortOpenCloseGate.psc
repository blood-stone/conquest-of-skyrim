Scriptname CS_DefendFortOpenCloseGate extends ObjectReference  

Event OnActivate(ObjectReference akActivator)
	if GetLinkedRef().IsEnabled()
		GetLinkedRef().disable()
	else
		GetLinkedRef().enable()
	endif
EndEvent