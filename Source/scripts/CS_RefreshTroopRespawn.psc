Scriptname CS_RefreshTroopRespawn extends Quest  

GlobalVariable Property DailyTroopSpawn  Auto  
GlobalVariable Property MiscCount  Auto  
GlobalVariable Property FortCount  Auto  
GlobalVariable Property VillageCount  Auto  
GlobalVariable Property MinorCityCount  Auto  
GlobalVariable Property MajorCityCount  Auto  
GlobalVariable Property DailyTroopLimit  Auto  
GlobalVariable Property Treasury Auto
GlobalVariable Property FoodPerDay Auto

int Property CityRecruitable Auto

FormList Property ArmyQuests Auto

bool Property RespawningTroops Auto

CS_TroopRecruiterScript Property TroopRecruiter Auto
CS_EconomyVariableFunctions Property EconomyScript Auto
CS_TroopManageMenuScript Property ManageArmy Auto

Event OnUpdateGameTime()
	UpdateLimit()
	CityRecruitable = 0
	DailyTroopSpawn.SetValue(0)
	AutoRespawnTroops()
EndEvent

Function UpdateLimit()
	DailyTroopLimit.SetValue(3*MiscCount.GetValue() + CityRecruitable)
EndFunction

Function AddRecruitableTroops(int amount)
	CityRecruitable += amount
EndFunction

Function AutoRespawnTroops()
	RespawningTroops = true
	int TotalCosts = 0
	int i = 0
	while i < ArmyQuests.GetSize()
		if ((ArmyQuests.GetAt(i) as Quest) as CS_ArmyTroopDeath).AutoRespawn && !((ArmyQuests.GetAt(i) as Quest) as CS_ArmyTroopDeath).Blockaded
		
			CS_ArmyTroopDeath ArmyScript = (ArmyQuests.GetAt(i) as Quest) as CS_ArmyTroopDeath
	
			while ArmyScript.CountSoldier < ArmyScript.CountSoldierAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[0] && ArmyScript.TroopCount < 20

					TotalCosts += PayForTroop(0)
					TroopRecruiter.RecruitTroop(i, 0)

			endwhile

			while ArmyScript.CountWarrior < ArmyScript.CountWarriorAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[1] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(1)
					TroopRecruiter.RecruitTroop(i, 1)

			endwhile

			while ArmyScript.CountArcher < ArmyScript.CountArcherAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[2] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(2)
					TroopRecruiter.RecruitTroop(i, 2)

			endwhile

			while ArmyScript.CountCrossbow < ArmyScript.CountCrossbowAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[3] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(3)
					TroopRecruiter.RecruitTroop(i, 3)

			endwhile

			while ArmyScript.CountMageDestructionFire < ArmyScript.CountMageDestructionFireAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[5] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(5)
					TroopRecruiter.RecruitTroop(i, 5, 1)

			endwhile

			while ArmyScript.CountMageDestructionFrost < ArmyScript.CountMageDestructionFrostAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[5] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(5)
					TroopRecruiter.RecruitTroop(i, 5, 2)

			endwhile

			while ArmyScript.CountMageDestructionShock < ArmyScript.CountMageDestructionShockAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[5] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(5)
					TroopRecruiter.RecruitTroop(i, 5, 3)

			endwhile

			while ArmyScript.CountMageRestoration < ArmyScript.CountMageRestorationAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[6] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(6)
					TroopRecruiter.RecruitTroop(i, 6)

			endwhile

			while ArmyScript.CountMageConjuration < ArmyScript.CountMageConjurationAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[7] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(7)
					TroopRecruiter.RecruitTroop(i, 7)

			endwhile

			while ArmyScript.CountMageAlteration < ArmyScript.CountMageAlterationAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[8] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(8)
					TroopRecruiter.RecruitTroop(i, 8)

			endwhile

			while ArmyScript.CountDwarvenSpider < ArmyScript.CountDwarvenSpiderAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[9] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(9)
					TroopRecruiter.RecruitTroop(i, 9)

			endwhile

			while ArmyScript.CountDwarvenSphere < ArmyScript.CountDwarvenSphereAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[10] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(10)
					TroopRecruiter.RecruitTroop(i, 10)

			endwhile

			while ArmyScript.CountDwarvenBallista < ArmyScript.CountDwarvenBallistaAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[11] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(11)
					TroopRecruiter.RecruitTroop(i, 11)

			endwhile

			while ArmyScript.CountDwarvenCenturion < ArmyScript.CountDwarvenCenturionAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[12] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(12)
					TroopRecruiter.RecruitTroop(i, 12)

			endwhile

			while ArmyScript.CountCreatureSkeever < ArmyScript.CountCreatureSkeeverAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[13] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(13)
					TroopRecruiter.RecruitTroop(i, 13)

			endwhile

			while ArmyScript.CountCreatureWolf < ArmyScript.CountCreatureWolfAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[14] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(14)
					TroopRecruiter.RecruitTroop(i, 14)

			endwhile

			while ArmyScript.CountCreatureSabreCat < ArmyScript.CountCreatureSabreCatAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[15] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(15)
					TroopRecruiter.RecruitTroop(i, 15)

			endwhile

			while ArmyScript.CountCreatureFrostbiteSpider < ArmyScript.CountCreatureFrostbiteSpiderAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[16] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(16)
					TroopRecruiter.RecruitTroop(i, 16)

			endwhile

			while ArmyScript.CountCreatureBear < ArmyScript.CountCreatureBearAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[17] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(17)
					TroopRecruiter.RecruitTroop(i, 17)

			endwhile

			while ArmyScript.CountCreatureTroll < ArmyScript.CountCreatureTrollAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[18] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(18)
					TroopRecruiter.RecruitTroop(i, 18)

			endwhile

			while ArmyScript.CountCreatureGiant < ArmyScript.CountCreatureGiantAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[19] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(19)
					TroopRecruiter.RecruitTroop(i, 19)

			endwhile

			while ArmyScript.CountCreatureMammoth < ArmyScript.CountCreatureMammothAuto && DailyTroopSpawn.GetValue() < DailyTroopLimit.GetValue() && ManageArmy.Treasury.GetValue() >= ManageArmy.TroopCostsInt[20] && ArmyScript.TroopCount < 20


					TotalCosts += PayForTroop(20)
					TroopRecruiter.RecruitTroop(i, 20)

			endwhile


		endif
		i += 1
	endwhile

	if TotalCosts > 0
		debug.notification(TotalCosts + " Gold deducted for Automatic Troop Recruitments (" + ManageArmy.Treasury.GetValueInt() + " Gold Remaining)")
	endif

	RespawningTroops = false
EndFunction

int Function PayForTroop(int TroopType)
	Treasury.SetValue(Treasury.GetValue() - ManageArmy.TroopCostsInt[TroopType])
	;debug.notification(ManageArmy.TroopCostsInt[TroopType] + " Gold deducted from the Treasury!")
	;FoodPerDay.SetValue(FoodPerDay.GetValue() - 1)
	return ManageArmy.TroopCostsInt[TroopType]
endFunction