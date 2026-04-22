;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__QF_CS_LoyaltyCheck_05300EB6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY RebelCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_RebelCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoyaltyCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_LoyaltyCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ProtestCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ProtestCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RebelLeader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RebelLeader Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CS_LoyaltyCheckScript
Quest __temp = self as Quest
CS_LoyaltyCheckScript kmyQuest = __temp as CS_LoyaltyCheckScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetInitialKeywords()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
