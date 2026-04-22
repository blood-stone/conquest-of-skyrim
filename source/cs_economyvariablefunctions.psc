Scriptname CS_EconomyVariableFunctions extends Quest  

Function SetInitialKeywords()
    int i = 0
    while i < AllLocations.GetSize()
        Location Holding = AllLocations.GetAt(i) as Location
        Holding.SetKeywordData(TaxRate, 0)
        If i < 5
            if i == 0 ;Markarth
                Holding.SetKeywordData(FarmLevel, 1)
                Holding.SetKeywordData(MineLevel, 4)
                Holding.SetKeywordData(LumberMillLevel, 2)
                Holding.SetKeywordData(FoodChange, 3)
                Holding.SetKeywordData(WoodChange, 2)
                Holding.SetKeywordData(MetalChange, 7)
            elseif i == 1 ;Riften
                Holding.SetKeywordData(FarmLevel, 3)
                Holding.SetKeywordData(MineLevel, 2)
                Holding.SetKeywordData(LumberMillLevel, 3)
                Holding.SetKeywordData(DocksLevel, 2)
                Holding.SetKeywordData(FoodChange, 7)
                Holding.SetKeywordData(WoodChange, 3)
                Holding.SetKeywordData(MetalChange, 2)
                Holding.SetKeywordData(DocksChange, 3)
            elseif i == 2 ;Solitude
                Holding.SetKeywordData(FarmLevel, 1)
                Holding.SetKeywordData(MineLevel, 0)
                Holding.SetKeywordData(LumberMillLevel, 1)
                Holding.SetKeywordData(DocksLevel, 4)
                Holding.SetKeywordData(FoodChange, 3)
                Holding.SetKeywordData(WoodChange, 2)
                Holding.SetKeywordData(MetalChange, 1)
                Holding.SetKeywordData(DocksChange, 10)
            elseif i == 3 ;Whiterun
                Holding.SetKeywordData(FarmLevel, 4)
                Holding.SetKeywordData(MineLevel, 0)
                Holding.SetKeywordData(LumberMillLevel, 1)
                Holding.SetKeywordData(FoodChange, 10)
                Holding.SetKeywordData(WoodChange, 3)
                Holding.SetKeywordData(MetalChange, 2)
            elseif i == 4 ;Windhelm
                Holding.SetKeywordData(FarmLevel, 2)
                Holding.SetKeywordData(MineLevel, 2)
                Holding.SetKeywordData(LumberMillLevel, 1)
                Holding.SetKeywordData(DocksLevel, 3)
                Holding.SetKeywordData(FoodChange, 7)
                Holding.SetKeywordData(WoodChange, 1)
                Holding.SetKeywordData(MetalChange, 2)
                Holding.SetKeywordData(DocksChange, 7)
            endif
            Holding.SetKeywordData(FoodRequired, 50)
            Holding.SetKeywordData(Population, 50)
            Holding.SetKeywordData(BarracksLevel, 2)            
        ElseIf i >= 5 && i < 9
            if i == 5 ;Dawnstar
                Holding.SetKeywordData(FarmLevel, 1)
                Holding.SetKeywordData(MineLevel, 2)
                Holding.SetKeywordData(LumberMillLevel, 1)
                Holding.SetKeywordData(DocksLevel, 1)
                Holding.SetKeywordData(FoodChange, 3)
                Holding.SetKeywordData(WoodChange, 1)
                Holding.SetKeywordData(MetalChange, 2)
                Holding.SetKeywordData(DocksChange, 3)
            elseif i == 6 ;Falkreath
                Holding.SetKeywordData(FarmLevel, 2)
                Holding.SetKeywordData(MineLevel, 1)
                Holding.SetKeywordData(LumberMillLevel, 4)
                Holding.SetKeywordData(FoodChange, 7)
                Holding.SetKeywordData(WoodChange, 7)
                Holding.SetKeywordData(MetalChange, 1)
            elseif i == 7 ;Morthal
                Holding.SetKeywordData(FarmLevel, 3)
                Holding.SetKeywordData(MineLevel, 2)
                Holding.SetKeywordData(LumberMillLevel, 1)
                Holding.SetKeywordData(FoodChange, 6)
                Holding.SetKeywordData(WoodChange, 1)
                Holding.SetKeywordData(MetalChange, 2)
            elseif i == 8 ;Winterhold
                Holding.SetKeywordData(FarmLevel, 0)
                Holding.SetKeywordData(MineLevel, 2)
                Holding.SetKeywordData(LumberMillLevel, 1)
                Holding.SetKeywordData(FoodChange, 1)
                Holding.SetKeywordData(WoodChange, 2)
                Holding.SetKeywordData(MetalChange, 3)
            endif
            Holding.SetKeywordData(FoodRequired, 20)
            Holding.SetKeywordData(Population, 20)
            Holding.SetKeywordData(BarracksLevel, 1)
        ElseIf i >= 9
            if i == 9 ;Dragon Bridge
                Holding.SetKeywordData(FarmLevel, 2)
                Holding.SetKeywordData(MineLevel, 0)
                Holding.SetKeywordData(LumberMillLevel, 3)
                Holding.SetKeywordData(FoodChange, 4)
                Holding.SetKeywordData(WoodChange, 2)
                Holding.SetKeywordData(MetalChange, 1)      
            elseif i == 10 ;Ivarstead
                Holding.SetKeywordData(FarmLevel, 2)
                Holding.SetKeywordData(MineLevel, 0)
                Holding.SetKeywordData(LumberMillLevel, 3)
                Holding.SetKeywordData(FoodChange, 4)
                Holding.SetKeywordData(WoodChange, 2)
                Holding.SetKeywordData(MetalChange, 1)  
            elseif i == 11 ;Karthwasten
                Holding.SetKeywordData(FarmLevel, 1)
                Holding.SetKeywordData(MineLevel, 4)
                Holding.SetKeywordData(LumberMillLevel, 0)
                Holding.SetKeywordData(FoodChange, 2)
                Holding.SetKeywordData(WoodChange, 1)
                Holding.SetKeywordData(MetalChange, 3)  
            elseif i == 12 ;Riverwood
                Holding.SetKeywordData(FarmLevel, 2)
                Holding.SetKeywordData(MineLevel, 0)
                Holding.SetKeywordData(LumberMillLevel, 3)
                Holding.SetKeywordData(FoodChange, 2)
                Holding.SetKeywordData(WoodChange, 3)
                Holding.SetKeywordData(MetalChange, 1)  
            elseif i == 13 ;Rorikstead
                Holding.SetKeywordData(FarmLevel, 4)
                Holding.SetKeywordData(MineLevel, 0)
                Holding.SetKeywordData(LumberMillLevel, 0)
                Holding.SetKeywordData(FoodChange, 2)
                Holding.SetKeywordData(WoodChange, 1)
                Holding.SetKeywordData(MetalChange, 1)  
            elseif i == 14 ;Shor's Stone
                Holding.SetKeywordData(FarmLevel, 1)
                Holding.SetKeywordData(MineLevel, 2)
                Holding.SetKeywordData(LumberMillLevel, 0)
                Holding.SetKeywordData(FoodChange, 4)
                Holding.SetKeywordData(WoodChange, 1)
                Holding.SetKeywordData(MetalChange, 3)  
            endif       
            Holding.SetKeywordData(FoodRequired, 10)
            Holding.SetKeywordData(Population, 10)      
        EndIf   
        Holding.SetKeywordData(Unemployed, Holding.GetKeywordData(Population))      
        Holding.SetKeywordData(JobsOpenFood, Holding.GetKeywordData(FoodChange)*Holding.GetKeywordData(FarmLevel))
        Holding.SetKeywordData(JobsOpenMetal, Holding.GetKeywordData(MetalChange)*Holding.GetKeywordData(MineLevel))
        Holding.SetKeywordData(JobsOpenWood, Holding.GetKeywordData(WoodChange)*Holding.GetKeywordData(LumberMillLevel))
        Holding.SetKeywordData(JobsOpenDocks, Holding.GetKeywordData(DocksChange)*Holding.GetKeywordData(DocksLevel))
        Holding.SetKeywordData(Loyalty, 50)
        Holding.SetKeywordData(Harshness, 50)
        i += 1
    endwhile
    UpdateEconomy()
EndFunction

Function CalculatePlayerResources()
    CalculatePlayerPerDay(1)
    CoinTotalPlayer.SetValue(CoinTotalPlayer.GetValue() + CoinTotalPlayerPerDay.GetValue())
    If CoinTotalPlayer.GetValue() < 0
        CoinTotalPlayer.SetValue(0)
        debug.notification("Your faction is out of gold!")
    EndIf
    FoodTotalPlayer.Mod(FoodTotalPlayerPerDay.GetValue() + FoodToHoldings.GetValue() - InitialFood - FoodTotalPlayerImported.GetValue() - FoodTotalPlayerProduced.GetValue() + FoodTotalPlayerRequired.GetValue() + FoodTotalPlayerExported.GetValue())
    If FoodTotalPlayer.GetValue() < 0
        debug.notification("Your faction is out of food!")
        FoodTotalPlayer.SetValue(0)
    EndIf
    MetalTotalPlayer.SetValue(MetalTotalPlayer.GetValue() + MetalTotalPlayerPerDay.GetValue() + MetalToHoldings.GetValue())
    WoodTotalPlayer.SetValue(WoodTotalPlayer.GetValue() + WoodTotalPlayerPerDay.GetValue() + WoodToHoldings.GetValue())
EndFunction

