Scriptname CS_EconomyHoldUpdaterNewScript extends Quest  

Location Property City Auto

int Property holdnum Auto

int Property Stability Auto

int Property Infrastructure Auto

int Property InitialFoodChange Auto
int Property InitialFoodFishChange Auto
int Property InitialFoodHuntingChange Auto
int Property InitialWoodChange Auto
int Property InitialMetalChange Auto

int Property InitialLevelFarms Auto
int Property InitialLevelFishing Auto
int Property InitialLevelHunting Auto
int Property InitialLevelLumberMills Auto
int Property InitialLevelMines Auto

int Property ChangeFood Auto
int Property ChangeWood Auto
int Property ChangeMetal Auto
int Property ChangeCoin Auto

int Property FoodReserve Auto
int Property WoodReserve Auto
int Property MetalReserve Auto
int Property CoinReserve Auto

int Property FoodCirculation Auto
int Property Food2DaysAgo Auto
int Property Food1DayAgo Auto
int Property FoodToday Auto
int Property FoodEatenReserves Auto
int Property WoodCirculation Auto
int Property MetalCirculation Auto
int Property CoinCirculation Auto
int Property CoinCirculationChange Auto

int Property Population Auto
int Property PopulationCommoner Auto
int Property WagesCommoner Auto
int Property PlayerWagesCommoner Auto
int Property WorkerWages Auto
int Property PaidWorkerWages Auto
int Property RentCommoner Auto
int Property PaidRentCommoner Auto
int Property PopulationNobility Auto
int Property WagesGuard Auto
int Property GuardWages Auto
int Property PaidGuardWages Auto
int Property FoodEaten Auto
int Property WoodMaintenanceCost Auto
int Property MetalMaintenanceCost Auto
int Property ProductionCost Auto

bool Property AutoMaintenance=true Auto

int Property CoinTaxes Auto
int Property CoinTaxesNobility Auto
int Property CoinTribute Auto
int Property CoinSubsidies Auto
int Property CoinStipends Auto
int Property CoinGovSalaries Auto
int Property TreasuryChange Auto
int Property FoodFarmed Auto
int Property FoodFarmedBought Auto
int Property FoodFarmedQuota Auto
int Property FoodHunted Auto
int Property FoodHuntedBought Auto
int Property FoodHuntedQuota Auto
int Property FoodFished Auto
int Property FoodFishedBought Auto
int Property FoodFishedQuota Auto
int Property FoodQuota Auto
int Property PlayerFood Auto
int Property WoodCut Auto
int Property WoodCutBought Auto
int Property WoodCutQuota Auto
int Property WoodQuota Auto
int Property PlayerWood Auto
int Property MetalMined Auto
int Property MetalMinedBought Auto
int Property MetalMinedQuota Auto
int Property MetalQuota Auto
int Property PlayerMetal Auto
int Property Guards Auto
int Property GuardsMax Auto
int Property Workers Auto
int Property WorkerIncreaseNum Auto
int Property WorkersFarms Auto
int Property WorkersFarmsMax Auto
int Property InfrastructureFarms Auto
int Property WorkersHunting Auto
int Property WorkersHuntingMax Auto
int Property InfrastructureHunting Auto
int Property WorkersFishing Auto
int Property WorkersFishingMax Auto
int Property InfrastructureFishing Auto
int Property WorkersLumberMills Auto
int Property WorkersLumberMillsMax Auto
int Property InfrastructureLumberMills Auto
int Property WorkersMines Auto
int Property WorkersMinesMax Auto
int Property InfrastructureMines Auto
int Property Unemployed Auto
int Property ArmiesDefending Auto
float Property CrimeRate Auto

int Property UpgradingBuilding Auto
float Property UpgradeTime Auto

int Property MinesIron Auto
int Property MinesGold Auto
int Property MinesSilver Auto
int Property MinesMoonstone Auto
int Property MinesQuicksilver Auto

