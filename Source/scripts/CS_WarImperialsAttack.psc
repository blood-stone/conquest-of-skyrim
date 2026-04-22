Scriptname CS_WarImperialsAttack extends Quest  

CS_WarImperialsScript Property WarImperials Auto

Event OnUpdateGameTime()
	UnRegisterForUpdateGameTime()
	int SpawnNumberMult = math.floor(WarImperials.GameDaysPassed.GetValue() - WarImperials.NextRespawn.GetValue())
	If SpawnNumberMult < 1
		SpawnNumberMult = 1
	ElseIf SpawnNumberMult > 3
		SpawnNumberMult = 3
	EndIf
	WarImperials.NextRespawn.SetValue(WarImperials.GameDaysPassed.GetValue() + 1)
	int iCheckTime = 0
	While iCheckTime < SpawnNumberMult
		WarImperials.AttackTroopNum.SetValue(WarImperials.AttackTroopNum.GetValue() + 7*WarImperials.CityCount.GetValue() + 5*WarImperials.MinorCityCount.GetValue() + 3*WarImperials.FortCount.GetValue())
		iCheckTime = iCheckTime + 1
	endWhile
	int i = 0
	While i < WarImperials.HoldingsInMainHold.Length
		If (WarImperials.DefendQuest.GetStage() >= 500 || WarImperials.DefendQuest.IsRunning() == 0) && WarImperials.DefendCitySons.GetLocation() != WarImperials.LocationsInMainHold[i] && WarImperials.DefendCityRebel.GetLocation() != WarImperials.LocationsInMainHold[i]
				If WarImperials.HoldingsInMainHold[i].GetValue() == 1
					WarImperials.DefendQuest.Reset()
					WarImperials.DefendQuest.Start()
					WarImperials.DefendQuest.SetStage(0)
					WarImperials.DefendLocationAlias.ForceLocationTo(WarImperials.LocationsInMainHold[i])
					WarImperials.DefendQuest.SetStage(1)
					i = WarImperials.HoldingsInMainHold.Length
				EndIf
		EndIf
		i = i + 1
	EndWhile
	float NextSiege = utility.randomfloat(24, 72)
	RegisterForSingleUpdateGameTime(NextSiege)
endEvent
