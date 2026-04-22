;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname CS__QF__05EB4707 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Patrol003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Patrol003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Patrol002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Patrol002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Patrol001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Patrol001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Alias_Patrol002.TryToDisable()
Alias_Patrol003.TryToEnable()
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CS_CityQuestScript
Quest __temp = self as Quest
CS_CityQuestScript kmyQuest = __temp as CS_CityQuestScript
;END AUTOCAST
;BEGIN CODE
debug.notification("Guard Quest Started")
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Patrol001.TryToEnable()
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CS_CityQuestScript
Quest __temp = self as Quest
CS_CityQuestScript kmyQuest = __temp as CS_CityQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30)
kmyQuest.ChangeGroupInfluence("Guards", 10)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Alias_Patrol001.TryToDisable()
Alias_Patrol002.TryToEnable()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
