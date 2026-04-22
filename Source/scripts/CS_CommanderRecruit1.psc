;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS_CommanderRecruit1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as CS_PatrolHoldScript).RecruitCommander(akSpeaker, 1)

if FactionStartRecruitCommander.GetValue() == 0
	FactionStartRecruitCommander.SetValue(1)
	GovQuest.SetStage(6)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property FactionStartRecruitCommander  Auto  

Quest Property GovQuest  Auto  
