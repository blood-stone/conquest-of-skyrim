Scriptname CS_CityManagementEconomy extends ObjectReference  

import CS_CommonFunctions

; Base Production
ObjectReference[] Property BuildingsFarms Auto
ObjectReference[] Property BuildingsHunting Auto
ObjectReference[] Property BuildingsFishing Auto
ObjectReference[] Property BuildingsLoggingCamps Auto
ObjectReference[] Property BuildingsMines Auto

;Refining
ObjectReference[] Property BuildingsLumberMills Auto
ObjectReference[] Property BuildingsTanneries Auto
ObjectReference[] Property BuildingsSmelters Auto
ObjectReference[] Property BuildingsCookeries Auto

;Crafting
ObjectReference[] Property BuildingsBlacksmiths Auto

;Military
ObjectReference[] Property BuildingsGuardPosts Auto

ObjectReference[] Property BuildingsShops Auto

ObjectReference[] Property InitialSatelliteSettlements Auto

ActorBase Property CS_StorageFoodCity Auto
ActorBase Property CS_StorageMaterialsCity Auto
ActorBase Property CS_StorageEquipmentCity Auto
ActorBase Property CS_StorageFoodReservesActor Auto
ActorBase Property CS_StorageTax Auto
ActorBase Property CS_StorageWage Auto
ActorBase Property CS_StorageEquipmentWorkers Auto

ObjectReference Property StorageFood Auto hidden
ObjectReference Property StorageFoodReserves Auto hidden
ObjectReference Property StorageMaterials Auto hidden
ObjectReference Property StorageEquipment Auto hidden
ObjectReference Property StorageEquipmentWorkers Auto hidden
ObjectReference Property StorageTax Auto hidden
ObjectReference Property StorageWage Auto hidden

int Property IsSettlement Auto

float Property IncomeTaxRate Auto hidden
int Property HousingTax Auto hidden

int Property TotalIncomeTax Auto hidden
int Property TotalWages Auto hidden

GlobalVariable Property GameDaysPassed Auto

int Property ResourceChangeFarmFood Auto
int Property ResourceChangeHuntingFood Auto
int Property ResourceChangeHuntingMaterials Auto
int Property ResourceChangeFishingFood Auto
int Property ResourceChangeMineMaterials Auto
int Property ResourceChangeLumberMaterials Auto

float Property LastDailyUpdate Auto

; Set Up Functions ---------------------------

Function SetUp()
    string holdnum = ((self as ObjectReference) as CS_CityManagementOwnership).VanillaCity.GetName()
    ResourceChangeFarmFood = 5
    ResourceChangeHuntingFood  = 5
    ResourceChangeHuntingMaterials  = 5
    ResourceChangeFishingFood  = 5
    ResourceChangeMineMaterials  = 5
    ResourceChangeLumberMaterials = 5
    IncomeTaxRate = 0.1
    HousingTax = 10 ;TEST!!!
    debug.trace("City " + holdnum + " setting up storage...")
    SetUpStorage()
    debug.trace("City " + holdnum + " setting up initial buildings...")
    debug.trace("City " + holdnum + " setting up farms...")
    SetUpInitialBuildings(BuildingsFarms)
    debug.trace("City " + holdnum + " setting up hunting...")
    SetUpInitialBuildings(BuildingsHunting)
    debug.trace("City " + holdnum + " setting up fishing...")
    SetUpInitialBuildings(BuildingsFishing)
    debug.trace("City " + holdnum + " setting up LoggingCamps...")
    SetUpInitialBuildings(BuildingsLoggingCamps)
    debug.trace("City " + holdnum + " setting up mines...")
    SetUpInitialBuildings(BuildingsMines)
    WaitForBaseProductionSetUp()
    debug.trace("City " + holdnum + " setting up mills...")
    SetUpInitialBuildings(BuildingsLumberMills)
    debug.trace("City " + holdnum + " setting up Tanneries...")
    SetUpInitialBuildings(BuildingsTanneries)
    debug.trace("City " + holdnum + " setting up Smelters...")
    SetUpInitialBuildings(BuildingsSmelters)
    debug.trace("City " + holdnum + " setting up Cookeries...")
    SetUpInitialBuildings(BuildingsSmelters)
    WaitForRefiningSetUp()
    debug.trace("City " + holdnum + " setting up blacksmiths...")
    SetUpInitialBuildings(BuildingsBlacksmiths)
    WaitForCraftingSetUp()
    
    ((self as ObjectReference) as CS_CityManagementPopulation).SetUp()
    GoToState("SetUp")
EndFunction
    
