;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__TIF__05EAA437 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CS_CityEventPlanning.Start()
CS_CityEventPlanning.GoToState("Festival")
CS_CityEventPlanning.CityManagementActivator = (GetOwningQuest() as CS_CityManagementScript).CityManagementActivator
CS_CityEventPlanning.EventType = 1
CS_CityEventPlanning.MenuStart()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CS_Feast  Auto  

Keyword Property CS_StoryFeast  Auto  

Location Property WhiterunDragonsreach  Auto  

CS_CityEventPlanningScript Property CS_CityEventPlanning Auto
