Scriptname CS_EconomyReportNewCityScript extends Quest  conditional

int Property citynum Auto conditional

Message Property CS_EconomyReportNewCityMenuStart Auto
Message Property CS_EconomyReportNewCityMenuResources Auto
Message Property CS_EconomyReportNewCityMenuResourcesCoin Auto
Message Property CS_EconomyReportNewCityMenuResourcesCoinTreasury Auto
Message Property CS_EconomyReportNewCityMenuResourcesCoinTax Auto
Message Property CS_EconomyReportNewCityMenuResourcesCoinTaxAdjust Auto
Message Property CS_EconomyReportNewCityMenuResourcesCoinDeposit Auto
Message Property CS_EconomyReportNewCityMenuResourcesCoinWithdraw Auto
Message Property CS_EconomyReportNewCityMenuResourcesCoinCommoners Auto
Message Property CS_EconomyReportNewCityMenuResourcesCoinNobility Auto
Message Property CS_EconomyReportNewCityMenuResourcesFood Auto
Message Property CS_EconomyReportNewCityMenuResourcesFoodReserves Auto
Message Property CS_EconomyReportNewCityMenuResourcesFoodReservesQuota Auto
Message Property CS_EconomyReportNewCityMenuResourcesFoodReservesQuota2 Auto
Message Property CS_EconomyReportNewCityMenuResourcesFoodFarms Auto
FormList Property CS_EconomyReportNewMessagesBuildingListsFarms Auto
Message Property CS_EconomyReportNewCityMenuResourcesFoodFarmsBuilding Auto
Message Property CS_EconomyReportNewCityMenuResourcesFoodHunting Auto
Message Property CS_EconomyReportNewCityMenuResourcesFoodFishing Auto
Message Property CS_EconomyReportNewCityMenuResourcesWood Auto
Message Property CS_EconomyReportNewCityMenuResourcesWoodReserves Auto
Message Property CS_EconomyReportNewCityMenuResourcesWoodReservesQuota Auto
Message Property CS_EconomyReportNewCityMenuResourcesWoodReservesQuota2 Auto
Message Property CS_EconomyReportNewCityMenuResourcesWoodLumberMills Auto
FormList Property CS_EconomyReportNewMessagesBuildingListsLumberMills Auto
Message Property CS_EconomyReportNewCityMenuResourcesWoodLumberMillsBuilding Auto
Message Property CS_EconomyReportNewCityMenuResourcesMetal Auto
Message Property CS_EconomyReportNewCityMenuResourcesMetalReserves Auto
Message Property CS_EconomyReportNewCityMenuResourcesMetalReservesQuota Auto
Message Property CS_EconomyReportNewCityMenuResourcesMetalReservesQuota2 Auto
Message Property CS_EconomyReportNewCityMenuResourcesMetalMines Auto
Message Property CS_EconomyReportNewCityMenuBuildings Auto
FormList Property CS_EconomyReportNewMessagesBuildingListsMines Auto
Message Property CS_EconomyReportNewCityMenuResourcesMetalMinesBuilding Auto
FormList Property CS_EconomyReportNewMessagesBuildingListsBuildings Auto
Message Property CS_EconomyReportNewCityMenuBuildingsBuilding Auto
Message Property CS_EconomyReportNewCityMenuBuildingsCrafting Auto
Message Property CS_EconomyReportNewCityMenuBuildingsCraftingPriorities Auto
FormList Property CS_EconomyReportNewMessagesBuildingsCraftingPriorities Auto
Message Property CS_EconomyReportNewCityMenuBuildingsCraftingPriorityStarted Auto
Message Property CS_EconomyReportNewCityMenuBuildingsCraftingPriorityUnstarted Auto
Message Property CS_EconomyReportNewCityMenuBuildingsCraftingPriorityUnstartedSearching Auto
FormList Property CS_EconomyReportNewMessagesBuildingsCraftingSupplies Auto
Message Property CS_EconomyReportNewCityMenuBuildingsHouse Auto
Message Property CS_EconomyReportNewCityMenuPopulation Auto
Message Property CS_EconomyReportNewCityMenuPopulationCommoners Auto
Message Property CS_EconomyReportNewCityMenuPopulationNobility Auto

int Property VMTreasury Auto conditional
int Property VMWoodReserves Auto conditional
int Property VMMetalReserves Auto conditional
int Property VMTaxRate Auto conditional

ReferenceAlias Property BuildingOwner Auto
ReferenceAlias Property RecipeMaterial Auto
ReferenceAlias Property CraftingSupplier Auto

LocationAlias Property City Auto
LocationAlias Property FactionLoc Auto

ReferenceAlias[] Property Buildings Auto
ReferenceAlias[] Property Recipes Auto
ReferenceAlias[] Property CraftingCustomers Auto

FormList Property CS_AllLocations Auto
FormList Property CS_AllUpgradeLocations Auto
FormList Property CS_AllHoldings Auto
FormList Property CS_FoodKeywords Auto
FormList Property CS_IngotKeyword Auto

Sound Property CoinSound Auto
Sound Property FoodSound Auto
Sound Property WoodSound Auto
Sound Property MetalSound Auto

GlobalVariable Property CS_UpgradeCoinCost Auto conditional
GlobalVariable Property CS_UpgradeWoodCost Auto conditional
GlobalVariable Property CS_UpgradeMetalCost Auto conditional
GlobalVariable Property GameDaysPassed Auto

ObjectReference Property EmptyMarker Auto
ObjectReference Property NoneObject Auto

MiscObject Property Gold001 Auto

CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto
CS_EconomyHoldUpdaterNewScript Property EconomyCity Auto

Function MenuStart(int Response = 0)
    citynum = ((self as Form) as UILIB_1).ShowTextInput(asTitle="Enter citynum") as int  ;DELETE WHEN DONE
    debug.trace("Economy report Started")
    City.ForceLocationTo(CS_AllUpgradeLocations.GetAt(citynum) as Location)
    EconomyCity = CS_EconomyUpdaterNew.EconomyHoldUpdaters[citynum]
    ;EconomyCity.ImmediateUpdate()
    debug.trace("Economy report processed")
    
    int Population = EconomyCity.Population
    int Stability = EconomyCity.Stability
    float CrimeRate = EconomyCity.CrimeRate*100
    float UnemploymentRate = (EconomyCity.Unemployed as float/Population as float)*100
    int Guards = EconomyCity.Guards
    int Infrastructure = EconomyCity.Infrastructure
    
    Response = CS_EconomyReportNewCityMenuStart.show(Population, Stability, CrimeRate, UnemploymentRate, Guards, Infrastructure)
    if Response == 0
        MenuResources()
    elseif Response == 1
        MenuPopulation()
    elseif Response == 2
        MenuBuildings()
    elseif Response == 5
        EconomyCity.TradeHub.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        MenuStart()
    elseif Response == 6
        (EconomyCity.TradeHub as CS_BuildingTradingHubScript).FoodReservesChest.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        MenuStart()
    endif
    
    Stop()
EndFunction

Function MenuResources(int Response = 0)
    EconomyCity.UpdateAllChangeValues()
    int CoinCirculation = EconomyCity.CoinCirculation
    int Treasury = EconomyCity.CoinReserve
    int FoodCirculation = EconomyCity.FoodCirculation
    int FoodReserve = EconomyCity.FoodReserve
    int WoodCirculation = EconomyCity.WoodCirculation
    int WoodReserve = EconomyCity.WoodReserve
    int MetalCirculation = EconomyCity.MetalCirculation
    int MetalReserve = EconomyCity.MetalReserve
    
    Response = CS_EconomyReportNewCityMenuResources.show(CoinCirculation, Treasury, FoodCirculation, FoodReserve, WoodCirculation, WoodReserve, MetalCirculation, MetalReserve)
    if Response == 0
        MenuResourcesCoin()
    elseif Response == 1
        MenuResourcesFood()
    elseif Response == 2
        MenuResourcesWood()
    elseif Response == 3
        MenuResourcesMetal()
    elseif Response == 4
        MenuStart()
    elseif Response == 5 ;DELETE WHEN DONE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        debug.trace("Destroying Buildings...")
        EconomyCity.InfrastructureFarms = 0
        EconomyCity.InfrastructureFishing = 0
        EconomyCity.InfrastructureHunting = 0
        EconomyCity.InfrastructureLumberMills = 0
        EconomyCity.InfrastructureMines = 0
        EconomyCity.Infrastructure = 0
        EconomyCity.ImmediateUpdate()
        debug.trace("Infrastructure destroyed. Cities finished responding")
        MenuResources()
    endif
EndFunction

Function MenuResourcesCoin(int Response = 0)
    EconomyCity.UpdateTreasuryChange()
    int Treasury = EconomyCity.CoinReserve
    int ChangeCoin = EconomyCity.TreasuryChange
    int CoinCirculation = EconomyCity.CoinCirculation
    int CoinCirculationChange = EconomyCity.WealthCommonersChange + EconomyCity.WealthNobilityChange
    int WealthCommoners = EconomyCity.WealthCommoners
    int WealthCommonersChange = EconomyCity.WealthCommonersChange
    int WealthNobility = EconomyCity.WealthNobility
    int WealthNobilityChange = EconomyCity.WealthNobilityChange
    
    Response = CS_EconomyReportNewCityMenuResourcesCoin.show(Treasury, ChangeCoin, CoinCirculation, CoinCirculationChange, WealthCommoners, WealthCommonersChange, WealthNobility, WealthNobilityChange)
    if Response == 0
        MenuResourcesCoinTreasury()
    elseif Response == 1
        MenuResourcesCoinCommoners()
    elseif Response == 2
        MenuResourcesCoinNobility()
    elseif Response == 3
        MenuResources()
    endif
EndFunction

