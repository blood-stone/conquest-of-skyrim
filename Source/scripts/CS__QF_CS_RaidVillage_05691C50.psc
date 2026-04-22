;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname CS__QF_CS_RaidVillage_05691C50 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Citizen000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WoodBarrel001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WoodBarrel001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FoodBarrel002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FoodBarrel002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MetalBarrel001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MetalBarrel001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FoodBarrel001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FoodBarrel001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CoinBarrel002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CoinBarrel002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MetalBarrel002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MetalBarrel002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen020
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen020 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen015 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CoinBarrel001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CoinBarrel001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TriggerBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TriggerBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WoodBarrel002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WoodBarrel002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen012 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen019
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen019 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Village
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Village Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen004 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_RaidVillageScript
Quest __temp = self as Quest
CS_RaidVillageScript kmyQuest = __temp as CS_RaidVillageScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.InitialSetUp()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