Function CalculatePlayerPerDay(int checkresourcecount=0)
    If GameDaysPassed.GetValue() >= ReparationsTimeImp.GetValue()
        ReparationsImp.SetValue(0)
    EndIf
    If GameDaysPassed.GetValue() >= ReparationsTimeSons.GetValue()
        ReparationsSons.SetValue(0)
    EndIf
    FoodTotalPlayerProduced.SetValue(0)
    FoodTotalPlayerRequired.SetValue(0)
    MetalTotalPlayerProduced.SetValue(MetalProducedMisc.GetValue())
    WoodTotalPlayerProduced.SetValue(0)
    int FoodHunted = 0
    int i = 0
    while i < CommanderScript.Commanders.Length
        if CommanderScript.Commanders[i].GetActorRef() != None
            if CommanderScript.Commanders[i].GetActorRef().IsInFaction(ArmyHunterFaction) == 1
                FoodHunted += 3*((TroopManage.TroopCounts.GetAt(i) as GlobalVariable).GetValue() as int)
            endif
        endif
        i += 1
    endwhile
    int TotalTroops = 0 
    i = 0
    while i < 30
        CS_ArmyTroopDeath ArmyScript = (TroopManage.ArmyQuests.GetAt(i) as Quest) as CS_ArmyTroopDeath
        if ArmyScript.IsVampire != true
            TotalTroops += ArmyScript.TroopCountFood
        endif
        i += 1
    endwhile
    CoinTotalPlayerPerDay.SetValue(CoinTotalPlayerPerDayHoldings.GetValue() - GovCosts.GetValue() - 100*FoodTotalPlayerImported.GetValue() + 100*FoodTotalPlayerExported.GetValue() - 100*WoodTotalPlayerImported.GetValue() + 100*WoodTotalPlayerExported.GetValue() - 100*MetalTotalPlayerImported.GetValue() + 100*MetalTotalPlayerExported.GetValue() + ReparationsImp.GetValue() + ReparationsSons.GetValue() + CoinSponsors.GetValue())
    FoodTotalPlayerProduced.Mod(FoodHunted)
    FoodTotalPlayerRequired.Mod(TotalTroops)
    FoodTotalPlayerPerDay.SetValue(FoodTotalPlayerImported.GetValue() + FoodFromHoldings.GetValue() + FoodHunted - TotalTroops - FoodTotalPlayerExported.GetValue() - FoodCostMisc.GetValue() - FoodToHoldings.GetValue())
    WoodTotalPlayerPerDay.SetValue(WoodTotalPlayerImported.GetValue() + WoodFromHoldings.GetValue() - WoodTotalPlayerExported.GetValue() - WoodToHoldings.GetValue())
    MetalTotalPlayerPerDay.SetValue(MetalTotalPlayerImported.GetValue() + MetalFromHoldings.GetValue() - MetalTotalPlayerExported.GetValue() + MetalProducedMisc.GetValue() - MetalToHoldings.GetValue())
    if checkresourcecount == 1
        if MetalTotalPlayerPerDay.GetValue() < 0 && math.abs(MetalTotalPlayerPerDay.GetValue()) > MetalTotalPlayer.GetValue()
            (EconReport as CS_EconomyMenuFunctions).CancelMetalExports(1)
            (EconReport as CS_EconomyMenuFunctions).CancelMetalExports(2)
            debug.notification("Metal Reserves depleted: cancelling all metal exports")
            MetalTotalPlayer.SetValue(0)    
            MetalTotalPlayerPerDay.SetValue(0)  
        endif
        if WoodTotalPlayerPerDay.GetValue() < 0 && math.abs(WoodTotalPlayerPerDay.GetValue()) > WoodTotalPlayer.GetValue()
            (EconReport as CS_EconomyMenuFunctions).CancelWoodExports(1)
            (EconReport as CS_EconomyMenuFunctions).CancelWoodExports(2)
            debug.notification("Wood Reserves depleted: cancelling all wood exports")
            WoodTotalPlayer.SetValue(0) 
            WoodTotalPlayerPerDay.SetValue(0)   
        endif
    endif
EndFunction

Function GetFoodPerDay()
    int FoodHunted = 0
    int i = 0
    while i < CommanderScript.Commanders.Length
        if CommanderScript.Commanders[i].GetActorRef() != None
            if CommanderScript.Commanders[i].GetActorRef().IsInFaction(ArmyHunterFaction) == 1
                FoodHunted += 3*((TroopManage.TroopCounts.GetAt(i) as GlobalVariable).GetValue() as int)
            endif
        endif
        i += 1
    endwhile
    int TotalTroops = 0 
    i = 0
    while i < 30
        CS_ArmyTroopDeath ArmyScript = (TroopManage.ArmyQuests.GetAt(i) as Quest) as CS_ArmyTroopDeath
        if ArmyScript.IsVampire != true
            TotalTroops += ArmyScript.TroopCountFood
        endif
        i += 1
    endwhile
    FoodTotalPlayerPerDay.SetValue(FoodTotalPlayerPerDayHoldings.GetValue() + FoodTotalPlayerImported.GetValue() + FoodHunted - TotalTroops - FoodTotalPlayerExported.GetValue() - FoodCostMisc.GetValue())
EndFunction

Function StartReparations(int ReparationsNum, int factionnum)
    if factionnum == 1
        ReparationsImp.SetValue(ReparationsNum)
        ReparationsTimeImp.SetValue(GameDaysPassed.GetValue() + 14)
    elseif factionnum == 2
        ReparationsSons.SetValue(ReparationsNum)
        ReparationsTimeSons.SetValue(GameDaysPassed.GetValue() + 14)
    endif
EndFunction

Function UpdateHoldingResources(int holdingnum)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    City.ForceLocationTo(Holding)
    Float efficiency = 1
    Holding.SetKeywordData(FoodRequired, Holding.GetKeywordData(Population))
    int Pop = Holding.GetKeywordData(Population) as int
    int FoodMax = (Holding.GetKeywordData(FoodChange)*Holding.GetKeywordData(FarmLevel)) as int
    int MetalMax = (Holding.GetKeywordData(MetalChange)*Holding.GetKeywordData(MineLevel)) as int
    int WoodMax = (Holding.GetKeywordData(WoodChange)*Holding.GetKeywordData(LumberMillLevel)) as int
    int MaxJobs = FoodMax + MetalMax + WoodMax
    If Pop - MaxJobs > 0
        Holding.SetKeywordData(Unemployed, Pop - MaxJobs)
    Else
        Holding.SetKeywordData(Unemployed, 0)
    EndIf
    int OpenJobs = Holding.GetKeywordData(JobsOpenFood) as int + Holding.GetKeywordData(JobsOpenMetal) as int + Holding.GetKeywordData(JobsOpenWood) as int
    while Holding.GetKeywordData(Unemployed) > 0 && OpenJobs > 0
        while Holding.GetKeywordData(JobsOpenFood) > 0 && OpenJobs > 0 && Holding.GetKeywordData(Unemployed) > 0
            Holding.SetKeywordData(JobsOpenFood, Holding.GetKeywordData(JobsOpenFood) - 1)
            Holding.SetKeywordData(Unemployed, Holding.GetKeywordData(Unemployed) - 1)
            OpenJobs -= 1
        endwhile
        while (Holding.GetKeywordData(JobsOpenWood) > 0 || Holding.GetKeywordData(JobsOpenMetal) > 0) && OpenJobs > 0 && Holding.GetKeywordData(Unemployed) > 0
            if Holding.GetKeywordData(JobsOpenWood) > 0 && OpenJobs > 0 && Holding.GetKeywordData(Unemployed) > 0 
                Holding.SetKeywordData(JobsOpenWood, Holding.GetKeywordData(JobsOpenWood) - 1)
                Holding.SetKeywordData(Unemployed, Holding.GetKeywordData(Unemployed) - 1)
                OpenJobs -= 1
            endif
            if Holding.GetKeywordData(JobsOpenMetal) > 0 && OpenJobs > 0 && Holding.GetKeywordData(Unemployed) > 0 
                Holding.SetKeywordData(JobsOpenMetal, Holding.GetKeywordData(JobsOpenMetal) - 1)
                Holding.SetKeywordData(Unemployed, Holding.GetKeywordData(Unemployed) - 1)
                OpenJobs -= 1
            endif
        endwhile
    endwhile
    if holdingnum < 5
        Holding.SetKeywordData(TreasuryPerDay, 500*Pop + 250*Pop*(Holding.GetKeywordData(TaxRate) as int))
        Holding.SetKeywordData(MetalProduced, Holding.GetKeywordData(MetalChange)*Holding.GetKeywordData(MineLevel) - Holding.GetKeywordData(JobsOpenMetal))
        Holding.SetKeywordData(WoodProduced, Holding.GetKeywordData(WoodChange)*Holding.GetKeywordData(LumberMillLevel) - Holding.GetKeywordData(JobsOpenWood))
    elseif holdingnum >= 5 && holdingnum < 9
        Holding.SetKeywordData(TreasuryPerDay, 300*Pop + 150*Pop*(Holding.GetKeywordData(TaxRate) as int))
        Holding.SetKeywordData(MetalProduced, Holding.GetKeywordData(MetalChange)*Holding.GetKeywordData(MineLevel) - Holding.GetKeywordData(JobsOpenMetal))
        Holding.SetKeywordData(WoodProduced, Holding.GetKeywordData(WoodChange)*Holding.GetKeywordData(LumberMillLevel) - Holding.GetKeywordData(JobsOpenWood))
    elseif holdingnum >= 9
        Holding.SetKeywordData(TreasuryPerDay, 200*Pop + 100*Pop*(Holding.GetKeywordData(TaxRate) as int))
        Holding.SetKeywordData(MetalProduced, Holding.GetKeywordData(MetalChange)*Holding.GetKeywordData(MineLevel) - Holding.GetKeywordData(JobsOpenMetal))
        Holding.SetKeywordData(WoodProduced, Holding.GetKeywordData(WoodChange)*Holding.GetKeywordData(LumberMillLevel) - Holding.GetKeywordData(JobsOpenWood))
    endif
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
        if (Holding.GetKeywordData(FoodImported) as int) > FoodTotalPlayer.GetValue()
            CancelFoodImports(holdingnum)
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
            Holding.SetKeywordData(FoodReserve, 0)
            Holding.SetKeywordData(NoFood, 1)
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
            CancelMetalImports(holdingnum)
            MetalLow.show()
        else
            MetalTotalPlayer.Mod(-Holding.GetKeywordData(MetalImported))
        endif
        if (Holding.GetKeywordData(WoodImported) as int) > WoodTotalPlayer.GetValue()
            CancelWoodImports(holdingnum)
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
    endif
EndFunction

