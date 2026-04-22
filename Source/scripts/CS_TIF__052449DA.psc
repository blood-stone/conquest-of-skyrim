;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS_TIF__052449DA Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CS_FactionManagementReportQuest.Start()
(CS_FactionManagementReportQuest as CS_FactionManagementReport).MenuStart(PlayerFactionActivator.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property CS_EconomyReportNew  Auto  

Quest Property CS_FactionManagementReportQuest  Auto  

ReferenceAlias Property PlayerFactionActivator  Auto  
