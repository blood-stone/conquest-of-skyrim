Scriptname CS_BuildingManagementScript extends ObjectReference  

import CS_CommonFunctions

Location Property VanillaLocation Auto

ObjectReference Property City Auto hidden
ObjectReference Property ToolInventory Auto hidden
ObjectReference Property InputChest Auto hidden
ObjectReference[] Property InputChests Auto hidden

LeveledItem Property OutputFood Auto
LeveledItem Property OutputMaterials Auto
LeveledItem Property OutputEquipment Auto

FormList Property OutputFoodList Auto
FormList Property OutputMaterialsList Auto
FormList Property OutputEquipmentList Auto

FormList Property CraftingTypes Auto
CS_CraftingResourcesScript Property CraftingType Auto ;recipe the player can choose to determine what to craft
FormList Property CraftingTypeTexts Auto
FormList Property CraftingOptions Auto
Form[] Property CraftingSelections Auto
int Property CraftingOutput Auto

Container Property CS_BuildingManagementCraftingChest Auto

Location Property BuildingTypeText Auto
Location Property BuildingStationText Auto
Location Property InputsText Auto
Location Property OutputsText Auto
Location Property CraftingTypeText Auto

GlobalVariable Property GameDaysPassed Auto

Actor[] Property WorkerActors Auto
Faction Property WorkerFaction Auto
Outfit Property WorkerOutfit Auto
Weapon Property WorkerTool Auto

Activator Property StationPlacement Auto

FormList Property ConstructionCosts Auto
CS_ConstructionCostScript Property UpgradeCost Auto

ObjectReference[] Property StationRefs Auto

int Property Workers Auto hidden
int Property Level Auto
int Property Wage Auto hidden
int Property TotalWages Auto hidden
int Property TotalIncomeTax Auto hidden
int Property Stations Auto hidden

ObjectReference Property IndoorJobMarker Auto

float NextProductionAmountFood
float NextProductionAmountMaterials
float NextProductionAmountEquipment

float LastUpdate
float ToolModifier

string Property BuildingType Auto

CS_BuildingManagementMenu Property CS_BuildingManagementReport Auto

Function SetUp()
    debug.trace(VanillaLocation.GetName() + ": Setting up " + BuildingType);/
    if OutputFoodList
        ObjectReference Storage = GetStorageDestination("Food")
        (Storage as CS_StorageFactionScript).AddToIncomeSources(self as ObjectReference, OutputFoodList)
    endif
    
    if OutputMaterialsList
        ObjectReference Storage = GetStorageDestination("Materials")
        (Storage as CS_StorageFactionScript).AddToIncomeSources(self as ObjectReference, OutputMaterialsList)
    endif
    
    if OutputEquipmentList
        ObjectReference Storage = GetStorageDestination("Equipment")
        (Storage as CS_StorageFactionScript).AddToIncomeSources(self as ObjectReference, OutputEquipmentList)
    endif/;
    
    if CraftingType
        InputChest = City.PlaceAtMe(CS_BuildingManagementCraftingChest)
        (InputChest as CS_BuildingManagementCraftingScript).Building = self
        (InputChest as CS_BuildingManagementCraftingScript).StorageFood = GetStorageDestination("Food")
        (InputChest as CS_BuildingManagementCraftingScript).StorageMaterials = GetStorageDestination("Materials")
        (InputChest as CS_BuildingManagementCraftingScript).StorageEquipment = GetStorageDestination("Equipment")
        ;/(InputChest as CS_BuildingManagementCraftingScript).CraftingResultsMaterials = CS_CraftingResultsListMaterials.GetAt(0) as LeveledItem
        (InputChest as CS_BuildingManagementCraftingScript).CraftingResultsEquipment = CS_CraftingResultsListEquipment.GetAt(0) as LeveledItem/;
    endif
    ;SetCraftingIncomeSources()
    
    Wage = 100
    
    if StationPlacement
        Level = 1
        Stations = 0
    else
        Stations = Level
        (City as CS_CityManagementPopulation).MaxWorkers += Level
    endif
    LastUpdate = GameDaysPassed.GetValue()
    EnableNoWait()
EndFunction

Function SetCraftingIncomeSources()
    if CraftingType
        (InputChest as CS_BuildingManagementCraftingScript).CraftingType = CraftingType
        ObjectReference StorageDestination = GetStorageDestination(CraftingType.OutputType)
        (StorageDestination as CS_StorageFactionScript).AddToIncomeSourcesCrafting(self as ObjectReference, CraftingType.Outputs, CraftingType.Inputs)
    elseif CraftingTypes
        int i = 0
        while i < CraftingTypes.GetSize()
            CS_CraftingResourcesScript SpecificCraftingType = CraftingTypes.GetAt(i) as CS_CraftingResourcesScript
            ObjectReference StorageDestination = GetStorageDestination(SpecificCraftingType.OutputType)
            (StorageDestination as CS_StorageFactionScript).AddToIncomeSourcesCrafting(self as ObjectReference, SpecificCraftingType.Outputs, SpecificCraftingType.Inputs)
            i += 1
        endwhile
    endif
