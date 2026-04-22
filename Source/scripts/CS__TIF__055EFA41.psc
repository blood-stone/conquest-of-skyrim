;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__TIF__055EFA41 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int armynum = (GetOwningQuest() as CS_PatrolHoldScript).GetCommanderArmyNum(akSpeaker)
((GetOwningQuest() as CS_PatrolHoldScript).Commanders[armynum] as CS_CommanderAliasScript).UpgradeCommander(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as CS_CommanderOutfitScript).CommanderOutfitMenu(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
