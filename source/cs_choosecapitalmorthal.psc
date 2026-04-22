;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_ChooseCapitalMorthal Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as CS_GovScriptFunctions).SetUpCapital(7)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property Steward  Auto  

ReferenceAlias Property ArmySecondInCommand  Auto  

ReferenceAlias Property Architect  Auto  

GlobalVariable Property Capital  Auto  

GlobalVariable Property HoldingValue  Auto  

ObjectReference Property ThroneInitial  Auto  

ObjectReference Property Throne  Auto  

ReferenceAlias Property ThroneAlias  Auto  

ReferenceAlias Property CourtSteward  Auto  

ObjectReference Property ChoppingBlock  Auto  

ReferenceAlias Property ChoppingBlockAlias  Auto  

ObjectReference[] Property StandMarker  Auto  

ReferenceAlias[] Property StandMarkerAliases  Auto  
