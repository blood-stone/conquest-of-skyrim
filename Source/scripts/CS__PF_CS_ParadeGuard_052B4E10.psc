;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname CS__PF_CS_ParadeGuard_052B4E10 Extends Package Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
akActor.KeepOffsetFromActor(Target.GetActorRef(), -200, 0, 0, afCatchUpRadius=300, afFollowRadius = 15)
akActor.MoveTo(Target.GetRef(), -200)
akActor.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
getowningquest().setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Float Property xOffset  Auto  

ReferenceAlias Property target  Auto  