Function SetUpInitialBuildings(ObjectReference[] BuildingType)
    int i = 0
    while i < BuildingType.Length
        ObjectReference BuildingContainer = BuildingType[i]
        if BuildingContainer && (BuildingContainer as CS_BuildingManagementScript)
            (BuildingContainer as CS_BuildingManagementScript).City = self as ObjectReference
            (BuildingContainer as CS_BuildingManagementScript).GoToState("NotSetUp")
            (BuildingContainer as CS_BuildingManagementScript).RegisterForSingleUpdate(0.1)
        else
            return
        endif
        i += 1
    endwhile
EndFunction

Function WaitForSetUp(ObjectReference[] BuildingType)
    int i = 0
    while i < BuildingType.Length
        int loopnum = 0
        CS_BuildingManagementScript BuildingScript = (BuildingType[i] as CS_BuildingManagementScript)
        while BuildingScript.GetState() != "SetUp" && loopnum < 50
            utility.wait(0.1)
            loopnum += 1
        endwhile
        i += 1
    endwhile
EndFunction

Function WaitForBaseProductionSetUp()

    WaitForSetUp(BuildingsFarms)
    WaitForSetUp(BuildingsHunting)
    WaitForSetUp(BuildingsFishing)
    WaitForSetUp(BuildingsLoggingCamps)
    WaitForSetUp(BuildingsMines)
    
EndFunction

Function WaitForRefiningSetUp()

    WaitForSetUp(BuildingsLumberMills)
    WaitForSetUp(BuildingsTanneries)
    WaitForSetUp(BuildingsSmelters)
    WaitForSetUp(BuildingsCookeries)
    
EndFunction

Function WaitForCraftingSetUp()

    WaitForSetUp(BuildingsBlacksmiths)
    
EndFunction

; Production -------------------------------------------------

Function AddBaseProduction()

    AddResourceProduction(BuildingsFarms)
    AddResourceProduction(BuildingsHunting)
    AddResourceProduction(BuildingsFishing)
    AddResourceProduction(BuildingsLoggingCamps)
    AddResourceProduction(BuildingsMines)
    
EndFunction

Function AddRefining()
    AddResourceProduction(BuildingsLumberMills)
    AddResourceProduction(BuildingsTanneries)
    AddResourceProduction(BuildingsSmelters)
    AddResourceProduction(BuildingsCookeries)
EndFunction

Function AddCrafting()
    AddResourceProduction(BuildingsBlacksmiths)
EndFunction

Function AddResourceProduction(ObjectReference[] BuildingType)
    int i = 0
    while i < BuildingType.Length
        ObjectReference BuildingContainer = BuildingType[i]
        CS_BuildingManagementScript BuildingScript = BuildingContainer as CS_BuildingManagementScript
        if BuildingScript
            BuildingScript.GoToState("Update")
            BuildingScript.RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
EndFunction

Function WaitForResourceProduction(ObjectReference[] BuildingType)
    int i = 0
    while i < BuildingType.Length
        int loopnum = 0
        CS_BuildingManagementScript BuildingScript = (BuildingType[i] as CS_BuildingManagementScript)
        while BuildingScript.GetState() != "Updated" && loopnum < 50
            utility.wait(0.1)
            string holdnum = ((self as ObjectReference) as CS_CityManagementOwnership).VanillaCity.GetName()
            debug.trace(holdnum + " Waiting for Resource Production")
            loopnum += 1
        endwhile
        i += 1
    endwhile
EndFunction

Function WaitForBaseProduction()

    WaitForResourceProduction(BuildingsFarms)
    WaitForResourceProduction(BuildingsHunting)
    WaitForResourceProduction(BuildingsFishing)
    WaitForResourceProduction(BuildingsLoggingCamps)
    WaitForResourceProduction(BuildingsMines)
    
EndFunction

Function WaitForRefining()

    WaitForResourceProduction(BuildingsLumberMills)
    WaitForResourceProduction(BuildingsTanneries)
    WaitForResourceProduction(BuildingsSmelters)
    WaitForResourceProduction(BuildingsCookeries)
    
EndFunction

Function WaitForCrafting()

    WaitForResourceProduction(BuildingsBlacksmiths)
    
EndFunction

; Buildings --------------------------------------------

