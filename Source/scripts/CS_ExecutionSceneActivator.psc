Scriptname CS_ExecutionSceneActivator extends ObjectReference  

Quest Property ExecutionScene  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		ExecutionScene.SetStage(15)
		self.disable()
	endif
EndEvent