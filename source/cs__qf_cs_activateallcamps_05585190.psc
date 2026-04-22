;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__QF_CS_ActivateAllCamps_05585190 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_ActivateAllCampsScript
Quest __temp = self as Quest
CS_ActivateAllCampsScript kmyQuest = __temp as CS_ActivateAllCampsScript
;END AUTOCAST
;BEGIN CODE
;kmyQuest.ActivateCamps()
kmyQuest.DeactivateCamps()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
