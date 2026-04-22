Scriptname CS_EconomyReportNewScript extends Quest  conditional

Message Property CS_EconomyReportNewMenuStart Auto
Message Property CS_EconomyReportNewMenuCoin Auto
Message Property CS_EconomyReportNewMenuCoinDeposit Auto
Message Property CS_EconomyReportNewMenuCoinWithdraw Auto
Message Property CS_EconomyReportNewMenuFood Auto
Message Property CS_EconomyReportNewMenuWood Auto
Message Property CS_EconomyReportNewMenuMetal Auto
Message Property CS_EconomyReportNewMenuTradeStart Auto
Message Property CS_EconomyReportNewMenuMajorCities Auto
Message Property CS_EconomyReportNewMenuMinorCities Auto
Message Property CS_EconomyReportNewMenuVillages Auto
Message Property CS_EconomyReportNewMenuCity Auto
Message Property CS_EconomyReportNewMenuCityTradeManage Auto
Message Property CS_EconomyReportNewMenuCityTradeManageImportAdd Auto
Message Property CS_EconomyReportNewMenuCityTradeManageImportRemove Auto
Message Property CS_EconomyReportNewMenuCityTradeManageExportAdd Auto
Message Property CS_EconomyReportNewMenuCityTradeManageExportRemove Auto
Message Property CS_EconomyReportNewMenuCityTradeAgreements Auto

LocationAlias Property City Auto

LocationAlias[] Property TradeCities Auto

ReferenceAlias[] Property AgreementTexts Auto
ReferenceAlias[] Property AgreementResources Auto

ReferenceAlias Property FactionName Auto
ReferenceAlias Property TradingOrNot Auto
ReferenceAlias Property ResourceAlias Auto

Location Property CS_NoneLocation Auto
Location Property CS_TroopsAndMovementsDataImperial Auto
Location Property CS_TroopsAndMovementsDataSons Auto
Location Property CS_OurFactionLoc Auto

Actor Property EconomyActorFood Auto
Actor Property EconomyActorWood Auto
Actor Property EconomyActorMetal Auto

MiscObject Property Gold001 Auto

ObjectReference Property NoneObject Auto
ObjectReference Property ResourceFood Auto
ObjectReference Property ResourceWood Auto
ObjectReference Property ResourceMetal Auto
ObjectReference Property ResourceEquipment Auto
ObjectReference Property TextImport Auto
ObjectReference Property TextExport Auto
ObjectReference Property TextPlayerNotTrading Auto
ObjectReference Property TextPlayerTrading Auto

float Property ResourceConditional Auto conditional
float Property ResourceConditionalImport Auto conditional
float Property ResourceConditionalExport Auto conditional

int Property TradeWithPlayer Auto conditional

FormList Property CS_AllUpgradeLocations Auto
FormList Property CS_FoodKeywords Auto
FormList Property CS_IngotKeyword Auto

Quest Property CS_FactionGovernment Auto

CS_EconomyUpdaterNewScript Property EconomyUpdater Auto

Function MenuStart(int Response = 0)
    CS_EconomyFactionUpdaterNewScript EconomyPlayer = EconomyUpdater.EconomyFactionUpdaters[0]
    EconomyPlayer.UpdateResources()
    
    float Treasury = EconomyPlayer.CoinReserve as float
    float TreasuryPerDay = EconomyPlayer.ChangeCoin as float
    float Food = EconomyPlayer.FoodReserve as float
    float FoodPerDay = EconomyPlayer.ChangeFood as float
    float Wood = EconomyPlayer.WoodReserve as float
    float WoodPerDay = EconomyPlayer.ChangeWood as float
    float Metal = EconomyPlayer.MetalReserve as float
    float MetalPerDay = EconomyPlayer.ChangeMetal as float
    
    Response = CS_EconomyReportNewMenuStart.show(Treasury, TreasuryPerDay, Food, FoodPerDay, Wood, WoodPerDay, Metal, MetalPerDay)
    if Response == 0
        MenuCoin()
    elseif Response == 1
        MenuFood()
    elseif Response == 2
        MenuWood()
    elseif Response == 3
        MenuMetal()
    elseif Response == 4
        MenuTradeStart()
    endif
    Stop()
