;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__059F4AB7 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as CS_PrisonScript).SendInPrisoner(5,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PrisonerGuard  Auto  

Scene Property CourtScene  Auto  

FormList Property Guards  Auto  

ReferenceAlias Property Prisoner  Auto  

ReferenceAlias Property PrisonerCourt  Auto  
