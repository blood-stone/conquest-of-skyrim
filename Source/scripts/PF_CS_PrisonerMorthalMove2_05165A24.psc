;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname PF_CS_PrisonerMorthalMove2_05165A24 Extends Package Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6(Actor akActor)
;BEGIN CODE
akActor.RemoveItem(akActor.GetEquippedWeapon())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property Cuffs  Auto  

ObjectReference Property PrisonMarker  Auto  

ReferenceAlias Property Guard  Auto  
