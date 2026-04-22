;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__QF_CS_CourtThroneWait_059BCEA6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Throne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Throne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourtPalace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CourtPalace Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
debug.trace("Throne Quest Started")
;ThroneWaitScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property ThroneWaitScene  Auto  
