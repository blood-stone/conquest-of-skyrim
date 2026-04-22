Scriptname CS_SettlementManagementScript extends Quest conditional

import CS_CommonFunctions

ObjectReference Property Settlement Auto hidden
ObjectReference Property StorageType Auto hidden
ObjectReference Property FactionStorageType Auto hidden

LocationAlias Property SettlementLoc Auto
LocationAlias Property FactionName Auto
LocationAlias Property ResourceType Auto
LocationAlias Property BuildingTypeLocAlias Auto

ReferenceAlias[] Property Resources Auto

Message Property CS_SettlementManagementMenuStart Auto
Message Property CS_SettlementManagementMenu00Economy Auto
Message Property CS_SettlementManagementMenu00EconomyTaxes Auto
Message Property CS_SettlementManagementMenu00EconomyTaxesHousing Auto
Message Property CS_SettlementManagementMenu00EconomyTaxesIncome Auto
Message Property CS_SettlementManagementMenu00EconomyFoodReserves Auto
Message Property CS_SettlementManagementMenu00EconomyFoodReservesMinimumAmount Auto
Message Property CS_SettlementManagementMenu00EconomyBuildings Auto
Message Property CS_SettlementManagementMenu00EconomyBuildings01BaseProduction Auto
Message Property CS_SettlementManagementMenu00EconomyBuildings02Refining Auto
Message Property CS_SettlementManagementMenu00EconomyBuildings03Crafting Auto
Message Property CS_SettlementManagementMenu00EconomyResource Auto
Message Property CS_SettlementManagementMenu00EconomyResourceBuildingsFood Auto
Message Property CS_SettlementManagementMenu00EconomyResourceBuildingsMaterials Auto
Message Property CS_SettlementManagementMenu00EconomyResourceBuildingsEquipment Auto
Message Property CS_SettlementManagementMenu00EconomyResourceTrade Auto
Message Property CS_SettlementManagementMenu00EconomyEquipment Auto
Message Property CS_SettlementManagementMenu01Defense Auto
Message Property CS_SettlementManagementMenu01DefenseEquipment Auto
Message Property CS_SettlementManagementMenu01DefenseEquipmentTier Auto
Message Property CS_SettlementManagementMenu02Construction Auto
Message Property CS_SettlementManagementMenu02Construction00Residential Auto
Message Property CS_SettlementManagementMenu02Construction01BaseProduction Auto
Message Property CS_SettlementManagementMenu02Construction02Refining Auto
Message Property CS_SettlementManagementMenu02Construction03Crafting Auto
Message Property CS_SettlementManagementMenu02Construction04Military Auto

FormList Property CS_SettlementManagementResourceRevenueMenus Auto
FormList Property CS_SettlementManagementResourceExpenseMenus Auto
FormList Property CS_SettlementManagementConstructionCostMenus Auto

FormList Property CS_BuildingConstructionResidential Auto
FormList Property CS_BuildingConstructionBaseProduction Auto
FormList Property CS_BuildingConstructionRefining Auto
FormList Property CS_BuildingConstructionCrafting Auto
FormList Property CS_BuildingConstructionMilitary Auto

FormList Property CS_BuildingTypeTexts00Residential Auto
FormList Property CS_BuildingTypeTexts01Base Auto
FormList Property CS_BuildingTypeTexts02Refining Auto
FormList Property CS_BuildingTypeTexts03Crafting Auto

FormList Property CS_ConstructionCostsAll Auto
FormList Property CS_BuildingConstructionCostsResidential Auto
FormList Property CS_BuildingConstructionCostsBaseProduction Auto
FormList Property CS_BuildingConstructionCostsRefining Auto
FormList Property CS_BuildingConstructionCostsCrafting Auto
FormList Property CS_BuildingConstructionCostsMilitary Auto

Location Property CS_TextSettlementManagementResourceTypeFood Auto
Location Property CS_TextSettlementManagementResourceTypeMaterials Auto
Location Property CS_TextSettlementManagementResourceTypeEquipment Auto

Static Property CS_ConstructionSite Auto

Sound Property CS_BuildSound Auto

Quest Property CS_TutorialQuests00FirstSteps Auto

CS_TradeAgreementActorScript Property TradeAgreementActor Auto

