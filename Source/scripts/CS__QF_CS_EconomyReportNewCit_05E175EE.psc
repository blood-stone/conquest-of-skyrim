;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__QF_CS_EconomyReportNewCit_05E175EE Extends Quest Hidden

;BEGIN ALIAS PROPERTY CraftingCustomer009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CraftingCustomer009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CraftingCustomer001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CraftingCustomer001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Building002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Building002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BuildingOwner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BuildingOwner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Building004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Building004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Building003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Building003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CraftingSupplier
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CraftingSupplier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CraftingCustomer005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CraftingCustomer005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BuildingText
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BuildingText Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CraftingCustomer004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CraftingCustomer004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CraftingCustomer002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CraftingCustomer002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Faction Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Building001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Building001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Building005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Building005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CraftingCustomer008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CraftingCustomer008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CraftingCustomer006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CraftingCustomer006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RecipeMaterial
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RecipeMaterial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CraftingCustomer003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CraftingCustomer003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CraftingCustomer007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CraftingCustomer007 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_EconomyReportNewCityScript
Quest __temp = self as Quest
CS_EconomyReportNewCityScript kmyQuest = __temp as CS_EconomyReportNewCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MenuStart()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
