Scriptname CS_ActivateBatteringRam extends ObjectReference  

Faction Property CommanderFactionImp Auto
Faction Property CommanderFactionSons Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef as Actor).IsInFaction(CommanderFactionImp) || (akActionRef as Actor).IsInFaction(CommanderFactionSons)
		GetLinkedRef().enable()
		(akActionRef as Actor).EvaluatePackage()
		self.disable()
	endif
EndEvent