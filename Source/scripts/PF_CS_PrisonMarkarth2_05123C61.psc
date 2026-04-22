;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_CS_PrisonMarkarth2_05123C61 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
akActor.MoveTo(PrisonMarker)
PrisonerGuard.Clear()
akActor.Unequipitem(Cuffs)
debug.SendAnimationEvent(akActor, "IdleForceDefaultStance")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property PrisonMarker  Auto  

Armor Property Cuffs  Auto  

ReferenceAlias Property PrisonerGuard  Auto  
