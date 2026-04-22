;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__QF_CS_BountyBanditStaging_0533399A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BountyLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BountyLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_BountyBanditScript
Quest __temp = self as Quest
CS_BountyBanditScript kmyQuest = __temp as CS_BountyBanditScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FindBountyLocation()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