Function MenuResourcesCoinTreasury(int Response = 0)
    EconomyCity.UpdateTreasuryChange()
    if (CS_AllHoldings.GetAt(citynum) as GlobalVariable).GetValue() == 11
        FactionLoc.ForceLocationTo(CS_EconomyUpdaterNew.CS_TroopsAndMovementsDataImperial)
    elseif (CS_AllHoldings.GetAt(citynum) as GlobalVariable).GetValue() == 12
        FactionLoc.ForceLocationTo(CS_EconomyUpdaterNew.CS_TroopsAndMovementsDataSons)
    endif
    int Treasury = EconomyCity.CoinReserve
    int TreasuryChange = EconomyCity.TreasuryChange
    int CoinTaxes = EconomyCity.CoinTaxes + EconomyCity.CoinTaxesNobility
    int CoinTribute = EconomyCity.CoinTribute
    int FactionAid = EconomyCity.CoinFactionAid
    int CoinGuardSalaries = EconomyCity.GuardWages
    int SubsidiesStipends = EconomyCity.CoinSubsidies + EconomyCity.CoinStipends
    int ResourceBought = EconomyCity.FoodCost*EconomyCity.FoodFarmedBought + EconomyCity.WoodCost*EconomyCity.WoodCutBought + EconomyCity.MetalCost*EconomyCity.MetalMinedBought
    int FactionTribute = EconomyCity.CoinFactionTribute
    
    Response = CS_EconomyReportNewCityMenuResourcesCoinTreasury.show(Treasury, TreasuryChange, CoinTaxes, CoinTribute, FactionAid, 0 - CoinGuardSalaries, 0 - SubsidiesStipends, 0 - ResourceBought, 0 - FactionTribute)
    if Response == 0
        MenuResourcesCoinDeposit()
    elseif Response == 1
        MenuResourcesCoinWithdraw()
    elseif Response == 2
        MenuResourcesCoin()
    endif
EndFunction

Function MenuResourcesCoinDeposit(int Response = 0)
    int CoinReserves = EconomyCity.CoinReserve
    VMTreasury = CoinReserves
    
    Response = CS_EconomyReportNewCityMenuResourcesCoinDeposit.show(CoinReserves)
    if Response < 7
        AddResource("Coin", math.pow(10, Response) as int)
        Game.GetPlayer().RemoveItem(Gold001, math.pow(10, Response) as int)
        MenuResourcesCoinDeposit()
    elseif Response == 7
        MenuResourcesCoinTreasury()
    endif
EndFunction

Function MenuResourcesCoinWithdraw(int Response = 0)
    int CoinReserves = EconomyCity.CoinReserve
    VMTreasury = CoinReserves
    
    Response = CS_EconomyReportNewCityMenuResourcesCoinWithdraw.show(CoinReserves)
    if Response < 7
        SpendResource("Coin", math.pow(10, Response) as int)
        Game.GetPlayer().AddItem(Gold001, math.pow(10, Response) as int)
        MenuResourcesCoinWithdraw()
    elseif Response == 7
        MenuResourcesCoinTreasury()
    endif
EndFunction

Function MenuResourcesCoinCommoners(int Response = 0)
    EconomyCity.UpdateWealthChange()
    int WealthCommoners = EconomyCity.WealthCommoners
    int WorkerWages = EconomyCity.PaidWorkerWages + EconomyCity.PaidGuardWages
    int Stipends = EconomyCity.CoinStipends
    int Taxes = EconomyCity.CoinTaxes
    int TaxRate = 10*City.GetLocation().GetKeywordData(EconomyCity.CS_CityManagementTaxRate) as int
    int Rent = EconomyCity.PaidRentCommoner
    int TotalFoodCost = EconomyCity.InitialFoodCost + EconomyCity.AddFoodCost
    int WealthCommonersChange = EconomyCity.WealthCommonersChange
    
    Response = CS_EconomyReportNewCityMenuResourcesCoinCommoners.show(WealthCommoners, WealthCommonersChange, WorkerWages, Stipends, 0 - Taxes, TaxRate, 0 - Rent, 0 - TotalFoodCost)
    if Response == 0
        MenuResourcesCoin()
    endif
EndFunction

Function MenuResourcesCoinNobility(int Response = 0)
    EconomyCity.UpdateWealthChange()
    int WealthNobility = EconomyCity.WealthNobility
    int WealthNobilityChange = EconomyCity.WealthNobilityChange
    int ResourcesDomestic = EconomyCity.InitialFoodCost + EconomyCity.AddFoodCost + EconomyCity.FoodCost*EconomyCity.FoodFarmedBought + EconomyCity.WoodCost*EconomyCity.WoodCutBought + EconomyCity.MetalCost*EconomyCity.MetalMinedBought
    int ResourcesExported = EconomyCity.GetSum(EconomyCity.CoinImport) + EconomyCity.GetSum(EconomyCity.FactionCoinImport)
    int ResourceSales = ResourcesDomestic + ResourcesExported
    int Rent = EconomyCity.PaidRentCommoner
    int Subsidies = EconomyCity.CoinSubsidies
    int ResourceImports = EconomyCity.GetSum(EconomyCity.CoinExport) + EconomyCity.GetSum(EconomyCity.FactionCoinExport)
    int Taxes = EconomyCity.CoinTaxesNobility + EconomyCity.CoinTribute
    int TaxRate = 10*City.GetLocation().GetKeywordData(EconomyCity.CS_CityManagementTaxRateNobility) as int
    int WorkerWages = EconomyCity.PaidWorkerWages
    
    Response = CS_EconomyReportNewCityMenuResourcesCoinNobility.show(WealthNobility, WealthNobilityChange, ResourceSales, Rent, Subsidies, 0 - ResourceImports, 0 - Taxes, TaxRate, 0 - WorkerWages)
    if Response == 0
        MenuResourcesCoin()
    endif
EndFunction

Function MenuResourcesCoinTax(int Response = 0)
    int Treasury = EconomyCity.CoinReserve
    int TaxRateCommoner = EconomyCity.City.GetKeywordData(EconomyCity.CS_CityManagementTaxRate) as int
    int CoinTaxesCommoner = EconomyCity.CoinTaxes
    int TaxRateNobility = EconomyCity.City.GetKeywordData(EconomyCity.CS_CityManagementTaxRateNobility) as int
    int CoinTaxesNobility = EconomyCity.CoinTaxesNobility
    int CoinTaxes = EconomyCity.CoinTaxes + EconomyCity.CoinTaxesNobility
    
    Response = CS_EconomyReportNewCityMenuResourcesCoinTax.show(Treasury, TaxRateCommoner, CoinTaxesCommoner, TaxRateNobility, CoinTaxesNobility, CoinTaxes)
    if Response == 0
        MenuResourcesCoinTaxAdjust("Commoner")
    elseif Response == 1
        MenuResourcesCoinTaxAdjust("Noble")
    elseif Response == 2
        MenuResourcesCoin()
    endif
EndFunction

Function MenuResourcesCoinTaxAdjust(string NobleOrCommoner, int Response = 0)
    int TaxRate
    if NobleOrCommoner == "Commoner"
        TaxRate = EconomyCity.City.GetKeywordData(EconomyCity.CS_CityManagementTaxRate) as int
    elseif NobleOrCommoner == "Noble"
        TaxRate = EconomyCity.City.GetKeywordData(EconomyCity.CS_CityManagementTaxRateNobility) as int
    endif
    VMTaxRate = TaxRate
    
    Response = CS_EconomyReportNewCityMenuResourcesCoinTaxAdjust.show(TaxRate)
    if Response < 8
        if NobleOrCommoner == "Commoner"
            EconomyCity.City.SetKeywordData(EconomyCity.CS_CityManagementTaxRate, Response*10)
        elseif NobleOrCommoner == "Noble"
            EconomyCity.City.SetKeywordData(EconomyCity.CS_CityManagementTaxRateNobility, Response*10)
        endif
        EconomyCity.ImmediateUpdate()
        MenuResourcesCoinTax()
    elseif Response == 8
        MenuResourcesCoinTax()
    endif
EndFunction

Function MenuResourcesFood(int Response = 0)
    EconomyCity.UpdateResourceChange("Food", false)
    CS_PlayerBuildingsHoldUpdaterScript PlayerBuildings = ((EconomyCity as Quest) as CS_PlayerBuildingsHoldUpdaterScript)
    int FoodCirculation = EconomyCity.FoodCirculation
    int FoodFarmed = EconomyCity.FoodFarmed + EconomyCity.FoodHunted + EconomyCity.FoodFished + PlayerBuildings.FoodChange
    float WorkerEfficiency = 100*EconomyCity.WorkerEfficiency
    int FoodImported = EconomyCity.GetSum(EconomyCity.FoodImport) + EconomyCity.GetSum(EconomyCity.FactionFoodImport)
    int FoodConsumed = EconomyCity.FoodEaten
    int FoodExported = EconomyCity.GetSum(EconomyCity.FoodExport) + EconomyCity.GetSum(EconomyCity.FactionFoodExport)
    int FoodSentToReserves = EconomyCity.FoodFarmedBought + EconomyCity.FoodHuntedBought + EconomyCity.FoodFishedBought + EconomyCity.PlayerFood
    int FoodToTrade = EconomyCity.FoodToTrade
    int ChangeFood = EconomyCity.ChangeFood
    
    Response = CS_EconomyReportNewCityMenuResourcesFood.show(FoodCirculation, FoodFarmed, WorkerEfficiency, FoodImported, 0 - FoodConsumed, 0 - FoodExported, 0 - FoodSentToReserves, 0 - FoodToTrade, ChangeFood)
    
    if Response == 0
        MenuResourcesFoodReserves()
    elseif Response == 1
        MenuResourcesFoodFarms()
    elseif Response == 2
        MenuResourcesFoodHunting()
    elseif Response == 3
        MenuResourcesFoodFishing()
    elseif Response == 4
        MenuResources()
    endif
EndFunction

Function MenuResourcesFoodReserves(int Response = 0)
    int FoodReserve = EconomyCity.FoodReserve
    int FoodAdded = EconomyCity.FoodFarmedBought
    int FoodQuota = EconomyCity.FoodQuota
    int FoodConsumed = EconomyCity.FoodEatenReserves
    Actor EconomyActorFood = EconomyCity.EconomyActorFood
    
    Response = CS_EconomyReportNewCityMenuResourcesFoodReserves.show(FoodReserve, FoodAdded, FoodQuota, 0 - FoodConsumed)
    if Response == 0
        EconomyActorFood.ShowGiftMenu(True, CS_FoodKeywords, true, false)
        MenuResourcesFood()
    elseif Response == 1
        EconomyActorFood.ShowGiftMenu(False, CS_FoodKeywords, true, false)
        MenuResourcesFood()
    elseif Response == 2
        MenuResourcesFoodReservesQuota()
    elseif Response == 3
        MenuResourcesFood()
    endif
EndFunction

Function MenuResourcesFoodReservesQuota(int Response = 0)
    int Treasury = EconomyCity.CoinReserve
    int TreasuryChange = EconomyCity.TreasuryChange
    int FoodCost = EconomyCity.FoodCost
    int FoodAdded = EconomyCity.FoodFarmedBought
    int FoodQuota = EconomyCity.FoodQuota
    
    Response = CS_EconomyReportNewCityMenuResourcesFoodReservesQuota.show(Treasury, TreasuryChange, FoodCost, FoodAdded, FoodQuota)
    if Response < 6
        EconomyCity.FoodQuota = 10*Response
        EconomyCity.ImmediateUpdate()
        MenuResourcesFoodReserves()
    elseif Response == 6
        MenuResourcesFoodReservesQuota2()
    elseif Response == 7
        MenuResourcesFoodReserves()
    endif
