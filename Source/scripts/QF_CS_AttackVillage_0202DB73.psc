;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_CS_AttackVillage_0202DB73 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Defender11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Village
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Village Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TriggerBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TriggerBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY defender
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_defender Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender20 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender18 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender15 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE CS_AttackVillageFailQuest
Quest __temp = self as Quest
CS_AttackVillageFailQuest kmyQuest = __temp as CS_AttackVillageFailQuest
;END AUTOCAST
;BEGIN CODE
Alias_Defender.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender2.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender3.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender4.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender5.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender6.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender7.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender8.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender9.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender10.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender11.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender12.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender13.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender14.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender15.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender16.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender17.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender18.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender19.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender20.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)

Alias_Defender.Clear()
Alias_Defender2.Clear()
Alias_Defender3.Clear()
Alias_Defender4.Clear()
Alias_Defender5.Clear()
Alias_Defender6.Clear()
Alias_Defender7.Clear()
Alias_Defender8.Clear()
Alias_Defender9.Clear()
Alias_Defender10.Clear()
Alias_Defender11.Clear()
Alias_Defender12.Clear()
Alias_Defender13.Clear()
Alias_Defender14.Clear()
Alias_Defender15.Clear()
Alias_Defender16.Clear()
Alias_Defender17.Clear()
Alias_Defender18.Clear()
Alias_Defender19.Clear()
Alias_Defender20.Clear()

Alias_TriggerBox.GetReference().disable()

int i = 0
while i < AllLocations.GetSize()
	Location VillageLoc = AllLocations.GetAt(i) as Location
	GlobalVariable VillageHolding = AllHoldings.GetAt(i) as GlobalVariable
	GlobalVariable TaxTime = AllTaxTimes.GetAt(i) as GlobalVariable
	ObjectReference MapMarker = MapMarkers.GetAt(i) as ObjectReference
	ObjectReference CaptureMarker = CaptureMarkers.GetAt(i) as ObjectReference
	ObjectReference ImpMarker = GarrisonMarkersImp.GetAt(i) as ObjectReference
	ObjectReference SonsMarker = GarrisonMarkersSons.GetAt(i) as ObjectReference
	If Alias_Village.GetLocation() == VillageLoc
			If VillageHolding.GetValue() == 8
				If i == 10
					WarQuest[VillageHolding.GetValue() as int].SetObjectiveCompleted(10)
				Elseif i == 14
					WarQuest[VillageHolding.GetValue() as int].SetObjectiveCompleted(11)
				EndIf
			ElseIf VillageHolding.GetValue() == 9
				If i == 12
					WarQuest[VillageHolding.GetValue() as int].SetObjectiveCompleted(10)
				Elseif i == 13
					WarQuest[VillageHolding.GetValue() as int].SetObjectiveCompleted(11)
				EndIf
			Else
			WarQuest[VillageHolding.GetValue() as int].SetObjectiveCompleted(10)
			EndIf
				Quest WarQuestSpecific = WarQuest[VillageHolding.GetValue() as int]
			VillageHolding.SetValue(1)
			VillageLoc.SetKeywordData(CWOwner, 69)
			WarQuestSpecific.SetStage(50)
			MapMarker.enable()
			ImpMarker.disable()
			SonsMarker.disable()
			CaptureMarker.enable()
			int index = 0
			while index < CityGuards[i].GetSize()
				Actor Guard = CityGuards[i].GetAt(index) as Actor
				OutfitChanger.ForceRefTo(Guard)
				OutfitChanger.GetActorRef().SetOutfit(OutfitsGuard.GetAt(OutfitNum.GetValue() as int) as Outfit)
				OutfitChanger.GetActorRef().RemoveItem(OutfitChanger.GetActorRef().GetEquippedWeapon())
				OutfitChanger.GetActorRef().RemoveItem(OutfitChanger.GetActorRef().GetEquippedShield())
				OutfitChanger.GetActorRef().EquipItem(BowsGuard.GetAt(OutfitNum.GetValue() as int) as Weapon)
				OutfitChanger.GetActorRef().AddItem(AmmoGuard.GetAt(OutfitNum.GetValue() as int) as Ammo, 100)
				OutfitChanger.GetActorRef().EquipItem(AmmoGuard.GetAt(OutfitNum.GetValue() as int) as Ammo)
				OutfitChanger.GetActorRef().EquipItem(SwordsGuard.GetAt(OutfitNum.GetValue() as int) as Weapon)
				OutfitChanger.GetActorRef().EquipItem(ShieldsGuard.GetAt(OutfitNum.GetValue() as int) as Armor)
				OutfitChanger.Clear()
				index += 1
			endwhile
			int guardnum = 0
			while guardnum < AllEnemyGuards[i].GetSize()
				(AllEnemyGuards[i].GetAt(guardnum) as Actor).disable()
				guardnum += 1
			endwhile
			TaxTime.SetValue(GameDaysPassed.GetValue())
			PlayerVillageCount.SetValue(PlayerVillageCount.GetValue() + 1)
	endIf
	i += 1