EndFunction

; Workers --------------------------------------

Function UpgradeBuilding()
    Level += 1
    if !StationPlacement
        Stations += 1
        (City as CS_CityManagementPopulation).MaxWorkers += 1
    endif
EndFunction

Function SetUpNewStation()
    ObjectReference NewStation = PlaceNewStation()
    if NewStation
        Stations += 1
        (City as CS_CityManagementPopulation).MaxWorkers += 1
        StationRefs = AddToArray(NewStation, StationRefs)
    endif
EndFunction

ObjectReference Function PlaceNewStation()
    ObjectReference BuildingPlacement = Game.GetPlayer().PlaceAtMe(StationPlacement, abinitiallyDisabled=true)
    ObjectReference NewBuilding = (BuildingPlacement as CS_PlaceObject).BeginPlacement(VanillaLocation)
    
    if NewBuilding
        BuildingPlacement.disable()
        BuildingPlacement.delete()
        NewBuilding.EnableNoWait()
        if NewBuilding as CS_BuildingPlacementScript
            (NewBuilding as CS_BuildingPlacementScript).PlaceBuilding()
        endif
        return NewBuilding
    else
        return None
    endif
EndFunction

Function HireWorker()
    CS_CityManagementPopulation PopulationScript = City as CS_CityManagementPopulation
    CS_CityManagementEconomy EconomyScript = City as CS_CityManagementEconomy
    
    if PopulationScript.Unemployed > 0
        if EconomyScript.IsSettlement
            Actor NewWorker = PopulationScript.GetUnemployedSettlerForJob()
            if NewWorker
                WorkerActors = AddToActorArray(NewWorker, WorkerActors)
                ((NewWorker as ObjectReference) as CS_SettlementSettlerScript).SetJob(self as ObjectReference)
                if IndoorJobMarker
                    NewWorker.MoveTo(IndoorJobMarker)
                endif
                NewWorker.AddToFaction(WorkerFaction)
                NewWorker.EvaluatePackage()
                if WorkerOutfit
                    NewWorker.SetOutfit(WorkerOutfit)
                endif
                if WorkerTool && HasTools()
                    NewWorker.AddItem(WorkerTool)
                endif
            endif
        endif
        PopulationScript.Unemployed -= 1
        PopulationScript.TotalWorkers += 1
        Workers += 1
        SetWageAndTaxes()
    endif
EndFunction

Function FireWorker(Actor Worker = None, bool killed=false)
    CS_CityManagementPopulation PopulationScript = City as CS_CityManagementPopulation
    CS_CityManagementEconomy EconomyScript = City as CS_CityManagementEconomy
    
    if EconomyScript.IsSettlement
        if !Worker && WorkerActors
            Worker = WorkerActors[0]
        endif
        
        if Worker
            WorkerActors = RemoveFromActorArray(Worker, WorkerActors)
            ((Worker as ObjectReference) as CS_SettlementSettlerScript).RemoveJob()
            
            if WorkerTool
                Worker.RemoveItem(WorkerTool)
            endif
            
            if !killed
                PopulationScript.UnemploySettler(Worker)
                ((Worker as ObjectReference) as CS_SettlementSettlerScript).ResetOutfit()
                if IndoorJobMarker && Worker.IsInInterior()
                    ObjectReference ExteriorMarker = (City as CS_CityManagementOwnership).HQExteriorMarker
                    Worker.MoveTo(ExteriorMarker)
                endif
                Worker.RemoveFromFaction(WorkerFaction)
                Worker.EvaluatePackage()
            endif
        endif
    endif
    PopulationScript.TotalWorkers -= 1
    Workers -= 1
    SetWageAndTaxes()
EndFunction

bool Function HasTools()
    ObjectReference StorageEquipment = (City as CS_CityManagementEconomy).StorageEquipmentWorkers
    if (StorageEquipment as CS_StorageEquipmentWorkersScript).WorkerEquipmentTier > 0
        return true
    else
        return false
    endif
EndFunction

Function AddWorkerTools()
    int i = 0
    while i < WorkerActors.Length
        if WorkerActors[i].GetItemCount(WorkerTool) == 0
            WorkerActors[i].AddItem(WorkerTool, 1)
        endif
        i += 1
    endwhile
EndFunction

Function RemoveWorkerTools()
    int i = 0
    while i < WorkerActors.Length
        WorkerActors[i].RemoveItem(WorkerTool, 1)
        i += 1
    endwhile
