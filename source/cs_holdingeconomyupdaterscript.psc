Scriptname CS_HoldingEconomyUpdaterScript extends Quest  

int Property holdingnum Auto
bool Property AllowUpdate Auto

Function UpdateHoldingResources()
	;Utility.Wait(3)
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	Float efficiency = 1
	int Pop = Holding.GetKeywordData(Population) as int
	int FoodMax = (Holding.GetKeywordData(FoodChange)*Holding.GetKeywordData(FarmLevel)) as int
	int MetalMax = (Holding.GetKeywordData(MetalChange)*Holding.GetKeywordData(MineLevel)) as int
	int WoodMax = (Holding.GetKeywordData(WoodChange)*Holding.GetKeywordData(LumberMillLevel)) as int
	int DocksMax = (Holding.GetKeywordData(CS_DocksChange)*Holding.GetKeywordData(CS_CityLevelDocks)) as int
	int MaxJobs = FoodMax + MetalMax + WoodMax + DocksMax
	if Pop < MaxJobs + 0.25*Pop
		int PopIncrease = utility.randomint(math.floor(0.3*(MaxJobs - math.floor(0.25*Pop))), math.floor(0.5*(MaxJobs - math.floor(0.25*Pop))))
		Holding.SetKeywordData(Population, Holding.GetKeywordData(Population) + PopIncrease)
		Holding.SetKeywordData(Unemployed, Holding.GetKeywordData(Unemployed) + PopIncrease)
	endif
	int OpenJobs = Holding.GetKeywordData(JobsOpenFood) as int + Holding.GetKeywordData(JobsOpenMetal) as int + Holding.GetKeywordData(JobsOpenWood) as int + Holding.GetKeywordData(CS_CityManagementJobsOpenDocks) as int
	debug.trace("Open jobs for " + holdingnum + " = " + OpenJobs)
	debug.trace("Unemployed for " + holdingnum + " = " + Holding.GetKeywordData(Unemployed))
	while Holding.GetKeywordData(Unemployed) > 0 && OpenJobs > 0
		while Holding.GetKeywordData(JobsOpenFood) > 0 && OpenJobs > 0 && Holding.GetKeywordData(Unemployed) > 0
			Holding.SetKeywordData(JobsOpenFood, Holding.GetKeywordData(JobsOpenFood) - 1)
			Holding.SetKeywordData(Unemployed, Holding.GetKeywordData(Unemployed) - 1)
			OpenJobs -= 1
			debug.trace("Open jobs for " + holdingnum + " = " + OpenJobs)
			debug.trace("Open Food jobs for " + holdingnum + " = " + Holding.GetKeywordData(JobsOpenFood))
			debug.trace("Unemployed for " + holdingnum + " = " + Holding.GetKeywordData(Unemployed))
		endwhile
		while (Holding.GetKeywordData(JobsOpenWood) > 0 || Holding.GetKeywordData(JobsOpenMetal) > 0 || Holding.GetKeywordData(CS_CityManagementJobsOpenDocks) > 0) && OpenJobs > 0 && Holding.GetKeywordData(Unemployed) > 0
			if Holding.GetKeywordData(CS_CityManagementJobsOpenDocks) > 0 && OpenJobs > 0 && Holding.GetKeywordData(Unemployed) > 0 
				Holding.SetKeywordData(CS_CityManagementJobsOpenDocks, Holding.GetKeywordData(CS_CityManagementJobsOpenDocks) - 1)
				Holding.SetKeywordData(Unemployed, Holding.GetKeywordData(Unemployed) - 1)
				OpenJobs -= 1
				debug.trace("Open jobs for " + holdingnum + " = " + OpenJobs)
				debug.trace("Open Docks  jobs for " + holdingnum + " = " + Holding.GetKeywordData(CS_CityManagementJobsOpenDocks))
				debug.trace("Unemployed for " + holdingnum + " = " + Holding.GetKeywordData(Unemployed))
			endif
			if Holding.GetKeywordData(JobsOpenWood) > 0 && OpenJobs > 0 && Holding.GetKeywordData(Unemployed) > 0 
				Holding.SetKeywordData(JobsOpenWood, Holding.GetKeywordData(JobsOpenWood) - 1)
				Holding.SetKeywordData(Unemployed, Holding.GetKeywordData(Unemployed) - 1)
				OpenJobs -= 1
				debug.trace("Open jobs for " + holdingnum + " = " + OpenJobs)
				debug.trace("Open Wood jobs for " + holdingnum + " = " + Holding.GetKeywordData(JobsOpenWood))
				debug.trace("Unemployed for " + holdingnum + " = " + Holding.GetKeywordData(Unemployed))
			endif
			if Holding.GetKeywordData(JobsOpenMetal) > 0 && OpenJobs > 0 && Holding.GetKeywordData(Unemployed) > 0 
				Holding.SetKeywordData(JobsOpenMetal, Holding.GetKeywordData(JobsOpenMetal) - 1)
				Holding.SetKeywordData(Unemployed, Holding.GetKeywordData(Unemployed) - 1)
				OpenJobs -= 1
				debug.trace("Open jobs for " + holdingnum + " = " + OpenJobs)
				debug.trace("Open Metal jobs for " + holdingnum + " = " + Holding.GetKeywordData(JobsOpenMetal))
				debug.trace("Unemployed for " + holdingnum + " = " + Holding.GetKeywordData(Unemployed))
			endif
		endwhile
	endwhile
	int RecruitableTroops = 0
	if Holding.GetKeywordData(CS_RecruitablePercentage) != -1
		RecruitableTroops = math.ceiling((Holding.GetKeywordData(CS_RecruitablePercentage))*Holding.GetKeywordData(Unemployed)) as int
	elseif EconUpdater.LoyaltyCheck.EntireFaction.GetKeywordData(CS_RecruitablePercentage) != -1 && (EconUpdater.AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 1
		RecruitableTroops = math.ceiling((EconUpdater.LoyaltyCheck.EntireFaction.GetKeywordData(CS_RecruitablePercentage))*Holding.GetKeywordData(Unemployed)) as int
	endif
	(CS_TroopRespawnRefresh as CS_RefreshTroopRespawn).AddRecruitableTroops(RecruitableTroops)
	(CS_TroopRespawnRefresh as CS_RefreshTroopRespawn).UpdateLimit()
	Holding.SetKeywordData(Population, Holding.GetKeywordData(Population) - RecruitableTroops)
	Holding.SetKeywordData(Unemployed, Holding.GetKeywordData(Unemployed) - RecruitableTroops)
	Holding.SetKeywordData(FoodRequired, Holding.GetKeywordData(Population) + Holding.GetKeywordData(CS_NumGuards))
	if holdingnum < 5
		Holding.SetKeywordData(TreasuryPerDay, 500*Pop + 250*Pop*(Holding.GetKeywordData(TaxRate) as int))
	elseif holdingnum >= 5 && holdingnum < 9
		Holding.SetKeywordData(TreasuryPerDay, 300*Pop + 150*Pop*(Holding.GetKeywordData(TaxRate) as int))
	elseif holdingnum >= 9
		Holding.SetKeywordData(TreasuryPerDay, 200*Pop + 100*Pop*(Holding.GetKeywordData(TaxRate) as int))
	endif
	Holding.SetKeywordData(FoodProduced, 3*(Holding.GetKeywordData(FoodChange)*Holding.GetKeywordData(FarmLevel) + math.floor(0.3*Holding.GetKeywordData(CS_DocksChange)*Holding.GetKeywordData(CS_CityLevelDocks)) - Holding.GetKeywordData(JobsOpenFood)))
	Holding.SetKeywordData(MetalProduced, 3*(Holding.GetKeywordData(MetalChange)*Holding.GetKeywordData(MineLevel) + math.floor(0.3*Holding.GetKeywordData(CS_DocksChange)*Holding.GetKeywordData(CS_CityLevelDocks)) - Holding.GetKeywordData(JobsOpenMetal)))
	Holding.SetKeywordData(WoodProduced, 3*(Holding.GetKeywordData(WoodChange)*Holding.GetKeywordData(LumberMillLevel) + math.floor(0.3*Holding.GetKeywordData(CS_DocksChange)*Holding.GetKeywordData(CS_CityLevelDocks)) - Holding.GetKeywordData(JobsOpenWood)))
	Holding.SetKeywordData(Treasury, Holding.GetKeywordData(Treasury) + 0.5*Holding.GetKeywordData(TreasuryPerDay))
	Holding.SetKeywordData(FoodToTrade, 0)
	Holding.SetKeywordData(MetalToTrade, 0)
	Holding.SetKeywordData(WoodToTrade, 0)
	if (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() != 1
		int FoodOffset = (Holding.GetKeywordData(FoodProduced) as int) - (Holding.GetKeywordData(FoodRequired) as int)
		int MetalOffset = (Holding.GetKeywordData(MetalProduced) as int)
		int WoodOffset = (Holding.GetKeywordData(WoodProduced) as int)
		if MetalOffset >= 0 && MetalOffset < 5
			Holding.SetKeywordData(MetalReserve, Holding.GetKeywordData(MetalReserve) + MetalOffset)
		elseif MetalOffset >= 5
			Holding.SetKeywordData(MetalReserve, Holding.GetKeywordData(MetalReserve) + 5)
			if (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 11
				ResourcePoolMetalImp.Mod(MetalOffset - 5)
			elseif (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 12
				ResourcePoolMetalSons.Mod(MetalOffset - 5)
			endif
		elseif MetalOffset < 0
			Holding.SetKeywordData(MetalReserve, Holding.GetKeywordData(MetalReserve) + MetalOffset)
			if (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 11
				ResourcePoolMetalImp.Mod(MetalOffset)
			elseif (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 12
				ResourcePoolMetalSons.Mod(MetalOffset)
			endif
		endif
		if WoodOffset >= 0 && WoodOffset < 5
			Holding.SetKeywordData(WoodReserve, Holding.GetKeywordData(WoodReserve) + WoodOffset)
		elseif WoodOffset >= 5
			Holding.SetKeywordData(WoodReserve, Holding.GetKeywordData(WoodReserve) + 5)
			if (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 11
				ResourcePoolWoodImp.Mod(WoodOffset - 5)
			elseif (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 12
				ResourcePoolWoodSons.Mod(WoodOffset - 5)
			endif
		elseif WoodOffset < 0
			Holding.SetKeywordData(WoodReserve, Holding.GetKeywordData(WoodReserve) + WoodOffset)
			if (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 11
				ResourcePoolWoodImp.Mod(WoodOffset)
			elseif (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 12
				ResourcePoolWoodSons.Mod(WoodOffset)
			endif
		endif
		if FoodOffset >= 0 && FoodOffset < 5
			Holding.SetKeywordData(FoodReserve, Holding.GetKeywordData(FoodReserve) + FoodOffset)
		elseif FoodOffset >= 5
			Holding.SetKeywordData(FoodReserve, Holding.GetKeywordData(FoodReserve) + 5)
			if (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 11
				ResourcePoolFoodImp.Mod(FoodOffset - 5)
			elseif (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 12
				ResourcePoolFoodSons.Mod(FoodOffset - 5)
			endif
		elseif FoodOffset < 0
			Holding.SetKeywordData(FoodReserve, Holding.GetKeywordData(FoodReserve) + FoodOffset)
			if (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 11
				ResourcePoolFoodImp.Mod(FoodOffset)
			elseif (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 12
				ResourcePoolFoodSons.Mod(FoodOffset)
			endif
		endif
		If holdingnum < 5
			If Holding.GetKeywordData(Treasury) >= 30000
				Holding.SetKeywordData(Treasury, 30000)
			EndIf
		ElseIf holdingnum >= 5 && holdingnum < 9
			If Holding.GetKeywordData(Treasury) >= 15000
				Holding.SetKeywordData(Treasury, 15000)
			EndIf
		ElseIf holdingnum >= 9
			If Holding.GetKeywordData(Treasury) >= 7500
				Holding.SetKeywordData(Treasury, 7500)
			EndIf
		EndIf
		If Holding.GetKeywordData(FoodReserve) < 0
			Holding.SetKeywordData(FoodReserve, 0)
		ElseIf Holding.GetKeywordData(FoodReserve) >= 100
			Holding.SetKeywordData(FoodReserve, 100)
		EndIf
		If Holding.GetKeywordData(MetalReserve) < 0
			if (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 11
				ResourcePoolMetalImp.Mod(Holding.GetKeywordData(MetalReserve))
			elseif (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 12
				ResourcePoolMetalSons.Mod(Holding.GetKeywordData(MetalReserve))
			endif
			Holding.SetKeywordData(MetalReserve, 0)
		ElseIf Holding.GetKeywordData(MetalReserve) >= 500
			Holding.SetKeywordData(MetalReserve, 500)
		EndIf
		If Holding.GetKeywordData(WoodReserve) < 0
			if (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 11
				ResourcePoolWoodImp.Mod(Holding.GetKeywordData(WoodReserve))
			elseif (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 12
				ResourcePoolWoodSons.Mod(Holding.GetKeywordData(WoodReserve))
			endif
			Holding.SetKeywordData(WoodReserve, 0)
		ElseIf Holding.GetKeywordData(WoodReserve) >= 500
			Holding.SetKeywordData(WoodReserve, 500)
		EndIf
	else
		JarlManageEconomy()
		if (Holding.GetKeywordData(FoodImported) as int) > FoodTotalPlayer.GetValue()
			CancelFoodImports()
			FoodLow.show()
		else
			FoodTotalPlayer.Mod(-Holding.GetKeywordData(FoodImported))
		endif
		int FoodAdd = (Holding.GetKeywordData(FoodProduced) as int) + (Holding.GetKeywordData(FoodImported) as int) - (Holding.GetKeywordData(FoodRequired) as int) - (Holding.GetKeywordData(FoodExported) as int)
		Holding.SetKeywordData(FoodReserve, Holding.GetKeywordData(FoodReserve) + FoodAdd)
		If Holding.GetKeywordData(FoodReserve) < 0
			If FoodAdd < 0
				Holding.SetKeywordData(FoodNeed, math.abs(FoodAdd))
			Else
				Holding.SetKeywordData(FoodNeed, 0)
			EndIf 
			Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) - math.abs(Holding.GetKeywordData(FoodReserve))/2)
			Holding.SetKeywordData(FoodReserve, 0)
			Holding.SetKeywordData(NoFood, 1)
			City.ForceLocationTo(Holding)
			StarvingMessage.show()
			efficiency = (Holding.GetKeywordData(FoodRequired) - Holding.GetKeywordData(FoodNeed))/(Holding.GetKeywordData(FoodRequired)) as Float
			CoinTotalPlayerPerDayHoldings.Mod(math.floor(efficiency*0.5*Holding.GetKeywordData(TreasuryPerDay)))
			MetalTotalPlayerPerDayHoldings.Mod(math.floor(efficiency*MetalAdd))
			WoodTotalPlayerPerDayHoldings.Mod(math.floor(efficiency*WoodAdd))
		Else
			Holding.SetKeywordData(NoFood, 0)
			CoinTotalPlayerPerDayHoldings.Mod(math.floor(efficiency*0.5*Holding.GetKeywordData(TreasuryPerDay)))
		EndIf
		Holding.SetKeywordData(MetalProduced, math.floor(efficiency*((Holding.GetKeywordData(MetalProduced) as int))))
		Holding.SetKeywordData(WoodProduced, math.floor(efficiency*((Holding.GetKeywordData(WoodProduced) as int))))
		If Holding.GetKeywordData(MetalExported) > Holding.GetKeywordData(MetalProduced)
			Holding.SetKeywordData(MetalExported, Holding.GetKeywordData(MetalProduced))
		EndIf
		If Holding.GetKeywordData(WoodExported) > Holding.GetKeywordData(WoodProduced)
			Holding.SetKeywordData(WoodExported, Holding.GetKeywordData(WoodProduced))
		EndIf
		if (Holding.GetKeywordData(MetalImported) as int) > MetalTotalPlayer.GetValue()
			CancelMetalImports()
			MetalLow.show()
		else
			MetalTotalPlayer.Mod(-Holding.GetKeywordData(MetalImported))
		endif
		if (Holding.GetKeywordData(WoodImported) as int) > WoodTotalPlayer.GetValue()
			CancelWoodImports()
			WoodLow.show()
		else
			WoodTotalPlayer.Mod(-Holding.GetKeywordData(WoodImported))
		endif
		int MetalAdd = (Holding.GetKeywordData(MetalProduced) as int) + (Holding.GetKeywordData(MetalImported) as int) - (Holding.GetKeywordData(MetalExported) as int)
		int WoodAdd = (Holding.GetKeywordData(WoodProduced) as int) + (Holding.GetKeywordData(WoodImported) as int) - (Holding.GetKeywordData(WoodExported) as int)
		Holding.SetKeywordData(MetalReserve, Holding.GetKeywordData(MetalReserve) + MetalAdd)
		Holding.SetKeywordData(WoodReserve, Holding.GetKeywordData(WoodReserve) + WoodAdd)
		If Holding.GetKeywordData(MetalExported) > 0
			MetalFromHoldings.Mod(Holding.GetKeywordData(MetalExported))
		EndIf
		If Holding.GetKeywordData(WoodExported) > 0
			WoodFromHoldings.Mod(Holding.GetKeywordData(WoodExported))
		EndIf
		If Holding.GetKeywordData(CS_CityManagementHarshness) > 100
			Holding.SetKeywordData(CS_CityManagementHarshness, 100)
		ElseIf Holding.GetKeywordData(CS_CityManagementHarshness) < 0
			Holding.SetKeywordData(CS_CityManagementHarshness, 0)
		EndIf
	endif
	CS_EconomyUpdatedNum.Mod(1)
	HoldingUpdated = true
	debug.trace("Updated Holding " + holdingnum)
EndFunction

Function JarlManageEconomy()
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	if Holding.GetKeywordData(EconUpdater.JarlEconomy) == 1
		CancelFoodImports()
		CancelFoodExports()
		CancelMetalImports()
		CancelMetalExports()
		CancelWoodImports()
		CancelWoodExports()
		int FoodOffset = (Holding.GetKeywordData(FoodProduced) as int) - (Holding.GetKeywordData(FoodRequired) as int)
		int MetalOffset = (Holding.GetKeywordData(MetalProduced) as int)
		int WoodOffset = (Holding.GetKeywordData(WoodProduced) as int)
		If FoodOffset > 5
			ExportFood(FoodOffset - 5)
		ElseIf FoodOffset < 0
			ImportFood(math.abs(FoodOffset) as int + 5)
		EndIf
		If MetalOffset > 5
			ExportMetal(MetalOffset - 5)
		ElseIf MetalOffset < 0
			ImportMetal(math.abs(MetalOffset) as int + 5)
		EndIf
		If WoodOffset > 5
			ExportWood(WoodOffset - 5)
		ElseIf WoodOffset < 0
			ImportWood(math.abs(WoodOffset) as int + 5)
		EndIf
	endif
EndFunction

Function ImportFood(int amount)
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	Holding.SetKeywordData(FoodImported, Holding.GetKeywordData(FoodImported) + amount)
	CS_ResourceFoodToHoldings.Mod(amount)
EndFunction

Function CancelFoodImports()
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	CS_ResourceFoodToHoldings.Mod(-Holding.GetKeywordData(FoodImported))
	Holding.SetKeywordData(FoodImported, 0)
EndFunction

Function ExportFood(int amount)
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	Holding.SetKeywordData(FoodExported, Holding.GetKeywordData(FoodExported) + amount)
	CS_ResourceFoodFromHoldings.Mod(amount)
EndFunction

Function CancelFoodExports()
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	CS_ResourceFoodFromHoldings.Mod(-Holding.GetKeywordData(FoodExported))
	Holding.SetKeywordData(FoodExported, 0)
EndFunction

Function ImportMetal(int amount)
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	Holding.SetKeywordData(MetalImported, Holding.GetKeywordData(MetalImported) + amount)
	CS_ResourceMetalToHoldings.Mod(amount)
EndFunction

Function CancelMetalImports()
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	CS_ResourceMetalToHoldings.Mod(-Holding.GetKeywordData(MetalImported))
	Holding.SetKeywordData(MetalImported, 0)
EndFunction

Function ExportMetal(int amount)
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	Holding.SetKeywordData(MetalExported, Holding.GetKeywordData(MetalExported) + amount)
	CS_ResourceMetalFromHoldings.Mod(amount)
EndFunction

Function CancelMetalExports()
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	CS_ResourceMetalFromHoldings.Mod(-Holding.GetKeywordData(MetalExported))
	Holding.SetKeywordData(MetalExported, 0)
EndFunction

Function ImportWood(int amount)
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	Holding.SetKeywordData(WoodImported, Holding.GetKeywordData(WoodImported) + amount)
	CS_ResourceWoodToHoldings.Mod(amount)
EndFunction

Function CancelWoodImports()
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	CS_ResourceWoodToHoldings.Mod(-Holding.GetKeywordData(WoodImported))
	Holding.SetKeywordData(WoodImported, 0)
EndFunction

Function ExportWood(int amount)
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	Holding.SetKeywordData(WoodExported, Holding.GetKeywordData(WoodExported) + amount)
	CS_ResourceWoodFromHoldings.Mod(amount)
EndFunction

Function CancelWoodExports()
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	CS_ResourceWoodFromHoldings.Mod(-Holding.GetKeywordData(WoodExported))
	Holding.SetKeywordData(WoodExported, 0)
EndFunction

Event OnUpdate()
	if AllowUpdate == true
		AllowUpdate = false
		debug.trace("Update Allowed for Holding " + holdingnum)
		UpdateHoldingResources()
	else
		debug.trace("Update NOT Allowed for Holding " + holdingnum)
	endif
EndEvent

bool Property HoldingUpdated Auto

Keyword Property FarmLevel  Auto  
Keyword Property MineLevel  Auto  
Keyword Property BarracksLevel  Auto  
Keyword Property LumberMillLevel  Auto  
Keyword Property CS_CityLevelDocks Auto
Keyword Property JobsOpenFood Auto
Keyword Property JobsOpenWood Auto
Keyword Property JobsOpenMetal Auto
Keyword Property CS_CityManagementJobsOpenDocks Auto
Keyword Property Unemployed Auto
Keyword Property FoodProduced  Auto  
Keyword Property FoodRequired  Auto  
Keyword Property WoodProduced  Auto  
Keyword Property MetalProduced  Auto  
Keyword Property WoodChange  Auto  
Keyword Property FoodChange  Auto  
Keyword Property MetalChange  Auto
Keyword Property CS_DocksChange Auto
Keyword Property TaxRate  Auto    
Keyword Property Treasury  Auto  
Keyword Property TreasuryPerDay  Auto  
Keyword Property FoodReserve  Auto  
Keyword Property MetalReserve  Auto
Keyword Property WoodReserve  Auto    
Keyword Property FoodImported  Auto  
Keyword Property MetalImported  Auto
Keyword Property WoodImported  Auto    
Keyword Property FoodExported  Auto  
Keyword Property MetalExported  Auto
Keyword Property WoodExported  Auto    
Keyword Property FoodToTrade Auto
Keyword Property MetalToTrade Auto
Keyword Property WoodToTrade Auto
Keyword Property Loyalty Auto

GlobalVariable Property CS_ResourceFoodToHoldings Auto
GlobalVariable Property CS_ResourceFoodFromHoldings Auto
GlobalVariable Property CS_ResourceWoodToHoldings Auto
GlobalVariable Property CS_ResourceWoodFromHoldings Auto
GlobalVariable Property CS_ResourceMetalToHoldings Auto
GlobalVariable Property CS_ResourceMetalFromHoldings Auto

FormList Property AllLocations  Auto  
FormList Property AllHoldings  Auto  
FormList Property CS_AllGuardFormLists Auto

GlobalVariable Property FoodTotalPlayer  Auto  
GlobalVariable Property WoodTotalPlayer  Auto  
GlobalVariable Property MetalTotalPlayer  Auto  
GlobalVariable Property CoinTotalPlayer  Auto  
GlobalVariable Property MetalFromHoldings Auto
GlobalVariable Property WoodFromHoldings Auto

LocationAlias Property City  Auto  

Keyword Property Population  Auto  

GlobalVariable Property PopulationMoving  Auto  

GlobalVariable Property CoinTotalPlayerPerDayHoldings  Auto  
GlobalVariable Property FoodTotalPlayerPerDayHoldings  Auto  
GlobalVariable Property MetalTotalPlayerPerDayHoldings  Auto  
GlobalVariable Property WoodTotalPlayerPerDayHoldings  Auto  

GlobalVariable Property ResourcePoolFoodImp Auto
GlobalVariable Property ResourcePoolMetalImp Auto
GlobalVariable Property ResourcePoolWoodImp Auto
GlobalVariable Property ResourcePoolFoodSons Auto
GlobalVariable Property ResourcePoolMetalSons Auto
GlobalVariable Property ResourcePoolWoodSons Auto

Keyword Property FoodNeed  Auto  
Keyword Property MetalNeed  Auto  
Keyword Property WoodNeed  Auto  
Keyword Property CS_RecruitablePercentage Auto
Keyword Property CS_NumGuards Auto
Keyword Property CS_CityManagementCrime Auto
Keyword Property CS_CityManagementHarshness Auto
Keyword Property CS_PrisonerNum Auto

Message Property FoodLow Auto
Message Property MetalLow Auto
Message Property WoodLow Auto

Message Property StarvingMessage  Auto  

GlobalVariable Property FoodRequiredHoldings  Auto  
GlobalVariable Property FoodProducedPlayerHoldings  Auto  

Keyword Property NoFood Auto

CS_EconomyVariableFunctions Property EconUpdater Auto
GlobalVariable Property CS_EconomyUpdatedNum  Auto  

Quest Property CS_TroopRespawnRefresh Auto