EndFunction

Function MenuResourcesFoodReservesQuota2(int Response = 0)
    int Treasury = EconomyCity.CoinReserve
    int TreasuryChange = EconomyCity.TreasuryChange
    int FoodCost = EconomyCity.FoodCost
    int FoodAdded = EconomyCity.FoodFarmedBought
    int FoodQuota = EconomyCity.FoodQuota
    
    Response = CS_EconomyReportNewCityMenuResourcesFoodReservesQuota2.show(Treasury, TreasuryChange, FoodCost, FoodAdded, FoodQuota)
    if Response == 0
        MenuResourcesFoodReservesQuota()
    elseif Response < 6
        EconomyCity.FoodQuota = 50 + 10*Response
        EconomyCity.ImmediateUpdate()
        MenuResourcesFoodReserves()
    elseif Response == 6
        MenuResourcesFoodReserves()
    endif
EndFunction

Function MenuResourcesFoodFarms(int Response = 0)
    Keyword InfrastructureKeyword = EconomyCity.CS_Infrastructure
    FormList ResourceBuildingsFarms = EconomyCity.ResourceBuildingsFarms
    int NumFarms = ResourceBuildingsFarms.GetSize()
    
    int Workers = EconomyCity.WorkersFarms
    int WorkersMax = EconomyCity.WorkersFarmsMax
    int Produced = EconomyCity.FoodFarmed
    if NumFarms == 0
        Response = (CS_EconomyReportNewMessagesBuildingListsFarms.GetAt(0) as Message).show()
    elseif NumFarms == 1
        int Infrastructure1 = (ResourceBuildingsFarms.GetAt(0) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsFarms.GetAt(0) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsFarms.GetAt(1) as Message).show(Infrastructure1, Workers, WorkersMax, Produced)
    elseif NumFarms == 2
        int Infrastructure1 = (ResourceBuildingsFarms.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsFarms.GetAt(1) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsFarms.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsFarms.GetAt(1) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsFarms.GetAt(2) as Message).show(Infrastructure1, Infrastructure2, Workers, WorkersMax, Produced)
    elseif NumFarms == 3
        int Infrastructure1 = (ResourceBuildingsFarms.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsFarms.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsFarms.GetAt(2) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsFarms.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsFarms.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsFarms.GetAt(2) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsFarms.GetAt(3) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Workers, WorkersMax, Produced)
    elseif NumFarms == 4
        int Infrastructure1 = (ResourceBuildingsFarms.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsFarms.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsFarms.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsFarms.GetAt(3) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsFarms.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsFarms.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsFarms.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsFarms.GetAt(3) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsFarms.GetAt(4) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Workers, WorkersMax, Produced)
    elseif NumFarms == 5
        int Infrastructure1 = (ResourceBuildingsFarms.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsFarms.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsFarms.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsFarms.GetAt(3) as CS_BuildingScript).Infrastructure as int
        int Infrastructure5 = (ResourceBuildingsFarms.GetAt(4) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsFarms.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsFarms.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsFarms.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsFarms.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsFarms.GetAt(4) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsFarms.GetAt(5) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5, Workers, WorkersMax, Produced)
    elseif NumFarms == 6
        int Infrastructure1 = (ResourceBuildingsFarms.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsFarms.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsFarms.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsFarms.GetAt(3) as CS_BuildingScript).Infrastructure as int
        int Infrastructure5 = (ResourceBuildingsFarms.GetAt(4) as CS_BuildingScript).Infrastructure as int
        int Infrastructure6 = (ResourceBuildingsFarms.GetAt(5) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsFarms.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsFarms.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsFarms.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsFarms.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsFarms.GetAt(4) as ObjectReference)
        Buildings[5].ForceRefTo(ResourceBuildingsFarms.GetAt(5) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsFarms.GetAt(6) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5, Infrastructure6, Workers, WorkersMax, Produced)
    endif

    if Response < NumFarms
        MenuResourcesFoodFarmsBuilding(BuildingNum=Response)
    elseif Response == NumFarms
        MenuResourcesFood()
    endif
EndFunction

Function MenuResourcesFoodFarmsBuilding(int BuildingNum, int Response = 0)
    ObjectReference Building = EconomyCity.ResourceBuildingsFarms.GetAt(BuildingNum) as ObjectReference
    Buildings[0].ForceRefTo(Building)
    CS_BuildingScript BuildingScript = Building as CS_BuildingScript
    Actor BuildingOwnerRef
    if BuildingScript.Owner
        BuildingOwnerRef = EmptyMarker.PlaceActorAtMe(BuildingScript.Owner)
        BuildingOwner.ForceRefTo(BuildingOwnerRef)
    else
        BuildingOwner.ForceRefTo(NoneObject)
    endif
    
    int Level = BuildingScript.Level as int
    int Infrastructure = BuildingScript.Infrastructure as int
    int Workers = BuildingScript.Workers as int
    int WorkersMax = EconomyCity.WorkerIncreaseNum*Level
    int Produced = BuildingScript.GetOutput()
    
    Response = CS_EconomyReportNewCityMenuResourcesFoodFarmsBuilding.show(Level, Infrastructure, Workers, WorkersMax, Produced)
    if BuildingOwnerRef
        BuildingOwnerRef.delete()
    endif
    if Response == 0
        Building.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        MenuResourcesFoodFarmsBuilding(BuildingNum)
    elseif Response == 2
        MenuResourcesFoodFarms()
    endif
EndFunction

Function MenuResourcesFoodHunting(int Response = 0)
    ObjectReference Building = EconomyCity.ResourceBuildingsHunting.GetAt(0) as ObjectReference
    Buildings[0].ForceRefTo(Building)
    CS_BuildingScript BuildingScript = Building as CS_BuildingScript
    Actor BuildingOwnerRef
    if BuildingScript.Owner
        BuildingOwnerRef = EmptyMarker.PlaceActorAtMe(BuildingScript.Owner)
        BuildingOwner.ForceRefTo(BuildingOwnerRef)
    else
        BuildingOwner.ForceRefTo(NoneObject)
    endif
    
    int Level = BuildingScript.Level as int
    int Infrastructure = BuildingScript.Infrastructure as int
    int Workers = BuildingScript.Workers as int
    int WorkersMax = EconomyCity.WorkerIncreaseNum*Level
    int Produced = BuildingScript.GetOutput()
    
    Response = CS_EconomyReportNewCityMenuBuildingsBuilding.show(Level, Infrastructure, Workers, WorkersMax)
    if BuildingOwnerRef
        BuildingOwnerRef.delete()
    endif
    if Response == 0
        Building.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        MenuResourcesFoodHunting()
    elseif Response == 2
        MenuResourcesFood()
    endif
EndFunction

Function MenuResourcesFoodFishing(int Response = 0)
    ObjectReference Building = EconomyCity.ResourceBuildingsFishing.GetAt(0) as ObjectReference
    Buildings[0].ForceRefTo(Building)
    CS_BuildingScript BuildingScript = Building as CS_BuildingScript
    Actor BuildingOwnerRef
    if BuildingScript.Owner
        BuildingOwnerRef = EmptyMarker.PlaceActorAtMe(BuildingScript.Owner)
        BuildingOwner.ForceRefTo(BuildingOwnerRef)
    else
        BuildingOwner.ForceRefTo(NoneObject)
    endif
    
    int Level = BuildingScript.Level as int
    int Infrastructure = BuildingScript.Infrastructure as int
    int Workers = BuildingScript.Workers as int
    int WorkersMax = EconomyCity.WorkerIncreaseNum*Level
    int Produced = BuildingScript.GetOutput()
    
    Response = CS_EconomyReportNewCityMenuBuildingsBuilding.show(Level, Infrastructure, Workers, WorkersMax)
    if BuildingOwnerRef
        BuildingOwnerRef.delete()
    endif
    if Response == 0
        Building.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        MenuResourcesFoodFishing()
    elseif Response == 2
        MenuResourcesFood()
    endif
EndFunction

Function MenuResourcesWood(int Response = 0)
    EconomyCity.UpdateResourceChange("Wood", false)
    CS_PlayerBuildingsHoldUpdaterScript PlayerBuildings = ((EconomyCity as Quest) as CS_PlayerBuildingsHoldUpdaterScript)
    int WoodCirculation = EconomyCity.WoodCirculation
    int WoodCut = EconomyCity.WoodCut
    float WorkerEfficiency = 100*EconomyCity.WorkerEfficiency
    int WoodImported = EconomyCity.GetSum(EconomyCity.WoodImport) + EconomyCity.GetSum(EconomyCity.FactionWoodImport)
    int WoodConsumed = EconomyCity.WoodMaintenanceCost
    int WoodExported = EconomyCity.GetSum(EconomyCity.WoodExport) + EconomyCity.GetSum(EconomyCity.FactionWoodExport)
    int WoodSentToReserves = EconomyCity.WoodCutBought
    int WoodToTrade = EconomyCity.WoodToTrade
    int ChangeWood = EconomyCity.ChangeWood
    
    Response = CS_EconomyReportNewCityMenuResourcesWood.show(WoodCirculation, WoodCut, WorkerEfficiency, WoodImported, 0 - WoodConsumed, 0 - WoodExported, 0 - WoodSentToReserves, 0 - WoodToTrade, ChangeWood)
    
    if Response == 0
        MenuResourcesWoodReserves()
    elseif Response == 1
        MenuResourcesWoodLumberMills()
    elseif Response == 2
        MenuResources()
    endif
EndFunction

Function MenuResourcesWoodReserves(int Response = 0)
    int WoodReserve = EconomyCity.WoodReserve
    int WoodAdded = EconomyCity.WoodCutBought
    int WoodQuota = EconomyCity.WoodQuota
    Actor EconomyActorWood = EconomyCity.EconomyActorWood
    
    Response = CS_EconomyReportNewCityMenuResourcesWoodReserves.show(WoodReserve, WoodAdded, WoodQuota)
    if Response == 0
        ;EconomyActorWood.ShowGiftMenu(True, CS_WoodKeywords, true, false)
        MenuResourcesWood()
    elseif Response == 1
        ;EconomyActorWood.ShowGiftMenu(False, CS_WoodKeywords, true, false)
        MenuResourcesWood()
    elseif Response == 2
        MenuResourcesWoodReservesQuota()
    elseif Response == 3
        MenuResourcesWood()
    endif
EndFunction

