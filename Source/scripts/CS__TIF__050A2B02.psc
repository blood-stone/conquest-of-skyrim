;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__050A2B02 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int regimentnum = 3
ReferenceAlias RegimentAlias = (GetOwningQuest() as CS_FactionArmyRegimentsScript).Regiments[regimentnum]
(RegimentAlias.GetRef() as CS_ArmyRegimentOrders).HireCommander(akSpeaker)
Actor[] CommanderActors = (GetOwningQuest() as CS_FactionArmyRegimentsScript).CommanderActors
CommanderActors[regimentnum] = akSpeaker
(GetOwningQuest() as CS_FactionArmyRegimentsScript).CommanderActors = CommanderActors
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