Function AddBuilding(ObjectReference Building, string BuildingType)
    debug.trace("Adding " + Building.GetBaseObject().GetName() + " to array")
    
    if BuildingType == "Farm"
        BuildingsFarms = AddToArray(Building, BuildingsFarms)
    elseif BuildingType == "Hunting"
        BuildingsHunting = AddToArray(Building, BuildingsHunting)
    elseif BuildingType == "Fishing"
        BuildingsFishing = AddToArray(Building, BuildingsFishing)
    elseif BuildingType == "LoggingCamp"
        BuildingsLoggingCamps = AddToArray(Building, BuildingsLoggingCamps)
    elseif BuildingType == "Mine"
        BuildingsMines = AddToArray(Building, BuildingsMines)
    elseif BuildingType == "LumberMill"
        BuildingsLumberMills = AddToArray(Building, BuildingsLumberMills)
    elseif BuildingType == "Tannery"
        BuildingsTanneries = AddToArray(Building, BuildingsTanneries)
    elseif BuildingType == "Smelter"
        BuildingsSmelters = AddToArray(Building, BuildingsSmelters)
    elseif BuildingType == "Cookery"
        BuildingsSmelters = AddToArray(Building, BuildingsCookeries)
    elseif BuildingType == "Blacksmith"
        BuildingsBlacksmiths = AddToArray(Building, BuildingsBlacksmiths)
    elseif BuildingType == "GuardPost"
        BuildingsGuardPosts = AddToArray(Building, BuildingsGuardPosts)
    endif
    ;SetInfrastructureMaintenanceTrade()
    
    ;(Building as CS_BuildingScriptOwnership).ChangeFactionOwner(self as ObjectReference)
    debug.trace(Building.GetBaseObject().GetName() + " added to array")
EndFunction

Function RemoveBuilding(ObjectReference Building)
    debug.trace("Removing " + Building.GetBaseObject().GetName() + " from array")
    if BuildingsFarms.Find(Building) >= 0
        BuildingsFarms = RemoveFromArray(Building, BuildingsFarms)
    elseif BuildingsHunting.Find(Building) >= 0
        BuildingsHunting = RemoveFromArray(Building, BuildingsHunting)
    elseif BuildingsFishing.Find(Building) >= 0
        BuildingsFishing = RemoveFromArray(Building, BuildingsFishing)
    elseif BuildingsLoggingCamps.Find(Building) >= 0
        BuildingsLoggingCamps = RemoveFromArray(Building, BuildingsLoggingCamps)
    elseif BuildingsMines.Find(Building) >= 0
        BuildingsMines = RemoveFromArray(Building, BuildingsMines)
    elseif BuildingsLumberMills.Find(Building) >= 0
        BuildingsLumberMills = RemoveFromArray(Building, BuildingsLumberMills)
    elseif BuildingsTanneries.Find(Building) >= 0
        BuildingsTanneries = RemoveFromArray(Building, BuildingsTanneries)
    elseif BuildingsSmelters.Find(Building) >= 0
        BuildingsSmelters = RemoveFromArray(Building, BuildingsSmelters)
    elseif BuildingsCookeries.Find(Building) >= 0
        BuildingsCookeries = RemoveFromArray(Building, BuildingsCookeries)
    elseif BuildingsBlacksmiths.Find(Building) >= 0
        BuildingsBlacksmiths = RemoveFromArray(Building, BuildingsBlacksmiths)
    elseif BuildingsGuardPosts.Find(Building) >= 0
        BuildingsGuardPosts = RemoveFromArray(Building, BuildingsGuardPosts)
    endif
    ;/
    if ((self as ObjectReference) as CS_CityManagementPopulation).WorkerPriorityBuilding == Building
        ((self as ObjectReference) as CS_CityManagementPopulation).WorkerPriorityBuilding = None
    endif/;
    ;SetInfrastructureMaintenanceTrade()
    debug.trace(Building.GetBaseObject().GetName() + " removed from array")
EndFunction

Function SetAllCraftingSources()
    
    SetCraftingIncomeSourcesBuildingType(BuildingsLumberMills)
    SetCraftingIncomeSourcesBuildingType(BuildingsTanneries)
    SetCraftingIncomeSourcesBuildingType(BuildingsSmelters)
    SetCraftingIncomeSourcesBuildingType(BuildingsCookeries)
    SetCraftingIncomeSourcesBuildingType(BuildingsBlacksmiths)
    
EndFunction

Function SetCraftingIncomeSourcesBuildingType(ObjectReference[] BuildingType)
    int i = 0
    while i < BuildingType.Length
        (BuildingType[i] as CS_BuildingManagementScript).SetCraftingIncomeSources()
        i += 1
    endwhile
EndFunction

; Workers -----------------------------------

