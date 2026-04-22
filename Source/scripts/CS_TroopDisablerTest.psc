Scriptname CS_TroopDisablerTest extends ObjectReference

ActorBase Property Soldier  Auto  

Activator Property ThisActivator  Auto  

Event OnActivate(ObjectReference akActionRef)
	TroopClearer.enable()
EndEvent
ObjectReference Property TroopClearer  Auto  