EndFunction

Function MenuCoin(int Response = 0)
    CS_EconomyFactionUpdaterNewScript EconomyPlayer = EconomyUpdater.EconomyFactionUpdaters[0]
    EconomyPlayer.UpdateResources()

    float CoinReserves = EconomyPlayer.CoinReserve as float
    float CoinImported = EconomyPlayer.GetSum(EconomyPlayer.CoinImport) as float
    float CoinEnterprises = EconomyPlayer.CoinEnterprises as float
    float CoinSponsors = EconomyPlayer.CoinSponsors as float
    float CoinSalariesTroops = EconomyPlayer.CoinSalariesTroops as float
    float CoinSalariesWorkers = EconomyPlayer.CoinSalariesWorkers as float
    float CoinToSponsored = EconomyPlayer.CoinToSponsored as float
    float CoinExported = EconomyPlayer.GetSum(EconomyPlayer.CoinExport) as float
    float CoinPerDay = EconomyPlayer.ChangeCoin as float
    
    Response = CS_EconomyReportNewMenuCoin.show(CoinReserves, CoinImported, CoinEnterprises, CoinSponsors, 0 - CoinSalariesTroops, 0 - CoinSalariesWorkers, 0 - CoinToSponsored, 0 - CoinExported, CoinPerDay)
    if Response == 0
        MenuCoinDeposit()
    elseif Response == 1
        MenuCoinWithdraw()
    elseif Response == 2
        MenuStart()
    endif
EndFunction

Function MenuCoinDeposit(int Response = 0)
    CS_EconomyFactionUpdaterNewScript EconomyPlayer = EconomyUpdater.EconomyFactionUpdaters[0]
    float CoinReserves = EconomyPlayer.CoinReserve as float
    
    Response = CS_EconomyReportNewMenuCoinDeposit.show(CoinReserves)
    if Response < 7
        EconomyPlayer.AddResource("Coin", math.pow(10, Response) as int)
        Game.GetPlayer().RemoveItem(Gold001, math.pow(10, Response) as int)
        if CS_FactionGovernment.GetStage() == 2
            if EconomyPlayer.CoinReserve >= 1000
                CS_FactionGovernment.SetStage(3)
                Utility.Wait(1)
            endif
        endif
        MenuCoinDeposit()
    elseif Response == 7
        MenuCoin()
    endif
EndFunction

Function MenuCoinWithdraw(int Response = 0)
    CS_EconomyFactionUpdaterNewScript EconomyPlayer = EconomyUpdater.EconomyFactionUpdaters[0]
    float CoinReserves = EconomyPlayer.CoinReserve as float
    
    Response = CS_EconomyReportNewMenuCoinWithdraw.show(CoinReserves)
    if Response < 7
        EconomyPlayer.SpendResource("Coin", math.pow(10, Response) as int)
        Game.GetPlayer().AddItem(Gold001, math.pow(10, Response) as int)
        MenuCoinWithdraw()
    elseif Response == 7
        MenuCoin()
    endif
EndFunction

Function MenuFood(int Response = 0)
    CS_EconomyFactionUpdaterNewScript EconomyPlayer = EconomyUpdater.EconomyFactionUpdaters[0]

    float FoodReserves = EconomyPlayer.FoodReserve as float
    float FoodHunted = EconomyPlayer.FoodHunted as float
    float FoodFarmed = EconomyPlayer.FoodFarmed as float
    float FoodImported = EconomyPlayer.GetSum(EconomyPlayer.FoodImport) as float
    float FoodImportedProjected = EconomyPlayer.GetSum(EconomyPlayer.FoodImport) as float
    float FoodConsumedTroopsWorkers  = EconomyPlayer.FoodConsumedTroops as float + EconomyPlayer.FoodConsumedWorkers as float
    float FoodExported = EconomyPlayer.GetSum(EconomyPlayer.FoodExport) as float
    float FoodProjected = EconomyPlayer.GetSum(EconomyPlayer.FoodExport) as float
    float FoodPerDay = EconomyPlayer.ChangeFood as float
    
    Response = CS_EconomyReportNewMenuFood.show(FoodReserves, FoodHunted, FoodFarmed, FoodImported, FoodImportedProjected, 0 - FoodConsumedTroopsWorkers, 0 - FoodExported, FoodProjected, FoodPerDay)
    if Response == 0
        EconomyActorFood.ShowGiftMenu(True, CS_FoodKeywords, true, false)
        MenuFood()
    elseif Response == 1
        EconomyActorFood.ShowGiftMenu(false, CS_FoodKeywords, true, false)
        MenuFood()
    elseif Response == 2
        MenuStart()
    endif
