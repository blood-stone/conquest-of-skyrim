Scriptname CS_AttackWhiterunTrigger extends ObjectReference  

Quest Property AttackQuest  Auto  

Event OnTriggerEnter(ObjectReference akTriggerRef)
	If akTriggerRef == Game.GetPlayer()
		AttackQuest.SetStage(11)
		SceneQuest1.stop()
		SceneQuest2.stop()
	EndIf
	self.disable()
EndEvent
Quest Property SceneQuest1  Auto  

Quest Property SceneQuest2  Auto  
