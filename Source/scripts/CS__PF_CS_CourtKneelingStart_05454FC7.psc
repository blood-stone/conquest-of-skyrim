;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__PF_CS_CourtKneelingStart_05454FC7 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
debug.sendAnimationEvent(akActor, "IdleKneelingEnter")
utility.wait(3)
debug.sendAnimationEvent(akActor, "IdleForceDefaultState")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