EndFunction

Function MenuWood(int Response = 0)
    CS_EconomyFactionUpdaterNewScript EconomyPlayer = EconomyUpdater.EconomyFactionUpdaters[0]

    float WoodReserves = EconomyPlayer.WoodReserve as float
    float WoodCut = EconomyPlayer.WoodCut as float
    float WoodImported = EconomyPlayer.GetSum(EconomyPlayer.WoodImport) as float
    float WoodImportedProjected = EconomyPlayer.GetSum(EconomyPlayer.WoodImport) as float
    float WoodMaintenance = 0; EconomyPlayer.WoodConsumedTroops as float
    float WoodExported = EconomyPlayer.GetSum(EconomyPlayer.WoodExport) as float
    float WoodProjected = EconomyPlayer.GetSum(EconomyPlayer.WoodExport) as float
    float WoodPerDay = EconomyPlayer.ChangeWood as float
    
    Response = CS_EconomyReportNewMenuWood.show(WoodReserves, WoodCut, WoodImported, WoodImportedProjected, 0 - WoodMaintenance, 0 - WoodExported, WoodProjected, WoodPerDay)
    if Response == 0
        MenuStart()
    endif
EndFunction

Function MenuMetal(int Response = 0)
    CS_EconomyFactionUpdaterNewScript EconomyPlayer = EconomyUpdater.EconomyFactionUpdaters[0]

    float MetalReserves = EconomyPlayer.MetalReserve as float
    float MetalMined = EconomyPlayer.MetalMined as float
    float MetalImported = EconomyPlayer.GetSum(EconomyPlayer.MetalImport) as float
    float MetalImportedProjected = EconomyPlayer.GetSum(EconomyPlayer.MetalImport) as float
    float MetalExported = EconomyPlayer.GetSum(EconomyPlayer.MetalExport) as float
    float MetalProjected = EconomyPlayer.GetSum(EconomyPlayer.MetalExport) as float
    float MetalPerDay = EconomyPlayer.ChangeMetal as float
    
    Response = CS_EconomyReportNewMenuMetal.show(MetalReserves, MetalMined, MetalImported, MetalImportedProjected, 0 - MetalExported, MetalProjected, MetalPerDay)
    if Response == 0
        EconomyActorMetal.ShowGiftMenu(True, CS_IngotKeyword, true, false)
        MenuMetal()
    elseif Response == 1
        EconomyActorMetal.ShowGiftMenu(false, CS_IngotKeyword, true, false)
        MenuMetal()
    elseif Response == 2
        MenuStart()
    endif
EndFunction

Function MenuTradeStart(int Response = 0)
    Response = CS_EconomyReportNewMenuTradeStart.show()
    if Response == 0
        MenuMajorCities()
    elseif Response == 1
        MenuMinorCities()
    elseif Response == 2
        MenuVillages()
    elseif Response == 3
        MenuStart()
    endif
EndFunction

Function MenuMajorCities(int Response = 0)
    Response = CS_EconomyReportNewMenuMajorCities.show()
    if Response < 5
        MenuCity(Response)
    elseif Response == 5
        MenuTradeStart()
    endif
EndFunction

Function MenuMinorCities(int Response = 0)
    Response = CS_EconomyReportNewMenuMinorCities.show()
    if Response < 4
        MenuCity(Response + 5)
    elseif Response == 4
        MenuTradeStart()
    endif
EndFunction

Function MenuVillages(int Response = 0)
    Response = CS_EconomyReportNewMenuVillages.show()
    if Response < 6
        MenuCity(Response + 9)
    elseif Response == 6
        MenuTradeStart()
    endif
EndFunction