int Property HasPreviousPage Auto conditional hidden
int Property HasNextPage Auto conditional hidden
int Property HousingTax Auto conditional hidden
int Property IncomeTaxRate Auto conditional hidden
int Property MinimumAmount Auto conditional hidden
int[] Property ResourceAmounts Auto hidden
int[] Property PlayerMaterials Auto hidden
int Property CanConstruct Auto conditional hidden
int Property CurrentGuards Auto conditional hidden
int Property RecruitableGuards Auto conditional hidden
int Property HasBaseProduction Auto conditional hidden
int Property HasRefining Auto conditional hidden
int Property HasCrafting Auto conditional hidden
int Property ShowBuilding1 Auto conditional hidden
int Property ShowBuilding2 Auto conditional hidden
int Property ShowBuilding3 Auto conditional hidden
int Property ShowBuilding4 Auto conditional hidden
int Property ShowBuilding5 Auto conditional hidden
int Property ShowingPatrolPoints Auto conditional hidden
int Property ShowTier0 Auto conditional hidden
int Property ShowTier1 Auto conditional hidden
int Property ShowTier2 Auto conditional hidden
int Property ShowTier3 Auto conditional hidden
int Property ShowTier4 Auto conditional hidden
int Property ShowTier5 Auto conditional hidden
int Property ShowTier6 Auto conditional hidden
int Property ShowTier7 Auto conditional hidden
int Property ShowTier8 Auto conditional hidden
int Property BuildingAmount1 Auto conditional hidden
int Property BuildingAmount2 Auto conditional hidden
int Property BuildingAmount3 Auto conditional hidden
int Property BuildingAmount4 Auto conditional hidden
int Property BuildingAmount5 Auto conditional hidden

int SoundFailsafeNum

Actor Property PlayerRef Auto

int ResourceBuildingRevenue
ObjectReference[] ResourceBuildings
ObjectReference[] BuildingTypes
bool forcequit

CS_CityManagementEconomy Economy
CS_CityManagementPopulation Population
CS_CityManagementMilitary Military
CS_CityManagementOwnership Ownership

CS_ConstructionCostScript ConstructionCostScript

CS_BuildingManagementMenu Property CS_BuildingManagementReport Auto

;Menu Functions ----------------------

Function Menu(ObjectReference SettlementToUse)
    if Settlement != SettlementToUse
        SetUp(SettlementToUse)
    endif
    
    int Response
    while !forcequit && Response != 3
        
        Response = CS_SettlementManagementMenuStart.show(Population.TotalPopulation, Population.MaxPopulation, Population.Happiness)
        if Response == 0
            EconomyMenu()
        elseif Response == 1
            DefenseMenu()
        elseif Response == 2
            ConstructionMenu()
        endif
    endwhile
    
    Stop()
EndFunction

Function EconomyMenu()
    int Response
    while !forcequit && Response != 4
        float ToolModifier = (Economy.StorageEquipmentWorkers as CS_StorageEquipmentWorkersScript).WorkerEquipmentModifier
        
        Response = CS_SettlementManagementMenu00Economy.show(Population.TotalWorkers, Population.MaxWorkers, ToolModifier)
        if Response == 0
            EconomyMenuTaxes()
        elseif Response == 1
            EconomyMenuFoodReserves()
        elseif Response == 2
            EconomyMenuBuildings()
        elseif Response == 3
            EconomyMenuEquipment()
        endif
    endwhile
EndFunction

Function EconomyMenuTaxes()
    int Response
    while !forcequit && Response != 2
        Economy.GetTotalWages()
        int TotalHousingTax = Economy.HousingTax*Population.TotalPopulation
        HousingTax = Economy.HousingTax
        int TotalIncomeTax = Economy.TotalIncomeTax
        IncomeTaxRate = math.floor(100*Economy.IncomeTaxRate) as int
        int TotalTaxRevenue = TotalHousingTax + TotalIncomeTax
        
        Response = CS_SettlementManagementMenu00EconomyTaxes.show(TotalHousingTax, HousingTax, TotalIncomeTax, IncomeTaxRate, TotalTaxRevenue)
        if Response == 0
            EconomyMenuTaxesHousing()
        elseif Response == 1
            EconomyMenuTaxesIncome()
        endif
    endwhile
EndFunction

Function EconomyMenuTaxesHousing()
    int Response
    while !forcequit && Response != 6
        HousingTax = Economy.HousingTax
        int TotalHousingTax = Economy.HousingTax*Population.TotalPopulation
        
        Response = CS_SettlementManagementMenu00EconomyTaxesHousing.show(HousingTax, TotalHousingTax)
        if Response < 6
            Economy.HousingTax = 10*Response
        endif
    endwhile
EndFunction

Function EconomyMenuTaxesIncome()
    int Response
    while !forcequit && Response != 6
        IncomeTaxRate = math.floor(100*Economy.IncomeTaxRate) as int
        int TotalIncomeTax = Economy.TotalIncomeTax
        
        Response = CS_SettlementManagementMenu00EconomyTaxesIncome.show(IncomeTaxRate, TotalIncomeTax)
        if Response < 6
            Economy.IncomeTaxRate = 0.1*(Response as float)
            Economy.SetTotalIncomeTax()
        endif
    endwhile
EndFunction

Function EconomyMenuFoodReserves()
    CS_StorageFoodReserves FoodReservesScript = Economy.StorageFoodReserves as CS_StorageFoodReserves
    
    int Response
    while !forcequit && Response != 3
        int StorageAmount = FoodReservesScript.GetStorageAmount()
        MinimumAmount = FoodReservesScript.MinimumAmount
        
        Response = CS_SettlementManagementMenu00EconomyFoodReserves.show(StorageAmount, MinimumAmount)
        if Response == 0
            (Economy.StorageFoodReserves as Actor).ShowGiftMenu(true, FoodReservesScript.CS_StorageKeywordsFood)
        elseif Response == 1
            (Economy.StorageFoodReserves as Actor).ShowGiftMenu(false, FoodReservesScript.CS_StorageKeywordsFood)
        elseif Response == 2
            EconomyMenuFoodReservesMinimumAmount()
        endif
    endwhile
