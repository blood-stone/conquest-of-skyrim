Scriptname CS_JarlSurrenders extends ReferenceAlias  

Event OnUpdate()
	if GetOwningQuest().GetStage() < 15
		if GetActorRef().IsBleedingOut() == 1
			GetOwningQuest().SetStage(15)
		endif
	endif
EndEvent

GlobalVariable Property JarlSurrender  Auto  
