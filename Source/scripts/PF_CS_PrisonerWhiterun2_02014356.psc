;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_CS_PrisonerWhiterun2_02014356 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
akActor.MoveTo(PrisonMarker)
akActor.Unequipitem(Cuffs)
debug.SendAnimationEvent(akActor, "IdleForceDefaultStance")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property PrisonMarker  Auto  

Armor Property Cuffs  Auto  