endwhile

TroopDeath.SetValue(0)
DefenderCount.SetValue(0)
Alias_Village.Clear()
Alias_TriggerBox.Clear()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CS_AttackVillageFailQuest
Quest __temp = self as Quest
CS_AttackVillageFailQuest kmyQuest = __temp as CS_AttackVillageFailQuest
;END AUTOCAST
;BEGIN CODE
TroopDeath.SetValue(0)
PercentRemaining.SetValue(100)
PercentRemainingTrue.SetValue(100)
UpdateCurrentInstanceGlobal(DefenderCount)
UpdateCurrentInstanceGlobal(TroopDeath)
UpdateCurrentInstanceGlobal(PercentRemaining)
kmyQuest.RegisterForUpdateGameTime(0.5)
Alias_TriggerBox.GetReference().disable()
SetObjectiveDisplayed(0, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
TroopDeath.SetValue(TroopDeath.GetValue() + 1)
float percentchange = 100*(1/(DefenderCount.GetValue())) as float
PercentRemainingTrue.SetValue(PercentRemainingTrue.GetValue() - percentchange)
percentchange = (PercentRemaining.GetValue() - PercentRemainingTrue.GetValue()) as int

if TroopDeath.GetValue() == DefenderCount.GetValue()
	SetStage(100)
endif

if TroopDeath.GetValue() == DefenderCount.GetValue()
	PercentRemaining.SetValue(0)
	percentchange = 0
	UpdateCurrentInstanceGlobal(PercentRemaining)
	SetObjectiveCompleted(0)
endif

if percentchange >= 30 && PercentRemainingTrue.GetValue() > 0
	ModObjectiveGlobal(-percentchange, PercentRemaining, 0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
Alias_Defender.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender2.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender3.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender4.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender5.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender6.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender7.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender8.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender9.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender10.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender11.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender12.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender13.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender14.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender15.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender16.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender17.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender18.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender19.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender20.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)

DefenderCount.SetValue(0)
Alias_TriggerBox.GetReference().enable()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Alias_Defender.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender2.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender3.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender4.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender5.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender6.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender7.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender8.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender9.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender10.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender11.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender12.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender13.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender14.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender15.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender16.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender17.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender18.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender19.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)
Alias_Defender20.GetActorRef().RemoveFromFaction(CS_DefendingVillageFaction)

Alias_Defender.Clear()
Alias_Defender2.Clear()
Alias_Defender3.Clear()
Alias_Defender4.Clear()
Alias_Defender5.Clear()
Alias_Defender6.Clear()
Alias_Defender7.Clear()
Alias_Defender8.Clear()
Alias_Defender9.Clear()
Alias_Defender10.Clear()
Alias_Defender11.Clear()
Alias_Defender12.Clear()
Alias_Defender13.Clear()
Alias_Defender14.Clear()
Alias_Defender15.Clear()
Alias_Defender16.Clear()
Alias_Defender17.Clear()
Alias_Defender18.Clear()
Alias_Defender19.Clear()
Alias_Defender20.Clear()

Alias_TriggerBox.GetReference().disable()