EndFunction

Function EconomyMenuFoodReservesMinimumAmount()
    CS_StorageFoodReserves FoodReservesScript = Economy.StorageFoodReserves as CS_StorageFoodReserves
    int PreviousMinimumAmount = FoodReservesScript.MinimumAmount
    
    int Response
    while !forcequit && Response != 6
        int StorageAmount = FoodReservesScript.GetStorageAmount()
        MinimumAmount = FoodReservesScript.MinimumAmount
        
        Response = CS_SettlementManagementMenu00EconomyFoodReservesMinimumAmount.show(StorageAmount, MinimumAmount)
        if Response < 3
            FoodReservesScript.MinimumAmount += math.pow(10, Response) as int
        elseif Response >= 3 && Response != 6
            FoodReservesScript.MinimumAmount -= math.pow(10, (Response - 3)) as int
        elseif Response == 6 && FoodReservesScript.MinimumAmount > PreviousMinimumAmount
            FoodReservesScript.GoToState("FillReserves")
            FoodReservesScript.RegisterForSingleUpdate(0.1)
        endif
    endwhile
EndFunction

Function EconomyMenuBuildings()
    
    int Response
    while !forcequit && Response != 3
        SetBuildingTypesMenu()
        
        Response = CS_SettlementManagementMenu00EconomyBuildings.show()
        if Response == 0
            EconomyMenuBuildingsType("Base")
        elseif Response == 1
            EconomyMenuBuildingsType("Refining")
        elseif Response == 2
            EconomyMenuBuildingsType("Crafting")
        endif
    endwhile
EndFunction

Function EconomyMenuBuildingsType(string BuildingType)
    
    Message BuildingMenuMessage
    if BuildingType == "Base"
        BuildingMenuMessage = CS_SettlementManagementMenu00EconomyBuildings01BaseProduction
    elseif BuildingType == "Refining"
        BuildingMenuMessage = CS_SettlementManagementMenu00EconomyBuildings02Refining
    elseif BuildingType == "Crafting"
        BuildingMenuMessage = CS_SettlementManagementMenu00EconomyBuildings03Crafting
    endif
    
    SetBuildingTypes(BuildingType)
    
    int Response = -1
    
    while !forcequit && Response != BuildingTypes.Length
        Response = BuildingMenuMessage.show()
        if Response < BuildingTypes.Length
            CS_BuildingManagementReport.Stop()
            CS_BuildingManagementReport.Start()
            
            CS_BuildingManagementReport.Menu(BuildingTypes[Response])
        endif
    endwhile
EndFunction

Function EconomyMenuEquipment()
    CS_StorageEquipmentWorkersScript WorkerEquipmentStorage = Economy.StorageEquipmentWorkers as CS_StorageEquipmentWorkersScript
        
    int Response
    while Response < 9
        SetWorkerEquipmentTierMenu()
        int EquipmentTier = WorkerEquipmentStorage.WorkerEquipmentTier
        
        Response = CS_SettlementManagementMenu00EconomyEquipment.show(EquipmentTier)
        if Response < 9
            WorkerEquipmentStorage.SetNewTier(Response)
        endif
    endwhile
EndFunction

Function DefenseMenu()
    ObjectReference FactionEquipmentStorage = (Ownership.FactionOwnerActivator as CS_FactionManagementEconomy).StorageEquipment
    CS_StorageFactionEquipmentScript StorageScript = FactionEquipmentStorage as CS_StorageFactionEquipmentScript
    
    int Response
    while !forcequit && Response != 6
        CurrentGuards = Population.Guards
        Population.MaxGuards = 5
        int MaxGuards = Population.MaxGuards
        float EquipmentModifier = (Population.GuardEquipment as CS_StorageEquipmentGuardsScript).TroopEquipmentModifier
        
        RecruitableGuards = MaxGuards - CurrentGuards
        if RecruitableGuards > Population.Unemployed
            RecruitableGuards = Population.Unemployed
        endif
        
        if Population.ShowingPatrolPoints == true
            ShowingPatrolPoints = 1
        else
            ShowingPatrolPoints = 0
        endif
        
        Response = CS_SettlementManagementMenu01Defense.show(Population.Guards, Population.MaxGuards, EquipmentModifier, Population.Unemployed)
        if Response == 0
            Population.HireGuard()
        elseif Response == 1
            Population.FireGuard()
        elseif Response == 2
            DefenseMenuEquipment()
        elseif Response == 3
            ConstructBuilding(CS_BuildingConstructionMilitary, 0)
        elseif Response == 4
            Population.ShowAllPatrolPoints()
        elseif Response == 5
            Population.HideAllPatrolPoints()
        endif
    endwhile
EndFunction

