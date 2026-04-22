Scriptname CS_MeetingJarlSitStart extends ReferenceAlias  

Event OnSit(ObjectReference Chair)
	if GetOwningQuest().GetStage() == 20
		GetOwningQuest().SetStage(25)
	endif
EndEvent