int i = 0
while i < AllLocations.GetSize()
	Location VillageLoc = AllLocations.GetAt(i) as Location
	GlobalVariable VillageHolding = AllHoldings.GetAt(i) as GlobalVariable
	GlobalVariable TaxTime = AllTaxTimes.GetAt(i) as GlobalVariable
	ObjectReference MapMarker = MapMarkers.GetAt(i) as ObjectReference
	ObjectReference CaptureMarker = CaptureMarkers.GetAt(i) as ObjectReference
	ObjectReference ImpMarker = GarrisonMarkersImp.GetAt(i) as ObjectReference
	ObjectReference SonsMarker = GarrisonMarkersSons.GetAt(i) as ObjectReference
	If Alias_Village.GetLocation() == VillageLoc
			If VillageHolding.GetValue() == 8
				If i == 10
					WarQuest[VillageHolding.GetValue() as int].SetObjectiveCompleted(10)
				Elseif i == 14
					WarQuest[VillageHolding.GetValue() as int].SetObjectiveCompleted(11)
				EndIf
			ElseIf VillageHolding.GetValue() == 9
				If i == 12
					WarQuest[VillageHolding.GetValue() as int].SetObjectiveCompleted(10)
				Elseif i == 13
					WarQuest[VillageHolding.GetValue() as int].SetObjectiveCompleted(11)
				EndIf
			Else
			WarQuest[VillageHolding.GetValue() as int].SetObjectiveCompleted(10)
			EndIf
				Quest WarQuestSpecific = WarQuest[VillageHolding.GetValue() as int]
			VillageHolding.SetValue(1)
			VillageLoc.SetKeywordData(CWOwner, 69)
			WarQuestSpecific.SetStage(50)
			MapMarker.enable()
			ImpMarker.disable()
			SonsMarker.disable()
			CaptureMarker.enable()
			int index = 0
			while index < CityGuards[i].GetSize()
				Actor Guard = CityGuards[i].GetAt(index) as Actor
				(UpgradeTroopQuest as CS_UpgradeTroopsMenu).UpgradeTroop(Guard)
				index += 1
			endwhile
			int guardnum = 0
			while guardnum < AllEnemyGuards[i].GetSize()
				(AllEnemyGuards[i].GetAt(guardnum) as Actor).disable()
				guardnum += 1
			endwhile
			TaxTime.SetValue(GameDaysPassed.GetValue())
			PlayerVillageCount.SetValue(PlayerVillageCount.GetValue() + 1)
	endIf
	i += 1
endwhile

TroopDeath.SetValue(0)
DefenderCount.SetValue(0)
Alias_Village.Clear()
Alias_TriggerBox.Clear()

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DefenderCount  Auto  

FormList Property AllHoldings  Auto  

FormList Property AllLocations  Auto  

FormList Property AllTaxTimes  Auto  

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property PlayerVillageCount  Auto  

GlobalVariable Property EnemyVillageCount  Auto  

Int Property DefenderCountInitial  Auto  

ObjectReference Property MarkerImp  Auto  

ObjectReference Property MarkerSons  Auto  

ObjectReference Property MarkerPlayer  Auto  

FormList Property CaptureMarkers  Auto  

GlobalVariable Property TroopDeath  Auto  

FormList Property GarrisonMarkersImp  Auto  

FormList Property GarrisonMarkersSons  Auto  

Quest[] Property WarQuest  Auto  

GlobalVariable Property HoldingValueVillage1  Auto  

Faction Property CS_DefendingVillageFaction  Auto  

FormList Property MapMarkers  Auto  

FormList[] Property CityGuards  Auto  

FormList Property OutfitsGuard  Auto  

FormList Property SwordsGuard  Auto  

FormList Property ShieldsGuard  Auto  

FormList Property BowsGuard  Auto  

FormList Property AmmoGuard  Auto  

GlobalVariable Property OutfitNum  Auto  

ReferenceAlias Property OutfitChanger  Auto  

FormList[] Property AllEnemyGuards  Auto  

Keyword Property CWOwner  Auto  

CS_EconomyVariableFunctions Property CS_EconomyUpdater Auto

Message Property PlunderChoiceMessage  Auto  

GlobalVariable Property PercentRemaining  Auto  

GlobalVariable Property PercentRemainingTrue  Auto  

Quest Property CommanderQuest  Auto  

Quest Property UpgradeTroopQuest  Auto  
