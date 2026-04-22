;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__QF_CS_WarObjectives_050C63A7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY EnemyFaction
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EnemyFaction Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObjectiveCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ObjectiveCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnemyFactionRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EnemyFactionRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObjectiveSettlement
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ObjectiveSettlement Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObjectiveHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ObjectiveHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WarActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WarActivator Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
CS_FactionManagementEconomy EnemyEconomy = Alias_EnemyFactionRef.GetRef() as CS_FactionManagementEconomy
int i = 0
while i < EnemyEconomy.Cities.Length
	CS_CityManagementOwnership CityOwnership = EnemyEconomy.Cities[i] as CS_CityManagementOwnership
	SetObjectiveDisplayed(CityOwnership.holdnum)
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
