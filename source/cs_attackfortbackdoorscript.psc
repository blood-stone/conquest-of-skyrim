Scriptname CS_AttackFortBackDoorScript extends ObjectReference  

Quest Property AttackFortQuest Auto

Event OnTriggerEnter(ObjectReference akActivatorRef)
	if akActivatorRef == Game.GetPlayer()
		(AttackFortQuest as CS_AttackFortCampScript).LaddersActivated = true
		self.disable()
	endif
EndEvent