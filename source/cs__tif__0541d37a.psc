;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__0541D37A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
((GetOwningQuest() as CS_GovScriptFunctions).HouseQuestDawnstar as BYOH_QF_BYOHHousePale_01010BEE).Alias_Jarl.ForceRefTo((GetOwningQuest() as CS_RecruitJarl).JarlAliases[6].GetActorRef())
((GetOwningQuest() as CS_GovScriptFunctions).HouseQuestFalkreath as BYOH_QF_BYOHHouseFalkreath_0100305E).Alias_Steward.ForceRefTo(akSpeaker)
((GetOwningQuest() as CS_GovScriptFunctions).HouseQuestFalkreath as byohhousescript).BYOHHPCost = (GetOwningQuest() as CS_GovScriptFunctions).CS_BYOHHPCost
(GetOwningQuest() as CS_GovScriptFunctions).HousecarlFalkreath.enable()
(GetOwningQuest() as CS_GovScriptFunctions).HouseQuestFalkreath.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
