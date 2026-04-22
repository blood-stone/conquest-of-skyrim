Scriptname CS_BuildingManagementMenu extends Quest conditional

ObjectReference Property Building Auto hidden

LocationAlias Property BuildingName Auto
LocationAlias Property BuildingType Auto
LocationAlias Property BuildingStation Auto
LocationAlias Property Outputs Auto
LocationAlias Property Inputs Auto
LocationAlias Property CraftingType Auto

ReferenceAlias[] Property Resources Auto

ObjectReference Property NoneObject Auto

Location Property NoneLocation Auto

Message Property CS_BuildingManagementMenuStart Auto
FormList Property CS_BuildingManagementMenuStartBuildStationCosts Auto
FormList Property CS_BuildingManagementMenuUpgradeCosts Auto
Message Property CS_BuildingManagementMenuWorkers Auto
Message Property CS_BuildingManagementMenuWorkersWages Auto
Message Property CS_BuildingManagementMenuCraftingBlacksmith Auto

ObjectReference Property CS_CraftingSelectionActor Auto

Quest Property CS_TutorialQuests00FirstSteps Auto

int Property Workers Auto conditional hidden
int Property WorkersWage Auto conditional hidden
int Property HasStation Auto conditional hidden
int Property Unemployed Auto conditional hidden
int Property AtMaxWorkers Auto conditional hidden
int Property Crafting Auto conditional hidden
int Property CanConstruct Auto conditional hidden
int[] Property ResourceAmounts Auto conditional hidden

int nummaterials

CS_BuildingManagementScript BuildingScript
CS_ConstructionCostScript ConstructionCostScript

Function Menu(ObjectReference BuildingToUse)
    SetUp(BuildingToUse)
    
    if BuildingScript.Level == 0 && BuildingScript.StationPlacement
        if ShowConstructionCosts(true)
            BuildingScript.UpgradeBuilding()
        endif
    else
        int Response
        while Response != 3
            Response = CS_BuildingManagementMenuStart.show(BuildingScript.Level, BuildingScript.Workers, BuildingScript.Stations, BuildingScript.GetTotalOutput())
            if Response == 0
                MenuWorkers()
            elseif Response == 1
                MenuCrafting()
            elseif Response == 2
                MenuUpgrade()
            endif
        endwhile
    endif
    
    Stop()
EndFunction

Function MenuUpgrade()
    if ShowConstructionCosts()
        BuildingScript.UpgradeBuilding()
    endif
EndFunction

Function MenuWorkers()
    CS_CityManagementPopulation Population = BuildingScript.City as CS_CityManagementPopulation
    
    int Response
    while Response != 4
        Workers = BuildingScript.Workers
        Unemployed = Population.Unemployed
        int TotalWages = BuildingScript.TotalWages
        int Wage = BuildingScript.Wage
        
        if BuildingScript.StationPlacement && BuildingScript.Stations < BuildingScript.Level
            HasStation = 1
        else
            HasStation = 0
        endif
        
        if Workers >= BuildingScript.Stations
            AtMaxWorkers = 1
        else
            AtMaxWorkers = 0
        endif
        
        Response = CS_BuildingManagementMenuWorkers.show(Workers, BuildingScript.Stations, Unemployed, TotalWages, Wage)
        if Response == 0
            BuildingScript.HireWorker()
            if CS_TutorialQuests00FirstSteps.GetStage() == 60
                CS_TutorialQuests00FirstSteps.SetStage(70)
            endif
        elseif Response == 1
            BuildingScript.FireWorker()
        elseif Response == 2
            MenuWorkersWage()
        elseif Response == 3
            BuildingScript.SetUpNewStation()
        endif
    endwhile
EndFunction

Function MenuWorkersWage()
    int Response
    while Response != 9
        WorkersWage = BuildingScript.Wage
        
        Response = CS_BuildingManagementMenuWorkersWages.show(WorkersWage)
        if Response < 9
            BuildingScript.SetWage(25*Response)
        endif
    endwhile
EndFunction

