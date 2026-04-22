;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CS_EconomyUpdater_05244A15 Extends Quest Hidden

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EconomyManaged
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EconomyManaged Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Loyalty
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Loyalty Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionName
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionName Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_EconomyVariableFunctions
Quest __temp = self as Quest
CS_EconomyVariableFunctions kmyQuest = __temp as CS_EconomyVariableFunctions
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetInitialKeywords()
kmyQuest.RegisterForUpdateGameTime(24)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