Function MenuCity(int citynum, int Response = 0)
    City.ForceLocationTo(CS_AllUpgradeLocations.GetAt(citynum) as Location)
    CS_EconomyHoldUpdaterNewScript EconomyHold = EconomyUpdater.EconomyHoldUpdaters[citynum]
    ;EconomyHold.ImmediateUpdate()
    if EconomyHold.TradeWithPlayer
        TradeWithPlayer = 1
        TradingOrNot.ForceRefTo(TextPlayerTrading)
    else
        TradeWithPlayer = 0
        TradingOrNot.ForceRefTo(TextPlayerNotTrading)
    endif
    float PlayerTradeModifier = EconomyHold.PlayerTradeModifier
    float CityTradeModifier = EconomyHold.CityTradeModifierWithPlayer
    float FoodToTrade = EconomyHold.FoodToTrade as float
    float WoodToTrade = EconomyHold.WoodToTrade as float
    float MetalToTrade = EconomyHold.MetalToTrade as float
    float FoodCost = EconomyHold.FoodCost as float
    float WoodCost = EconomyHold.WoodCost as float
    float MetalCost = EconomyHold.MetalCost as float
    float PlayerInfluenceEconomy = EconomyHold.PlayerInfluenceEconomy as float
    Response = CS_EconomyReportNewMenuCity.show(PlayerTradeModifier, CityTradeModifier, PlayerInfluenceEconomy, FoodToTrade, FoodCost, WoodToTrade, WoodCost, MetalToTrade, MetalCost)
    if Response == 0
        MenuCityTradeManage(citynum, "Food")
    elseif Response == 1
        MenuCityTradeManage(citynum, "Wood")
    elseif Response == 2
        MenuCityTradeManage(citynum, "Metal")
    elseif Response == 3
        MenuCityAgreements(citynum)
    elseif Response == 4
        if citynum < 5
            MenuMajorCities()
        elseif citynum >= 5 && citynum < 9
            MenuMinorCities()
        else
            MenuVillages()
        endif
    endif
EndFunction

