Scriptname CS_StopMapScenes extends ObjectReference  

Quest Property SceneImp1  Auto  

Quest Property SceneImp2  Auto  

Quest Property SceneSons1  Auto  

Quest Property SceneSons2  Auto  

Event OnTriggerEnter(ObjectReference akTriggerRef)
	if akTriggerRef == Game.GetPlayer()
		SceneImp1.stop()
		SceneImp2.stop()
		SceneSons1.stop()
		SceneSons2.stop()
	endif
endEvent