Function MenuResourcesWoodReservesQuota(int Response = 0)
    int Treasury = EconomyCity.CoinReserve
    int TreasuryChange = EconomyCity.TreasuryChange
    int WoodCost = EconomyCity.WoodCost
    int WoodAdded = EconomyCity.WoodCutBought
    int WoodQuota = EconomyCity.WoodQuota
    
    Response = CS_EconomyReportNewCityMenuResourcesWoodReservesQuota.show(Treasury, TreasuryChange, WoodCost, WoodAdded, WoodQuota)
    if Response < 6
        EconomyCity.WoodQuota = 10*Response
        EconomyCity.ImmediateUpdate()
        MenuResourcesWoodReserves()
    elseif Response == 6
        MenuResourcesWoodReservesQuota2()
    elseif Response == 7
        MenuResourcesWoodReserves()
    endif
EndFunction

Function MenuResourcesWoodReservesQuota2(int Response = 0)
    int Treasury = EconomyCity.CoinReserve
    int TreasuryChange = EconomyCity.TreasuryChange
    int WoodCost = EconomyCity.WoodCost
    int WoodAdded = EconomyCity.WoodCutBought
    int WoodQuota = EconomyCity.WoodQuota
    
    Response = CS_EconomyReportNewCityMenuResourcesWoodReservesQuota2.show(Treasury, TreasuryChange, WoodCost, WoodAdded, WoodQuota)
    if Response == 0
        MenuResourcesWoodReservesQuota()
    elseif Response < 6
        EconomyCity.WoodQuota = 50 + 10*Response
        EconomyCity.ImmediateUpdate()
        MenuResourcesWoodReserves()
    elseif Response == 6
        MenuResourcesWoodReserves()
    endif
EndFunction

Function MenuResourcesWoodLumberMills(int Response = 0)
    Keyword InfrastructureKeyword = EconomyCity.CS_Infrastructure
    FormList ResourceBuildingsLumberMills = EconomyCity.ResourceBuildingsLumberMills
    int NumLumberMills = ResourceBuildingsLumberMills.GetSize()
    
    int Workers = EconomyCity.WorkersLumberMills
    int WorkersMax = EconomyCity.WorkersLumberMillsMax
    int Produced = EconomyCity.WoodCut
    if NumLumberMills == 0
        Response = (CS_EconomyReportNewMessagesBuildingListsLumberMills.GetAt(0) as Message).show()
    elseif NumLumberMills == 1
        int Infrastructure1 = (ResourceBuildingsLumberMills.GetAt(0) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsLumberMills.GetAt(0) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsLumberMills.GetAt(1) as Message).show(Infrastructure1, Workers, WorkersMax, Produced)
    elseif NumLumberMills == 2
        int Infrastructure1 = (ResourceBuildingsLumberMills.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsLumberMills.GetAt(1) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsLumberMills.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsLumberMills.GetAt(1) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsLumberMills.GetAt(2) as Message).show(Infrastructure1, Infrastructure2, Workers, WorkersMax, Produced)
    elseif NumLumberMills == 3
        int Infrastructure1 = (ResourceBuildingsLumberMills.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsLumberMills.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsLumberMills.GetAt(2) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsLumberMills.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsLumberMills.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsLumberMills.GetAt(2) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsLumberMills.GetAt(3) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Workers, WorkersMax, Produced)
    elseif NumLumberMills == 4
        int Infrastructure1 = (ResourceBuildingsLumberMills.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsLumberMills.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsLumberMills.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsLumberMills.GetAt(3) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsLumberMills.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsLumberMills.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsLumberMills.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsLumberMills.GetAt(3) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsLumberMills.GetAt(4) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Workers, WorkersMax, Produced)
    elseif NumLumberMills == 5
        int Infrastructure1 = (ResourceBuildingsLumberMills.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsLumberMills.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsLumberMills.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsLumberMills.GetAt(3) as CS_BuildingScript).Infrastructure as int
        int Infrastructure5 = (ResourceBuildingsLumberMills.GetAt(4) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsLumberMills.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsLumberMills.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsLumberMills.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsLumberMills.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsLumberMills.GetAt(4) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsLumberMills.GetAt(5) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5, Workers, WorkersMax, Produced)
    elseif NumLumberMills == 6
        int Infrastructure1 = (ResourceBuildingsLumberMills.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsLumberMills.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsLumberMills.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsLumberMills.GetAt(3) as CS_BuildingScript).Infrastructure as int
        int Infrastructure5 = (ResourceBuildingsLumberMills.GetAt(4) as CS_BuildingScript).Infrastructure as int
        int Infrastructure6 = (ResourceBuildingsLumberMills.GetAt(5) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsLumberMills.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsLumberMills.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsLumberMills.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsLumberMills.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsLumberMills.GetAt(4) as ObjectReference)
        Buildings[5].ForceRefTo(ResourceBuildingsLumberMills.GetAt(5) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsLumberMills.GetAt(6) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5, Infrastructure6, Workers, WorkersMax, Produced)
    endif

    if Response < NumLumberMills
        MenuResourcesWoodLumberMillsBuilding(BuildingNum=Response)
    elseif Response == NumLumberMills
        MenuResourcesWood()
    endif
EndFunction

Function MenuResourcesWoodLumberMillsBuilding(int BuildingNum, int Response = 0)
    ObjectReference Building = EconomyCity.ResourceBuildingsLumberMills.GetAt(BuildingNum) as ObjectReference
    Buildings[0].ForceRefTo(Building)
    CS_BuildingScript BuildingScript = Building as CS_BuildingScript
    Actor BuildingOwnerRef
    if BuildingScript.Owner
        BuildingOwnerRef = EmptyMarker.PlaceActorAtMe(BuildingScript.Owner)
        BuildingOwner.ForceRefTo(BuildingOwnerRef)
    else
        BuildingOwner.ForceRefTo(NoneObject)
    endif
    
    int Level = BuildingScript.Level as int
    int Infrastructure = BuildingScript.Infrastructure as int
    int Workers = BuildingScript.Workers as int
    int WorkersMax = EconomyCity.WorkerIncreaseNum*Level
    int Produced = BuildingScript.GetOutput()
    
    Response = CS_EconomyReportNewCityMenuResourcesWoodLumberMillsBuilding.show(Level, Infrastructure, Workers, WorkersMax, Produced)
    if BuildingOwnerRef
        BuildingOwnerRef.delete()
    endif
    if Response == 0
        Building.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        MenuResourcesWoodLumberMillsBuilding(BuildingNum)
    elseif Response == 2
        MenuResourcesWoodLumberMills()
    endif
EndFunction

Function MenuResourcesMetal(int Response = 0)
    EconomyCity.UpdateResourceChange("Metal", false)
    CS_PlayerBuildingsHoldUpdaterScript PlayerBuildings = ((EconomyCity as Quest) as CS_PlayerBuildingsHoldUpdaterScript)
    int MetalCirculation = EconomyCity.MetalCirculation
    int MetalMined = EconomyCity.MetalMined
    float WorkerEfficiency = 100*EconomyCity.WorkerEfficiency
    int MetalImported = EconomyCity.GetSum(EconomyCity.MetalImport) + EconomyCity.GetSum(EconomyCity.FactionMetalImport)
    int MetalConsumed = EconomyCity.MetalMaintenanceCost
    int MetalExported = EconomyCity.GetSum(EconomyCity.MetalExport) + EconomyCity.GetSum(EconomyCity.FactionMetalExport)
    int MetalSentToReserves = EconomyCity.MetalMinedBought
    int MetalToTrade = EconomyCity.MetalToTrade
    int ChangeMetal = EconomyCity.ChangeMetal
    
    Response = CS_EconomyReportNewCityMenuResourcesMetal.show(MetalCirculation, MetalMined, WorkerEfficiency, MetalImported, 0 - MetalConsumed, 0 - MetalExported, 0 - MetalSentToReserves, 0 - MetalToTrade, ChangeMetal)
    
    if Response == 0
        MenuResourcesMetalReserves()
    elseif Response == 1
        MenuResourcesMetalMines()
    elseif Response == 2
        MenuResources()
    endif
EndFunction

Function MenuResourcesMetalReserves(int Response = 0)
    int MetalReserve = EconomyCity.MetalReserve
    int MetalAdded = EconomyCity.MetalMinedBought
    int MetalQuota = EconomyCity.MetalQuota
    Actor EconomyActorMetal = EconomyCity.EconomyActorMetal
    
    Response = CS_EconomyReportNewCityMenuResourcesMetalReserves.show(MetalReserve, MetalAdded, MetalQuota)
    if Response == 0
        EconomyActorMetal.ShowGiftMenu(True, CS_IngotKeyword, true, false)
        MenuResourcesMetal()
    elseif Response == 1
        EconomyActorMetal.ShowGiftMenu(False, CS_IngotKeyword, true, false)
        MenuResourcesMetal()
    elseif Response == 2
        MenuResourcesMetalReservesQuota()
    elseif Response == 3
        MenuResourcesMetal()
    endif
EndFunction

Function MenuResourcesMetalReservesQuota(int Response = 0)
    int Treasury = EconomyCity.CoinReserve
    int TreasuryChange = EconomyCity.TreasuryChange
    int MetalCost = EconomyCity.MetalCost
    int MetalAdded = EconomyCity.MetalMinedBought
    int MetalQuota = EconomyCity.MetalQuota
    
    Response = CS_EconomyReportNewCityMenuResourcesMetalReservesQuota.show(Treasury, TreasuryChange, MetalCost, MetalAdded, MetalQuota)
    if Response < 6
        EconomyCity.MetalQuota = 10*Response
        EconomyCity.ImmediateUpdate()
        MenuResourcesMetalReserves()
    elseif Response == 6
        MenuResourcesMetalReservesQuota2()
    elseif Response == 7
        MenuResourcesMetalReserves()
    endif
EndFunction

Function MenuResourcesMetalReservesQuota2(int Response = 0)
    int Treasury = EconomyCity.CoinReserve
    int TreasuryChange = EconomyCity.TreasuryChange
    int MetalCost = EconomyCity.MetalCost
    int MetalAdded = EconomyCity.MetalMinedBought
    int MetalQuota = EconomyCity.MetalQuota
    
    Response = CS_EconomyReportNewCityMenuResourcesMetalReservesQuota2.show(Treasury, TreasuryChange, MetalCost, MetalAdded, MetalQuota)
    if Response == 0
        MenuResourcesMetalReservesQuota()
    elseif Response < 6
        EconomyCity.MetalQuota = 50 + 10*Response
        EconomyCity.ImmediateUpdate()
        MenuResourcesMetalReserves()
    elseif Response == 6
        MenuResourcesMetalReserves()
    endif
