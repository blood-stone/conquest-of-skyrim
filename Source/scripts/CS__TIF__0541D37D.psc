;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__0541D37D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
((GetOwningQuest() as CS_GovScriptFunctions).HouseQuestDawnstar as BYOH_QF_BYOHHousePale_01010BEE).Alias_Jarl.ForceRefTo((GetOwningQuest() as CS_RecruitJarl).JarlAliases[7].GetActorRef())
((GetOwningQuest() as CS_GovScriptFunctions).HouseQuestMorthal as BYOH_QF_BYOHHouseHjaalmarch_0100BE09).Alias_Steward.ForceRefTo(akSpeaker)
((GetOwningQuest() as CS_GovScriptFunctions).HouseQuestMorthal as byohhousescript).BYOHHPCost = (GetOwningQuest() as CS_GovScriptFunctions).CS_BYOHHPCost
(GetOwningQuest() as CS_GovScriptFunctions).HousecarlMorthal.enable()
(GetOwningQuest() as CS_GovScriptFunctions).HouseQuestMorthal.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