Function MenuCityTradeManage(int citynum, string resource, int Response = 0)
    CS_EconomyHoldUpdaterNewScript EconomyHold = EconomyUpdater.EconomyHoldUpdaters[citynum]
    CS_EconomyFactionUpdaterNewScript EconomyPlayer = EconomyUpdater.EconomyFactionUpdaters[0]
    float PlayerTradeModifier
    float CityTradeModifier
    float ResourceToTrade
    float ResourceCost
    float ResourceCostCity
    float ResourceExport
    float ResourceExportCost
    float ResourceImport
    float ResourceImportCost
    float PlayerResource
    float PlayerResourcePerDay
    float ResourceProjected
    float ResourceProjectedImport
    
    if resource == "Food"
        ResourceAlias.ForceRefTo(ResourceFood)
        PlayerTradeModifier = EconomyHold.PlayerTradeModifier
        CityTradeModifier = EconomyHold.CityTradeModifierWithPlayer
        ResourceToTrade = EconomyHold.FoodToTrade as float
        ResourceCost = math.floor(EconomyHold.FoodCost*PlayerTradeModifier) as float
        ResourceCostCity = math.floor(EconomyHold.FoodCost*EconomyHold.CityTradeModifierWithPlayer) as float
        PlayerResource = EconomyPlayer.FoodReserve
        PlayerResourcePerDay = EconomyPlayer.ChangeFood
        ResourceExport = EconomyPlayer.FoodExport[citynum] as float - EconomyPlayer.FoodUndelivered[citynum] as float
        ResourceExportCost = math.floor(ResourceExport*EconomyHold.FoodCost*CityTradeModifier) as float
        ResourceProjected = EconomyPlayer.FoodExport[citynum] as float
        ResourceImport = EconomyPlayer.FoodImportActual[citynum] as float
        ResourceProjectedImport = EconomyPlayer.FoodImport[citynum] as float
    elseif resource == "Wood"
        ResourceAlias.ForceRefTo(ResourceWood)
        PlayerTradeModifier = EconomyHold.PlayerTradeModifier
        CityTradeModifier = EconomyHold.CityTradeModifierWithPlayer
        ResourceToTrade = EconomyHold.WoodToTrade as float
        ResourceCost = math.floor(EconomyHold.WoodCost*PlayerTradeModifier) as float
        ResourceCostCity = math.floor(EconomyHold.WoodCost*EconomyHold.CityTradeModifierWithPlayer) as float
        PlayerResource = EconomyPlayer.WoodReserve
        PlayerResourcePerDay = EconomyPlayer.ChangeWood
        ResourceExport = EconomyPlayer.WoodExport[citynum] as float - EconomyPlayer.WoodUndelivered[citynum] as float
        ResourceExportCost = math.floor(ResourceExport*EconomyHold.WoodCost*CityTradeModifier) as float
        ResourceProjected = EconomyPlayer.WoodExport[citynum] as float
        ResourceImport = EconomyPlayer.WoodImportActual[citynum] as float
        ResourceProjectedImport = EconomyPlayer.WoodImport[citynum] as float
    elseif resource == "Metal"
        ResourceAlias.ForceRefTo(ResourceMetal)
        PlayerTradeModifier = EconomyHold.PlayerTradeModifier
        CityTradeModifier = EconomyHold.CityTradeModifierWithPlayer
        ResourceToTrade = EconomyHold.MetalToTrade as float
        ResourceCost = math.floor(EconomyHold.MetalCost*PlayerTradeModifier) as float
        ResourceCostCity = math.floor(EconomyHold.MetalCost*EconomyHold.CityTradeModifierWithPlayer) as float
        PlayerResource = EconomyPlayer.MetalReserve
        PlayerResourcePerDay = EconomyPlayer.ChangeMetal
        ResourceExport = EconomyPlayer.MetalExport[citynum] as float - EconomyPlayer.MetalUndelivered[citynum] as float
        ResourceExportCost = math.floor(ResourceExport*EconomyHold.MetalCost*CityTradeModifier) as float
        ResourceProjected = EconomyPlayer.MetalExport[citynum] as float
        ResourceImport = EconomyPlayer.MetalImportActual[citynum] as float
        ResourceProjectedImport = EconomyPlayer.MetalImport[citynum] as float
    endif
    
    ResourceImportCost = ResourceImport*math.floor(ResourceCost)
    ResourceConditionalExport = ResourceProjected
    ResourceConditionalImport = ResourceProjectedImport
    
    Response = CS_EconomyReportNewMenuCityTradeManage.show(ResourceCost, ResourceCostCity, ResourceToTrade, ResourceExport, ResourceProjected, ResourceExportCost, ResourceImport, ResourceProjectedImport, 0 - ResourceImportCost)
    
    if Response == 0
        MenuCityTradeManageImport(citynum, resource, 1)
    elseif Response == 1
        MenuCityTradeManageImport(citynum, resource, -1)
    elseif Response == 2
        MenuCityTradeManageExport(citynum, resource, 1)
    elseif Response == 3
        MenuCityTradeManageExport(citynum, resource, -1)
    elseif Response == 4
        MenuCity(citynum)
    endif
EndFunction