EndFunction

Function MenuResourcesMetalMines(int Response = 0)
    Keyword InfrastructureKeyword = EconomyCity.CS_Infrastructure
    FormList ResourceBuildingsMines = EconomyCity.ResourceBuildingsMines
    int NumMines = ResourceBuildingsMines.GetSize()
    
    int Workers = EconomyCity.WorkersMines
    int WorkersMax = EconomyCity.WorkersMinesMax
    int Produced = EconomyCity.MetalMined
    if NumMines == 0
        Response = (CS_EconomyReportNewMessagesBuildingListsMines.GetAt(0) as Message).show()
    elseif NumMines == 1
        int Infrastructure1 = (ResourceBuildingsMines.GetAt(0) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsMines.GetAt(0) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsMines.GetAt(1) as Message).show(Infrastructure1, Workers, WorkersMax, Produced)
    elseif NumMines == 2
        int Infrastructure1 = (ResourceBuildingsMines.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsMines.GetAt(1) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsMines.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsMines.GetAt(1) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsMines.GetAt(2) as Message).show(Infrastructure1, Infrastructure2, Workers, WorkersMax, Produced)
    elseif NumMines == 3
        int Infrastructure1 = (ResourceBuildingsMines.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsMines.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsMines.GetAt(2) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsMines.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsMines.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsMines.GetAt(2) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsMines.GetAt(3) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Workers, WorkersMax, Produced)
    elseif NumMines == 4
        int Infrastructure1 = (ResourceBuildingsMines.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsMines.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsMines.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsMines.GetAt(3) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsMines.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsMines.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsMines.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsMines.GetAt(3) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsMines.GetAt(4) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Workers, WorkersMax, Produced)
    elseif NumMines == 5
        int Infrastructure1 = (ResourceBuildingsMines.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsMines.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsMines.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsMines.GetAt(3) as CS_BuildingScript).Infrastructure as int
        int Infrastructure5 = (ResourceBuildingsMines.GetAt(4) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsMines.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsMines.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsMines.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsMines.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsMines.GetAt(4) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsMines.GetAt(5) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5, Workers, WorkersMax, Produced)
    elseif NumMines == 6
        int Infrastructure1 = (ResourceBuildingsMines.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsMines.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsMines.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsMines.GetAt(3) as CS_BuildingScript).Infrastructure as int
        int Infrastructure5 = (ResourceBuildingsMines.GetAt(4) as CS_BuildingScript).Infrastructure as int
        int Infrastructure6 = (ResourceBuildingsMines.GetAt(5) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsMines.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsMines.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsMines.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsMines.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsMines.GetAt(4) as ObjectReference)
        Buildings[5].ForceRefTo(ResourceBuildingsMines.GetAt(5) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsMines.GetAt(6) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5, Infrastructure6, Workers, WorkersMax, Produced)
    endif

    if Response < NumMines
        MenuResourcesMetalMinesBuilding(BuildingNum=Response)
    elseif Response == NumMines
        MenuResourcesMetal()
    endif
EndFunction

Function MenuResourcesMetalMinesBuilding(int BuildingNum, int Response = 0)
    ObjectReference Building = EconomyCity.ResourceBuildingsMines.GetAt(BuildingNum) as ObjectReference
    Buildings[0].ForceRefTo(Building)
    CS_BuildingScript BuildingScript = Building as CS_BuildingScript
    Actor BuildingOwnerRef
    if BuildingScript.Owner
        BuildingOwnerRef = EmptyMarker.PlaceActorAtMe(BuildingScript.Owner)
        BuildingOwner.ForceRefTo(BuildingOwnerRef)
    else
        BuildingOwner.ForceRefTo(NoneObject)
    endif
    
    int Level = BuildingScript.Level as int
    int Infrastructure = BuildingScript.Infrastructure as int
    int Workers = BuildingScript.Workers as int
    int WorkersMax = EconomyCity.WorkerIncreaseNum*Level
    int Produced = BuildingScript.GetOutput()
    
    Response = CS_EconomyReportNewCityMenuResourcesMetalMinesBuilding.show(Level, Infrastructure, Workers, WorkersMax, Produced)
    if BuildingOwnerRef
        BuildingOwnerRef.delete()
    endif
    if Response == 0
        Building.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        MenuResourcesMetalMinesBuilding(BuildingNum)
    elseif Response == 2
        MenuResourcesMetalMines()
    endif
EndFunction

Function MenuPopulation(int Response = 0)
    int PopulationCommoner = EconomyCity.PopulationCommoner
    int PopulationNobility = EconomyCity.PopulationNobility
    int Population = EconomyCity.Population
    
    Response = CS_EconomyReportNewCityMenuPopulation.show(PopulationCommoner, PopulationNobility, Population)
    if Response == 0
        MenuPopulationCommoners()
    elseif Response == 1
        MenuPopulationNobility()
    elseif Response == 2
        MenuStart()
    endif
EndFunction

Function MenuPopulationCommoners(int Response = 0)
    int Population = EconomyCity.PopulationCommoner
    int Influence = ((EconomyCity as Quest) as CS_InfluenceHoldUpdaterScript).JarlInfluenceCommoner
    int Wealth = EconomyCity.WealthCommoners
    int WealthChange = EconomyCity.WealthCommonersChange
    
    Response = CS_EconomyReportNewCityMenuPopulationCommoners.show(Population, Influence, Wealth, WealthChange)
    if Response == 0
        MenuPopulation()
    endif
EndFunction

Function MenuPopulationNobility(int Response = 0)
    int Population = EconomyCity.PopulationNobility
    int Influence = ((EconomyCity as Quest) as CS_InfluenceHoldUpdaterScript).JarlInfluenceNobility
    int Wealth = EconomyCity.WealthNobility
    int WealthChange = EconomyCity.WealthNobilityChange
    
    Response = CS_EconomyReportNewCityMenuPopulationNobility.show(Population, Influence, Wealth, WealthChange)
    if Response == 0
        MenuPopulation()
    endif
EndFunction

Function MenuBuildings(int Response = 0)
    int numfarms = EconomyCity.ResourceBuildingsFarms.GetSize()
    int numfishing = EconomyCity.ResourceBuildingsFishing.GetSize()
    int numhunting = EconomyCity.ResourceBuildingsHunting.GetSize()
    int nummills = EconomyCity.ResourceBuildingsLumberMills.GetSize()
    int nummines = EconomyCity.ResourceBuildingsMines.GetSize()
    int numsmiths = EconomyCity.ResourceBuildingsBlacksmiths.GetSize()
    int numinns = 0
    int numshops = EconomyCity.ResourceBuildingsShops.GetSize()
    
    Response = CS_EconomyReportNewCityMenuBuildings.show(numfarms, numfishing, numhunting, nummills, nummines, numsmiths, numinns, numshops)
    if Response == 0
        MenuBuildingsList(EconomyCity.ResourceBuildingsFarms)
    elseif Response == 1
        MenuBuildingsList(EconomyCity.ResourceBuildingsFishing)
    elseif Response == 2
        MenuBuildingsList(EconomyCity.ResourceBuildingsHunting)
    elseif Response == 3
        MenuBuildingsList(EconomyCity.ResourceBuildingsLumberMills)
    elseif Response == 4
        MenuBuildingsList(EconomyCity.ResourceBuildingsMines)
    elseif Response == 5
        MenuBuildingsCraftingList(EconomyCity.ResourceBuildingsBlacksmiths)
    elseif Response == 6
        MenuBuildingsHousesList(EconomyCity.ResourceBuildingsHouses)
    elseif Response == 7
        MenuBuildingsSellingList(EconomyCity.ResourceBuildingsShops)
    elseif Response == 8
        MenuStart()
    endif
EndFunction

Function MenuBuildingsList(FormList BuildingList, int Response = 0)
    Keyword InfrastructureKeyword = EconomyCity.CS_Infrastructure
    FormList ResourceBuildingsShops = BuildingList
    int NumShops = ResourceBuildingsShops.GetSize()
    
    if NumShops == 0
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(0) as Message).show()
    elseif NumShops == 1
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(1) as Message).show(Infrastructure1)
    elseif NumShops == 2
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(2) as Message).show(Infrastructure1, Infrastructure2)
    elseif NumShops == 3
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(3) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3)
    elseif NumShops == 4
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsShops.GetAt(3) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsShops.GetAt(3) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(4) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4)
    elseif NumShops == 5
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsShops.GetAt(3) as CS_BuildingScript).Infrastructure as int
        int Infrastructure5 = (ResourceBuildingsShops.GetAt(4) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsShops.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsShops.GetAt(4) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(5) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5)
    elseif NumShops == 6
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsShops.GetAt(3) as CS_BuildingScript).Infrastructure as int
        int Infrastructure5 = (ResourceBuildingsShops.GetAt(4) as CS_BuildingScript).Infrastructure as int
        int Infrastructure6 = (ResourceBuildingsShops.GetAt(5) as CS_BuildingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsShops.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsShops.GetAt(4) as ObjectReference)
        Buildings[5].ForceRefTo(ResourceBuildingsShops.GetAt(5) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(6) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5, Infrastructure6)
    endif

    if Response < NumShops
        MenuBuildingsListBuilding(BuildingList, BuildingNum=Response)
    elseif Response == NumShops
        MenuBuildings()
    endif
EndFunction

Function MenuBuildingsListBuilding(FormList BuildingList, int BuildingNum, int Response = 0)
    ObjectReference Building = BuildingList.GetAt(BuildingNum) as ObjectReference
    Buildings[0].ForceRefTo(Building)
    CS_BuildingScript BuildingScript = Building as CS_BuildingScript
    Actor BuildingOwnerRef
    if BuildingScript.Owner
        BuildingOwnerRef = EmptyMarker.PlaceActorAtMe(BuildingScript.Owner)
        BuildingOwner.ForceRefTo(BuildingOwnerRef)
    else
        BuildingOwner.ForceRefTo(NoneObject)
    endif
    
    int Level = BuildingScript.Level as int
    int Infrastructure = BuildingScript.Infrastructure as int
    int Workers = BuildingScript.Workers as int
    
    Response = CS_EconomyReportNewCityMenuBuildingsBuilding.show(Level, Infrastructure, Workers, Level)
    if BuildingOwnerRef
        BuildingOwnerRef.delete()
    endif
    if Response == 0
        Building.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        MenuBuildingsListBuilding(BuildingList, BuildingNum)
    elseif Response == 2
        MenuBuildingsList(BuildingList)
    endif
EndFunction

