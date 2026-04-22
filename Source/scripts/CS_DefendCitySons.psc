;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname CS_DefendCitySons Extends Quest Hidden

;BEGIN ALIAS PROPERTY Defender14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefendMarkerPhase1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefendMarkerPhase1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker20 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackStartMarkerPhase2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackStartMarkerPhase2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefendMarkerPhase2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefendMarkerPhase2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY defender
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_defender Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TriggerBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TriggerBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender18 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker18 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Palace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Palace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender20 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SuccessMessage.show()

WarScoreSons.Mod(5)

AttackerCount.SetValue(0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
TroopDeath.SetValue(TroopDeath.GetValue() + 1)
float percentchange = 100*(1/(AttackerCount.GetValue())) as float
PercentRemainingTrue.SetValue(PercentRemainingTrue.GetValue() - percentchange)
percentchange = (PercentRemaining.GetValue() - PercentRemainingTrue.GetValue()) as int

if TroopDeath.GetValue() >= AttackerCount.GetValue()
	PercentRemaining.SetValue(0)
	percentchange = 0
	UpdateCurrentInstanceGlobal(PercentRemaining)
	SetObjectiveCompleted(0)
	SetStage(500)
endif

if percentchange >= 10 && PercentRemainingTrue.GetValue() > 0
	ModObjectiveGlobal(-percentchange, PercentRemaining, 0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
int i = 0
while i < AllLocations.GetSize() && TroopDeath.GetValue() < AttackerCount.GetValue() - 10
	If Alias_City.GetLocation() == (AllLocations.GetAt(i) as Location)
		int index = 0
		while index < (AttackerRefs.Length - 1)
			if AttackerRefs[index].GetActorRef().IsDead() == 1
				int trooptype = utility.randomint(0, 1)
				if trooptype == 0
					Actor Soldier = Alias_AttackStartMarker.GetReference().PlaceAtMe(SiegeTroopSoldier) as Actor
					AttackerRefs[index].ForceRefTo(Soldier)
				elseif trooptype == 1
					Actor Soldier = Alias_AttackStartMarker.GetReference().PlaceAtMe(SiegeTroopArcher) as Actor
					AttackerRefs[index].ForceRefTo(Soldier)
				endif
			endif
			index += 1
		endwhile
	endIf
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
int i = 0
while i < AllLocations.GetSize()
	Location CityLoc = AllLocations.GetAt(i) as Location
	GlobalVariable CityHolding = AllHoldings.GetAt(i) as GlobalVariable
	GlobalVariable TaxTime = AllTaxTimes.GetAt(i) as GlobalVariable
	ObjectReference CaptureMarker = CaptureMarkers.GetAt(i) as ObjectReference
	ObjectReference ImpMarker = GarrisonMarkersImp.GetAt(i) as ObjectReference
	ObjectReference SonsMarker = GarrisonMarkersSons.GetAt(i) as ObjectReference
	ObjectReference EnemyDefMarker = EnemyDefenderMarker.GetAt(i) as ObjectReference
	If Alias_City.GetLocation() == CityLoc
		CityHolding.SetValue(11)
		CityLoc.SetKeywordData(CWOwner, 1)
		CaptureMarker.disable()
		(Garrisons.GetAt(i) as GlobalVariable).SetValue(AttackerCount.GetValue() - TroopDeath.GetValue())
		JarlAliases[i].ForceRefTo(Jarls[i])
		If Jarls[i] == JarlCitizenAlias[i].GetActorRef()
			JarlCitizens.SetStage(100 + i)
		EndIf
		If Jarls[i] == JarlPrisonerAlias[i].GetActorRef()
			JarlPrisonerAlias[i].Clear()
		EndIf
		if i < 5
			PlayerCityCount.SetValue(PlayerCityCount.GetValue() - 1)
			EnemyCityCount.SetValue(EnemyCityCount.GetValue() + 1)
			ImpMarker.enable()
		else
			PlayerMinorCityCount.SetValue(PlayerMinorCityCount.GetValue() - 1)
			EnemyMinorCityCount.SetValue(EnemyMinorCityCount.GetValue() + 1)
		endif
	endIf
	i += 1
endwhile

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Fail

FailMessage.show()

Alias_Attacker.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker2.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker3.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker4.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker5.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker6.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker7.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker8.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker9.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker10.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker11.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker12.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker13.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker14.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker15.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker16.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker17.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker18.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker19.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker20.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)

int i = 0
while i < AllLocations.GetSize()
	Location CityLoc = AllLocations.GetAt(i) as Location
	GlobalVariable CityHolding = AllHoldings.GetAt(i) as GlobalVariable
	GlobalVariable TaxTime = AllTaxTimes.GetAt(i) as GlobalVariable
	ObjectReference CaptureMarker = CaptureMarkers.GetAt(i) as ObjectReference
	ObjectReference ImpMarker = GarrisonMarkersImp.GetAt(i) as ObjectReference
	ObjectReference SonsMarker = GarrisonMarkersSons.GetAt(i) as ObjectReference
	ObjectReference EnemyDefMarker = EnemyDefenderMarker.GetAt(i) as ObjectReference
	If Alias_City.GetLocation() == CityLoc
		CityHolding.SetValue(12)
		CityLoc.SetKeywordData(CWOwner, 2)
		CaptureMarker.disable()
		(Garrisons.GetAt(i) as GlobalVariable).SetValue(AttackerCount.GetValue() - TroopDeath.GetValue())
		JarlAliases[i].ForceRefTo(Jarls[i])
		If Jarls[i] == JarlCitizenAlias[i].GetActorRef()
			JarlCitizens.SetStage(100 + i)
		EndIf
		If Jarls[i] == JarlPrisonerAlias[i].GetActorRef()
			JarlPrisonerAlias[i].Clear()
		EndIf
		WarQuest.SetObjectiveDisplayed(i, abForce = true)
		if i < 5
			PlayerCityCount.SetValue(PlayerCityCount.GetValue() - 1)
			EnemyCityCount.SetValue(EnemyCityCount.GetValue() + 1)
			WarScoreSons.Mod(-30)
			SonsMarker.enable()
		else
			PlayerMinorCityCount.SetValue(PlayerMinorCityCount.GetValue() - 1)
			EnemyMinorCityCount.SetValue(EnemyMinorCityCount.GetValue() + 1)
			WarScoreSons.Mod(-20)
		endif
		Alias_TriggerBox.GetReference().enable()
	endIf
	i += 1
endwhile

TroopDeath.SetValue(0)
AttackerCount.SetValue(0)
Alias_City.Clear()
Alias_TriggerBox.Clear()

SetStage(501)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
RegisterForUpdateGameTime(1)
Iteration.SetValue(0)
CombatStarted.SetValue(0)
TroopDeath.SetValue(0)
PercentRemaining.SetValue(100)
PercentRemainingTrue.SetValue(100)
UpdateCurrentInstanceGlobal(TroopDeath)
UpdateCurrentInstanceGlobal(AttackerCount)
UpdateCurrentInstanceGlobal(PercentRemaining)
int AttackTroopNum = AttackerCount.GetValue() as int
AttackMessage.show()
SetObjectiveDisplayed(0, true)
int i = 0
while i < AllLocations.GetSize()
	if Alias_City.GetLocation() == AllLocations.GetAt(i) as Location
		Alias_Palace.ForceLocationTo(AllPalaces.GetAt(i) as Location)
		Alias_DefendMarkerPhase1.ForceRefTo(DefendMarkers1.GetAt(i) as ObjectReference) 
		Alias_DefendMarkerPhase2.ForceRefTo(DefendMarkers2.GetAt(i) as ObjectReference) 
		Alias_AttackStartMarker.ForceRefTo(AttackStartMarkers.GetAt(i) as ObjectReference)
		Alias_AttackStartMarkerPhase2.ForceRefTo(AttackStartMarkersPhase2.GetAt(i) as ObjectReference)
		Alias_TriggerBox.ForceRefTo(TriggerBoxes.GetAt(i) as ObjectReference)
		ObjectReference AttackMarker = AttackStartMarkers.GetAt(i) as ObjectReference
		PlayerGarrisonCount.SetValue((PlayerGarrisonCounts.GetAt(i) as GlobalVariable).GetValue())
		int index = 0
			if AttackerCount.GetValue() > 20		
				While index < 20
					int trooptype = utility.randomint(0, 1)
					if trooptype == 0
						Actor Soldier = AttackMarker.PlaceAtMe(SiegeTroopSoldier) as Actor
						AttackerRefs[index].ForceRefTo(Soldier)
					elseif trooptype == 1
						Actor Soldier = AttackMarker.PlaceAtMe(SiegeTroopArcher) as Actor
						AttackerRefs[index].ForceRefTo(Soldier)
					endif
					AttackTroopNum -= 1
					index += 1
				EndWhile
			elseif AttackerCount.GetValue() <= 20
				While index < AttackerCount.GetValue()
					int trooptype = utility.randomint(0, 1)
					if trooptype == 0
						Actor Soldier = AttackMarker.PlaceAtMe(SiegeTroopSoldier) as Actor
						AttackerRefs[index].ForceRefTo(Soldier)
					elseif trooptype == 1
						Actor Soldier = AttackMarker.PlaceAtMe(SiegeTroopArcher) as Actor
						AttackerRefs[index].ForceRefTo(Soldier)
					endif
					AttackTroopNum -= 1
					index += 1
				EndWhile
			endif
			index = 0
				While index < PlayerGarrisonCount.GetValue()
					Actor DefenseTroop = Alias_DefendMarkerPhase1.GetReference().PlaceActorAtMe(PlayerDefenseTroop)
					DefenderRefs[index].ForceRefTo(DefenseTroop)
					NameChanger.ForceRefTo(DefenderRefs[index].GetActorRef())
					DefenderRefs[index].GetActorRef().SetOutfit(OutfitsGuard.GetAt(OutfitNum.GetValue() as int) as Outfit)
					DefenderRefs[index].GetActorRef().RemoveItem(DefenderRefs[index].GetActorRef().GetEquippedWeapon())
					DefenderRefs[index].GetActorRef().RemoveItem(DefenderRefs[index].GetActorRef().GetEquippedShield())
					DefenderRefs[index].GetActorRef().EquipItem(BowsGuard.GetAt(OutfitNum.GetValue() as int) as Weapon)
					DefenderRefs[index].GetActorRef().AddItem(AmmoGuard.GetAt(OutfitNum.GetValue() as int) as Ammo, 100)
					DefenderRefs[index].GetActorRef().EquipItem(AmmoGuard.GetAt(OutfitNum.GetValue() as int) as Ammo)
					DefenderRefs[index].GetActorRef().EquipItem(SwordsGuard.GetAt(OutfitNum.GetValue() as int) as Weapon)
					DefenderRefs[index].GetActorRef().EquipItem(ShieldsGuard.GetAt(OutfitNum.GetValue() as int) as Armor)
					NameChanger.Clear()
					index += 1
				EndWhile
	endif
	i += 1
endWhile
EndFunction

int ChanceOfVictory = 0
int OutcomeRoll = 0

Event OnUpdateGameTime()
	Iteration.SetValue(Iteration.GetValue() + 1)
	;Perform Battle Calculation
	ChanceOfVictory = 50
	ChanceOfVictory += PlayerGarrisonCount.GetValue() as int
	ChanceOfVictory -= AttackerCount.GetValue() as int
	ChanceOfVictory += (math.abs(OutfitNum.GetValue() as int) as int)*5
	OutcomeRoll = utility.randomint(0, 100)
	If OutcomeRoll > ChanceOfVictory || ChanceOfVictory < 20
		DefenseWon.SetValue(0)
	Else
		DefenseWon.SetValue(1)
	EndIf
	If Game.GetPlayer().IsInLocation(Alias_City.GetLocation()) == 0
		If DefenseWon.GetValue() == 1
			SetStage(500)
		Else
			SetStage(100)
		EndIf
	ElseIf Game.GetPlayer().IsInLocation(Alias_City.GetLocation()) == 1
		If Iteration.GetValue() == 2
			If CombatStarted.GetValue() != 1
				If DefenseWon.GetValue() == 1
					int i = 0
					while i < AttackerRefs.Length
						AttackerRefs[i].GetActorRef().disable()
						i += 1
					endwhile
					UnRegisterForUpdateGameTime()
					SetStage(500)
				Else
					;Defenders Die
					Alias_AttackStartMarker.ForceRefTo(Alias_AttackStartMarkerPhase2.GetReference())
					Alias_DefendMarkerPhase1.ForceRefTo(Alias_DefendMarkerPhase2.GetReference())
					debug.notification("The attackers have breached the city!")
					int i = 0
					while i < math.floor(PlayerGarrisonCount.GetValue()/2) as int
						AttackerRefs[i].GetActorRef().kill()
						i += 1
					endwhile
					i = 0
					while i < AttackerRefs.Length
						AttackerRefs[i].GetActorRef().MoveTo(Alias_AttackStartMarkerPhase2.GetReference())
						i += 1
					endwhile
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent

Function BugFixMaybe()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
Alias_Attacker.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker2.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker3.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker4.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker5.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker6.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker7.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker8.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker9.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker10.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker11.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker12.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker13.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker14.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker15.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker16.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker17.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker18.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker19.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker20.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)