Function JarlAddFood(int holdingnum)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    if Holding.GetKeywordData(JarlEconomy) == 1 && (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 1
        int FoodOffset = (Holding.GetKeywordData(FoodProduced) as int) - (Holding.GetKeywordData(FoodRequired) as int)
        int MetalOffset = (Holding.GetKeywordData(MetalProduced) as int)
        int WoodOffset = (Holding.GetKeywordData(WoodProduced) as int)
        If FoodOffset > 5
            InitialFood += (FoodOffset - 5)
            FoodTotalPlayer.Mod(FoodOffset - 5)
        EndIf
    endif
EndFunction

Function JarlStartTrading(int holdingnum)
        Location Holding = AllLocations.GetAt(holdingnum) as Location
        CancelFoodImports(holdingnum)
        CancelFoodExports(holdingnum)
        CancelMetalImports(holdingnum)
        CancelMetalExports(holdingnum)
        CancelWoodImports(holdingnum)
        CancelWoodExports(holdingnum)
        int FoodOffset = (Holding.GetKeywordData(FoodProduced) as int) - (Holding.GetKeywordData(FoodRequired) as int)
        int MetalOffset = (Holding.GetKeywordData(MetalProduced) as int)
        int WoodOffset = (Holding.GetKeywordData(WoodProduced) as int)
        If FoodOffset > 5
            ExportFood(holdingnum, FoodOffset - 5)
        ElseIf FoodOffset < 0
            ImportFood(holdingnum, math.abs(FoodOffset) as int + 5)
        EndIf
        If MetalOffset > 5
            ExportMetal(holdingnum, MetalOffset - 5)
        ElseIf MetalOffset < 0
            ImportMetal(holdingnum, math.abs(MetalOffset) as int + 5)
        EndIf
        If WoodOffset > 5
            ExportWood(holdingnum, WoodOffset - 5)
        ElseIf WoodOffset < 0
            ImportWood(holdingnum, math.abs(WoodOffset) as int + 5)
        EndIf
EndFunction

Function StewardManageEconomy(int holdingnum)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    Holding.SetKeywordData(JarlEconomy, 1)
    JarlStartTrading(holdingnum)
EndFunction

Function StewardStopManageEconomy(int holdingnum)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    Holding.SetKeywordData(JarlEconomy, 0)
    CancelFoodImports(holdingnum)
    CancelFoodExports(holdingnum)
    CancelMetalImports(holdingnum)
    CancelMetalExports(holdingnum)
    CancelWoodImports(holdingnum)
    CancelWoodExports(holdingnum)
EndFunction

Function JarlStartManageEconomy(Actor JarlRef)
    int holdingnum = 0
    int FoundJarl = 0
    while holdingnum < (GovQuest as CS_RecruitJarl).JarlAliases.Length && FoundJarl == 0
        If JarlRef == (GovQuest as CS_RecruitJarl).JarlAliases[holdingnum].GetActorRef()
            Location Holding = AllLocations.GetAt(holdingnum) as Location
            JarlRef.AddToFaction(JarlManageFaction)
            Holding.SetKeywordData(JarlEconomy, 1)
            JarlStartTrading(holdingnum)
            FoundJarl = 1
        EndIf
        holdingnum += 1
    endwhile
EndFunction

Function JarlStopManageEconomy(Actor JarlRef)
    int holdingnum = 0
    int FoundJarl = 0
    while holdingnum < (GovQuest as CS_RecruitJarl).JarlAliases.Length && FoundJarl == 0
        If JarlRef == (GovQuest as CS_RecruitJarl).JarlAliases[holdingnum].GetActorRef()
            Location Holding = AllLocations.GetAt(holdingnum) as Location
            Holding.SetKeywordData(JarlEconomy, 0)
            Holding.SetKeywordData(JarlUpgrades, 0)
            CancelFoodImports(holdingnum)
            CancelFoodExports(holdingnum)
            CancelMetalImports(holdingnum)
            CancelMetalExports(holdingnum)
            CancelWoodImports(holdingnum)
            CancelWoodExports(holdingnum)
            JarlRef.RemoveFromFaction(JarlManageFaction)
            FoundJarl = 1
        EndIf
        holdingnum += 1
    endwhile
EndFunction

Function DistributePopulation()
    int i = 0
    int totalloops = 0
    while PopulationMoving.GetValue() > 0 && totalloops < 20
        Location Holding = AllLocations.GetAt(i) as Location
        if Holding.GetKeywordData(FoodToTrade) > 0
            Holding.SetKeywordData(Population, Holding.GetKeywordData(Population) + 1)
            PopulationMoving.Mod(-1)
        endif
        i += 1
        if i >= AllLocations.GetSize()
            i = 0
            totalloops += 1
        endif
        if totalloops >= 20
            i = 100
        endif
    endwhile
    PopulationMoving.SetValue(0)
EndFunction

Function UpdateFoodGlobalsImport()
    int i = 0
    while i < FoodExportGlobals.GetSize()
        if ((AllLocations.GetAt(i) as Location).GetKeywordData(FoodToTrade) as int) >= 0
            (FoodExportGlobals.GetAt(i) as GlobalVariable).SetValue((AllLocations.GetAt(i) as Location).GetKeywordData(FoodToTrade) as int)
        else
            (FoodExportGlobals.GetAt(i) as GlobalVariable).SetValue(0)
        endif
        i += 1
    endwhile
EndFunction

Function UpdateFoodGlobalsExport()
    int i = 0
    while i < FoodImportGlobals.GetSize()
        (FoodImportGlobals.GetAt(i) as GlobalVariable).SetValue((AllLocations.GetAt(i) as Location).GetKeywordData(FoodNeed) as int)
        i += 1
    endwhile
EndFunction

Function UpdateMetalGlobalsImport()
    int i = 0
    while i < FoodExportGlobals.GetSize()
        if ((AllLocations.GetAt(i) as Location).GetKeywordData(MetalToTrade) as int) >= 0
            (FoodExportGlobals.GetAt(i) as GlobalVariable).SetValue((AllLocations.GetAt(i) as Location).GetKeywordData(MetalToTrade) as int)
        else
            (FoodExportGlobals.GetAt(i) as GlobalVariable).SetValue(0)
        endif
        i += 1
    endwhile
EndFunction

Function UpdateMetalGlobalsExport()
    int i = 0
    while i < FoodImportGlobals.GetSize()
        if ((AllLocations.GetAt(i) as Location).GetKeywordData(MetalToTrade) as int) < 0
            (FoodImportGlobals.GetAt(i) as GlobalVariable).SetValue((AllLocations.GetAt(i) as Location).GetKeywordData(MetalToTrade) as int)
        else
            (FoodImportGlobals.GetAt(i) as GlobalVariable).SetValue(0)
        endif
        i += 1
    endwhile
EndFunction

Function UpdateWoodGlobalsImport()
    int i = 0
    while i < FoodExportGlobals.GetSize()
        if ((AllLocations.GetAt(i) as Location).GetKeywordData(WoodToTrade) as int) >= 0
            (FoodExportGlobals.GetAt(i) as GlobalVariable).SetValue((AllLocations.GetAt(i) as Location).GetKeywordData(WoodToTrade) as int)
        else
            (FoodExportGlobals.GetAt(i) as GlobalVariable).SetValue(0)
        endif
        i += 1
    endwhile
EndFunction

Function UpdateWoodGlobalsExport()
    int i = 0
    while i < FoodImportGlobals.GetSize()
        if ((AllLocations.GetAt(i) as Location).GetKeywordData(WoodToTrade) as int) < 0
            (FoodImportGlobals.GetAt(i) as GlobalVariable).SetValue((AllLocations.GetAt(i) as Location).GetKeywordData(WoodToTrade) as int)
        else
            (FoodImportGlobals.GetAt(i) as GlobalVariable).SetValue(0)
        endif
        i += 1
    endwhile
EndFunction

Function PillageHolding(int citynum)
    Location Holding = AllLocations.GetAt(citynum) as Location
    CoinTotalPlayer.SetValue(CoinTotalPlayer.GetValue() + Holding.GetKeywordData(Treasury) as int)
    FoodTotalPlayer.SetValue(FoodTotalPlayer.GetValue() + Holding.GetKeywordData(FoodReserve) as int)
    MetalTotalPlayer.SetValue(MetalTotalPlayer.GetValue() + Holding.GetKeywordData(MetalReserve) as int)
    WoodTotalPlayer.SetValue(WoodTotalPlayer.GetValue() + Holding.GetKeywordData(WoodReserve) as int)
    If Holding.GetKeywordData(Treasury) > 0
        debug.notification(Holding.GetKeywordData(Treasury) as int + " Gold has been added to the Treasury!")
    EndIf
    If Holding.GetKeywordData(FoodReserve) > 0
        debug.notification(Holding.GetKeywordData(FoodReserve) as int + " Food has been added to the Food Reserves!")
    EndIf
    If Holding.GetKeywordData(MetalReserve) > 0
        debug.notification(Holding.GetKeywordData(MetalReserve) as int + " Metal has been added to the Metal Reserves!")
    EndIf
    If Holding.GetKeywordData(WoodReserve) > 0
        debug.notification(Holding.GetKeywordData(WoodReserve) as int + " Wood has been added to the Wood Reserves!")
    EndIf
    Holding.SetKeywordData(Treasury, 0)
    Holding.SetKeywordData(FoodReserve, 0)
    Holding.SetKeywordData(MetalReserve, 0)
    Holding.SetKeywordData(WoodReserve, 0)
EndFunction

Function EconomyMenu(int Response = 0)
    FactionName.ForceRefTo(FactionNameGov.GetReference())
    Response = EconReportStart.show()
    if Response < 5
        EconomyMenuCity(Response)
    elseif Response == 5
        EconomyMenuStartMinorCities()
    elseif Response == 6
        EconomyMenuStartVillages()
    elseif Response == 7
        (EconReport as CS_EconomyMenuFunctions).StartMenu()
    endif
EndFunction

Function EconomyMenuStartMinorCities(int Response = 0)
    Response = EconReportStartMinorCities.show()
    if Response < 4
        EconomyMenuCity(Response + 5)
    elseif Response == 4
        EconomyMenu()
    elseif Response == 5
        EconomyMenuStartVillages()
    elseif Response == 6
        (EconReport as CS_EconomyMenuFunctions).StartMenu()
    endif
EndFunction

Function EconomyMenuStartVillages(int Response = 0)
    Response = EconReportStartVillages.show()
    if Response < 6
        EconomyMenuVillage(Response + 9)
    elseif Response == 6
        EconomyMenu()
    elseif Response == 7
        EconomyMenuStartMinorCities()
    elseif Response == 8
        (EconReport as CS_EconomyMenuFunctions).StartMenu()
    endif
EndFunction

Function EconomyMenuCity(int holdingnum, int Response = 0, int steward = 0)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    Actor CityJarl = (GovQuest as CS_RecruitJarl).JarlAliases[holdingnum].GetActorRef()
    if CityJarl != None
        Jarl.ForceRefTo(CityJarl)
    else
        Jarl.ForceRefTo(Game.GetPlayer())
    endif
    City.ForceLocationTo(Holding)
    FactionName.ForceRefTo(FactionNameGov.GetReference())
    ResourceRepEconomyManaged.SetValue(Holding.GetKeywordData(JarlEconomy))
    EconomyManaged.ForceRefTo(EconomyManagedBarrels[Holding.GetKeywordData(JarlEconomy) as int])
    int FoodAdd = (Holding.GetKeywordData(FoodProduced) as int) + (Holding.GetKeywordData(FoodImported) as int) - (Holding.GetKeywordData(FoodRequired) as int) - (Holding.GetKeywordData(FoodExported) as int)
    int MetalAdd = (Holding.GetKeywordData(MetalProduced) as int) + (Holding.GetKeywordData(MetalImported) as int) - (Holding.GetKeywordData(MetalExported) as int)
    int WoodAdd = (Holding.GetKeywordData(WoodProduced) as int) + (Holding.GetKeywordData(WoodImported) as int) - (Holding.GetKeywordData(WoodExported) as int)
    ResourceRepFoodReserve.SetValue(Holding.GetKeywordData(FoodReserve))
    ResourceRepFoodTotal.SetValue(FoodAdd)
    ResourceRepMetalReserve.SetValue(Holding.GetKeywordData(MetalReserve))
    ResourceRepMetalTotal.SetValue(MetalAdd)
    ResourceRepWoodReserve.SetValue(Holding.GetKeywordData(WoodReserve))
    ResourceRepWoodTotal.SetValue(WoodAdd)
    ResourceRepTreasury.SetValue(Holding.GetKeywordData(Treasury))
    ResourceRepPopulation.SetValue(Holding.GetKeywordData(Population))
    ResourceRepUnemployed.SetValue(Holding.GetKeywordData(Unemployed))
    int LoyaltyNum = Holding.GetKeywordData(Loyalty) as int
    if LoyaltyNum >= 0 && LoyaltyNum < 20
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[0])
    elseif LoyaltyNum >= 20 && LoyaltyNum < 40
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[1])
    elseif LoyaltyNum >= 40 && LoyaltyNum < 60
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[2])
    elseif LoyaltyNum >= 60 && LoyaltyNum < 80
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[3])
    elseif LoyaltyNum >= 80
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[4])
    endif
    int i = 0
    while i < ResourceGlobals.GetSize()
        UpdateCurrentInstanceGlobal(ResourceGlobals.GetAt(i) as GlobalVariable)
        i += 1
    endwhile
    if steward == 1
        Response = EconReportCitySteward.show()
        if Response == 0
            EconomyMenuFood(holdingnum, steward=1)
        elseif Response == 1
            EconomyMenuMetal(holdingnum, steward=1)
        elseif Response == 2
            EconomyMenuWood(holdingnum, steward=1)
        elseif Response == 3
            UpgradeMenu.SetGlobals(holdingnum)
            UpgradeMenu.MenuUpgrade(citynum=holdingnum, steward = 1)
        elseif Response == 4
            EconomyMenuGuards(holdingnum, steward=1)
        elseif Response == 5
            EconomyTaxMenu(holdingnum, steward = 1)
        endif
    else
        Response = EconReportCity.show()
        if Response == 0
            EconomyMenuFood(holdingnum)
        elseif Response == 1
            EconomyMenuMetal(holdingnum)
        elseif Response == 2
            EconomyMenuWood(holdingnum)
        elseif Response == 3
            UpgradeMenu.SetGlobals(holdingnum)
            UpgradeMenu.MenuUpgrade(citynum=holdingnum)
        elseif Response == 4
            EconomyMenuGuards(holdingnum)
        elseif Response == 5
            EconomyTaxMenu(holdingnum)
        elseif Response == 6
            if holdingnum < 5
                EconomyMenu()
            elseif holdingnum >= 5 && holdingnum < 9
                EconomyMenuStartMinorCities()
            else
                EconomyMenuStartVillages()
            endif
        endif
    endif
