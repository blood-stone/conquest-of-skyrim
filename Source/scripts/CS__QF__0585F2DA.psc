;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname CS__QF__0585F2DA Extends Quest Hidden

;BEGIN ALIAS PROPERTY Leader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Leader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ASIC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ASIC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Commander
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Commander Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TestLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TestLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LSHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_LSHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HoldLoc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_TMScript
Quest __temp = self as Quest
CS_TMScript kmyQuest = __temp as CS_TMScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartWar()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_TMScript
Quest __temp = self as Quest
CS_TMScript kmyQuest = __temp as CS_TMScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetUpInitial()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
