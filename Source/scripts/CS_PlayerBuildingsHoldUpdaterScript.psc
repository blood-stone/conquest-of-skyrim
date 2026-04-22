Scriptname CS_PlayerBuildingsHoldUpdaterScript extends Quest  

;Farm
int Property FarmLevel Auto
int Property FarmWorkers Auto
int Property FoodChange Auto

;Lumber Mill
int Property LumberMillLevel Auto
int Property LumberMillWorkers Auto
int Property WoodChange Auto

;Mine
int Property MineLevel Auto
int Property MineWorkers Auto
int Property MetalChange Auto

int Property WorkerSalary Auto

CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto

Function UpdateResources()
    FoodChange = math.floor(FarmWorkers*((self as Quest) as CS_EconomyHoldUpdaterNewScript).InitialFoodChange as float)
    WoodChange = math.floor(LumberMillWorkers*((self as Quest) as CS_EconomyHoldUpdaterNewScript).InitialWoodChange as float)
    MetalChange = math.floor(MineWorkers*((self as Quest) as CS_EconomyHoldUpdaterNewScript).InitialMetalChange as float)
    
    ExportResources()
EndFunction

Function ExportResources()
    CS_EconomyHoldUpdaterNewScript EconomyHold = ((self as Quest) as CS_EconomyHoldUpdaterNewScript)
    EconomyHold.PlayerFood = FoodChange
    EconomyHold.PlayerWood = WoodChange
    EconomyHold.PlayerMetal = MetalChange
EndFunction

int Function GetBuildingRevenue()
    CS_EconomyHoldUpdaterNewScript EconomyHold = ((self as Quest) as CS_EconomyHoldUpdaterNewScript)
    
    UpdateResources()
    
    int revenue = EconomyHold.FoodCost*FoodChange + EconomyHold.WoodCost*WoodChange + EconomyHold.MetalCost*MetalChange
    
    return revenue
EndFunction

Function UpgradeBuilding(string type)
    if type == "Farm"
        FarmLevel += 1
    elseif type == "LumberMill"
        LumberMillLevel += 1
    elseif type == "Mine"
        MineLevel += 1
    endif
EndFunction

Function HireWorker(string type)
    CS_EconomyHoldUpdaterNewScript EconomyHold = ((self as Quest) as CS_EconomyHoldUpdaterNewScript)
    if type == "Farm"
        FarmWorkers += 1
    elseif type == "LumberMill"
        LumberMillWorkers += 1
    elseif type == "Mine"
        MineWorkers += 1
    endif
    
    EconomyHold.Unemployed -= 1
EndFunction