EndFunction

Function EconomyMenuCitySteward(int holdingnum, int Response = 0)
    FactionName.ForceRefTo(FactionNameGov.GetReference())
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    Actor CityJarl = (GovQuest as CS_RecruitJarl).JarlAliases[holdingnum].GetActorRef()
    if CityJarl != None
        Jarl.ForceRefTo(CityJarl)
    else
        Jarl.ForceRefTo(Game.GetPlayer())
    endif
    City.ForceLocationTo(Holding)
    ResourceRepEconomyManaged.SetValue(Holding.GetKeywordData(JarlEconomy))
    EconomyManaged.ForceRefTo(EconomyManagedBarrels[Holding.GetKeywordData(JarlEconomy) as int])
    int FoodAdd = (Holding.GetKeywordData(FoodProduced) as int) + (Holding.GetKeywordData(FoodImported) as int) - (Holding.GetKeywordData(FoodRequired) as int) - (Holding.GetKeywordData(FoodExported) as int)
    int MetalAdd = (Holding.GetKeywordData(MetalProduced) as int) + (Holding.GetKeywordData(MetalImported) as int) - (Holding.GetKeywordData(MetalExported) as int)
    int WoodAdd = (Holding.GetKeywordData(WoodProduced) as int) + (Holding.GetKeywordData(WoodImported) as int) - (Holding.GetKeywordData(WoodExported) as int)
    ResourceRepFoodReserve.SetValue(Holding.GetKeywordData(FoodReserve))
    ResourceRepFoodTotal.SetValue(FoodAdd)
    ResourceRepMetalReserve.SetValue(Holding.GetKeywordData(MetalReserve))
    ResourceRepMetalTotal.SetValue(MetalAdd)
    ResourceRepWoodReserve.SetValue(Holding.GetKeywordData(WoodReserve))
    ResourceRepWoodTotal.SetValue(WoodAdd)
    ResourceRepTreasury.SetValue(Holding.GetKeywordData(Treasury))
    ResourceRepPopulation.SetValue(Holding.GetKeywordData(Population))
    ResourceRepUnemployed.SetValue(Holding.GetKeywordData(Unemployed))
    int LoyaltyNum = Holding.GetKeywordData(Loyalty) as int
    if LoyaltyNum >= 0 && LoyaltyNum < 20
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[0])
    elseif LoyaltyNum >= 20 && LoyaltyNum < 40
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[1])
    elseif LoyaltyNum >= 40 && LoyaltyNum < 60
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[2])
    elseif LoyaltyNum >= 60 && LoyaltyNum < 80
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[3])
    elseif LoyaltyNum >= 80
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[4])
    endif
    int i = 0
    while i < ResourceGlobals.GetSize()
        UpdateCurrentInstanceGlobal(ResourceGlobals.GetAt(i) as GlobalVariable)
        i += 1
    endwhile
    Response = EconReportCity.show()
    if Response == 0
        EconomyMenuFood(holdingnum)
    elseif Response == 1
        EconomyMenuMetal(holdingnum)
    elseif Response == 2
        EconomyMenuWood(holdingnum)
    elseif Response == 3
        UpgradeMenu.SetGlobals(holdingnum)
        UpgradeMenu.MenuUpgrade(citynum=holdingnum)
    endif
EndFunction

Function EconomyMenuVillage(int holdingnum, int Response = 0, int steward = 0)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    Actor CityJarl = (GovQuest as CS_RecruitJarl).JarlAliases[holdingnum].GetActorRef()
    if CityJarl != None
        Jarl.ForceRefTo(CityJarl)
    else
        Jarl.ForceRefTo(Game.GetPlayer())
    endif
    City.ForceLocationTo(Holding)
    FactionName.ForceRefTo(FactionNameGov.GetReference())
    ResourceRepEconomyManaged.SetValue(Holding.GetKeywordData(JarlEconomy))
    EconomyManaged.ForceRefTo(EconomyManagedBarrels[Holding.GetKeywordData(JarlEconomy) as int])
    int FoodAdd = (Holding.GetKeywordData(FoodProduced) as int) + (Holding.GetKeywordData(FoodImported) as int) - (Holding.GetKeywordData(FoodRequired) as int) - (Holding.GetKeywordData(FoodExported) as int)
    int MetalAdd = (Holding.GetKeywordData(MetalProduced) as int) + (Holding.GetKeywordData(MetalImported) as int) - (Holding.GetKeywordData(MetalExported) as int)
    int WoodAdd = (Holding.GetKeywordData(WoodProduced) as int) + (Holding.GetKeywordData(WoodImported) as int) - (Holding.GetKeywordData(WoodExported) as int)
    ResourceRepFoodReserve.SetValue(Holding.GetKeywordData(FoodReserve))
    ResourceRepFoodTotal.SetValue(FoodAdd)
    ResourceRepMetalReserve.SetValue(Holding.GetKeywordData(MetalReserve))
    ResourceRepMetalTotal.SetValue(MetalAdd)
    ResourceRepWoodReserve.SetValue(Holding.GetKeywordData(WoodReserve))
    ResourceRepWoodTotal.SetValue(WoodAdd)
    ResourceRepTreasury.SetValue(Holding.GetKeywordData(Treasury))
    ResourceRepPopulation.SetValue(Holding.GetKeywordData(Population))
    ResourceRepUnemployed.SetValue(Holding.GetKeywordData(Unemployed))
    int LoyaltyNum = Holding.GetKeywordData(Loyalty) as int
    if LoyaltyNum >= 0 && LoyaltyNum < 20
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[0])
    elseif LoyaltyNum >= 20 && LoyaltyNum < 40
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[1])
    elseif LoyaltyNum >= 40 && LoyaltyNum < 60
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[2])
    elseif LoyaltyNum >= 60 && LoyaltyNum < 80
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[3])
    elseif LoyaltyNum >= 80
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[4])
    endif
    int i = 0
    while i < ResourceGlobals.GetSize()
        UpdateCurrentInstanceGlobal(ResourceGlobals.GetAt(i) as GlobalVariable)
        i += 1
    endwhile
    if steward == 1
        Response = EconReportVillageSteward.show()
        if Response == 0
            EconomyMenuFood(holdingnum, steward=1)
        elseif Response == 1
            EconomyMenuMetal(holdingnum, steward=1)
        elseif Response == 2
            EconomyMenuWood(holdingnum, steward=1)
        elseif Response == 3
            UpgradeMenu.SetGlobals(holdingnum)
            UpgradeMenu.MenuUpgradeVillage(villagenum=holdingnum, steward = 1)
        elseif Response == 4
            EconomyMenuGuardsVillage(holdingnum, steward=1)
        elseif Response == 5
            EconomyTaxMenu(holdingnum, steward = 1)
        endif
    else
        Response = EconReportVillage.show()
        if Response == 0
            EconomyMenuFood(holdingnum)
        elseif Response == 1
            EconomyMenuMetal(holdingnum)
        elseif Response == 2
            EconomyMenuWood(holdingnum)
        elseif Response == 3
            UpgradeMenu.SetGlobalsVillage(holdingnum)
            UpgradeMenu.MenuUpgradeVillage(villagenum=holdingnum)
        elseif Response == 4
            EconomyMenuGuardsVillage(holdingnum)
        elseif Response == 5
            EconomyTaxMenu(holdingnum)
        elseif Response == 6
            EconomyMenuStartVillages()
        endif
    endif
