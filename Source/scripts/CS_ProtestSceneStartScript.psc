Scriptname CS_ProtestSceneStartScript extends ObjectReference  

Quest Property ProtestQuest Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		ProtestQuest.SetStage(20)
		self.disable()
	endif
EndEvent