Function MenuBuildingsCraftingList(FormList BuildingList, int Response = 0)
    Keyword InfrastructureKeyword = EconomyCity.CS_Infrastructure
    FormList ResourceBuildingsShops = BuildingList
    int NumShops = ResourceBuildingsShops.GetSize()
    
    if NumShops == 0
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(0) as Message).show()
    elseif NumShops == 1
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingCraftingScript).VariableInfrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(1) as Message).show(Infrastructure1)
    elseif NumShops == 2
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingCraftingScript).VariableInfrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(2) as Message).show(Infrastructure1, Infrastructure2)
    elseif NumShops == 3
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingCraftingScript).VariableInfrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(3) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3)
    elseif NumShops == 4
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure4 = (ResourceBuildingsShops.GetAt(3) as CS_BuildingCraftingScript).VariableInfrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsShops.GetAt(3) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(4) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4)
    elseif NumShops == 5
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure4 = (ResourceBuildingsShops.GetAt(3) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure5 = (ResourceBuildingsShops.GetAt(4) as CS_BuildingCraftingScript).VariableInfrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsShops.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsShops.GetAt(4) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(5) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5)
    elseif NumShops == 6
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure4 = (ResourceBuildingsShops.GetAt(3) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure5 = (ResourceBuildingsShops.GetAt(4) as CS_BuildingCraftingScript).VariableInfrastructure as int
        int Infrastructure6 = (ResourceBuildingsShops.GetAt(5) as CS_BuildingCraftingScript).VariableInfrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsShops.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsShops.GetAt(4) as ObjectReference)
        Buildings[5].ForceRefTo(ResourceBuildingsShops.GetAt(5) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(6) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5, Infrastructure6)
    endif

    if Response < NumShops
        MenuBuildingsCraftingListBuilding(BuildingList, BuildingNum=Response)
    elseif Response == NumShops
        MenuBuildings()
    endif
EndFunction

Function MenuBuildingsCraftingListBuilding(FormList BuildingList, int BuildingNum, int Response = 0)
    ObjectReference Building = BuildingList.GetAt(BuildingNum) as ObjectReference
    Buildings[0].ForceRefTo(Building)
    CS_BuildingCraftingScript BuildingScript = Building as CS_BuildingCraftingScript
    Actor BuildingOwnerRef
    if BuildingScript.Owner
        BuildingOwnerRef = EmptyMarker.PlaceActorAtMe(BuildingScript.Owner)
        BuildingOwner.ForceRefTo(BuildingOwnerRef)
    else
        BuildingOwner.ForceRefTo(NoneObject)
    endif
    
    int Level = BuildingScript.VariableLevel as int
    int Infrastructure = BuildingScript.VariableInfrastructure as int
    int Workers = BuildingScript.VariableWorkers as int
    int RemainingOutput = BuildingScript.VariableRemainingOutput as int
    
    Response = CS_EconomyReportNewCityMenuBuildingsCrafting.show(Level, Infrastructure, Workers, Level, RemainingOutput)
    if BuildingOwnerRef
        BuildingOwnerRef.delete()
    endif
    if Response == 0
        Building.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        MenuBuildingsCraftingListBuilding(BuildingList, BuildingNum)
    elseif Response == 1
        MenuBuildingsCraftingListSupplies(BuildingList, BuildingNum)
    elseif Response == 2
        MenuBuildingsCraftingListPriorities(BuildingList, BuildingNum)
    elseif Response == 3
        BuildingScript.UpgradeBuilding()
        MenuBuildingsCraftingListBuilding(BuildingList, BuildingNum)
    elseif Response == 4
        MenuBuildingsCraftingList(BuildingList)
    endif
EndFunction

Function MenuBuildingsCraftingListSupplies(FormList BuildingList, int BuildingNum, int Response = 0)
    ObjectReference Building = BuildingList.GetAt(BuildingNum) as ObjectReference
    CS_BuildingScriptImportThreadManager BuildingScript = Building as CS_BuildingScriptImportThreadManager
    int[] ImportAmounts = new int[10]
    int[] ThreadNums = new int[10]
    
    int importnum = 0
    
    if BuildingScript.Thread01.ImportItem && BuildingScript.Thread01.ImportLocation
        ObjectReference ImportItem = EmptyMarker.PlaceAtMe(BuildingScript.Thread01.ImportItem)
        ThreadNums[importnum] = 1
        Recipes[importnum].ForceRefTo(ImportItem)
        ImportAmounts[importnum] = BuildingScript.Thread01.ImportAmount
        CraftingCustomers[importnum].ForceRefTo(BuildingScript.Thread01.ImportLocation)
        importnum += 1
    endif
    
    if BuildingScript.Thread02.ImportItem && BuildingScript.Thread02.ImportLocation
        ObjectReference ImportItem = EmptyMarker.PlaceAtMe(BuildingScript.Thread02.ImportItem)
        ThreadNums[importnum] = 1
        Recipes[importnum].ForceRefTo(ImportItem)
        ImportAmounts[importnum] = BuildingScript.Thread02.ImportAmount
        CraftingCustomers[importnum].ForceRefTo(BuildingScript.Thread02.ImportLocation)
        importnum += 1
    endif
    
    if BuildingScript.Thread03.ImportItem && BuildingScript.Thread03.ImportLocation
        ObjectReference ImportItem = EmptyMarker.PlaceAtMe(BuildingScript.Thread03.ImportItem)
        ThreadNums[importnum] = 1
        Recipes[importnum].ForceRefTo(ImportItem)
        ImportAmounts[importnum] = BuildingScript.Thread03.ImportAmount
        CraftingCustomers[importnum].ForceRefTo(BuildingScript.Thread03.ImportLocation)
        importnum += 1
    endif
    
    if BuildingScript.Thread04.ImportItem && BuildingScript.Thread04.ImportLocation
        ObjectReference ImportItem = EmptyMarker.PlaceAtMe(BuildingScript.Thread04.ImportItem)
        ThreadNums[importnum] = 1
        Recipes[importnum].ForceRefTo(ImportItem)
        ImportAmounts[importnum] = BuildingScript.Thread04.ImportAmount
        CraftingCustomers[importnum].ForceRefTo(BuildingScript.Thread04.ImportLocation)
        importnum += 1
    endif
    
    if BuildingScript.Thread05.ImportItem && BuildingScript.Thread05.ImportLocation
        ObjectReference ImportItem = EmptyMarker.PlaceAtMe(BuildingScript.Thread05.ImportItem)
        ThreadNums[importnum] = 1
        Recipes[importnum].ForceRefTo(ImportItem)
        ImportAmounts[importnum] = BuildingScript.Thread05.ImportAmount
        CraftingCustomers[importnum].ForceRefTo(BuildingScript.Thread05.ImportLocation)
        importnum += 1
    endif
    
    if BuildingScript.Thread06.ImportItem && BuildingScript.Thread06.ImportLocation
        ObjectReference ImportItem = EmptyMarker.PlaceAtMe(BuildingScript.Thread06.ImportItem)
        ThreadNums[importnum] = 1
        Recipes[importnum].ForceRefTo(ImportItem)
        ImportAmounts[importnum] = BuildingScript.Thread06.ImportAmount
        CraftingCustomers[importnum].ForceRefTo(BuildingScript.Thread06.ImportLocation)
        importnum += 1
    endif
    
    if BuildingScript.Thread07.ImportItem && BuildingScript.Thread07.ImportLocation
        ObjectReference ImportItem = EmptyMarker.PlaceAtMe(BuildingScript.Thread07.ImportItem)
        ThreadNums[importnum] = 1
        Recipes[importnum].ForceRefTo(ImportItem)
        ImportAmounts[importnum] = BuildingScript.Thread07.ImportAmount
        CraftingCustomers[importnum].ForceRefTo(BuildingScript.Thread07.ImportLocation)
        importnum += 1
    endif
    
    if BuildingScript.Thread08.ImportItem && BuildingScript.Thread08.ImportLocation
        ObjectReference ImportItem = EmptyMarker.PlaceAtMe(BuildingScript.Thread08.ImportItem)
        ThreadNums[importnum] = 1
        Recipes[importnum].ForceRefTo(ImportItem)
        ImportAmounts[importnum] = BuildingScript.Thread08.ImportAmount
        CraftingCustomers[importnum].ForceRefTo(BuildingScript.Thread08.ImportLocation)
        importnum += 1
    endif
    
    if BuildingScript.Thread09.ImportItem && BuildingScript.Thread09.ImportLocation
        ObjectReference ImportItem = EmptyMarker.PlaceAtMe(BuildingScript.Thread09.ImportItem)
        ThreadNums[importnum] = 1
        Recipes[importnum].ForceRefTo(ImportItem)
        ImportAmounts[importnum] = BuildingScript.Thread09.ImportAmount
        CraftingCustomers[importnum].ForceRefTo(BuildingScript.Thread09.ImportLocation)
        importnum += 1
    endif
    
    int i = 0
    while i < Recipes.Length
        if Recipes[i].GetRef() == None
            Recipes[i].ForceRefTo(NoneObject)
        endif
        i += 1
    endwhile
    
    i = 0
    while i < CraftingCustomers.Length
        if CraftingCustomers[i].GetRef() == None
            CraftingCustomers[i].ForceRefTo(NoneObject)
        endif
        i += 1
    endwhile
    
    Message CraftingSuppliesMessage = CS_EconomyReportNewMessagesBuildingsCraftingSupplies.GetAt(importnum) as Message
    
    Response = CraftingSuppliesMessage.show(ImportAmounts[0], ImportAmounts[1], ImportAmounts[2], ImportAmounts[3], ImportAmounts[4]\
    , ImportAmounts[5], ImportAmounts[6], ImportAmounts[7], ImportAmounts[8])
    
    i = 0
    while i < Recipes.Length
        if Recipes[i].GetRef() == NoneObject
            Recipes[i].Clear()
        else
            if Recipes[i].GetRef()
                Recipes[i].GetRef().delete()
            endif
        endif
        i += 1
    endwhile
    
    i = 0
    while i < CraftingCustomers.Length
        CraftingCustomers[i].Clear()
        i += 1
    endwhile
    
    if Response == importnum
        MenuBuildingsCraftingListBuilding(BuildingList, BuildingNum)
    elseif Response == importnum + 1
        return;/
    else
        int threadnum = ThreadNums[Response]
        
        if threadnum == 1
            MenuBuildingsCraftingListPriority(Building, BuildingScript.Thread01.RequestedAmount, BuildingScript.Thread01.Recipe.Output, BuildingScript.Thread01.RequesterChest, BuildingScript.Thread01.CraftingThreadContainer.GetItemCount(BuildingScript.Thread01.Recipe.Ingredient1), BuildingScript.Thread01.MaterialAmountRequired, BuildingScript.Thread01.Recipe.Ingredient1, BuildingScript.Thread01.MaterialSupplierChest, BuildingScript.Thread01.FinishTime)
            MenuBuildingsCraftingListPriorities(BuildingList, BuildingNum)
        elseif threadnum == 2
            MenuBuildingsCraftingListPriority(Building, BuildingScript.Thread02.RequestedAmount, BuildingScript.Thread02.Recipe.Output, BuildingScript.Thread02.RequesterChest, BuildingScript.Thread02.CraftingThreadContainer.GetItemCount(BuildingScript.Thread02.Recipe.Ingredient1), BuildingScript.Thread02.MaterialAmountRequired, BuildingScript.Thread02.Recipe.Ingredient1, BuildingScript.Thread02.MaterialSupplierChest, BuildingScript.Thread02.FinishTime)
            MenuBuildingsCraftingListPriorities(BuildingList, BuildingNum)
        elseif threadnum == 3
            MenuBuildingsCraftingListPriority(Building, BuildingScript.Thread03.RequestedAmount, BuildingScript.Thread03.Recipe.Output, BuildingScript.Thread03.RequesterChest, BuildingScript.Thread03.CraftingThreadContainer.GetItemCount(BuildingScript.Thread03.Recipe.Ingredient1), BuildingScript.Thread03.MaterialAmountRequired, BuildingScript.Thread03.Recipe.Ingredient1, BuildingScript.Thread03.MaterialSupplierChest, BuildingScript.Thread03.FinishTime)
            MenuBuildingsCraftingListPriorities(BuildingList, BuildingNum)
        elseif threadnum == 4
            MenuBuildingsCraftingListPriority(Building, BuildingScript.Thread04.RequestedAmount, BuildingScript.Thread04.Recipe.Output, BuildingScript.Thread04.RequesterChest, BuildingScript.Thread04.CraftingThreadContainer.GetItemCount(BuildingScript.Thread04.Recipe.Ingredient1), BuildingScript.Thread04.MaterialAmountRequired, BuildingScript.Thread04.Recipe.Ingredient1, BuildingScript.Thread04.MaterialSupplierChest, BuildingScript.Thread04.FinishTime)
            MenuBuildingsCraftingListPriorities(BuildingList, BuildingNum)
        elseif threadnum == 5
            MenuBuildingsCraftingListPriority(Building, BuildingScript.Thread05.RequestedAmount, BuildingScript.Thread05.Recipe.Output, BuildingScript.Thread05.RequesterChest, BuildingScript.Thread05.CraftingThreadContainer.GetItemCount(BuildingScript.Thread05.Recipe.Ingredient1), BuildingScript.Thread05.MaterialAmountRequired, BuildingScript.Thread05.Recipe.Ingredient1, BuildingScript.Thread05.MaterialSupplierChest, BuildingScript.Thread05.FinishTime)
            MenuBuildingsCraftingListPriorities(BuildingList, BuildingNum)
        endif/;
    endif
