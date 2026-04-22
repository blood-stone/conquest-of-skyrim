Scriptname CS_CityEventBeginScene extends ObjectReference  

Quest Property EventManager  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		(EventManager as CS_CityEventManagerScript).StartQuestScene()
		self.disable()
	endif
EndEvent