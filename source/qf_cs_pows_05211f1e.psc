;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_CS_POWs_05211F1E Extends Quest Hidden

;BEGIN ALIAS PROPERTY PrisonerTitleChanger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrisonerTitleChanger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerTitleClearer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrisonerTitleClearer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Surrenderer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Surrenderer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AllLocations  Auto  

FormList[] Property PrisonersImp  Auto  

FormList[] Property PrisonersSons  Auto  

Faction Property GovImperial  Auto  

Faction Property GovSons  Auto  

ActorBase Property Guard  Auto  

FormList Property SpawnPoints  Auto  

ReferenceAlias[] Property PrisonerGuards  Auto  

Faction Property POWFaction  Auto  
