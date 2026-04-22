;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname CS_WarHaafingarScript Extends Quest Hidden

;BEGIN ALIAS PROPERTY GuardCommanderPrisoner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardCommanderPrisoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Village2
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Village2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlKid1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlKid1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlKid2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlKid2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlBrother
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlBrother Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlKid3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlKid3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Village1Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Village1Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseCarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseCarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Village1
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Village1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Village2Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Village2Marker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted(12)
StopCombat.disable()
UnRegisterForUpdateGameTime()
Capitulation.show()
CapitalFires1.Disable()
Faction03.SetEnemy(Faction01)
Faction01.SetEnemy(Faction03)

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_WarHaafingarAttack
Quest __temp = self as Quest
CS_WarHaafingarAttack kmyQuest = __temp as CS_WarHaafingarAttack
;END AUTOCAST
;BEGIN CODE
Faction04.SetPlayerEnemy(true)
Faction04.SetEnemy(Faction01)

SceneTrigger1.disable()
TriggerBoxActivator.enable()

CapitalDoor.lock(false)

int mapmarkernum = 0
while mapmarkernum < MapMarkers.GetSize()
	ObjectReference MapMarker = MapMarkers.GetAt(mapmarkernum) as ObjectReference
	MapMarker.disable()
	mapmarkernum += 1
endwhile

