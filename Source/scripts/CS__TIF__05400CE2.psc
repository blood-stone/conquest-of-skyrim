;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__05400CE2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CS_CityEventPlanning.Start()
CS_CityEventPlanning.GoToState("Festival")
CS_CityEventPlanning.CityManagementActivator = (GetOwningQuest() as CS_CityManagementScript).CityManagementActivator
CS_CityEventPlanning.EventType = 0
CS_CityEventPlanning.MenuStart()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CS_CityEventPlanningScript Property CS_CityEventPlanning Auto