EndFunction

Function MenuBuildingsCraftingListPriorities(FormList BuildingList, int BuildingNum, int Response = 0)
    ObjectReference Building = BuildingList.GetAt(BuildingNum) as ObjectReference
    CS_BuildingCraftingScript BuildingScript = Building as CS_BuildingCraftingScript
    int[] RecipeAmounts = new int[10]
    int[] ThreadNums = new int[5]
    
    int recipenum = 0
    
    if BuildingScript.Thread01.Recipe
        ObjectReference Output = EmptyMarker.PlaceAtMe(BuildingScript.Thread01.Recipe.Output)
        ThreadNums[recipenum] = 1
        Recipes[recipenum].ForceRefTo(Output)
        RecipeAmounts[recipenum] = BuildingScript.Thread01.RequestedAmount
        CraftingCustomers[recipenum].ForceRefTo(BuildingScript.Thread01.RequesterChest)
        recipenum += 1
    endif
    
    if BuildingScript.Thread02.Recipe
        ObjectReference Output = EmptyMarker.PlaceAtMe(BuildingScript.Thread02.Recipe.Output)
        ThreadNums[recipenum] = 2
        Recipes[recipenum].ForceRefTo(Output)
        RecipeAmounts[recipenum] = BuildingScript.Thread02.RequestedAmount
        CraftingCustomers[recipenum].ForceRefTo(BuildingScript.Thread02.RequesterChest)
        recipenum += 1
    endif
    
    if BuildingScript.Thread03.Recipe
        ObjectReference Output = EmptyMarker.PlaceAtMe(BuildingScript.Thread03.Recipe.Output)
        ThreadNums[recipenum] = 3
        Recipes[recipenum].ForceRefTo(Output)
        RecipeAmounts[recipenum] = BuildingScript.Thread03.RequestedAmount
        CraftingCustomers[recipenum].ForceRefTo(BuildingScript.Thread03.RequesterChest)
        recipenum += 1
    endif
    
    if BuildingScript.Thread04.Recipe
        ObjectReference Output = EmptyMarker.PlaceAtMe(BuildingScript.Thread04.Recipe.Output)
        ThreadNums[recipenum] = 4
        Recipes[recipenum].ForceRefTo(Output)
        RecipeAmounts[recipenum] = BuildingScript.Thread04.RequestedAmount
        CraftingCustomers[recipenum].ForceRefTo(BuildingScript.Thread04.RequesterChest)
        recipenum += 1
    endif
    
    if BuildingScript.Thread05.Recipe
        ObjectReference Output = EmptyMarker.PlaceAtMe(BuildingScript.Thread05.Recipe.Output)
        ThreadNums[recipenum] = 5
        Recipes[recipenum].ForceRefTo(Output)
        RecipeAmounts[recipenum] = BuildingScript.Thread05.RequestedAmount
        CraftingCustomers[recipenum].ForceRefTo(BuildingScript.Thread05.RequesterChest)
        recipenum += 1
    endif
    
    int i = 0
    while i < Recipes.Length
        if Recipes[i].GetRef() == None
            Recipes[i].ForceRefTo(NoneObject)
        endif
        i += 1
    endwhile
    
    i = 0
    while i < CraftingCustomers.Length
        if CraftingCustomers[i].GetRef() == None
            CraftingCustomers[i].ForceRefTo(NoneObject)
        endif
        i += 1
    endwhile
    
    Message CraftingPriorityMessage = CS_EconomyReportNewMessagesBuildingsCraftingPriorities.GetAt(recipenum) as Message
    
    Response = CraftingPriorityMessage.show(RecipeAmounts[0], RecipeAmounts[1], RecipeAmounts[2], RecipeAmounts[3], RecipeAmounts[4])
    
    i = 0
    while i < Recipes.Length
        if Recipes[i].GetRef() == NoneObject
            Recipes[i].Clear()
        else
            if Recipes[i].GetRef()
                Recipes[i].GetRef().delete()
            endif
        endif
        i += 1
    endwhile
    
    i = 0
    while i < CraftingCustomers.Length
        CraftingCustomers[i].Clear()
        i += 1
    endwhile
    
    if Response == recipenum
        MenuBuildingsCraftingListBuilding(BuildingList, BuildingNum)
    elseif Response == recipenum + 1
        return
    else
        int threadnum = ThreadNums[Response]
        
        if threadnum == 1
            MenuBuildingsCraftingListPriority(Building, BuildingScript.Thread01.RequestedAmount, BuildingScript.Thread01.Recipe.Output, BuildingScript.Thread01.RequesterChest, BuildingScript.Thread01.CraftingThreadContainer.GetItemCount(BuildingScript.Thread01.Recipe.Ingredient1), BuildingScript.Thread01.MaterialAmountRequired, BuildingScript.Thread01.Recipe.Ingredient1, BuildingScript.Thread01.FinishTime)
            MenuBuildingsCraftingListPriorities(BuildingList, BuildingNum)
        elseif threadnum == 2
            MenuBuildingsCraftingListPriority(Building, BuildingScript.Thread02.RequestedAmount, BuildingScript.Thread02.Recipe.Output, BuildingScript.Thread02.RequesterChest, BuildingScript.Thread02.CraftingThreadContainer.GetItemCount(BuildingScript.Thread02.Recipe.Ingredient1), BuildingScript.Thread02.MaterialAmountRequired, BuildingScript.Thread02.Recipe.Ingredient1, BuildingScript.Thread02.FinishTime)
            MenuBuildingsCraftingListPriorities(BuildingList, BuildingNum)
        elseif threadnum == 3
            MenuBuildingsCraftingListPriority(Building, BuildingScript.Thread03.RequestedAmount, BuildingScript.Thread03.Recipe.Output, BuildingScript.Thread03.RequesterChest, BuildingScript.Thread03.CraftingThreadContainer.GetItemCount(BuildingScript.Thread03.Recipe.Ingredient1), BuildingScript.Thread03.MaterialAmountRequired, BuildingScript.Thread03.Recipe.Ingredient1, BuildingScript.Thread03.FinishTime)
            MenuBuildingsCraftingListPriorities(BuildingList, BuildingNum)
        elseif threadnum == 4
            MenuBuildingsCraftingListPriority(Building, BuildingScript.Thread04.RequestedAmount, BuildingScript.Thread04.Recipe.Output, BuildingScript.Thread04.RequesterChest, BuildingScript.Thread04.CraftingThreadContainer.GetItemCount(BuildingScript.Thread04.Recipe.Ingredient1), BuildingScript.Thread04.MaterialAmountRequired, BuildingScript.Thread04.Recipe.Ingredient1, BuildingScript.Thread04.FinishTime)
            MenuBuildingsCraftingListPriorities(BuildingList, BuildingNum)
        elseif threadnum == 5
            MenuBuildingsCraftingListPriority(Building, BuildingScript.Thread05.RequestedAmount, BuildingScript.Thread05.Recipe.Output, BuildingScript.Thread05.RequesterChest, BuildingScript.Thread05.CraftingThreadContainer.GetItemCount(BuildingScript.Thread05.Recipe.Ingredient1), BuildingScript.Thread05.MaterialAmountRequired, BuildingScript.Thread05.Recipe.Ingredient1, BuildingScript.Thread05.FinishTime)
            MenuBuildingsCraftingListPriorities(BuildingList, BuildingNum)
        endif
    endif
EndFunction

