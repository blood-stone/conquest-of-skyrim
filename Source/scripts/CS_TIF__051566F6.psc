;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_TIF__051566F6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as CS_PrisonScript).SendToPrison(akSpeaker, 5)
CanArrest.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property ArmyFaction  Auto  

ReferenceAlias Property Prisoner  Auto  

Armor Property Cuffs  Auto  

Idle Property OffsetBoundStandingStart  Auto  

ReferenceAlias Property GuardFollower  Auto  

Faction Property FollowerFaction  Auto  

GlobalVariable Property CanArrest  Auto  

Scene Property ArrestScene  Auto  

ReferenceAlias[] Property PrisonerAliases  Auto  
