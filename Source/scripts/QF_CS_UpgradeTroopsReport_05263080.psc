;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CS_UpgradeTroopsReport_05263080 Extends Quest Hidden

;BEGIN ALIAS PROPERTY UpgradeTroop
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UpgradeTroop Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_UpgradeTroopsMenu
Quest __temp = self as Quest
CS_UpgradeTroopsMenu kmyQuest = __temp as CS_UpgradeTroopsMenu
;END AUTOCAST
;BEGIN CODE
kmyQuest.MenuStart()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
