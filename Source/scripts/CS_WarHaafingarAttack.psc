Scriptname CS_WarHaafingarAttack extends Quest  

CS_WarHaafingarScript Property WarHaafingar Auto

Event OnUpdateGameTime()
	int SpawnNumberMult = math.floor(WarHaafingar.GameDaysPassed.GetValue() - WarHaafingar.NextRespawn.GetValue())
	If SpawnNumberMult < 1
		SpawnNumberMult = 1
	EndIf
	WarHaafingar.NextRespawn.SetValue(WarHaafingar.GameDaysPassed.GetValue() + 1)
	int iCheckTime = 0
	While iCheckTime < SpawnNumberMult
		If WarHaafingar.AttackTroopNum.GetValue() < 20
			WarHaafingar.AttackTroopNum.SetValue(WarHaafingar.AttackTroopNum.GetValue() + 5)
		EndIf
		iCheckTime = iCheckTime + 1
	endWhile
	int i = 0
	While i < WarHaafingar.HoldingsInMainHold.Length
			If WarHaafingar.HoldingsInMainHold[i].GetValue() == 1
				WarHaafingar.AttackerCount.SetValue(0)
				WarHaafingar.DefendQuest.Start()
				WarHaafingar.DefendLocationAlias.ForceLocationTo(WarHaafingar.LocationsInMainHold[i])
				int guardnum = 0
				While WarHaafingar.AttackTroopNum.GetValue() > 0 && guardnum < WarHaafingar.GuardsVillages[i].GetSize()
					Actor Guard = WarHaafingar.GuardsVillages[i].GetAt(guardnum) as Actor
					If WarHaafingar.CityCapital.GetKeywordData(WarHaafingar.CWOwner) == 1 && Guard.IsInFaction(WarHaafingar.CWImperialFaction) == 1
						Guard.disable()
						If Guard.IsDead() == 1
							Guard.Reset()
						EndIf
						Guard.enable()
						WarHaafingar.AttackerRefs[WarHaafingar.AttackTroopNum.GetValue() as int - 1].ForceRefTo(Guard)
						Guard.AddToFaction(WarHaafingar.CS_AttackingVillageFaction)
						WarHaafingar.AttackerCount.SetValue(WarHaafingar.AttackerCount.GetValue() + 1)
						WarHaafingar.AttackTroopNum.SetValue(WarHaafingar.AttackTroopNum.GetValue() - 1)
					ElseIf WarHaafingar.CityCapital.GetKeywordData(WarHaafingar.CWOwner) == 2 && Guard.IsInFaction(WarHaafingar.CWSonsFaction) == 1
						Guard.disable()
						If Guard.IsDead() == 1
							Guard.Reset()
						EndIf
						Guard.enable()
						WarHaafingar.AttackerRefs[WarHaafingar.AttackTroopNum.GetValue() as int - 1].ForceRefTo(Guard)
						Guard.AddToFaction(WarHaafingar.CS_AttackingVillageFaction)
						WarHaafingar.AttackerCount.SetValue(WarHaafingar.AttackerCount.GetValue() + 1)
						WarHaafingar.AttackTroopNum.SetValue(WarHaafingar.AttackTroopNum.GetValue() - 1)
					EndIf
					guardnum += 1
				EndWhile
				int index = 0
				While index < WarHaafingar.GuardsVillagesPlayer[i].GetSize()
					Actor GuardPlayer = WarHaafingar.GuardsVillagesPlayer[i].GetAt(index) as Actor
					WarHaafingar.GuardsVillagePlayerRefs[i].ForceRefTo(GuardPlayer)
					index += 1
				EndWhile 
				WarHaafingar.DefendQuest.SetStage(1)
			EndIf
		i = i + 1
	EndWhile
endEvent