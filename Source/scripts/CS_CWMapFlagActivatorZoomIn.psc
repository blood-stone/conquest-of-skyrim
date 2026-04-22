Scriptname CS_CWMapFlagActivatorZoomIn extends ObjectReference  

Activator Property NewMap Auto

ObjectReference Property HoldMap Auto
ObjectReference Property OldMap Auto

Sound Property BookOpen Auto

Event OnActivate(ObjectReference akActivatorRef)
	self.disable()
	(OldMap as CS_CivilWarMapActivatorScript).SwitchMaps(NewMap, BookOpen)
EndEvent