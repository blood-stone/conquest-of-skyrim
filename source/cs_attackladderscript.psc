Scriptname CS_AttackLadderScript extends ObjectReference  

Quest Property AttackFortQuest Auto

Event OnActivate(ObjectReference akActionRef)
	akActionRef.MoveTo(GetLinkedRef())
	(akActionRef as Actor).EvaluatePackage()

	if AttackFortQuest.IsRunning()
		(AttackFortQuest as CS_AttackFortCampScript).LaddersActivated = true
	endif
EndEvent