;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CS_TroopRespawnRefresh_052816FB Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_RefreshTroopRespawn
Quest __temp = self as Quest
CS_RefreshTroopRespawn kmyQuest = __temp as CS_RefreshTroopRespawn
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForUpdateGameTime(24)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
