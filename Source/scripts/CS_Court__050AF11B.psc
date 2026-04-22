;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_Court__050AF11B Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as CS_CourtScript).FindBard()

int scenenum = utility.randomint(0, BardScenes.Length - 1)
BardScenes[scenenum].Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

FormList[] Property Residents  Auto  

Faction Property JobBardFaction  Auto  

Scene[] Property BardScenes  Auto  

FormList Property AllBards  Auto  

Scene Property BardSceneStart  Auto  
