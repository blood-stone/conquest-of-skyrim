;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname CS__QF_CS_Coup_05A4FDF2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CitizenMarker004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityCS
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CityCS Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardMarker004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardMarker004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardMarker003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardMarker003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardMarker001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardMarker001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardMarker002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardMarker002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen001 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ReturnActorsToNormal()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
;Player has started talking to Jarl
kmyQuest.CrowdChanting.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
;Player won coup battle
kmyQuest.StopCoupBattle(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
;Guards deciding what to do
kmyQuest.GuardsDecideToArrest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CrowdCheer.ForceStart()
Alias_Jarl.GetActorRef().EvaluatePackage()
Alias_Jarl.GetActorRef().StopCombat()
CompleteAllObjectives()
kmyQuest.JarlSurrenderCity()
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
; Guards fully side with Jarl
kmyQuest.GuardArrest.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Jarl Duel
Alias_Jarl.GetActorRef().EvaluatePackage()
SetObjectiveDisplayed(20)
Alias_Jarl.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
;Guards Fully Betray Jarl
kmyQuest.GuardBetrayJarl.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
;Guards discuss betraying but side with Player
kmyQuest.GuardDiscuss.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
FailAllObjectives()
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DeleteIfNotArrester(Alias_Guard001.GetActorRef())
kmyQuest.DeleteIfNotArrester(Alias_Guard002.GetActorRef())
kmyQuest.DeleteIfNotArrester(Alias_Guard003.GetActorRef())
kmyQuest.DeleteIfNotArrester(Alias_Guard004.GetActorRef())
kmyQuest.CityCS.GetLocation().SetKeywordData(kmyQuest.SpyNetworkMission, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
; Guards discuss betraying but side with Jarl
kmyQuest.GuardDiscuss.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MoveActorsToLocations()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
;Battle started!
kmyQuest.StartCoupBattle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
;Player lost coup battle
kmyQuest.StopCoupBattle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_CoupScript
Quest __temp = self as Quest
CS_CoupScript kmyQuest = __temp as CS_CoupScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