Function MenuCityTradeManageImport(int citynum, string resource, int type, int Response = 0)
    CS_EconomyHoldUpdaterNewScript EconomyHold = EconomyUpdater.EconomyHoldUpdaters[citynum]
    CS_EconomyFactionUpdaterNewScript EconomyPlayer = EconomyUpdater.EconomyFactionUpdaters[0]
    float PlayerTradeModifier
    float CityTradeModifier
    float ResourceToTrade
    float ResourceCost
    float ResourceCostCity
    float ResourceImport
    float ResourceImportCost
    float ResourceProjected
    
    if resource == "Food"
        PlayerTradeModifier = EconomyHold.PlayerTradeModifier
        ResourceToTrade = EconomyHold.FoodToTrade as float
        ResourceCost = math.floor(EconomyHold.FoodCost*PlayerTradeModifier) as float
        ResourceCostCity = math.floor(EconomyHold.FoodCost*EconomyHold.CityTradeModifierWithPlayer) as float
        ResourceImport = EconomyPlayer.FoodImportActual[citynum] as float
        ResourceProjected = EconomyPlayer.FoodImport[citynum] as float
    elseif resource == "Wood"
        PlayerTradeModifier = EconomyHold.PlayerTradeModifier
        ResourceToTrade = EconomyHold.WoodToTrade as float
        ResourceCost = math.floor(EconomyHold.WoodCost*PlayerTradeModifier) as float
        ResourceCostCity = math.floor(EconomyHold.WoodCost*EconomyHold.CityTradeModifierWithPlayer) as float
        ResourceImport = EconomyPlayer.WoodImportActual[citynum] as float
        ResourceProjected = EconomyPlayer.WoodImport[citynum] as float
    elseif resource == "Metal"
        PlayerTradeModifier = EconomyHold.PlayerTradeModifier
        ResourceToTrade = EconomyHold.MetalToTrade as float
        ResourceCost = math.floor(EconomyHold.MetalCost*PlayerTradeModifier) as float
        ResourceCostCity = math.floor(EconomyHold.MetalCost*EconomyHold.CityTradeModifierWithPlayer) as float
        ResourceImport = EconomyPlayer.MetalImportActual[citynum] as float
        ResourceProjected = EconomyPlayer.MetalImport[citynum] as float
    endif
    ResourceImportCost = ResourceImport*math.floor(ResourceCost)

    if type == 1
        ResourceConditional = ResourceToTrade
        Response = CS_EconomyReportNewMenuCityTradeManageImportAdd.show(ResourceCost, ResourceToTrade, ResourceImport, ResourceProjected, 0 - ResourceImportCost)
    elseif type == -1
        ResourceConditional = ResourceProjected
        Response = CS_EconomyReportNewMenuCityTradeManageImportRemove.show(ResourceCost, ResourceToTrade, ResourceImport, ResourceProjected, 0 - ResourceImportCost)
    endif
    
    if Response < 4
        ;EconomyPlayer.StartTradeAgreementPlayer(citynum, resource, type*math.pow(10, Response) as int)
        MenuCityTradeManageImport(citynum, resource, type)
    elseif Response == 4
        MenuCityTradeManage(citynum, resource)
    endif
EndFunction

Function MenuCityTradeManageExport(int citynum, string resource, int type, int Response = 0)
    CS_EconomyHoldUpdaterNewScript EconomyHold = EconomyUpdater.EconomyHoldUpdaters[citynum]
    CS_EconomyFactionUpdaterNewScript EconomyPlayer = EconomyUpdater.EconomyFactionUpdaters[0]
    float PlayerTradeModifier
    float CityTradeModifier
    float ResourceToTrade
    float ResourcePerDay
    float ResourceCost
    float ResourceCostCity
    float ResourceExport
    float ResourceExportCost
    float ResourceProjected
    
    if resource == "Food"
        CityTradeModifier = EconomyHold.CityTradeModifierWithPlayer
        ResourceToTrade = EconomyPlayer.FoodReserve as float
        ResourcePerDay = EconomyPlayer.ChangeFood as float
        ResourceCost = math.floor(EconomyHold.FoodCost*CityTradeModifier) as float
        ResourceCostCity = math.floor(EconomyHold.FoodCost*EconomyHold.CityTradeModifierWithPlayer) as float
        ResourceExport = EconomyPlayer.FoodExport[citynum] as float - EconomyPlayer.FoodUndelivered[citynum] as float
        ResourceProjected = EconomyPlayer.FoodExport[citynum] as float
        ResourceExportCost = math.floor(ResourceExport*EconomyHold.FoodCost*CityTradeModifier) as float
    elseif resource == "Wood"
        CityTradeModifier = EconomyHold.CityTradeModifierWithPlayer
        ResourceToTrade = EconomyPlayer.WoodReserve as float
        ResourcePerDay = EconomyPlayer.ChangeWood as float
        ResourceCost = math.floor(EconomyHold.WoodCost*CityTradeModifier) as float
        ResourceCostCity = math.floor(EconomyHold.WoodCost*EconomyHold.CityTradeModifierWithPlayer) as float
        ResourceExport = EconomyPlayer.WoodExport[citynum] as float - EconomyPlayer.WoodUndelivered[citynum] as float
        ResourceProjected = EconomyPlayer.WoodExport[citynum] as float
        ResourceExportCost = math.floor(ResourceExport*EconomyHold.WoodCost*CityTradeModifier) as float
    elseif resource == "Metal"
        CityTradeModifier = EconomyHold.CityTradeModifierWithPlayer
        ResourceToTrade = EconomyPlayer.MetalReserve as float
        ResourcePerDay = EconomyPlayer.ChangeMetal as float
        ResourceCost = math.floor(EconomyHold.MetalCost*CityTradeModifier) as float
        ResourceCostCity = math.floor(EconomyHold.MetalCost*EconomyHold.CityTradeModifierWithPlayer) as float
        ResourceExport = EconomyPlayer.MetalExport[citynum] as float - EconomyPlayer.MetalUndelivered[citynum] as float
        ResourceProjected = EconomyPlayer.MetalExport[citynum] as float
        ResourceExportCost = math.floor(ResourceExport*EconomyHold.MetalCost*CityTradeModifier) as float
    endif
    
    
    if type == 1
        ResourceConditional = ResourceToTrade + ResourcePerDay
        Response = CS_EconomyReportNewMenuCityTradeManageExportAdd.show(ResourceCostCity, ResourceToTrade, ResourcePerDay, ResourceExport, ResourceProjected, ResourceExportCost)
    elseif type == -1
        ResourceConditional = ResourceProjected
        Response = CS_EconomyReportNewMenuCityTradeManageExportRemove.show(ResourceCostCity, ResourceToTrade, ResourcePerDay, ResourceExport, ResourceProjected, ResourceExportCost)
    endif
    
    if Response < 4
        ;EconomyHold.ModifyTradeAgreementPlayer(resource, type*math.pow(10, Response) as int)
        MenuCityTradeManageExport(citynum, resource, type)
    elseif Response == 4
        MenuCityTradeManage(citynum, resource)
    endif
