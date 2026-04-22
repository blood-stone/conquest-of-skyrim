;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__QF_CS_StartUp_051F5C86 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_StartUpScript
Quest __temp = self as Quest
CS_StartUpScript kmyQuest = __temp as CS_StartUpScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartUp()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
