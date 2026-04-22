;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS_AttackPlanningAttackCity Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetObjectiveCompleted(1)
debug.sendAnimationEvent(akSpeaker, "IdleBlowHornImperial")
(Commander as CS_PatrolHoldScript).MoveToAttack2()
(GetOwningQuest() as CS_AttackPlanningScript).StartAttackQuest()
GetOwningQuest().Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Commander  Auto  

ObjectReference Property TriggerBoxTest  Auto  

ObjectReference Property TriggerBoxEnabler  Auto  

Idle Property IdleBlowHornImperial  Auto  
