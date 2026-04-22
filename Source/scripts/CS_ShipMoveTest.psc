Scriptname CS_ShipMoveTest extends ObjectReference

Event OnActivate(ObjectReference akActionRef)
	debug.notification("Button activated")
	Ship.TranslateToRef(MoveMarker, 100)
EndEvent

ObjectReference Property Ship  Auto  

ObjectReference Property MoveMarker  Auto  
