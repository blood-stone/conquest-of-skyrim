;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__054275DB Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int holdingnum = (GetOwningQuest() as CS_RecruitJarl).FindJarl(akSpeaker)
if holdingnum != -1
	(GetOwningQuest() as CS_GovScriptFunctions).EconUpdater.EconomyMenuVillage(holdingnum, steward=1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
