;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SF_CS_CourtBardLute_050B4229 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleLuteStart)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

Idle Property IdleLuteStart  Auto  

Idle Property IdleStop  Auto  
