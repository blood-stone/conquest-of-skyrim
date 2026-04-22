;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS_TIF__050EBE30 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(CatapultQuest as QF_CS_CatapultQuest_050F0F33).Catapults.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlanningQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Catapults  Auto  

FormList[] Property CatapultList  Auto  

FormList[] Property CatapultOpsList  Auto  

FormList Property AllLocations  Auto  

GlobalVariable Property CatapultsPurchased  Auto  

LocationAlias Property InvadeLocation  Auto  

ReferenceAlias[] Property CatapultOpsArray  Auto  

ReferenceAlias[] Property CatapultOpsMinorArray  Auto  

Quest Property CatapultQuest  Auto  

Quest Property PlanningQuest  Auto  
