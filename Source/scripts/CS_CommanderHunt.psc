;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_CommanderHunt Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as CS_PatrolHoldScript).StartHunt(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property HunterFaction  Auto  

Faction Property FollowerFaction  Auto  

ReferenceAlias[] Property CommanderAlias  Auto  

GlobalVariable[] Property FollowCommander  Auto  

GlobalVariable[] Property TroopCount  Auto  

GlobalVariable Property FoodHunted  Auto  

FormList Property ArmyQuests  Auto  
