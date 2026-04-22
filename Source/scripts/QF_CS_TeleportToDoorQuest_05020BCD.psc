;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_CS_TeleportToDoorQuest_05020BCD Extends Quest Hidden

;BEGIN ALIAS PROPERTY Door
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Door Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Door.GetReference(), -120.0 * Math.Sin(Alias_Door.GetReference().GetAngleZ()), -120.0 * Math.Cos(Alias_Door.GetReference().GetAngleZ()), abMatchRotation = false)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
