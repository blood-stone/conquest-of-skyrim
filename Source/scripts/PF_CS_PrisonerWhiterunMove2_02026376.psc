;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname PF_CS_PrisonerWhiterunMove2_02026376 Extends Package Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6(Actor akActor)
;BEGIN CODE
akActor.RemoveItem(akActor.GetEquippedWeapon())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(Actor akActor)
;BEGIN CODE
akActor.MoveTo(PrisonMarker)
akActor.Unequipitem(Cuffs)
debug.SendAnimationEvent(akActor, "IdleForceDefaultStance")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property Cuffs  Auto  

ObjectReference Property PrisonMarker  Auto  

ReferenceAlias Property Guard  Auto  