EndFunction

Function SetWageAndTaxes()
    SetTotalWages()
    SetTotalIncomeTax()
    (City as CS_CityManagementEconomy).GetTotalWages()
EndFunction

Function SetTotalIncomeTax()
    float IncomeTaxRate = (City as CS_CityManagementEconomy).IncomeTaxRate
    
    TotalIncomeTax = math.floor(IncomeTaxRate*Workers*Wage) as int
EndFunction

Function SetTotalWages()
    TotalWages = math.floor(Workers*Wage) as int
EndFunction

Function SetWage(int NewWageAmount)
    Wage = NewWageAmount
    SetWageAndTaxes()
EndFunction
; Resource Outputs ------------------------------

int Function GetResourceChange(string ResourceType)
    if BuildingType == "Farm"
        if ResourceType == "Food"
            return (City as CS_CityManagementEconomy).ResourceChangeFarmFood
        endif
    elseif BuildingType == "Hunting"
        if ResourceType == "Food"
            return (City as CS_CityManagementEconomy).ResourceChangeHuntingFood
        elseif ResourceType == "Materials"
            return (City as CS_CityManagementEconomy).ResourceChangeHuntingMaterials
        endif
    elseif BuildingType == "Fishing"
        if ResourceType == "Food"
            return (City as CS_CityManagementEconomy).ResourceChangeFishingFood
        endif
    elseif BuildingType == "Mine"
        if ResourceType == "Materials"
            return (City as CS_CityManagementEconomy).ResourceChangeMineMaterials
        endif
    elseif BuildingType == "LoggingCamp"
        if ResourceType == "Materials"
            return (City as CS_CityManagementEconomy).ResourceChangeLumberMaterials
        endif
    endif
    
    return 0
EndFunction

int Function GetTotalOutput()
    int TotalOutput

    if InputChest
        TotalOutput = CraftingOutput
    else
        if OutputFood
            TotalOutput += GetOutput("Food")
        endif

        if OutputMaterials
            TotalOutput += GetOutput("Materials")
        endif

        if OutputEquipment
            TotalOutput += GetOutput("Equipment")
        endif
    endif
    
    return TotalOutput
EndFunction

int Function GetOutput(string ResourceType)
    int ResourceChangeInt = GetResourceChange(ResourceType)
    int NumOutput
    ObjectReference StorageEquipment = (City as CS_CityManagementEconomy).StorageEquipment
    ToolModifier = 1;(StorageEquipment as CS_StorageCityToolsScript).ToolModifier
    if Workers > 0
        NumOutput = math.ceiling(ToolModifier*Workers*ResourceChangeInt)
    else
        NumOutput = 0
    endif
    
    return NumOutput
EndFunction

ObjectReference Function GetStorageDestination(string type)
    ObjectReference Destination

    if type == "Food"
        Destination = (City as CS_CityManagementEconomy).StorageFood
    elseif type == "Materials"
        Destination = (City as CS_CityManagementEconomy).StorageMaterials
    elseif type == "Equipment"
        Destination = (City as CS_CityManagementEconomy).StorageEquipment
    endif
    
    return Destination
EndFunction

LeveledItem Function GetStorageOutput(string type)
    LeveledItem Output

    if type == "Food"
        Output = OutputFood
    elseif type == "Materials"
        Output = OutputMaterials
    elseif type == "Equipment"
        Output = OutputEquipment
    endif
    
    return Output
EndFunction
    
float Function AddOutputSpecific(string type, float ProductionAmount)
    ObjectReference Destination = GetStorageDestination(type)
    LeveledItem Output = GetStorageOutput(type)
    
    int amounttoadd = math.floor(ProductionAmount)
    ProductionAmount -= amounttoadd
    Destination.AddItem(Output, amounttoadd)
    debug.trace((self as ObjectReference).GetBaseObject().GetName() + " Added " + amounttoadd + " " + Output)
    
    return ProductionAmount
EndFunction

Function AddOutput()
    
    if OutputFood
        int outputamount = GetOutput("Food")
        float adjustedamount = (GameDaysPassed.GetValue() - LastUpdate)*outputamount
        NextProductionAmountFood += adjustedamount
        if NextProductionAmountFood >= 1
            NextProductionAmountFood = AddOutputSpecific("Food", NextProductionAmountFood)
        endif
    endif
    
    if OutputMaterials
        int outputamount = GetOutput("Materials")
        float adjustedamount = (GameDaysPassed.GetValue() - LastUpdate)*outputamount
        NextProductionAmountMaterials += adjustedamount
        if NextProductionAmountMaterials >= 1
            NextProductionAmountMaterials = AddOutputSpecific("Materials", NextProductionAmountMaterials)
        endif
    endif
    
    if OutputEquipment
        int outputamount = GetOutput("Equipment")
        float adjustedamount = (GameDaysPassed.GetValue() - LastUpdate)*outputamount
        NextProductionAmountEquipment += adjustedamount
        if NextProductionAmountEquipment >= 1
            NextProductionAmountEquipment = AddOutputSpecific("Equipment", NextProductionAmountEquipment)
        endif
    endif
    
    LastUpdate = GameDaysPassed.GetValue()
