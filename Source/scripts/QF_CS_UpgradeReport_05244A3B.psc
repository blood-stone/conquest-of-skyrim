;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_CS_UpgradeReport_05244A3B Extends Quest Hidden

;BEGIN ALIAS PROPERTY UpgradeCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_UpgradeCity Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CS_UpgradeMenuFunctions
Quest __temp = self as Quest
CS_UpgradeMenuFunctions kmyQuest = __temp as CS_UpgradeMenuFunctions
;END AUTOCAST
;BEGIN CODE
kmyQuest.MenuStartVillage()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_UpgradeMenuFunctions
Quest __temp = self as Quest
CS_UpgradeMenuFunctions kmyQuest = __temp as CS_UpgradeMenuFunctions
;END AUTOCAST
;BEGIN CODE
kmyQuest.MenuStart()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
