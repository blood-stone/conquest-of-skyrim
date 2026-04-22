;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__05AF7101 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int holdnum = (GetOwningQuest() as CS_GovScriptFunctions).AttackPlanningHoldNum
CS_AttackPlanningNewScript AttackPlanningScript = (GetOwningQuest() as CS_GovScriptFunctions).AttackPlanning
AttackPlanningScript.Start()
AttackPlanningScript.InvasionTarget.ForceLocationTo(AttackPlanningScript.AllLocationsCampImp.GetAt(holdnum) as Location)
AttackPlanningScript.holdnum = holdnum
AttackPlanningScript.enemyfactionnum = 11
AttackPlanningScript.SelectTarget()
AttackPlanningScript.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