Function GetTotalWages()
    int Wages
    
    Wages += GetBuildingWages(BuildingsFarms)
    Wages += GetBuildingWages(BuildingsHunting)
    Wages += GetBuildingWages(BuildingsFishing)
    Wages += GetBuildingWages(BuildingsLoggingCamps)
    Wages += GetBuildingWages(BuildingsMines)
    
    Wages += GetBuildingWages(BuildingsLumberMills)
    Wages += GetBuildingWages(BuildingsTanneries)
    Wages += GetBuildingWages(BuildingsSmelters)
    Wages += GetBuildingWages(BuildingsCookeries)
    
    Wages += GetBuildingWages(BuildingsBlacksmiths)
    
    TotalWages = Wages
    SetTotalIncomeTax()
EndFunction

int Function GetBuildingWages(ObjectReference[] BuildingType)
    int Wages
    int i = 0
    while i < BuildingType.Length
        Wages += (BuildingType[i] as CS_BuildingManagementScript).TotalWages
        i += 1
    endwhile
    
    return Wages
EndFunction

int Function GetBuildingIncomeTax(ObjectReference[] BuildingType)
    int IncomeTax
    int i = 0
    while i < BuildingType.Length
        IncomeTax += (BuildingType[i] as CS_BuildingManagementScript).TotalIncomeTax
        i += 1
    endwhile
    
    return IncomeTax
EndFunction

Function SetTotalIncomeTax()
    TotalIncomeTax = math.floor(IncomeTaxRate*TotalWages)
EndFunction

int Function SetBuildingIncomeTax(ObjectReference[] BuildingType)
    int IncomeTax
    int i = 0
    while i < BuildingType.Length
        (BuildingType[i] as CS_BuildingManagementScript).SetTotalIncomeTax()
        IncomeTax += (BuildingType[i] as CS_BuildingManagementScript).TotalIncomeTax
        i += 1
    endwhile
    return IncomeTax
EndFunction

; Storage -------------------------------------------------------

Function SetUpStorage()
    ObjectReference FactionOwner = ((self as ObjectReference) as CS_CityManagementOwnership).FactionOwnerActivator
    StorageFood = (FactionOwner as CS_FactionManagementEconomy).StorageFood
    StorageMaterials = (FactionOwner as CS_FactionManagementEconomy).StorageMaterials
    StorageEquipment = (FactionOwner as CS_FactionManagementEconomy).StorageEquipment
    
    StorageFoodReserves = PlaceAtMe(CS_StorageFoodReservesActor)
    (StorageFoodReserves as CS_StorageFoodReserves).SetUp(self as ObjectReference)
    
    StorageEquipmentWorkers = PlaceAtMe(CS_StorageEquipmentWorkers)
    (StorageEquipmentWorkers as CS_StorageEquipmentWorkersScript).City = self as ObjectReference
    
    StorageTax = PlaceAtMe(CS_StorageTax)
    (StorageTax as CS_StorageTaxScript).SetUp(self as ObjectReference)
    
    StorageWage = PlaceAtMe(CS_StorageWage)
    (StorageWage as CS_StorageWageScript).SetUp(self as ObjectReference)
EndFunction

Function UpdateStorage()
    (StorageFoodReserves as CS_StorageFoodReserves).GoToState("InitiateConsumption")
    (StorageFoodReserves as CS_StorageFoodReserves).RegisterForSingleUpdate(0.1)
    
    (StorageWage as CS_StorageWageScript).CollectWages()
    
    (StorageTax as CS_StorageTaxScript).GoToState("DailyUpdate")
    (StorageTax as CS_StorageTaxScript).RegisterForSingleUpdate(0.1)
EndFunction

; States and Events ------------------------------------------------------
    
Auto State NotSetUp
    
EndState

State StartSetUp

    Event OnUpdate()
        debug.trace("Starting city " + ((self as ObjectReference) as CS_CityManagementOwnership).VanillaCity.GetName() + " economy set up...")
        SetUp()
        debug.trace("City " + ((self as ObjectReference) as CS_CityManagementOwnership).VanillaCity.GetName() + " economy SET UP!")
    EndEvent
    
EndState

State Hourly
    
    Event OnUpdate()
        if !((self as ObjectReference) as CS_CityManagementPopulation).UnitActivated
            AddBaseProduction()
            WaitForBaseProduction()
            AddRefining()
            WaitForRefining()
            AddCrafting()
        endif
        GoToState("Updated")
    EndEvent
    
EndState

State Daily
    
    Event OnUpdate()
        if !((self as ObjectReference) as CS_CityManagementPopulation).UnitActivated
            AddBaseProduction()
            WaitForBaseProduction()
            AddRefining()
            WaitForRefining()
            AddCrafting()
        endif
        UpdateStorage()
        GoToState("Updated")
    EndEvent
    
EndState