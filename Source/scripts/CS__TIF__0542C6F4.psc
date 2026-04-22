;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__0542C6F4 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int holdingnum = (GetOwningQuest() as CS_RecruitJarl).FindJarl(akSpeaker)
(GetOwningQuest() as CS_LawMenuScript).LawMenuStart(holding=holdingnum)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