Function DefenseMenuEquipment()
    
    int Response
    while Response != 2
        float EquipmentModifier = (Population.GuardEquipment as CS_StorageEquipmentGuardsScript).TroopEquipmentModifier
        
        Response = CS_SettlementManagementMenu01DefenseEquipment.show(EquipmentModifier)
        if Response == 0
            DefenseMenuEquipmentTier()
        elseif Response == 1
            ;DefenseMenuEquipmentCustom()
        endif
        
    endwhile
EndFunction

Function DefenseMenuEquipmentTier()
    CS_StorageEquipmentGuardsScript GuardEquipmentStorage = Population.GuardEquipment as CS_StorageEquipmentGuardsScript
        
    int Response
    while Response < 9
        SetGuardEquipmentTierMenu()
        int EquipmentTier = GuardEquipmentStorage.GuardEquipmentTier
        
        Response = CS_SettlementManagementMenu01DefenseEquipmentTier.show(EquipmentTier)
        if Response < 9
            GuardEquipmentStorage.SetNewTier(Response)
        endif
    endwhile
EndFunction

Function ConstructionMenu()
    int Response
    while !forcequit && Response != 4
        Response = CS_SettlementManagementMenu02Construction.show()
        if Response == 0
            ConstructionMenuResidential()
        elseif Response == 1
            ConstructionMenuBase()
        elseif Response == 2
            ConstructionMenuRefining()
        elseif Response == 3
            ConstructionMenuCrafting()
        endif
    endwhile
EndFunction

Function ConstructionMenuResidential()
    int Response
    while !forcequit && Response != 3
        Response = CS_SettlementManagementMenu02Construction00Residential.show()
        if Response < 3
            if ShowConstructionCosts(CS_BuildingConstructionCostsResidential, Response, "Residential")
                ConstructBuilding(CS_BuildingConstructionResidential, Response)
            endif
        endif
    endwhile
EndFunction

Function ConstructionMenuBase()
    int Response
    while !forcequit && Response != 4
        SetBuildingAmounts("Base")
        
        Response = CS_SettlementManagementMenu02Construction01BaseProduction.show()
        if Response < 4
            if ShowConstructionCosts(CS_BuildingConstructionCostsBaseProduction, Response, "Base")
                ConstructBuilding(CS_BuildingConstructionBaseProduction, Response)
            endif
        endif
    endwhile
EndFunction

Function ConstructionMenuRefining()
    int Response
    while !forcequit && Response != 4
        SetBuildingAmounts("Refining")
        
        Response = CS_SettlementManagementMenu02Construction02Refining.show()
        if Response < 4
            if ShowConstructionCosts(CS_BuildingConstructionCostsRefining, Response, "Refining")
                ConstructBuilding(CS_BuildingConstructionRefining, Response)
            endif
        endif
    endwhile
EndFunction

Function ConstructionMenuCrafting()
    int Response
    while !forcequit && Response != 1
        SetBuildingAmounts("Crafting")
        
        Response = CS_SettlementManagementMenu02Construction03Crafting.show()
        if Response < 1
            if ShowConstructionCosts(CS_BuildingConstructionCostsCrafting, Response, "Crafting")
                ConstructBuilding(CS_BuildingConstructionCrafting, Response)
            endif
        endif
    endwhile
EndFunction

Function ConstructionMenuMilitary()
    int Response
    while !forcequit && Response != 1
        Response = CS_SettlementManagementMenu02Construction04Military.show()
        if Response < 1
            if ShowConstructionCosts(CS_BuildingConstructionCostsMilitary, Response, "Military")
                ConstructBuilding(CS_BuildingConstructionMilitary, Response)
            endif
        endif
    endwhile
EndFunction

;Construction Functions ------------------

bool Function ShowConstructionCosts(FormList ConstructionCostList, int buildingtypenum, string type)
    ConstructionCostScript = ConstructionCostList.GetAt(buildingtypenum) as CS_ConstructionCostScript
    FormList Materials = ConstructionCostScript.Materials
    ResourceAmounts = new int[4]
    PlayerMaterials = new int[4]
    
    SetResourceConstructionCostMenu()
    SetConstructionText(type, buildingtypenum)
    int nummaterials = Materials.GetSize()
    
    CanConstruct = 1 ;DELETE WHEN DONE!!!!!!!!!!!!!
    Message ConstructionCostMessage = CS_SettlementManagementConstructionCostMenus.GetAt(nummaterials) as Message
    int Response = ConstructionCostMessage.show(ResourceAmounts[0], PlayerMaterials[0], ResourceAmounts[1], PlayerMaterials[1], ResourceAmounts[2], PlayerMaterials[2], ResourceAmounts[3], PlayerMaterials[3])
    if Response == 0
        return true
    else
        return false
    endif
EndFunction