LeveledItem Property CS_LItemFoodFarmed Auto
LeveledItem Property CS_LItemFoodFished Auto
LeveledItem Property CS_LItemFoodHunted Auto
LeveledItem Property CS_LItemFoodImported Auto
LeveledItem Property CS_LItemIngots Auto
MiscObject Property IngotIron Auto
MiscObject Property IngotGold Auto
MiscObject Property IngotSilver Auto
MiscObject Property IngotIMoonstone Auto
MiscObject Property IngotQuicksilver Auto

int Property FoodDeficit Auto

int Property IntelFoodDeficit Auto

int Property PlayerInfluenceEconomy Auto
int Property PlayerInfluenceDeeds Auto
float Property PlayerTradeModifier Auto
float Property CityTradeModifierWithPlayer Auto

int[] Property FoodExport Auto
int[] Property FoodImport Auto
int[] Property FoodUndelivered Auto
int[] Property FoodImportActual Auto
int[] Property WoodExport Auto
int[] Property WoodImport Auto
int[] Property WoodUndelivered Auto
int[] Property WoodImportActual Auto
int[] Property MetalExport Auto
int[] Property MetalImport Auto
int[] Property MetalUndelivered Auto
int[] Property MetalImportActual Auto
int[] Property CoinExport Auto
int[] Property CoinImport Auto
float Property CoinFactionTributePercent Auto
int Property CoinFactionTribute Auto
int Property CoinFactionAid Auto

int[] Property FactionFoodExport Auto
int[] Property FactionFoodImport Auto
int[] Property FactionFoodUndelivered Auto
int[] Property FactionFoodImportActual Auto
int[] Property FactionWoodExport Auto
int[] Property FactionWoodImport Auto
int[] Property FactionWoodUndelivered Auto
int[] Property FactionWoodImportActual Auto
int[] Property FactionMetalExport Auto
int[] Property FactionMetalImport Auto
int[] Property FactionMetalUndelivered Auto
int[] Property FactionMetalImportActual Auto
int[] Property FactionCoinExport Auto
int[] Property FactionCoinImport Auto
int[] Property FactionEquipmentExport Auto
int[] Property FactionEquipmentImport Auto

bool[] Property DoNotTrade Auto

int Property FoodToTrade Auto
int Property WoodToTrade Auto
int Property MetalToTrade Auto
int Property EquipmentToTrade Auto

int Property FoodCost Auto
int Property InitialFoodCost Auto
int Property AddFoodCost Auto
int Property WoodCost Auto
int Property MetalCost Auto
int Property RandomFoodModifier Auto
int Property RandomWoodModifier Auto
int Property RandomMetalModifier Auto
int Property EquipmentCost Auto

int Property WealthNobilityInitial Auto
int Property WealthNobility Auto
int Property WealthNobilityChange Auto
int Property WealthCommonersInitial Auto
int Property WealthCommoners Auto
int Property WealthCommonersChange Auto

int Property JarlOpinion Auto

float Property WorkerEfficiency Auto

bool Property ChangeDetected Auto
bool Property Updated Auto
bool Property TradeWithPlayer Auto
bool Property InventoryReset Auto

FormList Property NobilityCity Auto
FormList Property ResourceBuildingsFarms Auto
FormList Property ResourceBuildingsHunting Auto
FormList Property ResourceBuildingsFishing Auto
FormList Property ResourceBuildingsLumberMills Auto
FormList Property ResourceBuildingsMines Auto
FormList Property ResourceBuildingsBlacksmiths Auto
FormList Property ResourceBuildingsShops Auto
FormList Property ResourceBuildingsHouses Auto
FormList Property CS_BuildingPrioritiesFood Auto
FormList Property CS_AllUpgradeLocations Auto
FormList Property CS_AllLocations Auto
FormList Property CS_AllHoldings Auto
FormList Property CS_AllGuardFormLists Auto
FormList Property CS_AllAttackPalaces Auto