EndFunction

Function EconomyMenuGuards(int holdingnum, int Response = 0, int steward = 0)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    EconReportCrime.SetValue(Holding.GetKeywordData(Crime))
    EconReportPrisoners.SetValue((AllPrisoners.GetAt(holdingnum) as GlobalVariable).GetValue() + Holding.GetKeywordData(PrisonerNum))
    EconReportGuardNum.SetValue(Holding.GetKeywordData(NumGuards))
    EconReportGuardNumMax.SetValue((AllGuardFormLists.GetAt(holdingnum) as FormList).GetSize())
    EconReportGuardNumRemaining.SetValue(EconReportGuardNumMax.GetValue() - EconReportGuardNum.GetValue())
    UpdateCurrentInstanceGlobal(CoinTotalPlayer)
    UpdateCurrentInstanceGlobal(ResourceRepFoodReserve)
    UpdateCurrentInstanceGlobal(ResourceRepFoodTotal)
    UpdateCurrentInstanceGlobal(EconReportCrime)
    UpdateCurrentInstanceGlobal(EconReportPrisoners)
    UpdateCurrentInstanceGlobal(EconReportGuardNum)
    UpdateCurrentInstanceGlobal(EconReportGuardNumMax)
    Response = EconReportGuards.show()
    if Response == 0
        HireGuard(holdingnum, 1)
        EconomyMenuGuards(holdingnum, steward=steward)
    elseif Response == 1
        HireGuard(holdingnum, 5)
        EconomyMenuGuards(holdingnum, steward=steward)
    elseif Response == 2
        HireGuard(holdingnum, 10)
        EconomyMenuGuards(holdingnum, steward=steward)
    elseif Response == 3
        EconomyMenuCity(holdingnum, steward=steward)
    endif
EndFunction

Function EconomyMenuGuardsVillage(int holdingnum, int Response = 0, int steward = 0)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    EconReportCrime.SetValue(Holding.GetKeywordData(Crime))
    ;EconReportPrisoners.SetValue((AllPrisoners.GetAt(holdingnum) as GlobalVariable).GetValue())
    EconReportGuardNum.SetValue(Holding.GetKeywordData(NumGuards))
    EconReportGuardNumMax.SetValue((AllGuardFormLists.GetAt(holdingnum) as FormList).GetSize())
    EconReportGuardNumRemaining.SetValue(EconReportGuardNumMax.GetValue() - EconReportGuardNum.GetValue())
    UpdateCurrentInstanceGlobal(CoinTotalPlayer)
    UpdateCurrentInstanceGlobal(ResourceRepFoodReserve)
    UpdateCurrentInstanceGlobal(ResourceRepFoodTotal)
    UpdateCurrentInstanceGlobal(EconReportCrime)
    ;UpdateCurrentInstanceGlobal(EconReportPrisoners)
    UpdateCurrentInstanceGlobal(EconReportGuardNum)
    UpdateCurrentInstanceGlobal(EconReportGuardNumMax)
    Response = EconReportGuardsVillage.show()
    if Response == 0
        HireGuard(holdingnum, 1)
        EconomyMenuGuardsVillage(holdingnum)
    elseif Response == 1
        HireGuard(holdingnum, 5)
        EconomyMenuGuardsVillage(holdingnum)
    elseif Response == 2
        HireGuard(holdingnum, 10)
        EconomyMenuGuardsVillage(holdingnum)
    elseif Response == 3
        EconomyMenuVillage(holdingnum)
    endif
EndFunction

Function EconomyTaxMenu(int holdingnum, int Response = 0, int steward = 0)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    ResourceRepTaxRate.SetValue(10*(Holding.GetKeywordData(TaxRate) + 2))
    UpdateCurrentInstanceGlobal(ResourceRepTaxRate)
    Response = EconReportTaxRate.show()
    if Response < 6
        SetTaxRate(Holding, Response - 2)
        EconomyTaxMenu(holdingnum, steward=steward)
    elseif Response == 6
        if holdingnum < 9
            EconomyMenuCity(holdingnum, steward=steward)
        else
            EconomyMenuVillage(holdingnum, steward=steward)
        endif
    endif
EndFunction

Function SetTaxRate(Location Holding, int newrate)
    int oldrate = Holding.GetKeywordData(TaxRate) as int
    LoyaltyCheck.AdjustLoyalty(Holding, 10*(oldrate - newrate), novillage=1)
    Holding.SetKeywordData(TaxRate, newrate)
EndFunction


Function HireGuard(int holdingnum, int amount)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    FormList GuardList = AllGuardFormLists.GetAt(holdingnum) as FormList
    if CoinTotalPlayer.GetValue() >= 250*amount
        CoinTotalPlayer.Mod(-250*amount)
        debug.notification(250*amount + " Gold Removed from the Treasury!")
        ResourceRepFoodTotal.Mod(-1*amount)
        CoinSound.Play(Game.GetPlayer())
        int i = 0
        int recruitedguards = 0
        while i < GuardList.GetSize() && recruitedguards < amount
            Actor Guard = GuardList.GetAt(i) as Actor
            if Guard.IsDead() == 1 || Guard.IsDisabled() == 1
                Guard.disable()
                Guard.reset()
                Guard.AllowPCDialogue(true)
                Guard.enable()
                recruitedguards += 1
                Holding.SetKeywordData(NumGuards, Holding.GetKeywordData(NumGuards) + 1)
            endif
            i += 1
        endwhile
        if GovQuest.GetStage() == 13
            GovQuest.SetStage(14)
        endif
    else
        debug.notification("Not enough gold in the treasury!")
    endif
EndFunction

Function EconomyMenuFood(int holdingnum, int Response = 0, int steward = 0)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    UpdateCityFoodGlobals(Holding)
    Response = EconReportFood.show()
    If Response == 0
        If ResourceRepFoodExported.GetValue() > 0
            debug.notification("Can not import food to this city while exporting it!")
            EconomyMenuFood(holdingnum, steward=steward)
        Else
            EconomyMenuFoodImport(holdingnum, steward=steward)
        EndIf
    ElseIf Response == 1
        If ResourceRepFoodImported.GetValue() > 0
            debug.notification("Can not export food from this city while importing it!")
            EconomyMenuFood(holdingnum, steward=steward)
        Else
            EconomyMenuFoodExport(holdingnum, steward=steward)
        EndIf
    ElseIf Response == 2
        EconomyMenuCity(holdingnum, steward=steward)
    EndIf
EndFunction

Function EconomyMenuFoodImport(int holdingnum, int Response = 0, int steward = 0)
    Response = EconReportFoodImport.show()
    If Response < 3
        ImportFood(holdingnum, math.pow(10, Response) as int)
        EconomyMenuFoodImport(holdingnum, steward=steward)
    ElseIf Response == 3
        CancelFoodImports(holdingnum)
        EconomyMenuFoodImport(holdingnum, steward=steward)
    ElseIf Response == 4
        EconomyMenuFood(holdingnum, steward=steward)
    Endif
EndFunction

Function ImportFood(int holdingnum, int amount)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    Holding.SetKeywordData(FoodImported, Holding.GetKeywordData(FoodImported) + amount)
    FoodTotalPlayerPerDay.Mod(-amount)
    FoodToHoldings.Mod(amount)
    ResourceRepFoodImported.Mod(amount)
    int FoodAdd = (Holding.GetKeywordData(FoodProduced) as int) + (Holding.GetKeywordData(FoodImported) as int) - (Holding.GetKeywordData(FoodRequired) as int) - (Holding.GetKeywordData(FoodExported) as int)
    ResourceRepFoodTotal.SetValue(FoodAdd)
    UpdateCurrentInstanceGlobal(ResourceRepFoodTotal)
    UpdateCurrentInstanceGlobal(FoodTotalPlayerPerDay)
    if GovQuest.GetStage() == 14
        GovQuest.SetStage(15)
    endif
EndFunction

Function CancelFoodImports(int holdingnum)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    FoodTotalPlayerPerDay.Mod(Holding.GetKeywordData(FoodImported))
    FoodToHoldings.Mod(-Holding.GetKeywordData(FoodImported))
    ResourceRepFoodImported.Mod(-Holding.GetKeywordData(FoodImported))
    Holding.SetKeywordData(FoodImported, 0)
    int FoodAdd = (Holding.GetKeywordData(FoodProduced) as int) + (Holding.GetKeywordData(FoodImported) as int) - (Holding.GetKeywordData(FoodRequired) as int) - (Holding.GetKeywordData(FoodExported) as int)
    ResourceRepFoodTotal.SetValue(FoodAdd)
    UpdateCurrentInstanceGlobal(ResourceRepFoodTotal)
    UpdateCurrentInstanceGlobal(FoodTotalPlayerPerDay)
EndFunction

Function EconomyMenuFoodExport(int holdingnum, int Response = 0, int steward = 0)
    Response = EconReportFoodExport.show()
    If Response < 3
        ExportFood(holdingnum, math.pow(10, Response) as int)
        EconomyMenuFoodExport(holdingnum, steward=steward)
    ElseIf Response == 3
        CancelFoodExports(holdingnum)
        EconomyMenuFoodExport(holdingnum, steward=steward)
    ElseIf Response == 4
        EconomyMenuFood(holdingnum, steward=steward)
    Endif
EndFunction

