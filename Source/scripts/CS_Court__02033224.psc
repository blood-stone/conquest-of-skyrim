;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_Court__02033224 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CourtQuest.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Citizen1  Auto  

ReferenceAlias Property Citizen2  Auto  

FormList[] Property CityResidents  Auto  

Scene[] Property CitizenScenes  Auto  

FormList Property AllLocations  Auto  

Faction Property GovFaction  Auto  

FormList[] Property CityGuards  Auto  

ReferenceAlias Property BailiffAlias  Auto  

Faction Property prisonerFaction  Auto  

Quest Property CourtQuest  Auto  