bool Function PayConstructionCosts()
    FormList Materials = ConstructionCostScript.Materials
    int[] Amounts = ConstructionCostScript.Amounts
    ObjectReference CityStorage = Economy.StorageMaterials
    int[] PlayerConstructionMaterials = GetPlayerConstructionMaterials(Materials)
    
    CanConstruct = 1 ;DELETE WHEN DONE!!!!!!!!!!!!!
    if CanConstruct == 1
    
        int i = 0
        while i < Materials.GetSize()
            Form Material = Materials.GetAt(i)
            int materialremaining = Amounts[i]
            int CityStorageAmount = CityStorage.GetItemCount(Material)
            if CityStorageAmount >= materialremaining
                CityStorage.RemoveItem(Material, materialremaining)
                materialremaining = 0
            else
                CityStorage.RemoveItem(Material, CityStorageAmount)
                materialremaining -= CityStorageAmount
            endif
            
            ; Add Faction Here
            
            if materialremaining > 0
                int PlayerRefAmount = PlayerRef.GetItemCount(Material)
                if PlayerRefAmount >= materialremaining
                    PlayerRef.RemoveItem(Material, materialremaining)
                    materialremaining = 0
                else
                    PlayerRef.RemoveItem(Material, PlayerRefAmount)
                    materialremaining -= PlayerRefAmount
                endif
            endif
            
            i += 1
        endwhile
        
        return true
        
    else
        
        return false
        
    endif
EndFunction     

Function ConstructBuilding(FormList BuildingType, int buildingtypenum)
    ObjectReference BuildingPlacement = Game.GetPlayer().PlaceAtMe(BuildingType.GetAt(buildingtypenum) as Activator, abinitiallyDisabled=true)
    ObjectReference NewBuilding = (BuildingPlacement as CS_PlaceObject).BeginPlacement(Ownership.VanillaCity)
    float ConstructionSiteScale = (BuildingPlacement as CS_PlaceObject).ConstructionSiteScale
    BuildingPlacement.delete()
    
    if NewBuilding
        if BuildingType != CS_BuildingConstructionMilitary && PayConstructionCosts()
            if BuildingType == CS_BuildingConstructionBaseProduction || BuildingType == CS_BuildingConstructionRefining || BuildingType == CS_BuildingConstructionCrafting
                SoundFailsafeNum = 0
                RegisterForUpdate(0.3)
                ObjectReference ConstructionSite = NewBuilding.PlaceAtMe(CS_ConstructionSite, abInitiallyDisabled=true)
                if ConstructionSiteScale > 0
                    ConstructionSite.Enable()
                    ConstructionSite.SetScale(ConstructionSiteScale)
                    utility.wait(1)
                endif
                string BuildingName = (NewBuilding as CS_BuildingManagementScript).BuildingType
                Economy.AddBuilding(NewBuilding, BuildingName)
                (NewBuilding as CS_BuildingManagementScript).City = Settlement
                (NewBuilding as CS_BuildingManagementScript).VanillaLocation = Ownership.VanillaCity
                
                utility.wait(1)
                ConstructionSite.delete()
                (NewBuilding as CS_BuildingManagementScript).SetUp()
                (NewBuilding as CS_PlacedObjectActivator).InitialSetUp(Settlement)
                
                if CS_TutorialQuests00FirstSteps.GetStage() == 50 && buildingtypenum == 1
                    CS_TutorialQuests00FirstSteps.SetStage(60)
                endif
                UnRegisterForUpdate()
                ;NewBuilding.EnableNoWait()
                ;(NewBuilding as CS_BuildingManagementScript).UpgradeBuilding()
                ;(NewBuilding as CS_BuildingPlacementScript).PlaceBuilding()
            elseif BuildingType == CS_BuildingConstructionResidential
                ObjectReference ConstructionSite = NewBuilding.PlaceAtMe(CS_ConstructionSite, abInitiallyDisabled=true)
                if ConstructionSiteScale > 0
                    ConstructionSite.Enable()
                    ConstructionSite.SetScale(ConstructionSiteScale)
                endif
                CS_BuildSound.Play(PlayerRef)
                Population.MaxPopulation = Population.MaxPopulation + (NewBuilding as CS_ResidentialManagement).PopIncreaseAmount
                Population.UpdateCommonerIncreaseRate()
                
                utility.wait(1)
                CS_BuildSound.Play(PlayerRef)
                utility.wait(1)
                CS_BuildSound.Play(PlayerRef)
                ConstructionSite.delete()
                NewBuilding.Enable()
                (NewBuilding as CS_PlacedObjectActivator).InitialSetUp(Settlement)
                if (NewBuilding as CS_PlacedObjectActivatorMarker)
                    (NewBuilding as CS_PlacedObjectActivatorMarker).InitialSetUp(Settlement)
                endif
                CS_BuildSound.Play(PlayerRef)
                
                if CS_TutorialQuests00FirstSteps.GetStage() == 40 && buildingtypenum == 1
                    CS_TutorialQuests00FirstSteps.SetStage(50)
                endif
                ;(NewBuilding as CS_BuildingScriptOwnership).PlacedActivator = BuildingActivatorRef
            endif
        elseif BuildingType == CS_BuildingConstructionMilitary
            ;Population.MaxGuards = Population.MaxGuards + 1
            (NewBuilding as CS_GuardPostManagementScript).City = Settlement
            (NewBuilding as CS_GuardPostManagementScript).Level = 1
            (NewBuilding as CS_BuildingPlacementScript).PlaceBuilding()
            if buildingtypenum == 0
                Population.AddGuardPatrolPoint(NewBuilding)
            endif
        endif
    endif
    
    forcequit = true
