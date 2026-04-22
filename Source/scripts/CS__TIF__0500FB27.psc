;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__TIF__0500FB27 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CS_PeopleCommonReferences CommonReferences = (GetOwningQuest() as CS_PeopleCommonReferences)
CommonReferences.AddPerson(akSpeaker)
CommonReferences.PersonTalking.StartRelationship(CommonReferences.Player)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
