;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname CS_QF__051473E5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY UpgradeCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_UpgradeCity Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeCity(5)
debug.notification("Dawnstar Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeCity(2)
debug.notification("Solitude Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeCity(3)
debug.notification("Whiterun Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeCity(1)
debug.notification("Riften Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeCity(7)
debug.notification("Morthal Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeCity(8)
debug.notification("Winterhold Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeCity(4)
debug.notification("Windhelm Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeVillage(12)
debug.notification("Riverwood Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeCity(6)
debug.notification("Falkreath Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeVillage(13)
debug.notification("Rorikstead Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeCity(0)
debug.notification("Markarth Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeVillage(9)
debug.notification("Dragon Bridge Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeVillage(11)
debug.notification("Karthwasten Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeVillage(10)
debug.notification("Ivarstead Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE CS_UpgradeCityScript
Quest __temp = self as Quest
CS_UpgradeCityScript kmyQuest = __temp as CS_UpgradeCityScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpgradeVillage(14)
debug.notification("Shor's Stone Upgrade has been completed")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


GlobalVariable[] Property UpgradeType  Auto  

FormList[] Property AllUpgrades  Auto  

GlobalVariable[] Property AllowUpgrade  Auto  

FormList Property AllGarrisonCaps  Auto  

GlobalVariable[] Property CityGarrison  Auto  

FormList Property RecruitCommanders  Auto  

GlobalVariable[] Property Prosperity  Auto  

FormList Property AllLocations  Auto  

Keyword[] Property AllUpgradeKeywords  Auto  
