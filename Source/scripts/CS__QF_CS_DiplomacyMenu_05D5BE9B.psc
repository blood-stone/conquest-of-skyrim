;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__QF_CS_DiplomacyMenu_05D5BE9B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Faction002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faction002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faction001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ChosenFaction
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChosenFaction Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faction003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faction004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Faction005 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_DiplomacyMenuScript
Quest __temp = self as Quest
CS_DiplomacyMenuScript kmyQuest = __temp as CS_DiplomacyMenuScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MenuStart()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