Function MenuCrafting()
    int Response
    while Response != 2
        
        Response = CS_BuildingManagementMenuCraftingBlacksmith.show()
        if Response == 0
            (CS_CraftingSelectionActor as CS_CraftingSelectionScript).InitiateCraftingSelectionMenu(BuildingScript, true)
        elseif Response == 1
            (CS_CraftingSelectionActor as CS_CraftingSelectionScript).InitiateCraftingSelectionMenu(BuildingScript, false)
        endif
    endwhile
EndFunction

bool Function ShowConstructionCosts(bool StartingCost=false)
    int NextLevel = BuildingScript.Level + 1
    ConstructionCostScript = BuildingScript.ConstructionCosts.GetAt(BuildingScript.Level) as CS_ConstructionCostScript
    FormList Materials = ConstructionCostScript.Materials
    ResourceAmounts = new int[4]
    
    nummaterials = 0
    SetResourceConstructionCostMenu()
    int[] PlayerMaterials = GetPlayerConstructionMaterials(Materials)
    
    CanConstruct = 1 ;DELETE WHEN DONE!!!!!!!!!!!!!
    Message ConstructionCostMessage
    int Response
    ConstructionCostMessage = CS_BuildingManagementMenuUpgradeCosts.GetAt(nummaterials) as Message
    Response = ConstructionCostMessage.show(NextLevel, ResourceAmounts[0], PlayerMaterials[0], ResourceAmounts[1], PlayerMaterials[1], ResourceAmounts[2], PlayerMaterials[2], ResourceAmounts[3], PlayerMaterials[3])
    
    ClearResourceMenu()
    
    if Response == 0
        return true
    else
        return false
    endif
EndFunction

Function SetUp(ObjectReference BuildingToUse)
    Building = BuildingToUse
    BuildingScript = BuildingToUse as CS_BuildingManagementScript
    BuildingName.ForceLocationTo(BuildingScript.VanillaLocation)
    BuildingType.ForceLocationTo(BuildingScript.BuildingTypeText)
    if BuildingScript.BuildingStationText
        BuildingStation.ForceLocationTo(BuildingScript.BuildingStationText)
    endif
    Inputs.ForceLocationTo(BuildingScript.InputsText)
    Outputs.ForceLocationTo(BuildingScript.OutputsText)
    if BuildingScript.CraftingTypes
        Crafting = 1
    else
        Crafting = 0
    endif
EndFunction

Function SetResourceConstructionCostMenu()
    FormList Materials = ConstructionCostScript.Materials
    
    int i = 0
    while i < Materials.GetSize()
        ObjectReference MaterialRef = BuildingScript.City.PlaceAtMe(Materials.GetAt(i))
        int Amount = ConstructionCostScript.Amounts[i]*(BuildingScript.Level)
        if Amount > 0
            ResourceAmounts[nummaterials] = Amount
            Resources[nummaterials].ForceRefTo(MaterialRef)
            nummaterials += 1
        endif
        i += 1
    endwhile
EndFunction

int[] Function GetPlayerConstructionMaterials(FormList Materials, bool returnonfail=false)
    int[] MaterialAmounts = new int[4]
    ObjectReference PlayerRef = Game.GetPlayer()
    CS_CityManagementEconomy Economy = BuildingScript.City as CS_CityManagementEconomy
    ObjectReference CityStorage = Economy.StorageMaterials
    CanConstruct = 1
    
    int i = 0
    while i < Materials.GetSize()
        Form Material = Materials.GetAt(i)
        MaterialAmounts[i] = PlayerRef.GetItemCount(Material) + CityStorage.GetItemCount(Material)
        if ResourceAmounts[i] > MaterialAmounts[i]
            CanConstruct = 0
            if returnonfail
                return None
            endif
        endif
        i += 1
    endwhile
    
    return MaterialAmounts
EndFunction

Function ClearResourceMenu()
    
    int i = 0
    while i < Resources.Length
        if Resources[i].GetRef()
            Resources[i].GetRef().delete()
        endif
        i += 1
    endwhile
    
EndFunction