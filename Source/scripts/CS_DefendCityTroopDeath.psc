Scriptname CS_DefendCityTroopDeath extends Quest  

FormList Property TroopGarrisons  Auto  
FormList Property AllLocations Auto

Quest Property DefendCityImp Auto
Quest Property DefendCitySons Auto
Quest Property DefendCityRebel Auto

CS_DefendCityImpScript Property ImpScript Auto
CS_DefendCitySonsScript Property SonsScript Auto
CS_DefendCityRebelScript Property RebelScript Auto

CS_UpgradeTroopsMenu Property UpgradeTroops Auto

LocationAlias Property City Auto

ReferenceAlias Property DefenseMarker Auto

float Property PlayerTroopsRemaining Auto
float Property PlayerTroopsStart Auto

GlobalVariable Property PlayerTroopPercentRemaining Auto

Function TroopDeathPlayer(ReferenceAlias TroopAlias)
	int citynum = AllLocations.Find(City.GetLocation())
	FormList Garrison = TroopGarrisons.GetAt(citynum) as FormList
	AdjustPlayerPercentRemaining()
	int i = 0
	int AliasFound = 0
	while i < Garrison.GetSize() && AliasFound == 0
		Actor NewTroop = Garrison.GetAt(i) as Actor
		if NewTroop.IsDisabled() == 1
			int index = 0
			if self == DefendCitySons
				NewTroop.enable()
				TroopAlias.ForceRefTo(NewTroop)
				TroopAlias.GetActorRef().MoveTo(DefenseMarker.GetReference())
				((DefendCitySons as CS_DefendCitySonsScript).CommanderQuest as CS_PatrolHoldScript).RefreshPackage(TroopAlias.GetActorRef())	
				TroopAlias.GetActorRef().EvaluatePackage()				
				;UpgradeTroops.UpgradeTroop(NewTroop)
				AliasFound = 1
			elseif self == DefendCityRebel
				NewTroop.enable()
				TroopAlias.ForceRefTo(NewTroop)
				TroopAlias.GetActorRef().MoveTo(DefenseMarker.GetReference())
				((DefendCityRebel as CS_DefendCityRebelScript).CommanderQuest as CS_PatrolHoldScript).RefreshPackage(TroopAlias.GetActorRef())	
				TroopAlias.GetActorRef().EvaluatePackage()				
				;UpgradeTroops.UpgradeTroop(NewTroop)
				AliasFound = 1
			endif
		endif
		i += 1
	endwhile
EndFunction

