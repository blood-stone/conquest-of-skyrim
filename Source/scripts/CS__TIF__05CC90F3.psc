;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__TIF__05CC90F3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Utility.Wait(2)
debug.SendAnimationEvent(akSpeaker, "IdleBlowHornStormcloak")
;Utility.Wait(4)
(GetOwningQuest() as CS_AttackCitySiegeScript).LaunchAttack()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
