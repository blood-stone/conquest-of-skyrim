Scriptname CS_DefendCityUpdates extends Quest  

Quest Property DefendCityImp Auto
Quest Property DefendCitySons Auto
Quest Property DefendCityRebel Auto

CS_PatrolHoldScript Property CommanderQuest Auto

CS_DefendCityImpScript Property DefendCity Auto
CS_DefendCitySonsScript Property DefendCityScriptSons Auto
CS_DefendCityRebelScript Property DefendCityScriptRebel Auto

int Property ChanceOfVictory Auto
int Property TroopDifference Auto
int OutcomeRoll = 0

Function SimulateCasualties(int TroopDiff)
	Float LossPercentage = 100.0 - TroopDiff
	if LossPercentage < 0
		LossPercentage = 0
	endif
	If self == DefendCitySons
		Float LossPercentageFloat = (LossPercentage/100) as Float
		Float TroopsLostFloat = LossPercentageFloat*DefendCityScriptSons.PlayerGarrisonCount.GetValue() as float
		int TroopsLost = math.floor(TroopsLostFloat)
		debug.notification(TroopsLost + " Troops were lost in the battle")
		int citynum = DefendCityScriptSons.AllLocations.Find(DefendCityScriptSons.Alias_City.GetLocation())
		FormList Garrison = DefendCityScriptSons.GarrisonTroops.GetAt(citynum) as FormList
		(DefendCityScriptSons.PlayerGarrisonCounts.GetAt(citynum) as GlobalVariable).Mod(-TroopsLost)
		int i = 0
		int DeadTroops = 0
		while DeadTroops < TroopsLost
			if (Garrison.GetAt(i) as Actor).IsInFaction(DefendCityScriptSons.CommanderFaction) != 1
				(Garrison.GetAt(i) as Actor).enable()
				(Garrison.GetAt(i) as Actor).kill()
				DeadTroops += 1
			endif
			i += 1
		endwhile
	ElseIf self == DefendCityRebel
		Float LossPercentageFloat = (LossPercentage/100) as Float
		Float TroopsLostFloat = LossPercentageFloat*DefendCityScriptRebel.PlayerGarrisonCount.GetValue() as float
		int TroopsLost = math.floor(TroopsLostFloat)
		debug.notification(TroopsLost + " Troops were lost in the battle")
		int citynum = DefendCityScriptRebel.AllLocations.Find(DefendCityScriptRebel.Alias_City.GetLocation())
		FormList Garrison = DefendCityScriptRebel.GarrisonTroops.GetAt(citynum) as FormList
		(DefendCityScriptRebel.PlayerGarrisonCounts.GetAt(citynum) as GlobalVariable).Mod(-TroopsLost)
		int i = 0
		int DeadTroops = 0
		while DeadTroops < TroopsLost
			if (Garrison.GetAt(i) as Actor).IsInFaction(DefendCityScriptRebel.CommanderFaction) != 1
				(Garrison.GetAt(i) as Actor).enable()
				(Garrison.GetAt(i) as Actor).kill()
				DeadTroops += 1
			endif
			i += 1
		endwhile
	EndIf
EndFunction

