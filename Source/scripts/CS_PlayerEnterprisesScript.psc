Scriptname CS_PlayerEnterprisesScript extends Quest conditional

LocationAlias Property City Auto
ReferenceAlias Property EnterpriseType Auto
ReferenceAlias Property Resource Auto

int Property citynum Auto

FormList Property CS_AllLocations Auto

MiscObject Property Gold001 Auto

ObjectReference[] Property EnterpriseTypes Auto
ObjectReference[] Property ResourceTypes Auto

Message Property CS_EnterpriseMenuStart Auto
Message Property CS_EnterpriseMenuWorkers Auto
Message Property CS_EnterpriseMenuUpgrade Auto

GlobalVariable Property CS_EnterpriseUpgradeCostWood Auto
GlobalVariable Property CS_EnterpriseUpgradeCostCoin Auto

int Property PlayerEnterprises Auto conditional
int Property InfluenceJarl Auto conditional
int Property Level Auto conditional
int Property Workers Auto conditional
int Property WorkersAvailable Auto conditional
int Property Unemployed Auto conditional

int Property ResourceChange Auto

string Property type Auto

CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto
CS_EconomyHoldUpdaterNewScript Property EconomyHold Auto
CS_EconomyFactionUpdaterNewScript Property EconomyPlayer Auto
CS_PlayerBuildingsHoldUpdaterScript Property PlayerBuildingsHold Auto

Function SetUp()
    citynum = CS_AllLocations.Find(City.GetLocation())
    EconomyHold = CS_EconomyUpdaterNew.EconomyHoldUpdaters[citynum]
    PlayerBuildingsHold = CS_EconomyUpdaterNew.PlayerBuildingsUpdaters[citynum]
    PlayerBuildingsHold.UpdateResources()
    PlayerEnterprises = 0
    Unemployed = EconomyHold.Unemployed
    InfluenceJarl = ((EconomyHold as Quest) as CS_InfluenceHoldUpdaterScript).InfluenceJarl
    
    if PlayerBuildingsHold.FarmLevel > 0
        PlayerEnterprises += 1
        EnterpriseType.ForceRefTo(EnterpriseTypes[1])
        Resource.ForceRefTo(ResourceTypes[1])
        type = "Farm"
        Level = PlayerBuildingsHold.FarmLevel
        ResourceChange = PlayerBuildingsHold.FoodChange
        Workers = PlayerBuildingsHold.FarmWorkers
    endif
    
    if PlayerBuildingsHold.LumbermillLevel > 0
        PlayerEnterprises += 1
        EnterpriseType.ForceRefTo(EnterpriseTypes[2])
        Resource.ForceRefTo(ResourceTypes[2])
        type = "LumberMill"
        Level = PlayerBuildingsHold.LumberMillLevel
        ResourceChange = PlayerBuildingsHold.WoodChange
        Workers = PlayerBuildingsHold.LumberMillWorkers
    endif
    
    if PlayerBuildingsHold.MineLevel > 0
        PlayerEnterprises += 1
        EnterpriseType.ForceRefTo(EnterpriseTypes[3])
        Resource.ForceRefTo(ResourceTypes[3])
        type = "Mine"
        Level = PlayerBuildingsHold.MineLevel
        ResourceChange = PlayerBuildingsHold.MetalChange
        Workers = PlayerBuildingsHold.MineWorkers
    endif
    
    WorkersAvailable = Level - Workers
EndFunction

Function StartEnterprise()
    PlayerBuildingsHold.UpgradeBuilding(type)
    PlayerBuildingsHold.WorkerSalary = 50
    if EconomyPlayer.CoinReserve >= 5000
        EconomyPlayer.SpendResource("Coin", 5000)
    else
        Game.GetPlayer().RemoveItem(Gold001, 5000)
    endif
    SetUp()
EndFunction

Function EnterpriseMenuStart(int Response = 0)
    SetUp()
    int Revenue = PlayerBuildingsHold.GetBuildingRevenue()
    int TotalWorkerSalaries = Workers*PlayerBuildingsHold.WorkerSalary
    int TotalProfit = Revenue - TotalWorkerSalaries
    Response = CS_EnterpriseMenuStart.show(Level, ResourceChange, Revenue, Workers, 0 - TotalWorkerSalaries, TotalProfit)
    if Response == 0
        EnterpriseMenuUpgrade()
    elseif Response == 1
        EnterpriseMenuWorkers()
    endif
EndFunction

Function EnterpriseMenuUpgrade(int Response = 0)
    int Treasury = EconomyPlayer.CoinReserve
    int WoodReserve = EconomyPlayer.WoodReserve
    int NextLevel = Level + 1
    CS_EnterpriseUpgradeCostCoin.SetValue(2000*NextLevel)
    Response = CS_EnterpriseMenuUpgrade.show(Level, Treasury, NextLevel, CS_EnterpriseUpgradeCostCoin.GetValue())
    if Response == 0
        if EconomyPlayer.CoinReserve >= CS_EnterpriseUpgradeCostCoin.GetValue()
            EconomyPlayer.SpendResource("Coin", CS_EnterpriseUpgradeCostCoin.GetValueInt())
        else
            Game.GetPlayer().RemoveItem(Gold001, CS_EnterpriseUpgradeCostCoin.GetValueInt())
        endif
        PlayerBuildingsHold.UpgradeBuilding(type)
    endif
    EnterpriseMenuStart()
EndFunction

Function EnterpriseMenuWorkers(int Response = 0)
    int WorkerSalary = PlayerBuildingsHold.WorkerSalary
    int TotalWorkerSalaries = Workers*WorkerSalary
    Response = CS_EnterpriseMenuWorkers.show(Unemployed, Workers, Level, WorkerSalary, TotalWorkerSalaries)
    if Response == 0
        PlayerBuildingsHold.HireWorker(type)
        SetUp()
        EnterpriseMenuWorkers()
    elseif Response == 2
        EnterpriseMenuStart()
    endif
EndFunction

Event OnStoryChangeLocation(ObjectReference akActor, Location akOldLocation, Location akNewLocation)
    SetUp()
EndEvent