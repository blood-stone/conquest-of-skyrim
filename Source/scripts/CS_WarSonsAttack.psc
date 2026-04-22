Scriptname CS_WarSonsAttack extends Quest  

CS_WarSonsScript Property WarSons Auto

Event OnUpdateGameTime()
	int SpawnNumberMult = math.floor(WarSons.GameDaysPassed.GetValue() - WarSons.NextRespawn.GetValue())
	If SpawnNumberMult < 1
		SpawnNumberMult = 1
	ElseIf SpawnNumberMult > 3
		SpawnNumberMult = 3
	EndIf
	WarSons.NextRespawn.SetValue(WarSons.GameDaysPassed.GetValue() + 1)
	int iCheckTime = 0
	While iCheckTime < SpawnNumberMult
		WarSons.AttackTroopNum.SetValue(WarSons.AttackTroopNum.GetValue() + 7*WarSons.CityCount.GetValue() + 5*WarSons.MinorCityCount.GetValue() + 3*WarSons.FortCount.GetValue())
		iCheckTime = iCheckTime + 1
	endWhile
	int i = 0
	While i < WarSons.HoldingsInMainHold.Length
		If (WarSons.DefendQuest.GetStage() >= 500 || WarSons.DefendQuest.IsRunning() == 0) && WarSons.DefendCityImp.GetLocation() != WarSons.LocationsInMainHold[i] && WarSons.DefendCityRebel.GetLocation() != WarSons.LocationsInMainHold[i]
				If WarSons.HoldingsInMainHold[i].GetValue() == 1
					WarSons.DefendQuest.Reset()
					WarSons.DefendQuest.Start()
					WarSons.DefendQuest.SetStage(0)
					WarSons.DefendLocationAlias.ForceLocationTo(WarSons.LocationsInMainHold[i])
					WarSons.DefendQuest.SetStage(1)
					i = WarSons.HoldingsInMainHold.Length
				EndIf
		EndIf
		i = i + 1
	EndWhile
	float NextSiege = utility.randomfloat(24, 72)
	RegisterForSingleUpdateGameTime(NextSiege)
endEvent