Function ExportFood(int holdingnum, int amount)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    Holding.SetKeywordData(FoodExported, Holding.GetKeywordData(FoodExported) + amount)
    FoodTotalPlayerPerDay.Mod(amount)
    FoodFromHoldings.Mod(amount)
    ResourceRepFoodExported.Mod(amount)
    int FoodAdd = (Holding.GetKeywordData(FoodProduced) as int) + (Holding.GetKeywordData(FoodImported) as int) - (Holding.GetKeywordData(FoodRequired) as int) - (Holding.GetKeywordData(FoodExported) as int)
    ResourceRepFoodTotal.SetValue(FoodAdd)
    UpdateCurrentInstanceGlobal(ResourceRepFoodTotal)
    UpdateCurrentInstanceGlobal(FoodTotalPlayerPerDay)
    if GovQuest.GetStage() == 14
        GovQuest.SetStage(15)
    endif
EndFunction

Function CancelFoodExports(int holdingnum)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    FoodTotalPlayerPerDay.Mod(-Holding.GetKeywordData(FoodExported))
    FoodFromHoldings.Mod(-Holding.GetKeywordData(FoodExported))
    ResourceRepFoodExported.Mod(-Holding.GetKeywordData(FoodExported))
    Holding.SetKeywordData(FoodExported, 0)
    int FoodAdd = (Holding.GetKeywordData(FoodProduced) as int) + (Holding.GetKeywordData(FoodImported) as int) - (Holding.GetKeywordData(FoodRequired) as int) - (Holding.GetKeywordData(FoodExported) as int)
    ResourceRepFoodTotal.SetValue(FoodAdd)
    UpdateCurrentInstanceGlobal(ResourceRepFoodTotal)
    UpdateCurrentInstanceGlobal(FoodTotalPlayerPerDay)
EndFunction

Function UpdateCityFoodGlobals(Location Holding)
    ResourceRepFoodImported.SetValue(Holding.GetKeywordData(FoodImported))
    ResourceRepFoodExported.SetValue(Holding.GetKeywordData(FoodExported))
    ResourceRepFoodRequired.SetValue(Holding.GetKeywordData(FoodRequired))
    ResourceRepFoodProduced.SetValue(Holding.GetKeywordData(FoodProduced))
    int FoodAdd = (Holding.GetKeywordData(FoodProduced) as int) + (Holding.GetKeywordData(FoodImported) as int) - (Holding.GetKeywordData(FoodRequired) as int) - (Holding.GetKeywordData(FoodExported) as int)
    ResourceRepFoodTotal.SetValue(FoodAdd)
    int i = 0
    while i < ResourceRepFoodGlobals.GetSize()
        UpdateCurrentInstanceGlobal(ResourceRepFoodGlobals.GetAt(i) as GlobalVariable)
        i += 1
    endwhile
EndFunction

Function EconomyMenuMetal(int holdingnum, int Response = 0, int steward = 0)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    UpdateCityMetalGlobals(Holding)
    Response = EconReportMetal.show()
    If Response == 0
        If ResourceRepMetalExported.GetValue() > 0
            debug.notification("Can not import metal to this city while exporting it!")
            EconomyMenuMetal(holdingnum, steward=steward)
        Else
            EconomyMenuMetalImport(holdingnum, steward=steward)
        EndIf
    ElseIf Response == 1
        If ResourceRepMetalImported.GetValue() > 0
            debug.notification("Can not export metal from this city while importing it!")
            EconomyMenuMetal(holdingnum, steward=steward)
        Else
            EconomyMenuMetalExport(holdingnum, steward=steward)
        EndIf
    ElseIf Response == 2
        EconomyMenuCity(holdingnum, steward=steward)
    EndIf
EndFunction

Function EconomyMenuMetalImport(int holdingnum, int Response = 0, int steward = 0)
    Response = EconReportMetalImport.show()
    If Response < 3
        ImportMetal(holdingnum, math.pow(10, Response) as int)
        EconomyMenuMetalImport(holdingnum, steward=steward)
    ElseIf Response == 3
        CancelMetalImports(holdingnum)
        EconomyMenuMetalImport(holdingnum, steward=steward)
    ElseIf Response == 4
        EconomyMenuMetal(holdingnum, steward=steward)
    Endif
EndFunction

Function ImportMetal(int holdingnum, int amount)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    Holding.SetKeywordData(MetalImported, Holding.GetKeywordData(MetalImported) + amount)
    MetalTotalPlayerPerDay.Mod(-amount)
    MetalToHoldings.Mod(amount)
    ResourceRepMetalImported.Mod(amount)
    int MetalAdd = (Holding.GetKeywordData(MetalProduced) as int) + (Holding.GetKeywordData(MetalImported) as int) - (Holding.GetKeywordData(MetalExported) as int)
    ResourceRepMetalTotal.SetValue(MetalAdd)
    UpdateCurrentInstanceGlobal(ResourceRepMetalTotal)
    UpdateCurrentInstanceGlobal(MetalTotalPlayerPerDay)
EndFunction

Function CancelMetalImports(int holdingnum)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    MetalTotalPlayerPerDay.Mod(Holding.GetKeywordData(MetalImported))
    MetalToHoldings.Mod(-Holding.GetKeywordData(MetalImported))
    ResourceRepMetalImported.Mod(-Holding.GetKeywordData(MetalImported))
    Holding.SetKeywordData(MetalImported, 0)
    int MetalAdd = (Holding.GetKeywordData(MetalProduced) as int) + (Holding.GetKeywordData(MetalImported) as int) - (Holding.GetKeywordData(MetalExported) as int)
    ResourceRepMetalTotal.SetValue(MetalAdd)
    UpdateCurrentInstanceGlobal(ResourceRepMetalTotal)
    UpdateCurrentInstanceGlobal(MetalTotalPlayerPerDay)
EndFunction

Function EconomyMenuMetalExport(int holdingnum, int Response = 0, int steward = 0)
    Response = EconReportMetalExport.show()
    If Response < 3
        ExportMetal(holdingnum, math.pow(10, Response) as int)
        EconomyMenuMetalExport(holdingnum, steward=steward)
    ElseIf Response == 3
        CancelMetalExports(holdingnum)
        EconomyMenuMetalExport(holdingnum, steward=steward)
    ElseIf Response == 4
        EconomyMenuMetal(holdingnum, steward=steward)
    Endif
EndFunction

Function ExportMetal(int holdingnum, int amount)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    Holding.SetKeywordData(MetalExported, Holding.GetKeywordData(MetalExported) + amount)
    MetalTotalPlayerPerDay.Mod(amount)
    MetalFromHoldings.Mod(amount)
    ResourceRepMetalExported.Mod(amount)
    int MetalAdd = (Holding.GetKeywordData(MetalProduced) as int) + (Holding.GetKeywordData(MetalImported) as int) - (Holding.GetKeywordData(MetalExported) as int)
    ResourceRepMetalTotal.SetValue(MetalAdd)
    UpdateCurrentInstanceGlobal(ResourceRepMetalTotal)
    UpdateCurrentInstanceGlobal(MetalTotalPlayerPerDay)
EndFunction

Function CancelMetalExports(int holdingnum)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    MetalTotalPlayerPerDay.Mod(-Holding.GetKeywordData(MetalExported))
    MetalFromHoldings.Mod(-Holding.GetKeywordData(MetalExported))
    ResourceRepMetalExported.Mod(-Holding.GetKeywordData(MetalExported))
    Holding.SetKeywordData(MetalExported, 0)
    int MetalAdd = (Holding.GetKeywordData(MetalProduced) as int) + (Holding.GetKeywordData(MetalImported) as int) - (Holding.GetKeywordData(MetalExported) as int)
    ResourceRepMetalTotal.SetValue(MetalAdd)
    UpdateCurrentInstanceGlobal(ResourceRepMetalTotal)
    UpdateCurrentInstanceGlobal(MetalTotalPlayerPerDay)
EndFunction

Function UpdateCityMetalGlobals(Location Holding)
    ResourceRepMetalImported.SetValue(Holding.GetKeywordData(MetalImported))
    ResourceRepMetalExported.SetValue(Holding.GetKeywordData(MetalExported))
    ResourceRepMetalProduced.SetValue(Holding.GetKeywordData(MetalProduced))
    int MetalAdd = (Holding.GetKeywordData(MetalProduced) as int) + (Holding.GetKeywordData(MetalImported) as int) - (Holding.GetKeywordData(MetalExported) as int)
    ResourceRepMetalTotal.SetValue(MetalAdd)
    int i = 0
    while i < ResourceRepMetalGlobals.GetSize()
        UpdateCurrentInstanceGlobal(ResourceRepMetalGlobals.GetAt(i) as GlobalVariable)
        i += 1
    endwhile
EndFunction

Function EconomyMenuWood(int holdingnum, int Response = 0, int steward = 0)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    UpdateCityWoodGlobals(Holding)
    Response = EconReportWood.show()
    If Response == 0
        If ResourceRepWoodExported.GetValue() > 0
            debug.notification("Can not import wood to this city while exporting it!")
            EconomyMenuWood(holdingnum, steward=steward)
        Else
            EconomyMenuWoodImport(holdingnum, steward=steward)
        EndIf
    ElseIf Response == 1
        If ResourceRepWoodImported.GetValue() > 0
            debug.notification("Can not export wood from this city while importing it!")
            EconomyMenuWood(holdingnum, steward=steward)
        Else
            EconomyMenuWoodExport(holdingnum, steward=steward)
        EndIf
    ElseIf Response == 2
        EconomyMenuCity(holdingnum, steward=steward)
    EndIf
EndFunction

Function EconomyMenuWoodImport(int holdingnum, int Response = 0, int steward = 0)
    Response = EconReportWoodImport.show()
    If Response < 3
        ImportWood(holdingnum, math.pow(10, Response) as int)
        EconomyMenuWoodImport(holdingnum, steward=steward)
    ElseIf Response == 3
        CancelWoodImports(holdingnum)
        EconomyMenuWoodImport(holdingnum, steward=steward)
    ElseIf Response == 4
        EconomyMenuWood(holdingnum, steward=steward)
    Endif
EndFunction

Function ImportWood(int holdingnum, int amount)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    Holding.SetKeywordData(WoodImported, Holding.GetKeywordData(WoodImported) + amount)
    WoodTotalPlayerPerDay.Mod(-amount)
    WoodToHoldings.Mod(amount)
    ResourceRepWoodImported.Mod(amount)
    int WoodAdd = (Holding.GetKeywordData(WoodProduced) as int) + (Holding.GetKeywordData(WoodImported) as int) - (Holding.GetKeywordData(WoodExported) as int)
    ResourceRepWoodTotal.SetValue(WoodAdd)
    UpdateCurrentInstanceGlobal(ResourceRepWoodTotal)
    UpdateCurrentInstanceGlobal(WoodTotalPlayerPerDay)
