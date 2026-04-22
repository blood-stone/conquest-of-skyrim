;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__QF_CS_TroopFormUp_05BDAF36 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element3_Right
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element3_Right Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element3_CenterRight
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element3_CenterRight Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element1_Left
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element1_Left Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element4_CenterRight
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element4_CenterRight Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element2_Right
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element2_Right Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element2_Left
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element2_Left Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element1_CenterRight
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element1_CenterRight Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Commander
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Commander Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element1_Right
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element1_Right Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element3_Center
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element3_Center Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element4_Right
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element4_Right Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element2_CenterLeft
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element2_CenterLeft Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element1_CenterLeft
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element1_CenterLeft Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element2_CenterRight
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element2_CenterRight Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element4_CenterLeft
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element4_CenterLeft Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element1_Center
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element1_Center Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element3_Left
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element3_Left Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element2_Center
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element2_Center Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element4_Center
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element4_Center Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element3_CenterLeft
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element3_CenterLeft Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Element4_Left
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Element4_Left Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_TroopFormUpScript
Quest __temp = self as Quest
CS_TroopFormUpScript kmyQuest = __temp as CS_TroopFormUpScript
;END AUTOCAST
;BEGIN CODE
;kmyQuest.DisbandArmy()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
