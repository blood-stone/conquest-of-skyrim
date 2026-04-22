Scriptname CS_BuffersFindTargetScript extends Quest  

ReferenceAlias[] Property BufferTargets Auto

GlobalVariable Property AlterationMageLevel Auto

Spell[] Property Buff Auto

Function BufferCastAll(ObjectReference Buffer)
	Buff[AlterationMageLevel.GetValueInt()].Cast(Buffer, Buffer)
	Buff[AlterationMageLevel.GetValueInt()].Cast(Buffer, Game.GetPlayer())
	int i = 0
	while i < BufferTargets.Length
		Buff[AlterationMageLevel.GetValueInt()].Cast(Buffer, BufferTargets[i].GetActorRef())
		i += 1
	endwhile
	(ResetQuest as CS_BuffersFindTargetResetScript).RegisterForUpdate(27)
	;Stop()
EndFunction
Quest Property ResetQuest  Auto  
