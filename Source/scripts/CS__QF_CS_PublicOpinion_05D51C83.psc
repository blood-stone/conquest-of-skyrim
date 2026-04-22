;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__QF_CS_PublicOpinion_05D51C83 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_PublicOpinionScript
Quest __temp = self as Quest
CS_PublicOpinionScript kmyQuest = __temp as CS_PublicOpinionScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GetPlayerStancesMenu()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