EndFunction

;Variable SetUp Functions ---------------

Function SetUp(ObjectReference SettlementToUse)
    Settlement = SettlementToUse
    
    Economy = GetCityEconomy(Settlement)
    Population = GetCityPopulation(Settlement)
    Military = GetCityMilitary(Settlement)
    Ownership = GetCityOwnership(Settlement)
    
    SettlementLoc.ForceLocationTo(Ownership.VanillaCity)
    FactionName.ForceLocationTo((Ownership.FactionOwnerActivator as CS_FactionManagementDiplomacy).FactionName)
EndFunction

Function SetResourceType(string ResourceTypeString)
    if ResourceTypeString == "Food"
        ResourceType.ForceLocationTo(CS_TextSettlementManagementResourceTypeFood)
        StorageType = Economy.StorageFood
        FactionStorageType = (Ownership.FactionOwnerActivator as CS_FactionManagementEconomy).StorageFood
    elseif ResourceTypeString == "Materials"
        ResourceType.ForceLocationTo(CS_TextSettlementManagementResourceTypeMaterials)
        StorageType = Economy.StorageMaterials
        FactionStorageType = (Ownership.FactionOwnerActivator as CS_FactionManagementEconomy).StorageMaterials
    elseif ResourceTypeString == "Equipment"
        ResourceType.ForceLocationTo(CS_TextSettlementManagementResourceTypeEquipment)
        StorageType = Economy.StorageEquipment
        FactionStorageType = (Ownership.FactionOwnerActivator as CS_FactionManagementEconomy).StorageEquipment
    endif
EndFunction

Function SetResourceChangeMenu(string type, int ArrayStart, int ArrayEnd)
    CS_StorageCityScript StorageScript = (StorageType as CS_StorageCityScript)
    
    ResourceAmounts = new int[5]
    
    int i = 0
    while i < Resources.Length && (ArrayStart + i) < ArrayEnd;StorageScript.TodayRevenueStorageItems.Length
        if Resources[i]
            CS_SettlementManagementThreadAll Thread = Resources[i] as CS_SettlementManagementThreadAll
            Thread.ArrayPosition = ArrayStart + i
            Thread.GoToState(type)
            Thread.RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
    
    i = 0
    while i < Resources.Length && (ArrayStart + i) < ArrayEnd
        CS_SettlementManagementThreadAll Thread = Resources[i] as CS_SettlementManagementThreadAll
        int loopnum
        while Thread.GetState() != "Updated" && loopnum < 50
            utility.wait(0.1)
            loopnum += 1
        endwhile
        ResourceAmounts[i] = Thread.ResourceAmount
        i += 1
    endwhile
EndFunction

Function SetWorkerEquipmentTierMenu()
    CS_FactionManagementEconomy FactionEconomy = Ownership.FactionOwnerActivator as CS_FactionManagementEconomy
    CS_StorageFactionEquipmentScript EquipmentStorage = FactionEconomy.StorageEquipment as CS_StorageFactionEquipmentScript
    CS_StorageEquipmentWorkersScript WorkerEquipmentStorage = Economy.StorageEquipmentWorkers as CS_StorageEquipmentWorkersScript
    
    if WorkerEquipmentStorage.WorkerEquipmentTier > 0
        ShowTier0 = 1
    else
        ShowTier0 = 0
    endif
    
    ShowTier1 = EquipmentStorage.CurrentWorkerEquipmentTiers[1]
    ShowTier2 = EquipmentStorage.CurrentWorkerEquipmentTiers[2]
    ShowTier3 = EquipmentStorage.CurrentWorkerEquipmentTiers[3]
    ShowTier4 = EquipmentStorage.CurrentWorkerEquipmentTiers[4]
    ShowTier5 = EquipmentStorage.CurrentWorkerEquipmentTiers[5]
    ShowTier6 = EquipmentStorage.CurrentWorkerEquipmentTiers[6]
    ShowTier7 = EquipmentStorage.CurrentWorkerEquipmentTiers[7]
    ShowTier8 = EquipmentStorage.CurrentWorkerEquipmentTiers[8]
EndFunction

Function SetGuardEquipmentTierMenu()
    CS_FactionManagementEconomy FactionEconomy = Ownership.FactionOwnerActivator as CS_FactionManagementEconomy
    CS_StorageFactionEquipmentScript EquipmentStorage = FactionEconomy.StorageEquipment as CS_StorageFactionEquipmentScript
    CS_StorageEquipmentGuardsScript GuardEquipmentStorage = Population.GuardEquipment as CS_StorageEquipmentGuardsScript
    
    if GuardEquipmentStorage.GuardEquipmentTier > 0
        ShowTier0 = 1
    else
        ShowTier0 = 0
    endif
    
    ShowTier1 = EquipmentStorage.CurrentTroopEquipmentTiers[1]
    ShowTier2 = EquipmentStorage.CurrentTroopEquipmentTiers[2]
    ShowTier3 = EquipmentStorage.CurrentTroopEquipmentTiers[3]
    ShowTier4 = EquipmentStorage.CurrentTroopEquipmentTiers[4]
    ShowTier5 = EquipmentStorage.CurrentTroopEquipmentTiers[5]
    ShowTier6 = EquipmentStorage.CurrentTroopEquipmentTiers[6]
    ShowTier7 = EquipmentStorage.CurrentTroopEquipmentTiers[7]
    ShowTier8 = EquipmentStorage.CurrentTroopEquipmentTiers[8]
