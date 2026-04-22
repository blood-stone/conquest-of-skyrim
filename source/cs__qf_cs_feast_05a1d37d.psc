;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname CS__QF_CS_Feast_05A1D37D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Guest002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PalaceEntranceMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PalaceEntranceMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Palace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Palace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest006 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MoveGuestsToPalace()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FeastDay = math.floor(kmyQuest.GameDaysPassed.GetValue() + 1)
RegisterForUpdateGameTime(1)

kmyQuest.AddGuestsToAliases()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
