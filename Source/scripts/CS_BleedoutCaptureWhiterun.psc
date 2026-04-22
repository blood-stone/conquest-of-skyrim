Scriptname CS_BleedoutCaptureWhiterun extends ReferenceAlias  

GlobalVariable Property AllowCapture  Auto  

Event OnUpdate()
	If self.GetActorRef().IsBleedingOut() == 1
		debug.notification("The Jarl of Whiterun has been defeated!")
		AllowCapture.SetValue(1)
	EndIf
EndEvent
	