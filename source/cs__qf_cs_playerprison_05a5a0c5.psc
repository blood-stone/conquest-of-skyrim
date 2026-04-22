;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname CS__QF_CS_PlayerPrison_05A5A0C5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TrialMarkerSpawn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrialMarkerSpawn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JailDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JailDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CellMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CellMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrialMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrialMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrisonMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlThrone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlThrone Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JailGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JailGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityCS
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CityCS Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JailBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JailBed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExteriorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExteriorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrialMarkerGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrialMarkerGuard Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CS_PlayerPrisonScript
Quest __temp = self as Quest
CS_PlayerPrisonScript kmyQuest = __temp as CS_PlayerPrisonScript
;END AUTOCAST
;BEGIN CODE
;Player is free
Game.GetPlayer().ClearLookAt()
Alias_JailGuard.GetActorRef().ClearLookAt()
kmyQuest.FreePlayer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CS_PlayerPrisonScript
Quest __temp = self as Quest
CS_PlayerPrisonScript kmyQuest = __temp as CS_PlayerPrisonScript
;END AUTOCAST
;BEGIN CODE
;Guard takes prisoner to  be executed.
UnRegisterForUpdateGameTime()
kmyQuest.GuardGetPrisoner()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CS_PlayerPrisonScript
Quest __temp = self as Quest
CS_PlayerPrisonScript kmyQuest = __temp as CS_PlayerPrisonScript
;END AUTOCAST
;BEGIN CODE
;Guard takes prisoner to freedom
UnRegisterForUpdateGameTime()
kmyQuest.GuardGetPrisoner()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_PlayerPrisonScript
Quest __temp = self as Quest
CS_PlayerPrisonScript kmyQuest = __temp as CS_PlayerPrisonScript
;END AUTOCAST
;BEGIN CODE
;Guard takes Prisoner to trial
UnRegisterForUpdateGameTime()
kmyQuest.GuardGetPrisoner()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_PlayerPrisonScript
Quest __temp = self as Quest
CS_PlayerPrisonScript kmyQuest = __temp as CS_PlayerPrisonScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckIntoPrison()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CS_PlayerPrisonScript
Quest __temp = self as Quest
CS_PlayerPrisonScript kmyQuest = __temp as CS_PlayerPrisonScript
;END AUTOCAST
;BEGIN CODE
;Spy rescues player
UnRegisterForUpdateGameTime()
kmyQuest.SpyGetPrisoner()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CS_PlayerPrisonScript
Quest __temp = self as Quest
CS_PlayerPrisonScript kmyQuest = __temp as CS_PlayerPrisonScript
;END AUTOCAST
;BEGIN CODE
;Player return to Prison after trial
Game.GetPlayer().ClearLookAt()
Alias_JailGuard.GetActorRef().ClearLookAt()
Game.GetPlayer().EquipItem(kmyQuest.Gag)
Alias_JailGuard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player back in prison and awaiting punishment/being set free.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CS_PlayerPrisonScript
Quest __temp = self as Quest
CS_PlayerPrisonScript kmyQuest = __temp as CS_PlayerPrisonScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().SetLookAt(Alias_Jarl.GetActorRef(), true)
Alias_JailGuard.GetActorRef().SetLookAt(Alias_Jarl.GetActorRef(), true)
Game.GetPlayer().EvaluatePackage()
Alias_JailGuard.GetActorRef().EvaluatePackage()
Alias_Jarl.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CS_PlayerPrisonScript
Quest __temp = self as Quest
CS_PlayerPrisonScript kmyQuest = __temp as CS_PlayerPrisonScript
;END AUTOCAST
;BEGIN CODE
;Jarl gives sentence
RegisterForSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