EndFunction

Function CancelWoodImports(int holdingnum)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    WoodTotalPlayerPerDay.Mod(Holding.GetKeywordData(WoodImported))
    WoodToHoldings.Mod(-Holding.GetKeywordData(WoodImported))
    ResourceRepWoodImported.Mod(-Holding.GetKeywordData(WoodImported))
    Holding.SetKeywordData(WoodImported, 0)
    int WoodAdd = (Holding.GetKeywordData(WoodProduced) as int) + (Holding.GetKeywordData(WoodImported) as int) - (Holding.GetKeywordData(WoodExported) as int)
    ResourceRepWoodTotal.SetValue(WoodAdd)
    UpdateCurrentInstanceGlobal(ResourceRepWoodTotal)
    UpdateCurrentInstanceGlobal(WoodTotalPlayerPerDay)
EndFunction

Function EconomyMenuWoodExport(int holdingnum, int Response = 0, int steward = 0)
    Response = EconReportWoodExport.show()
    If Response < 3
        ExportWood(holdingnum, math.pow(10, Response) as int)
        EconomyMenuWoodExport(holdingnum, steward=steward)
    ElseIf Response == 3
        CancelWoodExports(holdingnum)
        EconomyMenuWoodExport(holdingnum, steward=steward)
    ElseIf Response == 4
        EconomyMenuWood(holdingnum, steward=steward)
    Endif
EndFunction

Function ExportWood(int holdingnum, int amount)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    Holding.SetKeywordData(WoodExported, Holding.GetKeywordData(WoodExported) + amount)
    WoodTotalPlayerPerDay.Mod(amount)
    WoodFromHoldings.Mod(amount)
    ResourceRepWoodExported.Mod(amount)
    int WoodAdd = (Holding.GetKeywordData(WoodProduced) as int) + (Holding.GetKeywordData(WoodImported) as int) - (Holding.GetKeywordData(WoodExported) as int)
    ResourceRepWoodTotal.SetValue(WoodAdd)
    UpdateCurrentInstanceGlobal(ResourceRepWoodTotal)
    UpdateCurrentInstanceGlobal(WoodTotalPlayerPerDay)
EndFunction

Function CancelWoodExports(int holdingnum)
    Location Holding = AllLocations.GetAt(holdingnum) as Location
    WoodTotalPlayerPerDay.Mod(-Holding.GetKeywordData(WoodExported))
    WoodFromHoldings.Mod(-Holding.GetKeywordData(WoodExported))
    ResourceRepWoodExported.Mod(-Holding.GetKeywordData(WoodExported))
    Holding.SetKeywordData(WoodExported, 0)
    int WoodAdd = (Holding.GetKeywordData(WoodProduced) as int) + (Holding.GetKeywordData(WoodImported) as int) - (Holding.GetKeywordData(WoodExported) as int)
    ResourceRepWoodTotal.SetValue(WoodAdd)
    UpdateCurrentInstanceGlobal(ResourceRepWoodTotal)
    UpdateCurrentInstanceGlobal(WoodTotalPlayerPerDay)
EndFunction

Function UpdateCityWoodGlobals(Location Holding)
    ResourceRepWoodImported.SetValue(Holding.GetKeywordData(WoodImported))
    ResourceRepWoodExported.SetValue(Holding.GetKeywordData(WoodExported))
    ResourceRepWoodProduced.SetValue(Holding.GetKeywordData(WoodProduced))
    int WoodAdd = (Holding.GetKeywordData(WoodProduced) as int) + (Holding.GetKeywordData(WoodImported) as int) - (Holding.GetKeywordData(WoodExported) as int)
    ResourceRepWoodTotal.SetValue(WoodAdd)
    int i = 0
    while i < ResourceRepWoodGlobals.GetSize()
        UpdateCurrentInstanceGlobal(ResourceRepWoodGlobals.GetAt(i) as GlobalVariable)
        i += 1
    endwhile
EndFunction

Function AddJobs(Location Holding, int jobnum)
    if jobnum == 0
        Holding.SetKeywordData(JobsOpenFood, Holding.GetKeywordData(JobsOpenFood) + Holding.GetKeywordData(FoodChange))
    elseif jobnum == 1
        Holding.SetKeywordData(JobsOpenWood, Holding.GetKeywordData(JobsOpenWood) + Holding.GetKeywordData(WoodChange))
    elseif jobnum == 2
        Holding.SetKeywordData(JobsOpenMetal, Holding.GetKeywordData(JobsOpenMetal) + Holding.GetKeywordData(MetalChange))
    endif
EndFunction

Function AddToTreasury(int GoldNum)
    CoinTotalPlayer.Mod(GoldNum)
    CoinSound.Play(Game.GetPlayer())
    debug.notification(GoldNum + " Gold has been added to the treasury!")
EndFunction

Function RemoveFromTreasury(int GoldNum)
    CoinTotalPlayer.Mod(-GoldNum)
    CoinSound.Play(Game.GetPlayer())
    debug.notification(GoldNum + " Gold has been removed from the treasury!")
EndFunction

Function ShowLoyaltyMessage(Location Holding, int InitialLoyalty)
    City.ForceLocationTo(Holding)
    int LoyaltyNum = Holding.GetKeywordData(Loyalty) as int
    if LoyaltyNum >= 0 && LoyaltyNum < 20
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[0])
    elseif LoyaltyNum >= 20 && LoyaltyNum < 40
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[1])
    elseif LoyaltyNum >= 40 && LoyaltyNum < 60
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[2])
    elseif LoyaltyNum >= 60 && LoyaltyNum < 80
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[3])
    elseif LoyaltyNum >= 80
        LoyaltyAlias.ForceRefTo(LoyaltyBarrels[4])
    endif
    
    If InitialLoyalty >= 0 && InitialLoyalty < 20
        if LoyaltyNum >= 20
            LoyaltyIncreaseMessage.show()
        endif
    ElseIf InitialLoyalty >= 20 && InitialLoyalty < 40
        if LoyaltyNum >= 40
            LoyaltyIncreaseMessage.show()
        elseif LoyaltyNum < 20
            LoyaltyDecreaseMessage.show()
        endif
    ElseIf InitialLoyalty >= 40 && InitialLoyalty < 60
        if LoyaltyNum >= 60
            LoyaltyIncreaseMessage.show()
        elseif LoyaltyNum < 40
            LoyaltyDecreaseMessage.show()
        endif
    ElseIf InitialLoyalty >= 60 && InitialLoyalty < 80
        if LoyaltyNum >= 80
            LoyaltyIncreaseMessage.show()
        elseif LoyaltyNum < 60
            LoyaltyDecreaseMessage.show()
        endif
    ElseIf InitialLoyalty >= 80 && InitialLoyalty <= 100
        if LoyaltyNum < 80
            LoyaltyDecreaseMessage.show()
        endif
    EndIf
EndFunction

Function AddInitialPlayerFood()
    FoodTotalPlayerProduced.SetValue(0)
    FoodTotalPlayerRequired.SetValue(0)
    int FoodHunted = 0
    int i = 0
    while i < CommanderScript.Commanders.Length
        if CommanderScript.Commanders[i].GetActorRef() != None
            if CommanderScript.Commanders[i].GetActorRef().IsInFaction(ArmyHunterFaction) == 1
                FoodHunted += 3*((TroopManage.TroopCounts.GetAt(i) as GlobalVariable).GetValue() as int)
            endif
        endif
        i += 1
    endwhile
    int TotalTroops = 0 
    i = 0
    while i < 30
        CS_ArmyTroopDeath ArmyScript = (TroopManage.ArmyQuests.GetAt(i) as Quest) as CS_ArmyTroopDeath
        if ArmyScript.IsVampire != true
            TotalTroops += ArmyScript.TroopCount
        endif
        i += 1
    endwhile
    FoodTotalPlayerProduced.Mod(FoodHunted)
    FoodTotalPlayerRequired.Mod(TotalTroops)
    FoodTotalPlayer.Mod(FoodTotalPlayerImported.GetValue() + FoodHunted - TotalTroops - FoodTotalPlayerExported.GetValue())
EndFunction

Function UpdateEconomy()
    if UpdatingEconomy.GetValue() != 1

    UpdatingEconomy.SetValue(1)
    debug.trace("Economy Update Started")
    LoyaltyCheck.PossibleRebellionCities.Revert()
    LoyaltyCheck.PossibleProtestCities.Revert()
    CS_EconomyUpdatedNum.SetValue(0)
    AddInitialPlayerFood()
    InitialFood = 0
    CoinTotalPlayerPerDayHoldings.SetValue(0)
    MetalFromHoldings.SetValue(0)
    WoodFromHoldings.SetValue(0)
    int i = 0
    while i <= 14
        JarlAddFood(i)
        i += 1
    endwhile
    int GettingEconomies = 1
    i = 0
    while i <= 14
        (HoldingUpdater[i] as CS_HoldingEconomyUpdaterScript).HoldingUpdated = false
        (HoldingUpdater[i] as CS_HoldingEconomyUpdaterScript).AllowUpdate = true
        (HoldingUpdater[i] as CS_HoldingEconomyUpdaterScript).RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
    int iterations = 0
    while GettingEconomies == 1 && iterations < 5
        debug.trace("Entered iteration while loop, iteration = " + iterations)
        int HoldingsUpdated = 0
        int index = 0
        while index <= 14
            if (HoldingUpdater[index] as CS_HoldingEconomyUpdaterScript).HoldingUpdated == true
                HoldingsUpdated += 1
            endif
            index += 1
        endwhile
        if HoldingsUpdated >= 14 || CS_EconomyUpdatedNum.GetValue() == 14 || iterations == 4
            debug.trace("All economies updated, entered if statement")
            If GovQuest.GetStage() >= 1 || FactionStarted.GetValue() == 1
                debug.trace("Faction is started, setting updated num to 0")
                i = 0
                while i <= 14
                    debug.trace("Entered Loyalty and intel while loop")
                    (HoldingUpdater[i] as CS_HoldingLoyaltyCheckScript).AllowUpdate = true
                    ;(HoldingUpdater[i] as CS_HoldingIntelUpdaterScript).AllowUpdate = true
                    (HoldingUpdater[i] as CS_HoldingLoyaltyCheckScript).RegisterForSingleUpdate(0.1)
                    i += 1
                endwhile
                debug.trace("Calculating player resources...")
                CalculatePlayerResources()
                debug.trace("registering event manager update")
                EventManager.RegisterForSingleUpdate(0.1)
            EndIf
            GettingEconomies = 0
            CS_EconomyUpdatedNum.SetValue(0)
        else
            debug.trace("All economies not updated, adding 1 to iterations")
            Utility.wait(3)
            iterations += 1
        endif
    endwhile
    UpdatingEconomy.SetValue(0)
    debug.trace("Economy Updated")
    if GovQuest.GetStage() >= 1
        debug.notification("Economy Updated")
    endif
    Utility.Wait(2)
    i = 0
    while i <= 14
        if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
            ShowLoyaltyMessage(AllLocations.GetAt(i) as Location, InitialLoyalties[i])
        endif
        i += 1
    endwhile
    ;LoyaltyCheck.StartRebellion()

    endif