Function TroopDeathEnemy(Actor Troop)
	if self == DefendCitySons
		SonsScript.TroopDeath.SetValue(SonsScript.TroopDeath.GetValue() + 1)
		float percentchange = 100*(1/(SonsScript.AttackerCount.GetValue())) as float
		SonsScript.PercentRemainingTrue.SetValue(SonsScript.PercentRemainingTrue.GetValue() - percentchange)
		percentchange = (SonsScript.PercentRemaining.GetValue() - SonsScript.PercentRemainingTrue.GetValue()) as int

		if SonsScript.TroopDeath.GetValue() >= SonsScript.AttackerCount.GetValue()
			SonsScript.PercentRemaining.SetValue(0)
			percentchange = 0
			UpdateCurrentInstanceGlobal(SonsScript.PercentRemaining)
			SetObjectiveCompleted(0)
			SetStage(500)
		endif

		if percentchange >= 10 && SonsScript.PercentRemainingTrue.GetValue() > 0
			ModObjectiveGlobal(-percentchange, SonsScript.PercentRemaining, 0)
		endif

		int i = 0
		while i < SonsScript.AllLocations.GetSize() && SonsScript.TroopDeath.GetValue() < SonsScript.AttackerCount.GetValue() - 10
			If SonsScript.Alias_City.GetLocation() == (SonsScript.AllLocations.GetAt(i) as Location)
				int index = 0
				while index < (SonsScript.AttackerRefs.Length - 1)
					if SonsScript.AttackerRefs[index].GetActorRef().IsDead() == 1
						int trooptype = utility.randomint(0, 1)
						if trooptype == 0
							Actor Soldier = SonsScript.Alias_AttackStartMarker.GetReference().PlaceAtMe(SonsScript.SiegeTroopSoldier) as Actor
							SonsScript.AttackerRefs[index].ForceRefTo(Soldier)
						elseif trooptype == 1
							Actor Soldier = SonsScript.Alias_AttackStartMarker.GetReference().PlaceAtMe(SonsScript.SiegeTroopArcher) as Actor
							SonsScript.AttackerRefs[index].ForceRefTo(Soldier)
						endif
					endif
					index += 1
				endwhile
			endIf
			i += 1
		endwhile
	
	elseif self == DefendCityRebel
		RebelScript.TroopDeath.SetValue(RebelScript.TroopDeath.GetValue() + 1)
		float percentchange = 100*(1/(RebelScript.AttackerCount.GetValue())) as float
		RebelScript.PercentRemainingTrue.SetValue(RebelScript.PercentRemainingTrue.GetValue() - percentchange)
		percentchange = (RebelScript.PercentRemaining.GetValue() - RebelScript.PercentRemainingTrue.GetValue()) as int

		if RebelScript.TroopDeath.GetValue() >= RebelScript.AttackerCount.GetValue()
			RebelScript.PercentRemaining.SetValue(0)
			percentchange = 0
			UpdateCurrentInstanceGlobal(RebelScript.PercentRemaining)
			SetObjectiveCompleted(0)
			SetStage(500)
		endif

		if percentchange >= 10 && RebelScript.PercentRemainingTrue.GetValue() > 0
			ModObjectiveGlobal(-percentchange, RebelScript.PercentRemaining, 0)
		endif

		int i = 0
		while i < RebelScript.AllLocations.GetSize() && RebelScript.TroopDeath.GetValue() < RebelScript.AttackerCount.GetValue() - 10
			If RebelScript.Alias_City.GetLocation() == (RebelScript.AllLocations.GetAt(i) as Location)
				int index = 0
				while index < (RebelScript.AttackerRefs.Length - 1)
					if RebelScript.AttackerRefs[index].GetActorRef().IsDead() == 1
						int trooptype = utility.randomint(0, 1)
						if trooptype == 0
							Actor Soldier = RebelScript.Alias_AttackStartMarker.GetReference().PlaceAtMe(RebelScript.SiegeTroopSoldier) as Actor
							RebelScript.AttackerRefs[index].ForceRefTo(Soldier)
						elseif trooptype == 1
							Actor Soldier = RebelScript.Alias_AttackStartMarker.GetReference().PlaceAtMe(RebelScript.SiegeTroopArcher) as Actor
							RebelScript.AttackerRefs[index].ForceRefTo(Soldier)
						endif
					endif
					index += 1
				endwhile
			endIf
			i += 1
		endwhile
	endif

EndFunction

Function SetUpPlayerTroopCounts()
	int citynum = AllLocations.Find(City.GetLocation())
	FormList Garrison = TroopGarrisons.GetAt(citynum) as FormList
	PlayerTroopsStart = Garrison.GetSize() as float
	PlayerTroopsRemaining = PlayerTroopsStart
	PlayerTroopPercentRemaining.SetValue(100)
	UpdateCurrentInstanceGlobal(PlayerTroopPercentRemaining)
EndFunction

Function AdjustPlayerPercentRemaining()
	PlayerTroopsRemaining -= 1
	int PercentRemainingInitial = PlayerTroopPercentRemaining.GetValue() as int
	float NewPercentRemaining = math.floor(100*(PlayerTroopsRemaining/PlayerTroopsStart))
	if NewPercentRemaining <= PercentRemainingInitial - 10
		int percentchange = PercentRemainingInitial - NewPercentRemaining as int
		If PlayerTroopsRemaining <= 0
			PlayerTroopPercentRemaining.SetValue(0)
			UpdateCurrentInstanceGlobal(PlayerTroopPercentRemaining)
			SetObjectiveDisplayed(5)
		Else
			ModObjectiveGlobal(-percentchange, PlayerTroopPercentRemaining, 5) 
		EndIf
	endif
EndFunction