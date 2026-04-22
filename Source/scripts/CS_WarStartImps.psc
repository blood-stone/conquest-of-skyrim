;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_WarStartImps Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CS_FactionPlayer.StartWar(CS_FactionMajorEmpireSkyrim)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property WarQuest  Auto

CS_FactionManagementDiplomacy Property CS_FactionPlayer Auto
ObjectReference Property CS_FactionMajorEmpireSkyrim Auto
