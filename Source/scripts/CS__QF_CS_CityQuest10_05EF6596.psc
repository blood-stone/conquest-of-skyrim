;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname CS__QF_CS_CityQuest10_05EF6596 Extends Quest Hidden

;BEGIN ALIAS PROPERTY City000
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Commoner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Commoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CS_CityQuestScript
Quest __temp = self as Quest
CS_CityQuestScript kmyQuest = __temp as CS_CityQuestScript
;END AUTOCAST
;BEGIN CODE
;Influence Nobility Option

Alias_Commoner.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
;Throw Commoner in prison
SetObjectiveCompleted(20)
kmyQuest.ChangeGroupInfluence("Nobility", 5)
kmyQuest.ChangeGroupInfluence("Commoners", -5)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_CityQuestScript
Quest __temp = self as Quest
CS_CityQuestScript kmyQuest = __temp as CS_CityQuestScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
kmyQuest.ChangeGroupInfluence("Commoners", -5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CS_CityQuestScript
Quest __temp = self as Quest
CS_CityQuestScript kmyQuest = __temp as CS_CityQuestScript
;END AUTOCAST
;BEGIN CODE
;Influence Commoners Option

Alias_Commoner.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
SetObjectiveCompleted(20)
kmyQuest.ChangeGroupInfluence("Commoners", 5)
kmyQuest.ChangeGroupInfluence("Nobility", -5)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
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
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CS_CityQuestScript
Quest __temp = self as Quest
CS_CityQuestScript kmyQuest = __temp as CS_CityQuestScript
;END AUTOCAST
;BEGIN CODE
;Both Option

SetObjectiveCompleted(20)
kmyQuest.ChangeGroupInfluence("Commoners", 3)
kmyQuest.ChangeGroupInfluence("Nobility", 3)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
