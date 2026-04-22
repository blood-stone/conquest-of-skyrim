;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__QF_CS_EconomyUpdaterNew_05D6B243 Extends Quest Hidden

;BEGIN ALIAS PROPERTY GuardNameChanger004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNameChanger004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardNameChanger007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNameChanger007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardNameChanger008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNameChanger008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardNameChangerSons
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNameChangerSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TextCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TextCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardNameChanger005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNameChanger005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TextFaction
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TextFaction Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardNameChanger003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNameChanger003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardNameChanger006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNameChanger006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardNameChangerImp
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNameChangerImp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardNameChanger000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNameChanger000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardNameChanger001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNameChanger001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardNameChanger002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardNameChanger002 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_EconomyUpdaterNewScript
Quest __temp = self as Quest
CS_EconomyUpdaterNewScript kmyQuest = __temp as CS_EconomyUpdaterNewScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
