Scriptname CS_ThroneActivate extends ReferenceAlias

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		debug.notification("Throne Activated")
	endif
EndEvent
