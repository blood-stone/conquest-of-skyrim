;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__05B61674 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int holdingnum = (GetOwningQuest() as CS_RecruitJarl).FindJarl(akSpeaker)
(GetOwningQuest() as CS_LawMenuScript).SetHoldConscriptionPercentage(holdingnum, 0.25, changeloyalty=0)
akSpeaker.AddToFaction((GetOwningQuest() as CS_GovScriptFunctions).JarlNeutralGivingTroopsFaction)
if GetOwningQuest().GetStage() == 8
	GetOwningQuest().SetStage(9)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
