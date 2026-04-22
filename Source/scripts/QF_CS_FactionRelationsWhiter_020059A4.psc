;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_CS_FactionRelationsWhiter_020059A4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY StewardPrisoner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardPrisoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Village1
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Village1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlKid3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlKid3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlKid1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlKid1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardCommanderPrisoner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardCommanderPrisoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Village2Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Village2Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlPrisoner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlPrisoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Village1Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Village1Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlPrisoner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlPrisoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlBrother
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlBrother Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlKid2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlKid2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Village2
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Village2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted(12)
EnemyHousecarlAlias.ForceRefTo(EnemyHousecarl)
EnemyStewardAlias.ForceRefTo(EnemySteward)
EnemyGuardCommanderAlias.ForceRefTo(EnemyGuardCommander)
JarlKid1Alias.ForceRefTo(JarlKid1)
JarlKid2Alias.ForceRefTo(JarlKid2)
JarlKid3Alias.ForceRefTo(JarlKid3)
JarlBrotherAlias.ForceRefTo(JarlBrother)
EnemyGuardCommander.MoveTo(EnemyJarlPrison)
EnemyHousecarl.MoveTo(EnemyJarlPrison)
JarlBrother.MoveTo(EnemyJarlPrison)
JarlKid1.MoveTo(EnemyJarlPrison)
JarlKid2.MoveTo(EnemyJarlPrison)
JarlKid3.MoveTo(EnemyJarlPrison)
JarlBrother.MoveTo(EnemyJarlPrison)
EnemyGuardCommander.RemoveFromFaction(Faction03)
EnemyGuardCommander.RemoveFromFaction(Faction04)
Game.GetPlayer().AddToFaction(JarlFaction)
Game.GetPlayer().AddToFaction(PalaceOccupants)
StopCombat.disable()
WhiterunAttackStuff.disable()
WhiterunAttackStuff2.disable()
UnRegisterForUpdateGameTime()
Capitulation.show()
Faction03.SetEnemy(Faction01)
Faction01.SetEnemy(Faction03)

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
TriggerBoxActivator.disable()
AttackTriggerBox1.disable()
AttackTriggerBox2.disable()

UnRegisterForUpdateGameTime()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
TriggerBoxActivator.enable()
If HoldingsInMainHold[2].GetValue() != 1
	AttackTriggerBox1.enable()
EndIf
If HoldingsInMainHold[1].GetValue() != 1
	AttackTriggerBox2.enable()
EndIf
int mapmarkernum = 0
while mapmarkernum < MapMarkers.GetSize()
	ObjectReference MapMarker = MapMarkers.GetAt(mapmarkernum) as ObjectReference
	MapMarker.disable()
	mapmarkernum += 1
endwhile
int markernum = 0
while markernum < MarkersImp.GetSize()
	ObjectReference MarkerImp = MarkersImp.GetAt(markernum) as ObjectReference
	MarkerImp.disable()
	markernum += 1
endwhile
int guardnum = 0
int numguards = 0
while numguards < 3*BarracksLevel.GetValue()
	Actor GuardVillage1 = GuardsVillage1.GetAt(guardnum) as Actor
	Actor GuardVillage2 = GuardsVillage2.GetAt(guardnum) as Actor
	If Alias_Jarl.GetActorRef().IsInFaction(GovImperial) == 1
		If GuardVillage1.IsInFaction(CWImperialFaction) == 1
			GuardVillage1.enable()
			GuardVillage2.enable()
			numguards += 1
		EndIf
	ElseIf Alias_Jarl.GetActorRef().IsInFaction(GovSons) == 1
		If GuardVillage1.IsInFaction(CWSonsFaction) == 1
			GuardVillage1.enable()
			GuardVillage2.enable()
			numguards += 1
		EndIf
	EndIf
	guardnum += 1
endwhile
RegisterForUpdateGameTime(24)
NextRespawn.SetValue(GameDaysPassed.GetValue() + 1)
endFunction


Event OnUpdateGameTime()
	int SpawnNumberMult = math.floor(GameDaysPassed.GetValue() - NextRespawn.GetValue())
	If SpawnNumberMult < 1
		SpawnNumberMult = 1
	EndIf
	NextRespawn.SetValue(GameDaysPassed.GetValue() + 1)
	int iCheckTime = 0
	While iCheckTime < SpawnNumberMult
		If AttackTroopNum.GetValue() < 20
			AttackTroopNum.SetValue(AttackTroopNum.GetValue() + 5)
		EndIf
		iCheckTime = iCheckTime + 1
	endWhile
	int i = 0
	While i < HoldingsInMainHold.Length
			If HoldingsInMainHold[i].GetValue() == 1
				AttackerCount.SetValue(0)
				DefendQuest.Start()
				DefendLocationAlias.ForceLocationTo(LocationsInMainHold[i])
				While AttackTroopNum.GetValue() > 0
					Actor Guard = GuardsVillages[i].GetAt(AttackTroopNum.GetValue() as int - 1) as Actor
					If CapitalCity.GetKeywordData(CWOwner) == 1 && Guard.IsInFaction(FactionImp) == 1
						Guard.disable()
						If Guard.IsDead() == 1
							Guard.Reset()
						EndIf
						Guard.enable()
						AttackerRefs[AttackTroopNum.GetValue() as int - 1].ForceRefTo(Guard)
						Guard.AddToFaction(CS_AttackingVillageFaction)
						AttackerCount.SetValue(AttackerCount.GetValue() + 1)
						AttackTroopNum.SetValue(AttackTroopNum.GetValue() - 1)
					ElseIf CapitalCity.GetKeywordData(CWOwner) == 2 && Guard.IsInFaction(FactionSons) == 1
						Guard.disable()
						If Guard.IsDead() == 1
							Guard.Reset()
						EndIf
						Guard.enable()
						AttackerRefs[AttackTroopNum.GetValue() as int - 1].ForceRefTo(Guard)
						Guard.AddToFaction(CS_AttackingVillageFaction)
						AttackerCount.SetValue(AttackerCount.GetValue() + 1)
						AttackTroopNum.SetValue(AttackTroopNum.GetValue() - 1)
					EndIf
				EndWhile
				int index = 0
				While index < GuardsVillagesPlayer[i].GetSize()
					Actor GuardPlayer = GuardsVillagesPlayer[i].GetAt(index) as Actor
					GuardsVillagePlayerRefs[i].ForceRefTo(GuardPlayer)
					index += 1
				EndWhile 
				DefendQuest.SetStage(1)
		EndIf
		i = i + 1
	EndWhile
endEvent

Function BugFixMaybe()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
stop()
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

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
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

MiscObject Property Gold001  Auto  

ObjectReference Property ExileMarker  Auto  

FormList Property MapMarkers  Auto  

ObjectReference Property TriggerBoxActivator  Auto  

Faction Property GovImperial  Auto  

Faction Property GovSons  Auto  

Faction Property CWImperialFaction  Auto  

Faction Property CWSonsFaction  Auto  

Location Property CapitalCity  Auto  

Keyword Property CWOwner  Auto  

Faction Property FactionImp  Auto  

Faction Property FactionSons  Auto  

Quest Property GovQuest  Auto  