Function MenuBuildingsCraftingListPriority(ObjectReference Building, int CraftingAmount, Form RecipeOutput, ObjectReference CustomerBuilding, int AmountFulfilled, int AmountRequired, Form RecipeMaterialBase, float FinishTime)
    Buildings[0].ForceRefTo(Building)
    Recipes[0].ForceRefTo(EmptyMarker.PlaceAtMe(RecipeOutput))
    CraftingCustomers[0].ForceRefTo(CustomerBuilding)
    RecipeMaterial.ForceRefTo(EmptyMarker.PlaceAtMe(RecipeMaterialBase))
    
    float CompletionTime
    
    if FinishTime > 0
        CompletionTime = math.ceiling((FinishTime - GameDaysPassed.GetValue())/0.0415)
        
        CS_EconomyReportNewCityMenuBuildingsCraftingPriorityStarted.show(CraftingAmount, AmountFulfilled, AmountRequired, CompletionTime)
    else
        CompletionTime = CraftingAmount
        
        CS_EconomyReportNewCityMenuBuildingsCraftingPriorityUnstartedSearching.show(CraftingAmount, AmountFulfilled, AmountRequired, CompletionTime)
    endif
    
    Recipes[0].GetRef().delete()
    RecipeMaterial.GetRef().delete()
    RecipeMaterial.Clear()
    CraftingSupplier.Clear()
EndFunction

Function MenuBuildingsSellingList(FormList BuildingList, int Response = 0)
    Keyword InfrastructureKeyword = EconomyCity.CS_Infrastructure
    FormList ResourceBuildingsShops = BuildingList
    int NumShops = ResourceBuildingsShops.GetSize()
    
    if NumShops == 0
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(0) as Message).show()
    elseif NumShops == 1
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingSellingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(1) as Message).show(Infrastructure1)
    elseif NumShops == 2
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingSellingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(2) as Message).show(Infrastructure1, Infrastructure2)
    elseif NumShops == 3
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingSellingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(3) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3)
    elseif NumShops == 4
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsShops.GetAt(3) as CS_BuildingSellingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsShops.GetAt(3) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(4) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4)
    elseif NumShops == 5
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsShops.GetAt(3) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure5 = (ResourceBuildingsShops.GetAt(4) as CS_BuildingSellingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsShops.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsShops.GetAt(4) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(5) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5)
    elseif NumShops == 6
        int Infrastructure1 = (ResourceBuildingsShops.GetAt(0) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure2 = (ResourceBuildingsShops.GetAt(1) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure3 = (ResourceBuildingsShops.GetAt(2) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure4 = (ResourceBuildingsShops.GetAt(3) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure5 = (ResourceBuildingsShops.GetAt(4) as CS_BuildingSellingScript).Infrastructure as int
        int Infrastructure6 = (ResourceBuildingsShops.GetAt(5) as CS_BuildingSellingScript).Infrastructure as int
        Buildings[0].ForceRefTo(ResourceBuildingsShops.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(ResourceBuildingsShops.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(ResourceBuildingsShops.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(ResourceBuildingsShops.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(ResourceBuildingsShops.GetAt(4) as ObjectReference)
        Buildings[5].ForceRefTo(ResourceBuildingsShops.GetAt(5) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(6) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5, Infrastructure6)
    endif

    if Response < NumShops
        MenuBuildingsSellingListBuilding(BuildingList, BuildingNum=Response)
    elseif Response == NumShops
        MenuBuildings()
    endif
EndFunction

Function MenuBuildingsHousesList(FormList BuildingList, int Response = 0)
    Keyword InfrastructureKeyword = EconomyCity.CS_Infrastructure
    FormList BuildingsHouses = BuildingList
    int NumShops = BuildingsHouses.GetSize()
    
    if NumShops == 0
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(0) as Message).show()
    elseif NumShops == 1
        int Infrastructure1 = (BuildingsHouses.GetAt(0) as CS_BuildingHouseScript).Infrastructure as int
        Buildings[0].ForceRefTo(BuildingsHouses.GetAt(0) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(1) as Message).show(Infrastructure1)
    elseif NumShops == 2
        int Infrastructure1 = (BuildingsHouses.GetAt(0) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure2 = (BuildingsHouses.GetAt(1) as CS_BuildingHouseScript).Infrastructure as int
        Buildings[0].ForceRefTo(BuildingsHouses.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(BuildingsHouses.GetAt(1) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(2) as Message).show(Infrastructure1, Infrastructure2)
    elseif NumShops == 3
        int Infrastructure1 = (BuildingsHouses.GetAt(0) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure2 = (BuildingsHouses.GetAt(1) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure3 = (BuildingsHouses.GetAt(2) as CS_BuildingHouseScript).Infrastructure as int
        Buildings[0].ForceRefTo(BuildingsHouses.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(BuildingsHouses.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(BuildingsHouses.GetAt(2) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(3) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3)
    elseif NumShops == 4
        int Infrastructure1 = (BuildingsHouses.GetAt(0) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure2 = (BuildingsHouses.GetAt(1) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure3 = (BuildingsHouses.GetAt(2) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure4 = (BuildingsHouses.GetAt(3) as CS_BuildingHouseScript).Infrastructure as int
        Buildings[0].ForceRefTo(BuildingsHouses.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(BuildingsHouses.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(BuildingsHouses.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(BuildingsHouses.GetAt(3) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(4) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4)
    elseif NumShops == 5
        int Infrastructure1 = (BuildingsHouses.GetAt(0) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure2 = (BuildingsHouses.GetAt(1) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure3 = (BuildingsHouses.GetAt(2) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure4 = (BuildingsHouses.GetAt(3) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure5 = (BuildingsHouses.GetAt(4) as CS_BuildingHouseScript).Infrastructure as int
        Buildings[0].ForceRefTo(BuildingsHouses.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(BuildingsHouses.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(BuildingsHouses.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(BuildingsHouses.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(BuildingsHouses.GetAt(4) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(5) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5)
    elseif NumShops == 6
        int Infrastructure1 = (BuildingsHouses.GetAt(0) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure2 = (BuildingsHouses.GetAt(1) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure3 = (BuildingsHouses.GetAt(2) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure4 = (BuildingsHouses.GetAt(3) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure5 = (BuildingsHouses.GetAt(4) as CS_BuildingHouseScript).Infrastructure as int
        int Infrastructure6 = (BuildingsHouses.GetAt(5) as CS_BuildingHouseScript).Infrastructure as int
        Buildings[0].ForceRefTo(BuildingsHouses.GetAt(0) as ObjectReference)
        Buildings[1].ForceRefTo(BuildingsHouses.GetAt(1) as ObjectReference)
        Buildings[2].ForceRefTo(BuildingsHouses.GetAt(2) as ObjectReference)
        Buildings[3].ForceRefTo(BuildingsHouses.GetAt(3) as ObjectReference)
        Buildings[4].ForceRefTo(BuildingsHouses.GetAt(4) as ObjectReference)
        Buildings[5].ForceRefTo(BuildingsHouses.GetAt(5) as ObjectReference)
        Response = (CS_EconomyReportNewMessagesBuildingListsBuildings.GetAt(6) as Message).show(Infrastructure1, Infrastructure2, Infrastructure3, Infrastructure4, Infrastructure5, Infrastructure6)
    endif

    if Response < NumShops
        MenuBuildingsHousesListBuilding(BuildingList, BuildingNum=Response)
    elseif Response == NumShops
        MenuBuildings()
    endif
EndFunction

Function MenuBuildingsHousesListBuilding(FormList BuildingList, int BuildingNum, int Response = 0)
    ObjectReference Building = BuildingList.GetAt(BuildingNum) as ObjectReference
    Buildings[0].ForceRefTo(Building)
    CS_BuildingHouseScript BuildingScript = Building as CS_BuildingHouseScript
    
    int Occupants = BuildingScript.Occupants.Length
    int Level = BuildingScript.Level as int
    int Infrastructure = BuildingScript.Infrastructure as int
    
    Response = CS_EconomyReportNewCityMenuBuildingsHouse.show(Occupants, Level, Infrastructure)

    if Response == 1
        Building.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        MenuBuildingsHousesListBuilding(BuildingList, BuildingNum)
    elseif Response == 3
        MenuBuildingsHousesList(BuildingList)
    endif
EndFunction

Function MenuBuildingsSellingListBuilding(FormList BuildingList, int BuildingNum, int Response = 0)
    ObjectReference Building = BuildingList.GetAt(BuildingNum) as ObjectReference
    Buildings[0].ForceRefTo(Building)
    CS_BuildingSellingScript BuildingScript = Building as CS_BuildingSellingScript
    Actor BuildingOwnerRef
    if BuildingScript.Owner
        BuildingOwnerRef = EmptyMarker.PlaceActorAtMe(BuildingScript.Owner)
        BuildingOwner.ForceRefTo(BuildingOwnerRef)
    else
        BuildingOwner.ForceRefTo(NoneObject)
    endif
    
    int Level = BuildingScript.Level as int
    int Infrastructure = BuildingScript.Infrastructure as int
    int Workers = BuildingScript.Workers as int
    
    Response = CS_EconomyReportNewCityMenuBuildingsBuilding.show(Level, Infrastructure, Workers, Level)
    if BuildingOwnerRef
        BuildingOwnerRef.delete()
    endif
    if Response == 0
        Building.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        MenuBuildingsSellingListBuilding(BuildingList, BuildingNum)
    elseif Response == 2
        MenuBuildingsSellingList(BuildingList)
    endif
EndFunction

Function SpendResource(string resource, int cost)
    if resource == "Coin"
        CoinSound.Play(Game.GetPlayer())
        EconomyCity.CoinReserve -= cost
    elseif resource == "Food"
        FoodSound.Play(Game.GetPlayer())
        EconomyCity.FoodReserve -= cost
    elseif resource == "Wood"
        WoodSound.Play(Game.GetPlayer())
        EconomyCity.WoodReserve -= cost
    elseif resource == "Metal"
        MetalSound.Play(Game.GetPlayer())
        EconomyCity.MetalReserve -= cost
    endif
    debug.notification(cost + " " + resource + " has been deducted from the reserves")
EndFunction

Function AddResource(string resource, int addition)
    if resource == "Coin"
        CoinSound.Play(Game.GetPlayer())
        EconomyCity.CoinReserve += addition
    elseif resource == "Food"
        FoodSound.Play(Game.GetPlayer())
        EconomyCity.FoodReserve += addition
    elseif resource == "Wood"
        WoodSound.Play(Game.GetPlayer())
        EconomyCity.WoodReserve += addition
    elseif resource == "Metal"
        MetalSound.Play(Game.GetPlayer())
        EconomyCity.MetalReserve += addition
    endif
    debug.notification(addition + " " + resource + " has been added to the reserves")
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
  citynum = aiValue1
    MenuStart()
EndEvent