EndFunction

Event OnUpdateGameTime()
    UpdateEconomy()
EndEvent

CS_LoyaltyCheckScript Property LoyaltyCheck Auto
CS_CityEventManagerScript Property EventManager Auto

Keyword Property FarmLevel  Auto  
Keyword Property MineLevel  Auto  
Keyword Property BarracksLevel  Auto  
Keyword Property LumberMillLevel  Auto  
Keyword Property DocksLevel Auto
Keyword Property JobsOpenFood Auto
Keyword Property JobsOpenWood Auto
Keyword Property JobsOpenMetal Auto
Keyword Property JobsOpenDocks Auto
Keyword Property Unemployed Auto
Keyword Property FoodProduced  Auto  
Keyword Property FoodRequired  Auto  
Keyword Property WoodProduced  Auto  
Keyword Property MetalProduced  Auto  
Keyword Property WoodChange  Auto  
Keyword Property FoodChange  Auto  
Keyword Property MetalChange  Auto
Keyword Property DocksChange Auto
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

Location Property Markarth Auto
Location Property Riften Auto
Location Property Solitude Auto
Location Property Whiterun Auto
Location Property Windhelm Auto
Location Property Dawnstar Auto
Location Property Falkreath Auto
Location Property Morthal Auto
Location Property Winterhold Auto

FormList Property AllLocations  Auto  
FormList Property AllHoldings  Auto  

GlobalVariable Property FoodTotalPlayer  Auto  
GlobalVariable Property FoodTotalPlayerPerDay  Auto  
GlobalVariable Property FoodTotalPlayerProduced  Auto  
GlobalVariable Property FoodTotalPlayerImported  Auto  
GlobalVariable Property FoodTotalPlayerExported  Auto  
GlobalVariable Property FoodTotalPlayerRequired  Auto  
GlobalVariable Property WoodTotalPlayer  Auto  
GlobalVariable Property WoodTotalPlayerPerDay  Auto  
GlobalVariable Property WoodTotalPlayerProduced  Auto  
GlobalVariable Property WoodTotalPlayerImported  Auto  
GlobalVariable Property WoodTotalPlayerExported  Auto  
GlobalVariable Property MetalTotalPlayer  Auto  
GlobalVariable Property MetalTotalPlayerPerDay  Auto  
GlobalVariable Property MetalTotalPlayerProduced  Auto  
GlobalVariable Property MetalTotalPlayerImported  Auto  
GlobalVariable Property MetalTotalPlayerExported  Auto  
GlobalVariable Property FoodTotalPlayerHunted  Auto  
GlobalVariable Property CoinTotalPlayer  Auto  
GlobalVariable Property CoinTotalPlayerPerDay  Auto  

Faction Property ArmyHunterFaction  Auto  

ReferenceAlias[] Property Commander  Auto  

GlobalVariable[] Property TroopCount  Auto  

Quest Property GovQuest Auto

FormList[] Property HoldingResidents  Auto  

GlobalVariable Property FoodCostMisc  Auto  

GlobalVariable Property MetalProducedMisc  Auto  

Message Property EconReportStart  Auto  

Message Property EconReportStartMinorCities  Auto  

Message Property EconReportCity  Auto  

FormList Property ResourceGlobals  Auto  

GlobalVariable Property ResourceRepFoodReserve  Auto  
GlobalVariable Property ResourceRepFoodProduced  Auto  
GlobalVariable Property ResourceRepFoodTotal  Auto  
GlobalVariable Property ResourceRepFoodImported  Auto  
GlobalVariable Property ResourceRepFoodExported  Auto  
GlobalVariable Property ResourceRepFoodRequired  Auto  
GlobalVariable Property FoodToHoldings  Auto  
GlobalVariable Property FoodFromHoldings  Auto  

Message Property EconReportFood Auto
Message Property EconReportMetal Auto
Message Property EconReportWood Auto

FormList Property ResourceRepFoodGlobals Auto

GlobalVariable Property ResourceRepTreasury  Auto  

Message Property EconReportStartVillages  Auto  

GlobalVariable Property ResourceRepMetalReserve  Auto  
GlobalVariable Property ResourceRepMetalProduced  Auto  
GlobalVariable Property ResourceRepMetalTotal  Auto  
GlobalVariable Property ResourceRepMetalImported  Auto  
GlobalVariable Property ResourceRepMetalExported  Auto  
GlobalVariable Property MetalToHoldings  Auto  
GlobalVariable Property MetalFromHoldings  Auto  

FormList Property ResourceRepMetalGlobals Auto

GlobalVariable Property ResourceRepWoodReserve  Auto  
GlobalVariable Property ResourceRepWoodProduced  Auto  
GlobalVariable Property ResourceRepWoodTotal  Auto  
GlobalVariable Property ResourceRepWoodImported  Auto  
GlobalVariable Property ResourceRepWoodExported  Auto  
GlobalVariable Property WoodToHoldings  Auto  
GlobalVariable Property WoodFromHoldings  Auto  

FormList Property ResourceRepWoodGlobals Auto

LocationAlias Property City  Auto  

Keyword Property Population  Auto  

GlobalVariable Property PopulationMoving  Auto  

GlobalVariable Property ResourceRepPopulation  Auto  

FormList Property FoodExportGlobals  Auto  

GlobalVariable Property UpdatingEconomy  Auto  

GlobalVariable Property CoinTotalPlayerPerDayHoldings  Auto  
GlobalVariable Property FoodTotalPlayerPerDayHoldings  Auto  
GlobalVariable Property MetalTotalPlayerPerDayHoldings  Auto  
GlobalVariable Property WoodTotalPlayerPerDayHoldings  Auto  

GlobalVariable Property FoodImportAvailable Auto

GlobalVariable Property ReparationsImp Auto
GlobalVariable Property ReparationsSons Auto
GlobalVariable Property ReparationsTimeImp Auto
GlobalVariable Property ReparationsTimeSons Auto
GlobalVariable Property GameDaysPassed Auto

GlobalVariable Property ResourcePoolFoodImp Auto
GlobalVariable Property ResourcePoolMetalImp Auto
GlobalVariable Property ResourcePoolWoodImp Auto
GlobalVariable Property ResourcePoolFoodSons Auto
GlobalVariable Property ResourcePoolMetalSons Auto
GlobalVariable Property ResourcePoolWoodSons Auto

Keyword Property FoodNeed  Auto  
Keyword Property MetalNeed  Auto  
Keyword Property WoodNeed  Auto  

Message Property FoodLow Auto
Message Property MetalLow Auto
Message Property WoodLow Auto

FormList Property FoodImportGlobals  Auto  

Message Property StarvingMessage  Auto  

GlobalVariable Property FoodRequiredHoldings  Auto  

GlobalVariable Property FoodProducedPlayerHoldings  Auto  

Quest Property EconReport Auto

GlobalVariable Property GovCosts  Auto  
GlobalVariable Property FactionStarted Auto
ObjectReference[] Property LoyaltyBarrels  Auto  

ReferenceAlias Property LoyaltyAlias  Auto  

Message Property EconReportFoodImport  Auto  
Message Property EconReportFoodExport  Auto  

Message Property EconReportMetalImport  Auto  
Message Property EconReportMetalExport  Auto  

Message Property EconReportWoodImport  Auto  
Message Property EconReportWoodExport  Auto  

ReferenceAlias Property Jarl Auto

CS_UpgradeMenuFunctions Property UpgradeMenu Auto

Keyword Property JarlEconomy  Auto  

Keyword Property JarlUpgrades  Auto  

int Property InitialFood Auto

Message Property EconReportVillage  Auto  

Faction Property JarlManageFaction  Auto  

ReferenceAlias Property EconomyManaged  Auto  

ObjectReference[] Property EconomyManagedBarrels  Auto  

GlobalVariable Property ResourceRepEconomyManaged Auto
GlobalVariable Property ResourceRepUnemployed Auto

ReferenceAlias Property FactionName  Auto  

ReferenceAlias Property FactionNameGov  Auto  

Keyword Property NoFood Auto

Message Property EconReportCitySteward  Auto  
Message Property EconReportGuards Auto

Message Property LoyaltyIncreaseMessage Auto
Message Property LoyaltyDecreaseMessage Auto

GlobalVariable Property EconReportGuardNum Auto
GlobalVariable Property EconReportGuardNumMax Auto
GlobalVariable Property EconReportGuardNumRemaining Auto
GlobalVariable Property EconReportCrime Auto
GlobalVariable Property EconReportPrisoners Auto

Keyword Property NumGuards Auto
Keyword Property PrisonerNum Auto
Keyword Property Crime Auto

FormList Property AllPrisoners Auto
FormList Property AllGuardFormLists Auto
FormList Property PossibleRebellionCities Auto

CS_TroopManageMenuScript Property TroopManage Auto
CS_PatrolHoldScript Property CommanderScript Auto

Quest[] Property HoldingUpdater Auto
GlobalVariable Property CS_EconomyUpdatedNum  Auto  

Sound Property CoinSound Auto

Keyword Property Harshness  Auto  

Message Property EconReportGuardsVillage  Auto  
Message Property EconReportVillageSteward Auto
Message Property EconReportTaxRate Auto

GlobalVariable Property ResourceRepTaxRate Auto
GlobalVariable Property CoinSponsors Auto

int[] Property InitialLoyalties Auto
Keyword Property RecruitablePercentage  Auto  