int i = 0
while i < DefenderRefs.Length
	DefenderRefs[i].GetActorRef().delete()
	DefenderRefs[i].Clear()
	AttackerRefs[i].GetActorRef().delete()
	AttackerRefs[i].Clear()
	i += 1
endwhile

AttackerCount.SetValue(0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
int i = 0
while i < AllFortLocations.GetSize()
	Location FortLoc = AllFortLocations.GetAt(i) as Location
	GlobalVariable FortHolding = AllFortHoldings.GetAt(i) as GlobalVariable
	ObjectReference CaptureMarker = CaptureMarkersFort.GetAt(i) as ObjectReference
	ObjectReference SonsMarker = GarrisonMarkersSonsFort.GetAt(i) as ObjectReference
	If Alias_City.GetLocation() == FortLoc
		FortHolding.SetValue(12)
		FortLoc.SetKeywordData(CWOwner, 2)
		CaptureMarker.disable()
		PlayerFortCount.SetValue(PlayerCityCount.GetValue() - 1)
		EnemyFortCount.SetValue(EnemyCityCount.GetValue() + 1)
		SonsMarker.enable()
	endIf
	i += 1
endwhile

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property AttackerCount  Auto  

FormList Property AllHoldings  Auto  

FormList Property AllLocations  Auto  

FormList Property AllTaxTimes  Auto  

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property PlayerVillageCount  Auto  

GlobalVariable Property EnemyVillageCount  Auto  

ObjectReference Property MarkerImp  Auto  

ObjectReference Property MarkerSons  Auto  

ObjectReference Property MarkerPlayer  Auto  

FormList Property CaptureMarkers  Auto  

GlobalVariable Property TroopDeath  Auto  

FormList Property GarrisonMarkersImp  Auto  

FormList Property GarrisonMarkersSons  Auto  

Quest Property WarQuest  Auto  

GlobalVariable Property HoldingValueVillage1  Auto  

Faction Property CS_AttackingVillageFaction  Auto  

ActorBase Property SiegeTroopSoldier  Auto  

ActorBase Property SiegeTroopArcher  Auto  

FormList Property AttackStartMarkers  Auto  

ReferenceAlias[] Property AttackerRefs  Auto  

FormList Property AllPalaces  Auto  

Cell[] Property PalaceCells  Auto  

FormList Property DefendMarkers1  Auto  

GlobalVariable Property DefenseWon  Auto  

GlobalVariable Property Iteration  Auto  

GlobalVariable Property combatStarted  Auto  

FormList Property DefendMarkers2  Auto  

FormList Property CityDoors  Auto  

ReferenceAlias[] Property FleeingTroopsRefs  Auto  

GlobalVariable Property PlayerCityCount  Auto  

GlobalVariable Property EnemyCityCount  Auto  


GlobalVariable Property PlayerMinorCityCount  Auto  

GlobalVariable Property EnemyMinorCityCount  Auto  

FormList Property TriggerBoxes  Auto  

FormList Property EnemyDefenderMarker  Auto  

FormList Property PlayerGarrisonCounts  Auto  

GlobalVariable Property PlayerGarrisonCount  Auto  

ReferenceAlias[] Property DefenderRefs  Auto  

ActorBase Property PlayerDefenseTroop  Auto  

FormList Property OutfitsGuard  Auto  

GlobalVariable Property OutfitNum  Auto  

FormList Property BowsGuard  Auto  

FormList Property AmmoGuard  Auto  

FormList Property SwordsGuard  Auto  

FormList Property ShieldsGuard  Auto  

FormList Property AttackStartMarkersPhase2  Auto  

FormList[] Property Defenders  Auto  

GlobalVariable Property PercentRemaining  Auto  

Message Property AttackMessage  Auto  

GlobalVariable Property PercentRemainingTrue  Auto  

ReferenceAlias Property NameChanger  Auto  

Quest Property JarlCitizens  Auto  

Message Property FailMessage  Auto  

Message Property SuccessMessage  Auto  

ReferenceAlias[] Property JarlAliases  Auto  

ObjectReference[] Property Jarls  Auto  

FormList Property Garrisons  Auto  

ReferenceAlias[] Property JarlCitizenAlias  Auto  

ReferenceAlias[] Property JarlPrisonerAlias  Auto  

Keyword Property CWOwner  Auto  

GlobalVariable Property WarScoreSons  Auto  

FormList Property AllFortLocations  Auto  

FormList Property AllFortHoldings  Auto  

FormList Property CaptureMarkersFort  Auto  

FormList Property GarrisonMarkersSonsFort  Auto  

GlobalVariable Property PlayerFortCount  Auto  

GlobalVariable Property EnemyFortCount  Auto  

Quest Property BorderQuest  Auto  
