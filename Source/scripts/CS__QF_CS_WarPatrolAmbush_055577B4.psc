;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname CS__QF_CS_WarPatrolAmbush_055577B4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Troop007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop012 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop015 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop020
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop020 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Regiment
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Regiment Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PatrolMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PatrolMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop019
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop019 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Commander
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Commander Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TriggerBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TriggerBox Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_WarPatrolAmbushScript
Quest __temp = self as Quest
CS_WarPatrolAmbushScript kmyQuest = __temp as CS_WarPatrolAmbushScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetUpValues()
kmyQuest.SpawnTroops()
kmyQuest.DisplayObjective()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
