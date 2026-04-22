Scriptname CS_ActivateThrone extends ReferenceAlias

;Event OnSit(ObjectReference chair)
;	If Coronation.IsRunning() == 1 && Coronation.GetStage() >= 10
;		debug.trace("Coronation is halting throne start")
;	ElseIf MeetingQuest.IsRunning() == 1 && MeetingQuest.GetStage() >= 10 && (MeetingQuest as CS_MeetingScript).holdingnum >= 5
;		debug.trace("Meeting is halting throne start")
;	Else
;		CourtScript.StewardStart(CourtScript.CheckIfThrone(Chair))
;	EndIf
;EndEvent

ReferenceAlias Property Throne  Auto  

CS_CourtScript Property CourtScript Auto

Scene Property CourtStartScene  Auto  

Quest Property Coronation  Auto  

Quest Property MeetingQuest  Auto  