EndFunction

; Crafting ----------------------

Function GetInputMaterials()
    int maxoutput = Workers*Level
    ObjectReference Storage
    CraftingOutput = 0
    
    if CraftingType
        (InputChest as CS_BuildingManagementCraftingScript).CraftedItemsAmount = new int[20]
        if CraftingType.OutputType == "Food"
            Storage = (City as CS_CityManagementEconomy).StorageFood
        else
            Storage = (City as CS_CityManagementEconomy).StorageMaterials
        endif
        Storage.RemoveItem(CraftingType.Inputs, maxoutput*CraftingType.ConversionAmount, false, InputChest)
    elseif CraftingSelections.Length > 0
        int i = 0
        while i < CraftingSelections.Length
            CS_CraftingResourcesScript CraftingScript = (CraftingSelections[i] as CS_CraftingResourcesScript)
            (InputChests[i] as CS_BuildingManagementCraftingScript).CraftedItemsAmount = new int[20]
            if CraftingScript.OutputType == "Food"
                Storage = (City as CS_CityManagementEconomy).StorageFood
            else
                Storage = (City as CS_CityManagementEconomy).StorageMaterials
            endif
            Storage.RemoveItem(CraftingScript.Inputs, maxoutput*CraftingScript.ConversionAmount, false, InputChests[i])
            i += 1
        endwhile
    endif
EndFunction

Function AddOptionToCrafting(Form CraftingOption)
    int CraftingIndex = CraftingOptions.Find(CraftingOption)
    Form CraftingSelection = CraftingTypes.GetAt(CraftingIndex)
    ObjectReference NewInputChest = City.PlaceAtMe(CS_BuildingManagementCraftingChest)
    (NewInputChest as CS_BuildingManagementCraftingScript).Building = self
    (NewInputChest as CS_BuildingManagementCraftingScript).CraftingType = CraftingSelection as CS_CraftingResourcesScript
    (NewInputChest as CS_BuildingManagementCraftingScript).StorageFood = GetStorageDestination("Food")
    (NewInputChest as CS_BuildingManagementCraftingScript).StorageMaterials = GetStorageDestination("Materials")
    (NewInputChest as CS_BuildingManagementCraftingScript).StorageEquipment = GetStorageDestination("Equipment")
    
    CraftingSelections = AddToFormArray(CraftingSelection, CraftingSelections)
    InputChests = AddToArray(NewInputChest, InputChests)
EndFunction

Function RemoveOptionFromCrafting(Form CraftingOption)
    int CraftingIndex = CraftingOptions.Find(CraftingOption)
    Form CraftingSelection = CraftingTypes.GetAt(CraftingIndex)
    ObjectReference OldInputChest = InputChests[CraftingIndex]
    CraftingSelections = RemoveFromFormArray(CraftingSelection, CraftingSelections)
    InputChests = RemoveFromArray(OldInputChest, InputChests)
EndFunction

Function SetEquipmentCraftingList(int EquipmentType)
    CraftingType = CraftingTypes.GetAt(EquipmentType) as CS_CraftingResourcesScript
    (InputChest as CS_BuildingManagementCraftingScript).CraftingType = CraftingType
    CraftingTypeText = CraftingTypeTexts.GetAt(EquipmentType) as Location
EndFunction

Function ClearEquipmentCrafting()
    CraftingType = None
    (InputChest as CS_BuildingManagementCraftingScript).CraftingType = CraftingType
    CraftingTypeText = None
EndFunction

; States and Events --------------------

State NotSetUp
    
    Event OnUpdate()
        
        GoToState("SettingUp")
        SetUp()
        GoToState("SetUp")
        
    EndEvent
    
EndState

State Activated
    
    Event OnActivate(ObjectReference akActionRef)
        
       ;Blocked
       
    EndEvent
   
EndState

State Updating
    
    Event OnActivate(ObjectReference akActionRef)
        
       ;Blocked
       
    EndEvent
   
EndState

State Update

    Event OnUpdate()
        
        GoToState("Updating")
        if InputChest
            ;(InputChest as CS_BuildingManagementCraftingScript).AddCraftingResults()
            GetInputMaterials()
        else
            AddOutput()
        endif
        GoToState("Updated")
        
    EndEvent
    
EndState