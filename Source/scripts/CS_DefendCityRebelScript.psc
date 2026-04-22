;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname CS_DefendCityRebelScript Extends Quest Hidden

;BEGIN ALIAS PROPERTY DefendMarkerPhase2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefendMarkerPhase2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RebelCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_RebelCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewJarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NewJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefendMarkerPhase1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefendMarkerPhase1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker20 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackStartMarkerPhase2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackStartMarkerPhase2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Palace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Palace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender015 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Leader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Leader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TriggerBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TriggerBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker015 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker012 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY defender
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_defender Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender012 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker18 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender000 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CS_DefendCityUpdates
Quest __temp = self as Quest
CS_DefendCityUpdates kmyQuest = __temp as CS_DefendCityUpdates
;END AUTOCAST
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

int i = AllLocations.Find(Alias_City.GetLocation())

	Location CityLoc = AllLocations.GetAt(i) as Location
	(AllLocationsCS.GetAt(i) as Location).SetKeywordData(Attackable, 1)
	GlobalVariable CityHolding = AllHoldings.GetAt(i) as GlobalVariable
	GlobalVariable TaxTime = AllTaxTimes.GetAt(i) as GlobalVariable
	ObjectReference CaptureMarker = CaptureMarkers.GetAt(i) as ObjectReference
	ObjectReference ImpMarker = GarrisonMarkersImp.GetAt(i) as ObjectReference
	ObjectReference SonsMarker = GarrisonMarkersSons.GetAt(i) as ObjectReference
	ObjectReference EnemyDefMarker = EnemyDefenderMarker.GetAt(i) as ObjectReference
		CityHolding.SetValue(70)
		(GovQuest as CS_EnemyCities).EnemyCities[i].ForceLocationTo(CityLoc)
		CityLoc.SetKeywordData(CWOwner, 70)
		CaptureMarker.disable()
		(Garrisons.GetAt(i) as GlobalVariable).SetValue(AttackerCount.GetValue() - TroopDeath.GetValue())
		(GovQuest as CS_RecruitJarl).FireJarlSpecific(i)
		If WarQuest.IsRunning() == 0
			WarQuest.Start()
			WarQuest.SetStage(10)
		Else
			WarQuest.SetObjectiveDisplayed(i, abForce = true)
		EndIf
		JarlAliases[i].ForceRefTo(Alias_Leader.GetActorRef())
		Alias_NewJarl.ForceRefTo(Alias_Leader.GetActorRef())
		NewJarlMessage.show()
		if i < 5
			PlayerCityCount.SetValue(PlayerCityCount.GetValue() - 1)
			EnemyCityCount.SetValue(EnemyCityCount.GetValue() + 1)
			WarScoreRebel.Mod(-30)
		else
			PlayerMinorCityCount.SetValue(PlayerMinorCityCount.GetValue() - 1)
			EnemyMinorCityCount.SetValue(EnemyMinorCityCount.GetValue() + 1)
			WarScoreRebel.Mod(-20)
		endif
		(GovQuest as CS_GovScriptFunctions).FindNewCapital(i)
		(CommanderQuest as CS_PatrolHoldScript).RemoveAllCommandersFromGarrison(Alias_City)
		Alias_TriggerBox.GetReference().enable()
		(GovQuest as CS_ChangeBanners).RestoreOldCityBanners(i)
		(AllWarQuests.GetAt(i) as Quest).SetStage(10)
		int index = 0
		while index < (AllGuardFormLists.GetAt(i) as FormList).GetSize()
			Actor Guard = (AllGuardFormLists.GetAt(i) as FormList).GetAt(index) as Actor
			if Guard.IsEnabled() == 1
				Guard.kill()
			endif
			index += 1
		endwhile
		if i == 0
			if ((AllHoldings.GetAt(11) as GlobalVariable).GetValue() as int) == 1
				Quest VillageQuest = VillageAlias[i].GetOwningQuest() as Quest
				VillageQuest.Start()
				VillageQuest.SetStage(0)
				VillageAlias[i].ForceLocationTo(AllLocations.GetAt(11) as Location)
				VillageQuest.SetStage(150)
			endif
		elseif i == 1
			if ((AllHoldings.GetAt(10) as GlobalVariable).GetValue() as int) == 1
				Quest VillageQuest = VillageAlias[i].GetOwningQuest() as Quest
				VillageQuest.Start()
				VillageQuest.SetStage(0)
				VillageAlias[i].ForceLocationTo(AllLocations.GetAt(10) as Location)
				VillageQuest.SetStage(150)
			endif
			if ((AllHoldings.GetAt(14) as GlobalVariable).GetValue() as int) == 1
				Quest VillageQuest = VillageAlias[i].GetOwningQuest() as Quest
				VillageQuest.Start()
				VillageQuest.SetStage(0)
				VillageAlias[i].ForceLocationTo(AllLocations.GetAt(14) as Location)
				VillageQuest.SetStage(150)
			endif
		elseif i == 2
			if ((AllHoldings.GetAt(9) as GlobalVariable).GetValue() as int) == 1
				Quest VillageQuest = VillageAlias[i].GetOwningQuest() as Quest
				VillageQuest.Start()
				VillageQuest.SetStage(0)
				VillageAlias[i].ForceLocationTo(AllLocations.GetAt(9) as Location)
				VillageQuest.SetStage(150)
			endif
		elseif i == 3
			if ((AllHoldings.GetAt(12) as GlobalVariable).GetValue() as int) == 1
				Quest VillageQuest = VillageAlias[i].GetOwningQuest() as Quest
				VillageQuest.Start()
				VillageQuest.SetStage(0)
				VillageAlias[i].ForceLocationTo(AllLocations.GetAt(12) as Location)
				VillageQuest.SetStage(150)
			endif
			if ((AllHoldings.GetAt(13) as GlobalVariable).GetValue() as int) == 1
				Quest VillageQuest = VillageAlias[i].GetOwningQuest() as Quest
				VillageQuest.Start()
				VillageQuest.SetStage(0)
				VillageAlias[i].ForceLocationTo(AllLocations.GetAt(13) as Location)
				VillageQuest.SetStage(150)
			endif
		endif