NextRespawn.SetValue(GameDaysPassed.GetValue() + 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
int i = 0
while i < MapMarkers.GetSize()
	(MapMarkers.GetAt(i) as ObjectReference).enable()
	i += 1
endwhile

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
Faction04.SetPlayerEnemy(false)
Faction04.SetEnemy(Faction01, false)

int mapmarkernum = 0
while mapmarkernum < MapMarkers.GetSize()
	ObjectReference MapMarker = MapMarkers.GetAt(mapmarkernum) as ObjectReference
	MapMarker.enable()
	mapmarkernum += 1
endwhile

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
Faction04.SetPlayerEnemy(false)
Faction04.SetEnemy(Faction01, false)

SceneTrigger1.enable()
TriggerBoxActivator.disable()
AttackTriggerBox1.disable()

UnRegisterForUpdateGameTime()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
int i = 0
int CaptureNum = 0
while i < HoldingsInMainHold.Length
	if HoldingsInMainHold[i].GetValue() == 1
		CaptureNum += 1
	endif
	i += 1
endwhile

if CaptureNum == HoldingsInMainHold.Length
	SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property Faction01  Auto  

Faction Property Faction02  Auto  

Faction Property Faction03  Auto  

Faction Property Faction04  Auto  

Faction Property PlayerFaction  Auto  

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property NextRespawn  Auto  

GlobalVariable Property respawnCount  Auto  

GlobalVariable Property VillageCount  Auto  

GlobalVariable Property CityCount  Auto  

GlobalVariable Property FortCount  Auto  

ObjectReference Property TroopSpawn  Auto  

ActorBase Property Troop  Auto  

ObjectReference Property EnemyCommander1  Auto  

Actor Property Commander1  Auto  

GlobalVariable[] Property AllVillageHoldings  Auto  

GlobalVariable[] Property AllCityMinorHoldings  Auto  

GlobalVariable[] Property AllCityMajorHoldings  Auto  

ActorBase[] Property AllVillageTroops  Auto  

ActorBase[] Property AllCityMinorTroops  Auto  


ActorBase[] Property AllCityMajorTroops  Auto  

GlobalVariable Property FactionValue  Auto  

GlobalVariable Property TotalFactionTroops  Auto  

ObjectReference[] Property AllVillageTroopSpawn  Auto  

ObjectReference[] Property AllCityMinorTroopSpawn  Auto  

ObjectReference[] Property AllCityMajorTroopSpawn  Auto  

Actor Property Commander2  Auto  

GlobalVariable Property AttackTroopNum  Auto  


GlobalVariable[] Property HoldingsInMainHold  Auto  

ActorBase[] Property AttackTroopsInMainHold  Auto  

ObjectReference[] Property AttackTroopSpawnInMainHold  Auto  

GlobalVariable[] Property PlayerGarrisonsInMainHold  Auto  

Quest Property RelationsQuest  Auto  

Location[] Property AttackedLocation  Auto  

GlobalVariable Property attackStart  Auto  

GlobalVariable[] Property EnemyGarrisonInMainHold  Auto  

GlobalVariable[] Property TotalSpawnedVillage  Auto  

GlobalVariable[] Property TotalSpawnedMinorCity  Auto  

GlobalVariable[] Property TotalSpawnedCity  Auto  

GlobalVariable[] Property TotalSpawnedInMainHold  Auto  

ObjectReference Property CapitalAttackTrigger  Auto  

Actor Property EnemyJarl  Auto  

ObjectReference Property EnemyJarlPrison  Auto  

ReferenceAlias Property EnemyJarlAlias  Auto  

Message Property Capitulation  Auto  

Actor Property EnemyHousecarl  Auto  

Actor Property EnemySteward  Auto  

ReferenceAlias Property EnemyHousecarlAlias  Auto  

ReferenceAlias Property EnemyStewardAlias  Auto  

Faction Property JarlFaction  Auto  

Faction Property PalaceOccupants  Auto  

ObjectReference Property MapMarker1  Auto  

ObjectReference Property StopCombat  Auto  

ObjectReference Property WhiterunAttackStuff  Auto  

ObjectReference Property GuardMarker1  Auto  

ObjectReference Property GuardMarker2  Auto  

Actor Property EnemyGuardCommander  Auto  

ReferenceAlias Property EnemyGuardCommanderAlias  Auto  

Actor Property JarlKid1  Auto  

Actor Property JarlKid2  Auto  

Actor Property JarlKid3  Auto  

Actor Property JarlBrother  Auto  

ReferenceAlias Property JarlKid1Alias  Auto  

ReferenceAlias Property JarlKid2Alias  Auto  

ReferenceAlias Property JarlKid3Alias  Auto  

ReferenceAlias Property JarlBrotherAlias  Auto  

ObjectReference Property WhiterunAttackStuff2  Auto  

FormList Property MarkersImp  Auto  

FormList Property MarkersSons  Auto  

FormList Property GuardsVillage1  Auto  

FormList Property GuardsVillage2  Auto  

ObjectReference Property AttackTriggerBox1  Auto  

ObjectReference Property AttackTriggerBox2  Auto  

GlobalVariable Property BarracksLevel  Auto  

FormList[] Property GuardsVillages  Auto  

Quest Property DefendQuest  Auto  

ReferenceAlias[] Property AttackerRefs  Auto  

Faction Property CS_AttackingVillageFaction  Auto  

GlobalVariable Property AttackerCount  Auto  

Location[] Property LocationsInMainHold  Auto  

LocationAlias Property DefendLocationAlias  Auto  

ReferenceAlias Property TriggerBoxAlias  Auto  

FormList[] Property GuardsVillagesPlayer  Auto  

ReferenceAlias[] Property GuardsVillagePlayerRefs  Auto  

ObjectReference Property CapitalAttackTrigger2  Auto  

MiscObject Property Gold001  Auto  

ObjectReference Property ExileMarker  Auto  

FormList Property MapMarkers  Auto  

ObjectReference Property TriggerBoxActivator  Auto  

ObjectReference Property CapitalFires1  Auto  

ObjectReference Property CapitalDoor  Auto  

ObjectReference Property Saerlund  Auto  

ObjectReference Property Harrald  Auto  

ReferenceAlias Property EnemyJarlKid1  Auto  

ReferenceAlias Property EnemyJarlKid2  Auto  

ObjectReference Property SolitudeMarkerImp  Auto  

ObjectReference Property SolitudeMarkerSons  Auto  

Faction Property CWImperialFaction  Auto  

Faction Property CWSonsFaction  Auto  

ObjectReference Property VillageTriggerBox  Auto  

FormList Property AllMapMarkers  Auto  

ObjectReference Property SceneTrigger1  Auto  

Location Property CityCapital  Auto  

Keyword Property CWOwner  Auto  

Faction Property FactionImp  Auto  

Faction Property FactionSons  Auto  