Keyword Property CS_CityManagementTaxRate Auto
Keyword Property CS_CityManagementTaxRateNobility Auto
Keyword Property CS_PlayerJarl Auto
Keyword Property CS_Infrastructure Auto
Keyword Property CS_Workers Auto
Keyword Property CS_NearCity Auto
Keyword Property CS_BuildingLevel Auto

Keyword Property CS_CityLevelFarms Auto
Keyword Property CS_CityLevelHunting Auto
Keyword Property CS_CityLevelFishing Auto
Keyword Property CS_CityLevelLumberMills Auto
Keyword Property CS_CityLevelMines Auto

Actor Property EconomyActorFood Auto
Actor Property EconomyActorWood Auto
Actor Property EconomyActorMetal Auto

Faction Property CS_FactionBandits Auto
Faction Property CS_FactionOrcs Auto
Faction Property CS_FactionUnclaimed Auto

GlobalVariable Property GameDaysPassed Auto
float Property LastDailyUpdate Auto

ReferenceAlias Property NameChanger Auto

ObjectReference Property TradeHub Auto

CS_RecruitJarl Property CS_FactionGovernment Auto
CS_EconomyUpdaterNewScript Property EconomyUpdater Auto

Function SetUpInitialValues()
    
EndFunction

Function UpdatePopulationCount(bool stream = true) ; Gets the population count  (doesn't actually change it), START OF POPULATION CHANGE STREAM
    debug.trace("City " + holdnum + "Population Count Stream Started")
    int initialPopulation = Population
    UpdateNobilityCount()
    Population = PopulationCommoner + PopulationNobility
    debug.trace("City " + holdnum + "Population Count Stream Finished")
EndFunction

Function UpdatePlayerBuildings(bool stream = true) ;Updates the resources from the player buildings
    CS_PlayerBuildingsHoldUpdaterScript PlayerBuildings = ((self as Quest) as CS_PlayerBuildingsHoldUpdaterScript)
    PlayerBuildings.UpdateResources()
EndFunction

Function UpdateWages(bool stream = true) ; Updates the paid wages of both the guards and commoners, START OF WAGES STREAM
    debug.trace("City " + holdnum + "Wages Stream Started")
    
    GuardWages = WagesGuard*Guards
    WorkerWages = WagesCommoner*(PopulationCommoner - Unemployed)
    
    if (WealthNobility + WealthNobilityChange) >= WorkerWages
        PaidWorkerWages = WorkerWages
    elseif (WealthNobility + WealthNobilityChange) > 0
        ;Some workers unpaid
        PaidWorkerWages = (WealthNobility + WealthNobilityChange)
    else
        ;All workers unpaid
        PaidWorkerWages = 0
    endif
    
    if (CoinReserve + TreasuryChange) >= GuardWages
        PaidGuardWages = GuardWages
    elseif (CoinReserve + TreasuryChange) > 0
        ;Some guards unpaid
        PaidGuardWages = CoinReserve + TreasuryChange
    else
        ;All guards unpaid
        PaidGuardWages = 0
    endif
    
    if stream
        UpdateTaxes("Commoners", false)
        UpdateWealthChange()
        UpdateTreasuryChange(false)
    endif
    debug.trace("City " + holdnum + "Wages Stream Finished")
EndFunction

Function UpdateMaintenanceCosts(bool stream = true) ; Determining the maintenance costs of a city
    if AutoMaintenance
        WoodMaintenanceCost = math.floor(Population as float/10)
        MetalMaintenanceCost = math.ceiling(WoodMaintenanceCost*0.2)
    else
        WoodMaintenanceCost = 0
        MetalMaintenanceCost = 0
    endif
EndFunction

Function UpdateRent(bool stream = true) ; Updates the paid rent of the commoners : START OF RENT STREAM
    debug.trace("City " + holdnum + "Rent Stream Started")
    if (WealthCommoners + WealthCommonersChange) >= RentCommoner*(PopulationCommoner - Guards)
        PaidRentCommoner = RentCommoner*(PopulationCommoner - Guards)
    elseif (WealthCommoners + WealthCommonersChange) > 0
        ;Some rent unpaid
        PaidRentCommoner = (WealthCommoners + WealthCommonersChange)
    else
        PaidRentCommoner = 0
        ;All rent unpaid
    endif
    
    if stream
        UpdateTreasuryChange()
        UpdateWealthChange()
    endif
    debug.trace("City " + holdnum + "Rent Stream Finished")
EndFunction

Function UpdateTaxes(string Group, bool stream = true) ; Updates the amount of tax coin provided by each group ; START OF TAXES STREAM
    debug.trace("City " + holdnum + "Taxes Stream Started")
    if Group == "Commoners"
        CoinTaxes = math.floor(PaidWorkerWages as float*(0.1*City.GetKeywordData(CS_CityManagementTaxRate)))
        if CoinTaxes < 0
            CoinTaxes = 0
        endif
    elseif Group == "Nobility"
        CoinTaxesNobility = math.floor((PaidRentCommoner + GetSum(CoinImport) + GetSum(FactionCoinImport) + InitialFoodCost + AddFoodCost + FoodCost*FoodFarmedBought + WoodCost*WoodCutBought + MetalCost*MetalMinedBought - PaidWorkerWages) as float*(0.1*City.GetKeywordData(CS_CityManagementTaxRateNobility)))
        if CoinTaxesNobility < 0
            CoinTaxesNobility = 0
        endif
    endif
    
    if stream
        UpdateTreasuryChange()
        UpdateWealthChange()
    endif
    debug.trace("City " + holdnum + "Taxes Stream Ended")
EndFunction

Function UpdateTreasuryChange(bool stream = true) ; Updates the daily change of the treasury
    int Revenues = CoinTaxes + CoinTaxesNobility + CoinTribute  + CoinFactionAid
    int Expenses = CoinGovSalaries + PaidGuardWages + CoinFactionTribute + CoinSubsidies + CoinStipends
    int ReservesPurchases = FoodCost*FoodFarmedBought + WoodCost*WoodCutBought + MetalCost*MetalMinedBought
    TreasuryChange = Revenues - Expenses - ReservesPurchases
EndFunction

Function UpdateReservesPurchases(string Resource, bool stream = true) ; Determines the daily amount of a resource that the treasury has purchased
    if Resource == "Food"
        if ChangeFood > 0
            if (CoinReserve + TreasuryChange) <= 0
                FoodFarmedBought = 0
            elseif (CoinReserve + TreasuryChange) >= FoodCost*math.ceiling(0.01*FoodQuota*ChangeFood)
                FoodFarmedBought = math.ceiling(0.01*FoodQuota*ChangeFood)
            elseif (CoinReserve + TreasuryChange) < FoodCost*math.ceiling(0.01*FoodQuota*ChangeFood)
                FoodFarmedBought = math.floor((CoinReserve + TreasuryChange) as float/FoodCost as float)
            endif
        else
            FoodFarmedBought = 0
        endif
        debug.trace("City " + holdnum + " FoodBought = " + FoodFarmedBought)
    elseif Resource == "Wood"
        if ChangeWood > 0
            if (CoinReserve + TreasuryChange) <= 0
                WoodCutBought = 0
            elseif (CoinReserve + TreasuryChange) >= WoodCost*math.ceiling(0.01*WoodQuota*ChangeWood)
                WoodCutBought = math.ceiling(0.01*WoodQuota*ChangeWood)
            elseif (CoinReserve + TreasuryChange) < WoodCost*math.ceiling(0.01*WoodQuota*ChangeWood)
                WoodCutBought = math.floor((CoinReserve + TreasuryChange) as float/WoodCost as float)
            endif
        else
            WoodCutBought = 0
        endif
        debug.trace("City " + holdnum + " WoodCutBought = " + WoodCutBought)
    elseif Resource == "Metal"
        if ChangeMetal > 0
            if (CoinReserve + TreasuryChange) <= 0
                MetalMinedBought = 0
            elseif (CoinReserve + TreasuryChange) >= MetalCost*math.ceiling(0.01*MetalQuota*ChangeMetal)
                MetalMinedBought = math.ceiling(0.01*MetalQuota*ChangeMetal)
            elseif (CoinReserve + TreasuryChange) < MetalCost*math.ceiling(0.01*MetalQuota*ChangeMetal)
                MetalMinedBought = math.floor((CoinReserve + TreasuryChange) as float/MetalCost as float)
            endif
        else
            MetalMinedBought = 0
        endif
        debug.trace("City " + holdnum + " MetalMinedBought = " + MetalMinedBought)
    endif
EndFunction

Function SetTradeAmounts(string Resource, bool stream = true) ; Determines the amount of a resource that will be allocated to trading
    if Resource == "Food"
        FoodToTrade = ChangeFood - FoodEaten - GetSum(FoodImport)
    elseif Resource == "Wood"
        WoodToTrade = ChangeWood - 20 - GetSum(WoodImport)
    elseif Resource ==  "Metal"
        MetalToTrade = ChangeMetal - 20 - GetSum(MetalImport)
    endif
EndFunction

Function UpdateWealthChange()
    ;WealthNobilityChange
    int NobilityChanges1 = PaidRentCommoner - PaidWorkerWages - CoinTribute - CoinTaxesNobility
    int NobilityChanges2 = FoodCost*FoodFarmedBought + WoodCost*WoodCutBought + MetalCost*MetalMinedBought
    int NobilityChanges3 = (GetSum(CoinImport) + GetSum(FactionCoinImport) - GetSum(CoinExport) - GetSum(FactionCoinExport))
    int NobilityChanges4 = InitialFoodCost + AddFoodCost + CoinSubsidies
    WealthNobilityChange = NobilityChanges1 + NobilityChanges2 + NobilityChanges3 + NobilityChanges4
    
    ;WealthCommonerChange
    int CommonerChanges1 = PaidWorkerWages + PaidGuardWages + CoinStipends - PaidRentCommoner - CoinTaxes
    int CommonerChanges2 = -InitialFoodCost - AddFoodCost
    WealthCommonersChange = CommonerChanges1 + CommonerChanges2
EndFunction

Function SpawnGuard()
    Actor NextGuard = GetNextGuard()
    NextGuard.reset()
    NextGuard.enable()
    NextGuard.reset()
    NameChanger.ForceRefTo(NextGuard)
    Guards += 1
    if Guards > GuardsMax
        Guards = GuardsMax
    endif
EndFunction
    
Actor Function GetNextGuard()
    FormList GuardFormList = CS_AllGuardFormLists.GetAt(holdnum) as FormList
    int i = 0
    while i < GuardFormList.GetSize()
        if (GuardFormList.GetAt(i) as Actor).IsDisabled() || (GuardFormList.GetAt(i) as Actor).IsDead()
            return GuardFormList.GetAt(i) as Actor
        endif
        i += 1
    endwhile
EndFunction

Function SpawnAllGuards()
    FormList GuardFormList = CS_AllGuardFormLists.GetAt(holdnum) as FormList
    int i = 0
    while i < GuardFormList.GetSize()
        if (GuardFormList.GetAt(i) as Actor).IsDisabled() || (GuardFormList.GetAt(i) as Actor).IsDead()
            Actor NextGuard = (GuardFormList.GetAt(i) as Actor)
            NextGuard.reset()
            NextGuard.enable()
            NextGuard.reset()
            NameChanger.ForceRefTo(NextGuard)
            Guards += 1
        endif
        i += 1
    endwhile
    
    if Guards > GuardsMax
        Guards = GuardsMax
    endif
EndFunction

Function UpdateGuards()
    FormList GuardFormList = CS_AllGuardFormLists.GetAt(holdnum) as FormList
    Guards = 0
    int i = 0
    while i < GuardFormList.GetSize()
        if (GuardFormList.GetAt(i) as Actor).IsEnabled() && !(GuardFormList.GetAt(i) as Actor).IsDead()
            Guards += 1
        endif
        i += 1
    endwhile
    
    if Guards > GuardsMax
        Guards = GuardsMax
    endif
EndFunction

Function UpdateNobilityCount()
    int initialNobility = PopulationNobility
    
    if NobilityCity
        int NobilityAlive = 0
        int i = 0
        while i < NobilityCity.GetSize()
            ActorBase Noble = (NobilityCity.GetAt(i) as ActorBase)
            if Noble.GetDeadCount() == 0 && CS_FactionGovernment.JarlAliases[holdnum].GetActorRef().GetActorBase() != Noble
                NobilityAlive += 1
            endif
            i += 1
        endwhile
        
        PopulationNobility = NobilityAlive
    else
        PopulationNobility = 0
    endif
EndFunction

int Function GetSum(int[] array)
    int sum = 0
    int i = 0
    while i < array.Length
        sum += array[i]
        i += 1
    endwhile
    
    return sum
EndFunction

Function CalculatePlayerInfluence()
    PlayerInfluenceEconomy = 0
    float PlayerFoodPercentage = 0
    float PlayerWoodPercentage = 0
    float PlayerMetalPercentage = 0
    float PlayerCoinPercentage = 0
    
    if FactionFoodImport[0] > 0 || PlayerFood > 0
        int InitialFood = math.floor((1 + 0.02*WorkersFarms)*InitialFoodChange) + math.floor((1 + 0.02*WorkersHunting)*InitialFoodHuntingChange) + math.floor((1 + 0.02*WorkersFishing)*InitialFoodFishChange) + GetSum(FoodImport) + GetSum(FactionFoodImport) + PlayerFood
        PlayerFoodPercentage = 100*((FactionFoodImportActual[0] as float) + PlayerFood as float)/(InitialFood as float)
    endif
    
    if FactionWoodImport[0] > 0 || PlayerWood > 0
        int InitialWood = math.floor((1 + 0.02*WorkersLumberMills)*InitialWoodChange) + GetSum(WoodImport) + GetSum(FactionWoodImport)
        PlayerWoodPercentage = 100*((FactionWoodImportActual[0] as float) + PlayerWood as float)/(InitialWood as float)
    endif
    
    if FactionMetalImport[0] > 0 || PlayerMetal > 0
        int InitialMetal = math.floor((1 + 0.02*WorkersMines)*InitialMetalChange) + GetSum(MetalImport) + GetSum(FactionMetalImport)
        PlayerMetalPercentage = 100*((FactionMetalImportActual[0] as float) + PlayerMetal as float)/(InitialMetal as float)
    endif
    
    if FactionCoinImport[0] > 0
        int InitialCoin = 10*Population*City.GetKeywordData(CS_CityManagementTaxRate) as int + GetSum(CoinImport) + GetSum(FactionCoinImport)
        PlayerCoinPercentage = 100*(FactionCoinImport[0] as float)/(InitialCoin as float)
    endif
    
    PlayerInfluenceEconomy = math.floor((3*PlayerFoodPercentage + PlayerWoodPercentage + PlayerMetalPercentage + PlayerCoinPercentage)/6)
    
    if PlayerInfluenceEconomy > 100
        PlayerInfluenceEconomy = 100
    elseif PlayerInfluenceEconomy < 0
        PlayerInfluenceEconomy = 0
    endif
EndFunction

int Function CalculateCityInfluence(int citynum)
    int CityInfluenceEconomy = 0
    float CityFoodPercentage = 0
    float CityWoodPercentage = 0
    float CityMetalPercentage = 0
    float CityCoinPercentage = 0
    
    if FoodImport[citynum] > 0
        int InitialFood = math.floor((1 + 0.02*WorkersFarms)*InitialFoodChange) + math.floor((1 + 0.02*WorkersHunting)*InitialFoodHuntingChange) + math.floor((1 + 0.02*WorkersFishing)*InitialFoodFishChange) + GetSum(FoodImport)
        CityFoodPercentage = 100*(FoodImportActual[citynum] as float)/(InitialFood as float)
    endif
    
    if WoodImport[citynum] > 0
        int InitialWood = math.floor((1 + 0.02*WorkersLumberMills)*InitialWoodChange) + GetSum(WoodImport)
        CityWoodPercentage = 100*(WoodImportActual[citynum] as float)/(InitialWood as float)
    endif
    
    if MetalImport[citynum] > 0
        int InitialMetal = math.floor((1 + 0.02*WorkersMines)*InitialMetalChange) + GetSum(MetalImport)
        CityMetalPercentage = 100*(MetalImportActual[citynum] as float)/(InitialMetal as float)
    endif
    
    if CoinImport[citynum] > 0
        int InitialCoin = 10*Population*City.GetKeywordData(CS_CityManagementTaxRate) as int + GetSum(CoinImport) + GetSum(CoinImport)
        CityCoinPercentage = 100*(CoinImport[citynum] as float)/(InitialCoin as float)
    endif
    
    CityInfluenceEconomy = math.floor((3*CityFoodPercentage + CityWoodPercentage + CityMetalPercentage + CityCoinPercentage)/6)
    
    if CityInfluenceEconomy > 100
        CityInfluenceEconomy = 100
    elseif CityInfluenceEconomy < 0
        CityInfluenceEconomy = 0
    endif
    
    return CityInfluenceEconomy
EndFunction

Function AdjustResourceCosts()
    
    float PopulationFood = ((FoodCirculation + FoodToTrade) as float)/(Population as float)
    int FoodCostModifier = 0
    if PopulationFood < 1
        FoodCostModifier += math.floor((1 - PopulationFood)*10) + RandomFoodModifier
    else
        FoodCostModifier -= math.floor(PopulationFood) + RandomFoodModifier
    endif
    FoodCost = 15 + FoodCostModifier
    if FoodCost < 10
        FoodCost = 10
    endif
    
    float PopulationWood = ((WoodCirculation + WoodToTrade) as float)/(Population as float)
    int WoodCostModifier = 0
    if PopulationWood < 1
        WoodCostModifier += math.floor((1 - PopulationWood)*10) + RandomWoodModifier
    else
        WoodCostModifier -= math.floor(PopulationWood) + RandomWoodModifier
    endif
    WoodCost = 45 + WoodCostModifier
    if WoodCost < 20
        WoodCost = 20
    endif
    
    float PopulationMetal = ((MetalCirculation + MetalToTrade) as float)/(Population as float)
    int MetalCostModifier = 0
    if PopulationMetal < 1
        MetalCostModifier += math.floor((1 - PopulationMetal)*10) + RandomMetalModifier
    else
        MetalCostModifier -= math.floor(PopulationMetal) + RandomMetalModifier
    endif
    MetalCost = 45 + MetalCostModifier
    if MetalCost < 20
        MetalCost = 20
    endif
    
EndFunction

float Function GetMax(int a, int b, int c=-1, int d=-1, int e=-1)
    Float max = a
    
    If (b > max)
        max = b
    EndIf
    
    If (c > max)
        max = c
    EndIf
    
    If (d > max)
        max = d
    EndIf
    
    If (e > max)
        max = e
    EndIf
    
    Return max
EndFunction

Function UpdateAllChangeValues()
    UpdateTaxes("Nobility", false)
    UpdateTaxes("Commoners", false)
    UpdateTreasuryChange()
    UpdateWealthChange()
EndFunction
