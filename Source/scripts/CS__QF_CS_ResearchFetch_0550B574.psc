;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname CS__QF_CS_ResearchFetch_0550B574 Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DungeonCleared
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DungeonCleared Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Commander
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Commander Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourtMage
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CourtMage Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainerCleared
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossContainerCleared Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarkerCleared
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarkerCleared Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CS_ResearchFetchScript
Quest __temp = self as Quest
CS_ResearchFetchScript kmyQuest = __temp as CS_ResearchFetchScript
;END AUTOCAST
;BEGIN CODE
if Alias_Dungeon.GetLocation() != None
	Alias_BossContainer.GetRef().AddItem(Alias_QuestItem.GetRef())
	kmyQuest.QuestContainer = Alias_BossContainer
	Alias_MapMarker.GetRef().enable()
	SetObjectiveDisplayed(0)
else
	Alias_BossContainerCleared.GetRef().AddItem(Alias_QuestItem.GetRef())
	kmyQuest.QuestContainer = Alias_BossContainerCleared
	Alias_MapMarkerCleared.GetRef().enable()
	SetObjectiveDisplayed(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CS_ResearchFetchScript
Quest __temp = self as Quest
CS_ResearchFetchScript kmyQuest = __temp as CS_ResearchFetchScript
;END AUTOCAST
;BEGIN CODE
;Send commander

kmyQuest.PlayerDecision = 2
kmyQuest.UnRegisterForUpdateGameTime()
kmyQuest.RegisterForSingleUpdateGameTime(kmyQuest.GetTimeToFinish())
kmyQuest.Commander.GetActorRef().EvaluatePackage()

if Alias_Dungeon.GetLocation() != None
	SetObjectiveDisplayed(90)
else
	SetObjectiveDisplayed(91)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
CompleteAllObjectives()
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CS_ResearchFetchScript
Quest __temp = self as Quest
CS_ResearchFetchScript kmyQuest = __temp as CS_ResearchFetchScript
;END AUTOCAST
;BEGIN CODE
if Alias_Dungeon.GetLocation() != None
	Alias_BossContainer.GetRef().RemoveItem(Alias_QuestItem.GetRef())
else
	Alias_BossContainerCleared.GetRef().RemoveItem(Alias_QuestItem.GetRef())
endif
kmyQuest.ReturnCommander()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CS_ResearchFetchScript
Quest __temp = self as Quest
CS_ResearchFetchScript kmyQuest = __temp as CS_ResearchFetchScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
kmyQuest.StartUpgrade()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