EndFunction

Function ChooseTier(int TierNum)
    CS_FactionManagementEconomy FactionEconomy = Ownership.FactionOwnerActivator as CS_FactionManagementEconomy
    CS_StorageFactionScript EquipmentStorage = FactionEconomy.StorageEquipment as CS_StorageFactionScript
    CS_StorageEquipmentGuardsScript GuardEquipmentStorage = Population.GuardEquipment as CS_StorageEquipmentGuardsScript
    FormList GuardEquipment = GuardEquipmentStorage.TroopEquipment
    
    GuardEquipmentStorage.SetNewTier(TierNum)
EndFunction

Function SetBuildingTypesMenu()
    HasBaseProduction = 0
    HasRefining = 0
    HasCrafting = 0
    
    if Economy.BuildingsFarms.Length > 0 || Economy.BuildingsHunting.Length > 0 \
        || Economy.BuildingsFishing.Length > 0 || Economy.BuildingsLoggingCamps.Length > 0 \
        || Economy.BuildingsMines.Length > 0
        HasBaseProduction = 1
    endif
    
    if Economy.BuildingsLumberMills.Length > 0 || Economy.BuildingsTanneries.Length > 0 \
        || Economy.BuildingsSmelters.Length > 0
        HasRefining = 1
    endif
    
    if Economy.BuildingsBlacksmiths.Length > 0
        HasCrafting = 1
    endif
EndFunction

Message Function SetBuildingMenu(string BuildingType)
    if BuildingType == "Base"
        ResourceBuildings = new ObjectReference[3]
        if Economy.BuildingsFarms.Length > 0
            ResourceBuildings[0] = Economy.BuildingsFarms[0]
            ShowBuilding1 = 1
        else
            ShowBuilding1 = 0
        endif
        
        if Economy.BuildingsHunting.Length > 0
            ResourceBuildings[1] = Economy.BuildingsHunting[0]
            ShowBuilding2 = 1
        else
            ShowBuilding2 = 0
        endif
        
        if Economy.BuildingsFishing.Length > 0
            ResourceBuildings[2] = Economy.BuildingsFishing[0]
            ShowBuilding3 = 1
        else
            ShowBuilding3 = 0
        endif
        
        if Economy.BuildingsLoggingCamps.Length > 0
            ResourceBuildings[3] = Economy.BuildingsLoggingCamps[0]
            ShowBuilding4 = 1
        else
            ShowBuilding4 = 0
        endif
        
        if Economy.BuildingsMines.Length > 0
            ResourceBuildings[4] = Economy.BuildingsMines[0]
            ShowBuilding5 = 1
        else
            ShowBuilding5 = 0
        endif
        
        ;ResourceBuildingRevenue = (Economy.StorageFood as CS_StorageCityScript).GetTotalRevenueFromBuildings()
        ;return CS_SettlementManagementMenu00EconomyBuildingsBaseProduction
    elseif BuildingType == "Refining"
        ResourceBuildings = new ObjectReference[5]
        
        if Economy.BuildingsLumberMills.Length > 0
            ResourceBuildings[0] = Economy.BuildingsLumberMills[0]
            ShowBuilding1 = 1
        else
            ShowBuilding1 = 0
        endif
        
        if Economy.BuildingsTanneries.Length > 0
            ResourceBuildings[1] = Economy.BuildingsTanneries[0]
            ShowBuilding2 = 1
        else
            ShowBuilding2 = 0
        endif
        
        if Economy.BuildingsSmelters.Length > 0
            ResourceBuildings[2] = Economy.BuildingsSmelters[0]
            ShowBuilding3 = 1
        else
            ShowBuilding3 = 0
        endif
        
        ;ResourceBuildingRevenue = (Economy.StorageMaterials as CS_StorageCityScript).GetTotalRevenueFromBuildings()
        ;return CS_SettlementManagementMenu00EconomyBuildingsRefining
    elseif BuildingType == "Crafting"
        ResourceBuildings = new ObjectReference[1]
        if Economy.BuildingsBlacksmiths.Length > 0
            ResourceBuildings[0] = Economy.BuildingsBlacksmiths[0]
            ShowBuilding1 = 1
        else
            ShowBuilding1 = 0
        endif
        
        ;ResourceBuildingRevenue = (Economy.StorageEquipment as CS_StorageCityScript).GetTotalRevenueFromBuildings()
        ;return CS_SettlementManagementMenu00EconomyBuildingsCrafting
    endif
EndFunction