EndFunction

Function MenuCityAgreements(int citynum, int Response = 0)
    SetUpTradeAgreements(citynum)
    Response = CS_EconomyReportNewMenuCityTradeAgreements.show()
    if Response == 0
        MenuCity(citynum)
    endif  
EndFunction

Function SetUpTradeAgreements(int citynum)
    int i = 0
    while i < 8
        TradeCities[i].ForceLocationTo(CS_NoneLocation)
        AgreementResources[i].ForceRefTo(NoneObject)
        AgreementTexts[i].ForceRefTo(NoneObject)
        i += 1
    endwhile

    CS_EconomyHoldUpdaterNewScript EconomyHold = EconomyUpdater.EconomyHoldUpdaters[citynum]
    
    int messagetextnum = 0
    
    if EconomyHold.FactionFoodExport[0] > 0
        TradeCities[messagetextnum].ForceLocationTo(CS_OurFactionLoc)
        AgreementResources[messagetextnum].ForceRefTo(ResourceFood)
        AgreementTexts[messagetextnum].ForceRefTo(TextExport)
        messagetextnum += 1
    endif

    if EconomyHold.FactionWoodExport[0] > 0
        TradeCities[messagetextnum].ForceLocationTo(CS_OurFactionLoc)
        AgreementResources[messagetextnum].ForceRefTo(ResourceWood)
        AgreementTexts[messagetextnum].ForceRefTo(TextExport)
        messagetextnum += 1
    endif
    
    if EconomyHold.FactionMetalExport[0] > 0
        TradeCities[messagetextnum].ForceLocationTo(CS_OurFactionLoc)
        AgreementResources[messagetextnum].ForceRefTo(ResourceMetal)
        AgreementTexts[messagetextnum].ForceRefTo(TextExport)
        messagetextnum += 1
    endif
    
    if EconomyHold.FactionFoodImport[0] > 0
        TradeCities[messagetextnum].ForceLocationTo(CS_OurFactionLoc)
        AgreementResources[messagetextnum].ForceRefTo(ResourceFood)
        AgreementTexts[messagetextnum].ForceRefTo(TextImport)
        messagetextnum += 1
    endif

    if EconomyHold.FactionWoodImport[0] > 0
        TradeCities[messagetextnum].ForceLocationTo(CS_OurFactionLoc)
        AgreementResources[messagetextnum].ForceRefTo(ResourceWood)
        AgreementTexts[messagetextnum].ForceRefTo(TextImport)
        messagetextnum += 1
    endif
    
    if EconomyHold.FactionMetalImport[0] > 0
        TradeCities[messagetextnum].ForceLocationTo(CS_OurFactionLoc)
        AgreementResources[messagetextnum].ForceRefTo(ResourceMetal)
        AgreementTexts[messagetextnum].ForceRefTo(TextImport)
        messagetextnum += 1
    endif
    
    if EconomyHold.FactionFoodExport[1] > 0
        TradeCities[messagetextnum].ForceLocationTo(CS_TroopsAndMovementsDataImperial)
        AgreementResources[messagetextnum].ForceRefTo(ResourceFood)
        AgreementTexts[messagetextnum].ForceRefTo(TextExport)
        messagetextnum += 1
    endif
    
    if EconomyHold.FactionFoodExport[2] > 0
        TradeCities[messagetextnum].ForceLocationTo(CS_TroopsAndMovementsDataSons)
        AgreementResources[messagetextnum].ForceRefTo(ResourceFood)
        AgreementTexts[messagetextnum].ForceRefTo(TextExport)
        messagetextnum += 1
    endif
    
    if EconomyHold.FactionEquipmentExport[1] > 0
        TradeCities[messagetextnum].ForceLocationTo(CS_TroopsAndMovementsDataImperial)
        AgreementResources[messagetextnum].ForceRefTo(ResourceEquipment)
        AgreementTexts[messagetextnum].ForceRefTo(TextExport)
        messagetextnum += 1
    endif
    
    if EconomyHold.FactionEquipmentExport[2] > 0
        TradeCities[messagetextnum].ForceLocationTo(CS_TroopsAndMovementsDataSons)
        AgreementResources[messagetextnum].ForceRefTo(ResourceEquipment)
        AgreementTexts[messagetextnum].ForceRefTo(TextExport)
        messagetextnum += 1
    endif
            
    i = 0
    while i < CS_AllUpgradeLocations.GetSize()
        if i != citynum
            if EconomyHold.FoodImport[i] > 0
                TradeCities[messagetextnum].ForceLocationTo(CS_AllUpgradeLocations.GetAt(i) as Location)
                AgreementResources[messagetextnum].ForceRefTo(ResourceFood)
                AgreementTexts[messagetextnum].ForceRefTo(TextImport)
                messagetextnum += 1
            endif
            
            if EconomyHold.FoodExport[i] > 0
                TradeCities[messagetextnum].ForceLocationTo(CS_AllUpgradeLocations.GetAt(i) as Location)
                AgreementResources[messagetextnum].ForceRefTo(ResourceFood)
                AgreementTexts[messagetextnum].ForceRefTo(TextExport)
                messagetextnum += 1
            endif
            
            if EconomyHold.WoodImport[i] > 0
                TradeCities[messagetextnum].ForceLocationTo(CS_AllUpgradeLocations.GetAt(i) as Location)
                AgreementResources[messagetextnum].ForceRefTo(ResourceWood)
                AgreementTexts[messagetextnum].ForceRefTo(TextImport)
                messagetextnum += 1
            endif
            
            if EconomyHold.WoodExport[i] > 0
                TradeCities[messagetextnum].ForceLocationTo(CS_AllUpgradeLocations.GetAt(i) as Location)
                AgreementResources[messagetextnum].ForceRefTo(ResourceWood)
                AgreementTexts[messagetextnum].ForceRefTo(TextExport)
                messagetextnum += 1
            endif
            
            if EconomyHold.MetalImport[i] > 0
                TradeCities[messagetextnum].ForceLocationTo(CS_AllUpgradeLocations.GetAt(i) as Location)
                AgreementResources[messagetextnum].ForceRefTo(ResourceMetal)
                AgreementTexts[messagetextnum].ForceRefTo(TextImport)
                messagetextnum += 1
            endif
            
            if EconomyHold.MetalExport[i] > 0
                TradeCities[messagetextnum].ForceLocationTo(CS_AllUpgradeLocations.GetAt(i) as Location)
                AgreementResources[messagetextnum].ForceRefTo(ResourceMetal)
                AgreementTexts[messagetextnum].ForceRefTo(TextExport)
                messagetextnum += 1
            endif
        endif
        i += 1
    endwhile
EndFunction