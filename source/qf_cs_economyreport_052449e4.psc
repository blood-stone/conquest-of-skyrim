;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_CS_EconomyReport_052449E4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ImportCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ImportCity Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_EconomyMenuFunctions
Quest __temp = self as Quest
CS_EconomyMenuFunctions kmyQuest = __temp as CS_EconomyMenuFunctions
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpdateEconomy()
kmyQuest.StartMenu()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property EconGlobals  Auto  

Message Property EconMenuStart  Auto  