TroopDeath.SetValue(0)
AttackerCount.SetValue(0)
Alias_City.Clear()
Alias_TriggerBox.Clear()

SetStage(501)
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
		(GovQuest as CS_GovScriptFunctions).FindNewCapital(i)
		(CommanderQuest as CS_PatrolHoldScript).RemoveAllCommandersFromGarrison(Alias_City)
		(GovQuest as CS_ChangeBanners).RestoreOldCityBanners(i)
	endIf
	i += 1
endwhile

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CS_DefendCityUpdates
Quest __temp = self as Quest
CS_DefendCityUpdates kmyQuest = __temp as CS_DefendCityUpdates
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnregisterForUpdateGameTime()

MUSCombatCivilWar.Remove()
DefenderMarkers[0].GetOwningQuest().stop()
SuccessMessage.show()

Alias_Leader.GetActorRef().RemoveFromFaction(RebelFaction)
Surrenderer.GetOwningQuest().Start()
Surrenderer.ForceRefTo(Alias_Leader.GetActorRef())

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
while i < AttackerRefs.Length
	AttackerRefs[i].GetActorRef().AddToFaction(RetreatFaction)
	AttackerRefs[i].Clear()
	i += 1
endwhile

int citynum = AllLocations.Find(Alias_City.GetLocation())
FormList TroopGarrison = GarrisonTroops.GetAt(citynum) as FormList
int index = 0
While index < TroopGarrison.GetSize()
	if (TroopGarrison.GetAt(index) as Actor).IsInFaction(CommanderFaction) == 1
		(CommanderQuest as CS_PatrolHoldScript).SetUpForTroopRespawn(TroopGarrison.GetAt(index) as Actor)
	endif
	index += 1
EndWhile

(LoyaltyQuest as CS_LoyaltyCheckScript).AdjustLoyalty((LoyaltyQuest as CS_LoyaltyCheckScript).ConvertVanillaToCS(Alias_City.GetLocation()), 40)

WarScoreRebel.Mod(5)

