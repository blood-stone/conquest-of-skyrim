Scriptname CS_WarRebelsAttack extends Quest  

CS_WarRebelsScript Property WarRebels Auto

Event OnUpdateGameTime()
	UnRegisterForUpdateGameTime()
	int SpawnNumberMult = math.floor(WarRebels.GameDaysPassed.GetValue() - WarRebels.NextRespawn.GetValue())
	If SpawnNumberMult < 1
		SpawnNumberMult = 1
	EndIf
	WarRebels.NextRespawn.SetValue(WarRebels.GameDaysPassed.GetValue() + 1)
	int iCheckTime = 0
	While iCheckTime < SpawnNumberMult
		WarRebels.AttackTroopNum.SetValue(WarRebels.AttackTroopNum.GetValue() + 7*WarRebels.CityCount.GetValue() + 5*WarRebels.MinorCityCount.GetValue() + 3*WarRebels.FortCount.GetValue())
		iCheckTime = iCheckTime + 1
	endWhile
	int i = 0
	While i < WarRebels.HoldingsInMainHold.Length
		If WarRebels.DefendQuest.GetStage() >= 500 || WarRebels.DefendQuest.IsRunning() == 0
				If WarRebels.HoldingsInMainHold[i].GetValue() == 1
					WarRebels.DefendQuest.Reset()
					WarRebels.DefendQuest.Start()
					WarRebels.DefendQuest.SetStage(0)
					WarRebels.DefendLocationAlias.ForceLocationTo(WarRebels.LocationsInMainHold[i])
					WarRebels.DefendQuest.SetStage(1)
					i = WarRebels.HoldingsInMainHold.Length
				EndIf
		EndIf
		i = i + 1
	EndWhile
	float NextSiege = utility.randomfloat(24, 72)
	RegisterForSingleUpdateGameTime(NextSiege)
endEvent
