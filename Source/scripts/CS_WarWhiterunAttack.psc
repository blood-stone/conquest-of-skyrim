Scriptname CS_WarWhiterunAttack extends Quest  

CS_WarWhiterunScript Property WarWhiterun Auto

Event OnUpdateGameTime()
	int SpawnNumberMult = math.floor(WarWhiterun.GameDaysPassed.GetValue() - WarWhiterun.NextRespawn.GetValue())
	If SpawnNumberMult < 1
		SpawnNumberMult = 1
	EndIf
	WarWhiterun.NextRespawn.SetValue(WarWhiterun.GameDaysPassed.GetValue() + 1)
	int iCheckTime = 0
	While iCheckTime < SpawnNumberMult
		If WarWhiterun.AttackTroopNum.GetValue() < 20
			WarWhiterun.AttackTroopNum.SetValue(WarWhiterun.AttackTroopNum.GetValue() + 5)
		EndIf
		iCheckTime = iCheckTime + 1
	endWhile
	int i = 0
	int AttackVillageFound = 0
	While i < WarWhiterun.HoldingsInMainHold.Length && AttackVillageFound == 0
			If WarWhiterun.HoldingsInMainHold[i].GetValue() == 1
				AttackVillageFound = 1
				WarWhiterun.AttackerCount.SetValue(WarWhiterun.AttackTroopNum.GetValue())
				WarWhiterun.DefendQuest.Start()
				WarWhiterun.DefendLocationAlias.ForceLocationTo(WarWhiterun.LocationsInMainHold[i])
				int guardnum = 0
				While WarWhiterun.AttackTroopNum.GetValue() > 0 && guardnum < WarWhiterun.GuardsVillages[i].GetSize()
					Actor Guard = WarWhiterun.GuardsVillages[i].GetAt(guardnum) as Actor
					If WarWhiterun.CapitalCity.GetKeywordData(WarWhiterun.CWOwner) == 1 && Guard.IsInFaction(WarWhiterun.CWImperialFaction) == 1
						Guard.disable()
						If Guard.IsDead() == 1
							Guard.Reset()
						EndIf
						Guard.enable()
						WarWhiterun.AttackerRefs[WarWhiterun.AttackTroopNum.GetValue() as int - 1].ForceRefTo(Guard)
						Guard.AddToFaction(WarWhiterun.CS_AttackingVillageFaction)
						WarWhiterun.AttackTroopNum.SetValue(WarWhiterun.AttackTroopNum.GetValue() - 1)
					ElseIf WarWhiterun.CapitalCity.GetKeywordData(WarWhiterun.CWOwner) == 2 && Guard.IsInFaction(WarWhiterun.CWSonsFaction) == 1
						Guard.disable()
						If Guard.IsDead() == 1
							Guard.Reset()
						EndIf
						Guard.enable()
						WarWhiterun.AttackerRefs[WarWhiterun.AttackTroopNum.GetValue() as int - 1].ForceRefTo(Guard)
						Guard.AddToFaction(WarWhiterun.CS_AttackingVillageFaction)
						WarWhiterun.AttackTroopNum.SetValue(WarWhiterun.AttackTroopNum.GetValue() - 1)
					EndIf
					guardnum += 1
				EndWhile
				WarWhiterun.DefendQuest.SetStage(1)
			EndIf
		i = i + 1
	EndWhile
endEvent