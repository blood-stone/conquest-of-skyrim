Scriptname CS_BatteringRamRopeScript extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)
	GetLinkedRef().Activate(akActionRef)
	(akActionRef as Actor).EvaluatePackage()
EndEvent