Scriptname CS_WarReachAttack extends Quest  

CS_WarReachScript Property WarReach Auto

Event OnUpdateGameTime()
	debug.notification("Game Time Updated")
	int SpawnNumberMult = math.floor(WarReach.GameDaysPassed.GetValue() - WarReach.NextRespawn.GetValue())
	If SpawnNumberMult < 1
		SpawnNumberMult = 1
	EndIf
	WarReach.NextRespawn.SetValue(WarReach.GameDaysPassed.GetValue() + 1)
	int iCheckTime = 0
	While iCheckTime < SpawnNumberMult
		If WarReach.AttackTroopNum.GetValue() < 20
			WarReach.AttackTroopNum.SetValue(WarReach.AttackTroopNum.GetValue() + 5)
		EndIf
		iCheckTime = iCheckTime + 1
	endWhile
	int i = 0
	While i < WarReach.HoldingsInMainHold.Length
			If WarReach.HoldingsInMainHold[i].GetValue() == 1
				WarReach.AttackerCount.SetValue(0)
				WarReach.DefendQuest.Start()
				WarReach.DefendLocationAlias.ForceLocationTo(WarReach.LocationsInMainHold[i])
				int guardnum = 0
				While WarReach.AttackTroopNum.GetValue() > 0 && guardnum < WarReach.GuardsVillages[i].GetSize()
					Actor Guard = WarReach.GuardsVillages[i].GetAt(guardnum) as Actor
					If WarReach.CityCapital.GetKeywordData(WarReach.CWOwner) == 1 && Guard.IsInFaction(WarReach.CWImperialFaction) == 1
						Guard.disable()
						If Guard.IsDead() == 1
							Guard.Reset()
						EndIf
						Guard.enable()
						WarReach.AttackerRefs[WarReach.AttackTroopNum.GetValue() as int - 1].ForceRefTo(Guard)
						Guard.AddToFaction(WarReach.CS_AttackingVillageFaction)
						WarReach.AttackerCount.SetValue(WarReach.AttackerCount.GetValue() + 1)
						WarReach.AttackTroopNum.SetValue(WarReach.AttackTroopNum.GetValue() - 1)
					ElseIf WarReach.CityCapital.GetKeywordData(WarReach.CWOwner) == 2 && Guard.IsInFaction(WarReach.CWSonsFaction) == 1
						Guard.disable()
						If Guard.IsDead() == 1
							Guard.Reset()
						EndIf
						Guard.enable()
						WarReach.AttackerRefs[WarReach.AttackTroopNum.GetValue() as int - 1].ForceRefTo(Guard)
						Guard.AddToFaction(WarReach.CS_AttackingVillageFaction)
						WarReach.AttackerCount.SetValue(WarReach.AttackerCount.GetValue() + 1)
						WarReach.AttackTroopNum.SetValue(WarReach.AttackTroopNum.GetValue() - 1)
					EndIf
					guardnum += 1
				EndWhile
				WarReach.DefendQuest.SetStage(1)
			EndIf
		i = i + 1
	EndWhile
endEvent