AttackerCount.SetValue(0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
int i = 0
while i < AllFortLocations.GetSize()
	Location FortLoc = AllFortLocations.GetAt(i) as Location
	GlobalVariable FortHolding = AllFortHoldings.GetAt(i) as GlobalVariable
	ObjectReference CaptureMarker = CaptureMarkersFort.GetAt(i) as ObjectReference
	ObjectReference ImpMarker = GarrisonMarkersImpFort.GetAt(i) as ObjectReference
	If Alias_City.GetLocation() == FortLoc
		FortHolding.SetValue(11)
		FortLoc.SetKeywordData(CWOwner, 1)
		CaptureMarker.disable()
		PlayerFortCount.SetValue(PlayerCityCount.GetValue() - 1)
		EnemyFortCount.SetValue(EnemyCityCount.GetValue() + 1)
		ImpMarker.enable()
		(GovQuest as CS_ChangeBanners).RestoreOldFortBanners(i)
	endIf
	i += 1
endwhile

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE CS_DefendCityUpdates
Quest __temp = self as Quest
CS_DefendCityUpdates kmyQuest = __temp as CS_DefendCityUpdates
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForUpdateGameTime(1)
DefenderMarkers[0].GetOwningQuest().Start()
Iteration.SetValue(0)
CombatStarted.SetValue(0)
TroopDeath.SetValue(0)
PercentRemaining.SetValue(100)
PercentRemainingTrue.SetValue(100)
((Alias_Attacker).GetOwningQuest() as CS_DefendCityTroopDeath).SetUpPlayerTroopCounts()
UpdateCurrentInstanceGlobal(TroopDeath)
UpdateCurrentInstanceGlobal(AttackerCount)
UpdateCurrentInstanceGlobal(PercentRemaining)
int AttackTroopNum = AttackerCount.GetValue() as int
if WarQuest.IsRunning() == 0
	Alias_RebelCity.ForceLocationTo(Alias_City.GetLocation())
endif
RebellionMessage.show()
AttackMessage.show()
SetObjectiveDisplayed(0, true)
SetObjectiveDisplayed(5, true, true)
kmyQuest.CommanderQuest.MoveCommandersFromCity(Alias_City)
int i = AllLocations.Find(Alias_City.GetLocation())

	if Alias_City.GetLocation() == AllLocations.GetAt(i) as Location
		Alias_Palace.ForceLocationTo(AllPalaces.GetAt(i) as Location)
		Alias_DefendMarkerPhase1.ForceRefTo(DefendMarkers1.GetAt(i) as ObjectReference) 
		Alias_DefendMarkerPhase2.ForceRefTo(DefendMarkers2.GetAt(i) as ObjectReference) 
		Alias_AttackStartMarker.ForceRefTo(AttackStartMarkers.GetAt(i) as ObjectReference)
		if i < 5
			Alias_AttackStartMarkerPhase2.ForceRefTo(AttackStartMarkersPhase2.GetAt(i) as ObjectReference)
		endif
		Alias_TriggerBox.ForceRefTo(TriggerBoxes.GetAt(i) as ObjectReference)
		ObjectReference AttackMarker = AttackStartMarkers.GetAt(i) as ObjectReference
		FormList TroopGarrison = GarrisonTroops.GetAt(i) as FormList
		(PlayerGarrisonCounts.GetAt(i) as GlobalVariable).SetValue(TroopGarrison.GetSize())
		PlayerGarrisonCount.SetValue((PlayerGarrisonCounts.GetAt(i) as GlobalVariable).GetValue())
		If Game.GetPlayer().IsInLocation(Alias_City.GetLocation())
			MUSCombatCivilWar.Add()
		EndIf
		int index = 0
		Alias_Leader.GetActorRef().enable()
		Alias_Leader.GetActorRef().SetAV("Confidence", 4)
		Alias_Leader.GetActorRef().SetAV("Aggression", 1)
		Alias_Leader.GetActorRef().SetAV("Morality", 0)
		Alias_Leader.GetActorRef().AddToFaction(RebelFaction)
		Alias_Leader.GetActorRef().MoveTo(AttackMarker)
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
			int refnum = 0
			int commandernum = 0
				While index < TroopGarrison.GetSize()
					Actor Troop = TroopGarrison.GetAt(index) as Actor
					if Troop.IsInFaction(CommanderFaction) == 1
						Troop.enable()
						(CommanderQuest as CS_PatrolHoldScript).RespawnTroops(Troop)
						DefenderRefs[refnum].ForceRefTo(Troop)
						DefenderMarkerTroops[refnum].ForceRefTo(DefenderMarkers[refnum].GetReference())
						Troop.MoveTo(DefenderMarkerTroops[refnum].GetReference())
						refnum += 1
						commandernum += 1
					endif
					index += 1
				endwhile
				index = 0
				debug.notification(TroopGarrison.GetSize() + " Troops in the garrison")
				While index < TroopGarrison.GetSize()
					Actor Troop = TroopGarrison.GetAt(index) as Actor
					if refnum < 20 - commandernum && Troop.IsInFaction(CommanderFaction) != 1
						Troop.enable()
						if Troop.GetActorBase() == PlayerSoldier || Troop.GetActorBase() == PlayerWarrior
							DefenderMarkerTroops[refnum].ForceRefTo(DefenderMarkers[refnum].GetReference())
						elseif Troop.GetActorBase() == PlayerArcher || Troop.GetActorBase() == PlayerCrossbowman
							DefenderMarkerTroops[refnum].ForceRefTo(DefenderMarkersRanged[refnum].GetReference())
						endif
						DefenderRefs[refnum].ForceRefTo(Troop)
						DefenderRefs[refnum].GetActorRef().MoveTo(DefenderMarkerTroops[refnum].GetReference())
						refnum += 1
						;(UpgradeTroops as CS_UpgradeTroopsMenu).UpgradeTroop(DefenderRefs[index].GetActorRef())
					elseif refnum >= 20 - commandernum  && Troop.IsInFaction(CommanderFaction) != 1
						;(UpgradeTroops as CS_UpgradeTroopsMenu).UpgradeTroop(DefenderRefs[index].GetActorRef())
						Troop.disable()
					endif
					index += 1
				EndWhile
	endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE CS_DefendCityUpdates
Quest __temp = self as Quest
CS_DefendCityUpdates kmyQuest = __temp as CS_DefendCityUpdates
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnregisterForUpdateGameTime()

MUSCombatCivilWar.Remove()
DefenderMarkers[0].GetOwningQuest().stop()

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
	DefenderRefs[i].Clear()
	AttackerRefs[i].GetActorRef().delete()
	AttackerRefs[i].Clear()
	i += 1
endwhile

int citynum = AllLocations.Find(Alias_City.GetLocation())
FormList TroopGarrison = GarrisonTroops.GetAt(citynum) as FormList
int index = 0
While index < TroopGarrison.GetSize()
	if (TroopGarrison.GetAt(index) as Actor).IsInFaction(CommanderFaction) == 1
		(CommanderQuest as CS_PatrolHoldScript).SetUpForTroopRespawn(TroopGarrison.GetAt(index) as Actor)
	endif
	index += 1
EndWhile

AttackerCount.SetValue(0)
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

GlobalVariable Property WarScoreImp  Auto  

GlobalVariable Property WarScoreSons  Auto  

FormList Property AllFortLocations  Auto  

FormList Property AllFortHoldings  Auto  

FormList Property GarrisonMarkersImpFort  Auto  

GlobalVariable Property PlayerFortCount  Auto  

GlobalVariable Property EnemyFortCount  Auto  

FormList Property CaptureMarkersFort  Auto  

Quest Property BorderQuest  Auto  

FormList Property GarrisonTroops  Auto  

Faction Property CommanderFaction  Auto  

Quest Property UpgradeTroops  Auto  

Quest Property GovQuest  Auto  

Quest Property CommanderQuest  Auto  

FormList Property AllWarQuests  Auto  

Message Property NewJarlMessage  Auto  

LocationAlias[] Property VillageAlias  Auto  

Faction Property RetreatFaction  Auto  

Faction Property RefreshFaction  Auto  

ReferenceAlias[] Property DefenderMarkers  Auto  

ReferenceAlias[] Property DefenderMarkersRanged  Auto  

ActorBase Property PlayerArcher  Auto  
ActorBase Property PlayerSoldier  Auto  
ActorBase Property PlayerCrossbowman  Auto  
ActorBase Property PlayerWarrior  Auto  

ReferenceAlias[] Property DefenderMarkerTroops  Auto  

MusicType Property MUSCombatCivilWar  Auto  

GlobalVariable Property WarScoreRebel  Auto  

Quest Property LoyaltyQuest  Auto  

Message Property RebellionMessage  Auto  

ReferenceAlias Property Surrenderer  Auto  

Faction Property RebelFaction  Auto  

FormList Property AllGuardFormLists  Auto  

FormList Property AllLocationsCS  Auto  

Keyword Property Attackable  Auto  
