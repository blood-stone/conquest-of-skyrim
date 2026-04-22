Scriptname CS_MovingTargetScript extends ReferenceAlias  

Event OnLoad()
	CS_CommanderMovingScript MovingScript = GetOwningQuest() as CS_CommanderMovingScript
	int targetnum = MovingScript.Targets.Find(self)
	if MovingScript.Commanders[targetnum].GetActorRef().Is3DLoaded() == true
		MovingScript.CommanderArrival(MovingScript.Commanders[targetnum].GetActorRef())
	endif
EndEvent