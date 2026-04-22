;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname SF_CS_CourtBardDrum1_050AF115 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Bard.GetActorRef().PlayIdle(IdleDrumStart)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

Idle Property PlayDrumIdle  Auto  

Idle Property IdleDrumStart  Auto  

Idle Property IdleStop  Auto  