Event OnUpdateGameTime()
	If self == DefendCitySons
		DefendCityScriptSons.Iteration.SetValue(DefendCityScriptSons.Iteration.GetValue() + 1)
		;Perform Battle Calculation
		int citynum = DefendCityScriptSons.AllLocations.Find(DefendCityScriptSons.Alias_City.GetLocation())
		DefendCityScriptSons.PlayerGarrisonCount.SetValue((DefendCityScriptSons.GarrisonTroops.GetAt(citynum) as FormList).GetSize())
		int NewAttackerCount = DefendCityScriptSons.AttackerCount.GetValue() as int - DefendCityScriptSons.TroopDeath.GetValue() as int
		ChanceOfVictory = 50
		TroopDifference = 50
		ChanceOfVictory += 3*DefendCityScriptSons.PlayerGarrisonCount.GetValue() as int
		TroopDifference += DefendCityScriptSons.PlayerGarrisonCount.GetValue() as int
		ChanceOfVictory -= 3*NewAttackerCount
		TroopDifference -= NewAttackerCount
		ChanceOfVictory += (math.abs((DefendCityScriptSons.OutfitNum.GetValue() as int) as int) as int)*5
		OutcomeRoll = utility.randomint(0, 100)
		If (OutcomeRoll > ChanceOfVictory && ChanceOfVictory < 80) || ChanceOfVictory < 20
			DefendCityScriptSons.DefenseWon.SetValue(0)
		Else
			DefendCityScriptSons.DefenseWon.SetValue(1)
		EndIf
		If DefendCityScriptSons.Alias_City.GetLocation().IsLoaded() == 0
			UnRegisterForUpdateGameTime()
			If DefendCityScriptSons.DefenseWon.GetValue() == 1
				SimulateCasualties(TroopDifference)
				SetStage(500)
			Else
				SimulateCasualties(TroopDifference)
				SetStage(120)
			EndIf
		ElseIf DefendCityScriptSons.Alias_City.GetLocation().IsLoaded() == 1
			MUSCombatCivilWar.Add()
			If DefendCityScriptSons.Iteration.GetValue() == 2
				If DefendCityScriptSons.CombatStarted.GetValue() != 1 && Game.GetPlayer().IsInCombat() == 0
					If DefendCityScriptSons.DefenseWon.GetValue() == 1
						int i = 0
						while i < DefendCityScriptSons.AttackerRefs.Length
							DefendCityScriptSons.AttackerRefs[i].GetActorRef().disable()
							i += 1
						endwhile
						UnRegisterForUpdateGameTime()
						SimulateCasualties(TroopDifference)
						SetStage(500)
					Else
						DefendCityScriptSons.Alias_AttackStartMarker.ForceRefTo(DefendCityScriptSons.Alias_AttackStartMarkerPhase2.GetReference())
						DefendCityScriptSons.Alias_DefendMarkerPhase1.ForceRefTo(DefendCityScriptSons.Alias_DefendMarkerPhase2.GetReference())
						RefreshPackages(DefendCityScriptSons.DefenderRefs, DefendCityScriptSons.RefreshFaction)
						RefreshPackages(DefendCityScriptSons.AttackerRefs, DefendCityScriptSons.RefreshFaction)
						debug.notification("The attackers have breached the city!")
						int i = 0
						while i < math.floor(DefendCityScriptSons.PlayerGarrisonCount.GetValue()/3) as int
							DefendCityScriptSons.AttackerRefs[i].GetActorRef().kill()
							i += 1
						endwhile
						i = 0
						while i < math.floor(DefendCityScriptSons.AttackerCount.GetValue()/3) as int
							DefendCityScriptSons.DefenderRefs[i].GetActorRef().kill()
							i += 1
						endwhile
						i = 0
						while i < DefendCityScriptSons.AttackerRefs.Length
							If DefendCityScriptSons.AttackerRefs[i].GetActorRef().IsDead() == 0
								DefendCityScriptSons.AttackerRefs[i].GetActorRef().MoveTo(DefendCityScriptSons.Alias_AttackStartMarkerPhase2.GetReference())
							EndIf
							If DefendCityScriptSons.DefenderRefs[i].GetActorRef().IsDead() == 0
								DefendCityScriptSons.DefenderRefs[i].GetActorRef().MoveTo(DefendCityScriptSons.Alias_AttackStartMarkerPhase2.GetReference())
							EndIf
							i += 1
						endwhile
					EndIf
				EndIf
			EndIf
		EndIf
		
	ElseIf self == DefendCityRebel
		DefendCityScriptRebel.Iteration.SetValue(DefendCityScriptRebel.Iteration.GetValue() + 1)
		;Perform Battle Calculation
		int citynum = DefendCityScriptRebel.AllLocations.Find(DefendCityScriptRebel.Alias_City.GetLocation())
		DefendCityScriptRebel.PlayerGarrisonCount.SetValue((DefendCityScriptRebel.GarrisonTroops.GetAt(citynum) as FormList).GetSize())
		int NewAttackerCount = DefendCityScriptRebel.AttackerCount.GetValue() as int - DefendCityScriptRebel.TroopDeath.GetValue() as int
		ChanceOfVictory = 50
		TroopDifference = 50
		ChanceOfVictory += 3*DefendCityScriptRebel.PlayerGarrisonCount.GetValue() as int
		TroopDifference += DefendCityScriptRebel.PlayerGarrisonCount.GetValue() as int
		ChanceOfVictory -= 3*NewAttackerCount
		TroopDifference -= NewAttackerCount
		ChanceOfVictory += (math.abs((DefendCityScriptRebel.OutfitNum.GetValue() as int) as int) as int)*5
		debug.notification("Chance of victory = " + ChanceOfVictory)
		OutcomeRoll = utility.randomint(0, 100)
		If (OutcomeRoll > ChanceOfVictory && ChanceOfVictory < 80) || ChanceOfVictory < 20
			DefendCityScriptRebel.DefenseWon.SetValue(0)
		Else
			DefendCityScriptRebel.DefenseWon.SetValue(1)
		EndIf
		If DefendCityScriptRebel.Alias_City.GetLocation().IsLoaded() == 0
			UnRegisterForUpdateGameTime()
			If DefendCityScriptRebel.DefenseWon.GetValue() == 1
				SimulateCasualties(TroopDifference)
				SetStage(500)
			Else
				SimulateCasualties(TroopDifference)
				SetStage(120)
			EndIf
		ElseIf DefendCityScriptRebel.Alias_City.GetLocation().IsLoaded() == 1
			MUSCombatCivilWar.Add()
			If DefendCityScriptRebel.Iteration.GetValue() == 2
				If DefendCityScriptRebel.CombatStarted.GetValue() != 1 && Game.GetPlayer().IsInCombat() == 0
					If DefendCityScriptRebel.DefenseWon.GetValue() == 1
						int i = 0
						while i < DefendCityScriptRebel.AttackerRefs.Length
							DefendCityScriptRebel.AttackerRefs[i].GetActorRef().disable()
							i += 1
						endwhile
						UnRegisterForUpdateGameTime()
						SimulateCasualties(TroopDifference)
						SetStage(500)
					Else
						DefendCityScriptRebel.Alias_AttackStartMarker.ForceRefTo(DefendCityScriptRebel.Alias_AttackStartMarkerPhase2.GetReference())
						DefendCityScriptRebel.Alias_DefendMarkerPhase1.ForceRefTo(DefendCityScriptRebel.Alias_DefendMarkerPhase2.GetReference())
						RefreshPackages(DefendCityScriptRebel.DefenderRefs, DefendCityScriptRebel.RefreshFaction)
						RefreshPackages(DefendCityScriptRebel.AttackerRefs, DefendCityScriptRebel.RefreshFaction)
						debug.notification("The attackers have breached the city!")
						int i = 0
						while i < math.floor(DefendCityScriptRebel.PlayerGarrisonCount.GetValue()/3) as int
							DefendCityScriptRebel.AttackerRefs[i].GetActorRef().kill()
							i += 1
						endwhile
						i = 0
						while i < math.floor(DefendCityScriptRebel.AttackerCount.GetValue()/3) as int
							DefendCityScriptRebel.DefenderRefs[i].GetActorRef().kill()
							i += 1
						endwhile
						i = 0
						while i < DefendCityScriptRebel.AttackerRefs.Length
							If DefendCityScriptRebel.AttackerRefs[i].GetActorRef().IsDead() == 0
								DefendCityScriptRebel.AttackerRefs[i].GetActorRef().MoveTo(DefendCityScriptRebel.Alias_AttackStartMarkerPhase2.GetReference())
							EndIf
							If DefendCityScriptRebel.DefenderRefs[i].GetActorRef().IsDead() == 0
								DefendCityScriptRebel.DefenderRefs[i].GetActorRef().MoveTo(DefendCityScriptRebel.Alias_AttackStartMarkerPhase2.GetReference())
							EndIf
							i += 1
						endwhile
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent

Function RefreshPackages(ReferenceAlias[] Troops, Faction Refresh)
	int i = 0
	while i < Troops.Length
		if Troops[i].GetActorRef() != None
			Troops[i].GetActorRef().AddToFaction(Refresh)
			Troops[i].GetActorRef().EvaluatePackage()
			Troops[i].GetActorRef().RemoveFromFaction(Refresh)
			Troops[i].GetActorRef().EvaluatePackage()
		endif
		i += 1
	endwhile
EndFunction
ReferenceAlias[] Property RespawnCommanderAliases  Auto  

MusicType Property MUSCombatCivilWar  Auto  
