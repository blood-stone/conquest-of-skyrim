;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__PF_CS_ParadeGuard2_05B9E320 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
;akActor.ClearKeepOffsetFromActor()
getowningquest().setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
;akActor.KeepOffsetFromActor(Target.GetActorRef(), XOffset, 0, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Float Property xOffset  Auto  

ReferenceAlias Property target  Auto  
