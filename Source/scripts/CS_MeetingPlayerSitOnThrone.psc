Scriptname CS_MeetingPlayerSitOnThrone extends ReferenceAlias  

;Event OnSit(ObjectReference Chair)
;	if Chair == (GetOwningQuest() as CS_MeetingScript).Throne.GetReference() && GetOwningQuest().GetStage() == 10
;		GetOwningQuest().SetStage(20)
;	endif
;EndEvent

Event OnGetUp(ObjectReference Chair)
	if Chair == (GetOwningQuest() as CS_MeetingScript).Throne.GetReference() && (GetOwningQuest().GetStage() < 30 || GetOwningQuest().GetStage() > 35)
		(GetOwningQuest() as CS_MeetingScript).JarlsStand()
		GetOwningQuest().SetStage(100)
	endif
EndEvent