Function SetBuildingAmounts(string type)
    if type == "Base"
        BuildingAmount1 = Economy.BuildingsFarms.Length
        BuildingAmount2 = Economy.BuildingsHunting.Length
        BuildingAmount3 = Economy.BuildingsFishing.Length
        BuildingAmount4 = Economy.BuildingsLoggingCamps.Length
    elseif type == "Refining"
        BuildingAmount1 = Economy.BuildingsLumberMills.Length
        BuildingAmount2 = Economy.BuildingsTanneries.Length
        BuildingAmount3 = Economy.BuildingsSmelters.Length
        BuildingAmount4 = Economy.BuildingsCookeries.Length
    elseif type == "Crafting"
        BuildingAmount1 = Economy.BuildingsBlacksmiths.Length
    endif
EndFunction

Function SetBuildingTypes(string type)
    if type == "Base"
        BuildingTypes = new ObjectReference[4]
        BuildingAmount1 = Economy.BuildingsFarms.Length
        if BuildingAmount1 > 0
            BuildingTypes[0] = Economy.BuildingsFarms[0]
        endif
        
        BuildingAmount2 = Economy.BuildingsHunting.Length
        if BuildingAmount2 > 0
            BuildingTypes[1] = Economy.BuildingsHunting[0]
        endif
        
        BuildingAmount3 = Economy.BuildingsFishing.Length
        if BuildingAmount3 > 0
            BuildingTypes[2] = Economy.BuildingsFishing[0]
        endif
        
        BuildingAmount4 = Economy.BuildingsLoggingCamps.Length
        if BuildingAmount4 > 0
            BuildingTypes[3] = Economy.BuildingsLoggingCamps[0]
        endif
    elseif type == "Refining"
        BuildingTypes = new ObjectReference[4]
        BuildingAmount1 = Economy.BuildingsLumberMills.Length
        if BuildingAmount1 > 0
            BuildingTypes[0] = Economy.BuildingsLumberMills[0]
        endif
        
        BuildingAmount2 = Economy.BuildingsTanneries.Length
        if BuildingAmount2 > 0
            BuildingTypes[1] = Economy.BuildingsTanneries[0]
        endif
        
        BuildingAmount3 = Economy.BuildingsSmelters.Length
        if BuildingAmount3 > 0
            BuildingTypes[2] = Economy.BuildingsSmelters[0]
        endif
        
        BuildingAmount4 = Economy.BuildingsCookeries.Length
        if BuildingAmount4 > 0
            BuildingTypes[3] = Economy.BuildingsCookeries[0]
        endif
    elseif type == "Crafting"
        BuildingTypes = new ObjectReference[1]
        BuildingAmount1 = Economy.BuildingsBlacksmiths.Length
        if BuildingAmount1 > 0
            BuildingTypes[0] = Economy.BuildingsBlacksmiths[0]
        endif
    endif
EndFunction

Function SetConstructionText(string Type, int typenum)
    FormList BuildingTexts
    
    if Type == "Residential"
        BuildingTexts = CS_BuildingTypeTexts00Residential
    elseif Type == "Base"
        BuildingTexts = CS_BuildingTypeTexts01Base
    elseif Type == "Refining"
        BuildingTexts = CS_BuildingTypeTexts02Refining
    elseif Type == "Crafting"
        BuildingTexts = CS_BuildingTypeTexts03Crafting
    endif
    BuildingTypeLocAlias.ForceLocationTo(BuildingTexts.GetAt(typenum) as Location)
EndFunction
        
Function SetResourceConstructionCostMenu()
    FormList Materials = ConstructionCostScript.Materials
    
    int i = 0
    while i < Materials.GetSize()
        (Resources[i] as CS_SettlementManagementThreadAll).ConstructionCostScript = ConstructionCostScript
        (Resources[i] as CS_SettlementManagementThreadAll).CityStorage = Economy.StorageMaterials
        (Resources[i] as CS_SettlementManagementThreadAll).GoToState("ConstructionCost")
        (Resources[i] as CS_SettlementManagementThreadAll).RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
    
    i = 0
    while i < Materials.GetSize()
        while (Resources[i] as CS_SettlementManagementThreadAll).GetState() != "Updated"
            utility.wait(0.1)
        endwhile
        ResourceAmounts[i] = (Resources[i] as CS_SettlementManagementThreadAll).MaterialAmount
        PlayerMaterials[i] = (Resources[i] as CS_SettlementManagementThreadAll).PlayerMaterialAmount
        i += 1
    endwhile
EndFunction

int[] Function GetPlayerConstructionMaterials(FormList Materials, bool returnonfail=false)
    int[] MaterialAmounts = new int[4]   
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
        CS_SettlementManagementThreadAll Thread = Resources[i] as CS_SettlementManagementThreadAll
        if Resources[i].GetRef()
            Resources[i].GetRef().delete()
        endif
        Thread.GoToState("Cleared")
        i += 1
    endwhile
    
EndFunction

Event OnUpdate()
    if SoundFailSafeNum >= 10
        UnRegisterForUpdate()
    else
        SoundFailSafeNum += 1
        CS_BuildSound.Play(PlayerRef)
    endif
EndEvent