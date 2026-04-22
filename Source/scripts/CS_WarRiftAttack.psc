Scriptname CS_WarRiftAttack extends Quest  

CS_WarRiftScript Property WarRift Auto

Event OnUpdateGameTime()
	int SpawnNumberMult = math.floor(WarRift.GameDaysPassed.GetValue() - WarRift.NextRespawn.GetValue())
	If SpawnNumberMult < 1
		SpawnNumberMult = 1
	EndIf
	WarRift.NextRespawn.SetValue(WarRift.GameDaysPassed.GetValue() + 1)
	int iCheckTime = 0
	While iCheckTime < SpawnNumberMult
		If WarRift.AttackTroopNum.GetValue() < 20
			WarRift.AttackTroopNum.SetValue(WarRift.AttackTroopNum.GetValue() + 5)
		EndIf
		iCheckTime = iCheckTime + 1
	endWhile
	int i = 0
	While i < WarRift.HoldingsInMainHold.Length
			If WarRift.HoldingsInMainHold[i].GetValue() == 1
				WarRift.AttackerCount.SetValue(0)
				WarRift.DefendQuest.Start()
				WarRift.DefendLocationAlias.ForceLocationTo(WarRift.LocationsInMainHold[i])
				int guardnum = 0
				While WarRift.AttackTroopNum.GetValue() > 0 && guardnum < WarRift.GuardsVillages[i].GetSize()
					Actor Guard = WarRift.GuardsVillages[i].GetAt(guardnum) as Actor
					If WarRift.CapitalCity.GetKeywordData(WarRift.CWOwner) == 1 && Guard.IsInFaction(WarRift.CWImperialFaction) == 1
						Guard.disable()
						If Guard.IsDead() == 1
							Guard.Reset()
						EndIf
						Guard.enable()
						WarRift.AttackerRefs[WarRift.AttackTroopNum.GetValue() as int - 1].ForceRefTo(Guard)
						Guard.AddToFaction(WarRift.CS_AttackingVillageFaction)
						WarRift.AttackerCount.SetValue(WarRift.AttackerCount.GetValue() + 1)
						WarRift.AttackTroopNum.SetValue(WarRift.AttackTroopNum.GetValue() - 1)
					ElseIf WarRift.CapitalCity.GetKeywordData(WarRift.CWOwner) == 2 && Guard.IsInFaction(WarRift.CWSonsFaction) == 1
						Guard.disable()
						If Guard.IsDead() == 1
							Guard.Reset()
						EndIf
						Guard.enable()
						WarRift.AttackerRefs[WarRift.AttackTroopNum.GetValue() as int - 1].ForceRefTo(Guard)
						Guard.AddToFaction(WarRift.CS_AttackingVillageFaction)
						WarRift.AttackerCount.SetValue(WarRift.AttackerCount.GetValue() + 1)
						WarRift.AttackTroopNum.SetValue(WarRift.AttackTroopNum.GetValue() - 1)
					EndIf
					guardnum += 1
				EndWhile
				int index = 0
				While index < WarRift.GuardsVillagesPlayer[i].GetSize()
					Actor GuardPlayer = WarRift.GuardsVillagesPlayer[i].GetAt(index) as Actor
					WarRift.GuardsVillagePlayerRefs[i].ForceRefTo(GuardPlayer)
					index += 1
				EndWhile 
				WarRift.DefendQuest.SetStage(1)
			EndIf
		i = i + 1
	EndWhile
endEvent