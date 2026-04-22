Scriptname CS_EconomyFactionUpdaterNewScript extends Quest  conditional


int Property factionnum Auto

int Property ChangeFood Auto
int Property ChangeWood Auto
int Property ChangeMetal Auto
int Property ChangeCoin Auto
int Property ChangeEquipment Auto
int Property FoodDeficit Auto

int Property FoodReserve Auto conditional
int Property WoodReserve Auto conditional
int Property MetalReserve Auto conditional
int Property EquipmentReserve Auto conditional
int Property CoinReserve Auto conditional

int Property CoinEnterprises Auto
int Property CoinSalariesWorkers Auto
int Property CoinSalariesTroops Auto
int Property CoinToSponsored Auto
int Property CoinSponsors Auto
int Property FoodHunted Auto
int Property FoodFarmed Auto
int Property WoodCut Auto
int Property MetalMined Auto

int Property ArmyCount Auto
int Property ArmiesHunting Auto

int Property FoodConsumedTroops Auto
int Property FoodConsumedWorkers Auto

Actor Property EconomyActorFood Auto
Actor Property EconomyActorWood Auto
Actor Property EconomyActorMetal Auto

LeveledItem Property CS_LItemFoodFarmed Auto
LeveledItem Property CS_LItemFoodHunted Auto
LeveledItem Property CS_LItemFoodImported Auto
LeveledItem Property CS_LItemIngots Auto
MiscObject Property IngotIron Auto
MiscObject Property IngotGold Auto
MiscObject Property IngotOrichalcum Auto
MiscObject Property IngotMoonstone Auto

int[] Property FoodExport Auto
int[] Property FoodImport Auto
int[] Property FoodImportActual Auto
int[] Property FoodUndelivered Auto
int[] Property FoodUnafforded Auto
int[] Property WoodExport Auto
int[] Property WoodImport Auto
int[] Property WoodImportActual Auto
int[] Property WoodUndelivered Auto
int[] Property WoodUnafforded Auto
int[] Property MetalExport Auto
int[] Property MetalImport Auto
int[] Property MetalImportActual Auto
int[] Property MetalUndelivered Auto
int[] Property MetalUnafforded Auto
int[] Property CoinExport Auto
int[] Property CoinImport Auto
int[] Property EquipmentExport Auto
int[] Property EquipmentImport Auto
int[] Property CoinTribute Auto
int[] Property CoinAid Auto

bool[] Property DoNotTrade Auto

bool Property Updated Auto

int Property MinesIron Auto
int Property MinesGold Auto
int Property MinesOrc Auto
int Property MinesMoonstone Auto

Sound Property CoinSound Auto
Sound Property FoodSound Auto
Sound Property WoodSound Auto
Sound Property MetalSound Auto

FormList Property CS_AllUpgradeLocations Auto
FormList Property CS_AllHoldings Auto

CS_TMScript Property TMScript Auto
CS_EconomyUpdaterNewScript Property EconomyUpdater Auto
CS_PatrolHoldScript Property CS_Commander Auto

Function UpdateResources()
    if factionnum != 10 ;Not player's faction
        SetCoinTribute()
        ArmyCount = 20*TMScript.ActiveCommanderCount
        
        ChangeFood = GetSum(FoodImport) + 3*ArmiesHunting - ArmyCount
        ChangeCoin = GetSum(CoinImport) + GetSum(CoinTribute) - GetSum(CoinExport)
    else
        UpdateTroopCosts()
        UpdateSponsors()
        UpdateEnterprises()

        ChangeFood = FoodHunted + FoodFarmed - FoodConsumedTroops - FoodConsumedWorkers
        ChangeWood = WoodCut
        ChangeMetal = MetalMined
        ChangeCoin = CoinSponsors + CoinEnterprises - CoinSalariesTroops - CoinSalariesWorkers - CoinToSponsored
        
    endif
EndFunction

Function SetCoinTribute()
    int i = 0
    while i < CoinTribute.Length
        if (CS_AllHoldings.GetAt(i) as GlobalVariable).GetValueInt() == factionnum
            CoinTribute[i] = EconomyUpdater.EconomyHoldUpdaters[i].CoinFactionTribute
        else
            CoinTribute[i] = 0
        endif
        i += 1
    endwhile
EndFunction

Function ResetCoin()
    int i = 0
    while i < CoinImport.Length
        CoinImport[i] = 0
        CoinExport[i] = 0
        i += 1
    endwhile
EndFunction

Function UpdateEnterprises()
    CoinEnterprises = 0
    int i = 0
    while i < EconomyUpdater.PlayerBuildingsUpdaters.Length
        CoinEnterprises += EconomyUpdater.PlayerBuildingsUpdaters[i].GetBuildingRevenue()
        i += 1
    endwhile
EndFunction

Function UpdateSponsors()
    CoinToSponsored = 0
    
    int i = 0
    while i < 9
        CoinToSponsored += 1000*((EconomyUpdater.EconomyHoldUpdaters[i] as Quest) as CS_InfluenceHoldUpdaterScript).ShopsSponsoredByPlayer
        i += 1
    endwhile
EndFunction

Function UpdateTroopCosts()
    FoodHunted = 0
    FoodConsumedTroops = 0
    CoinSalariesTroops = 0
    int i = 0
    while i < CS_Commander.Commanders.Length
        if CS_Commander.Commanders[i].GetActorRef() != None
            CS_ArmyTroopDeath ArmyScript = CS_Commander.ArmyScripts[i] as CS_ArmyTroopDeath
            if CS_Commander.Commanders[i].GetActorRef().IsInFaction(CS_Commander.HunterFaction) == 1
                FoodHunted += 3*ArmyScript.TroopCount
            endif
            
            if ArmyScript.IsVampire != true
                FoodConsumedTroops += ArmyScript.TroopCountFood
            endif
            
            CoinSalariesTroops += 10*ArmyScript.TroopCountCoin
        endif
        i += 1
    endwhile
EndFunction

Function SpendResource(string resource, int cost)
    if resource == "Coin"
        CoinSound.Play(Game.GetPlayer())
        CoinReserve -= cost
    elseif resource == "Food"
        FoodSound.Play(Game.GetPlayer())
        FoodReserve -= cost
    elseif resource == "Wood"
        WoodSound.Play(Game.GetPlayer())
        WoodReserve -= cost
    elseif resource == "Metal"
        MetalSound.Play(Game.GetPlayer())
        MetalReserve -= cost
    endif
    debug.notification(cost + " " + resource + " has been deducted from the reserves")
EndFunction

Function AddResource(string resource, int addition)
    if resource == "Coin"
        CoinSound.Play(Game.GetPlayer())
        CoinReserve += addition
    elseif resource == "Food"
        FoodSound.Play(Game.GetPlayer())
        FoodReserve += addition
    elseif resource == "Wood"
        WoodSound.Play(Game.GetPlayer())
        WoodReserve += addition
    elseif resource == "Metal"
        MetalSound.Play(Game.GetPlayer())
        MetalReserve += addition
    endif
    debug.notification(addition + " " + resource + " has been added to the reserves")
EndFunction

Function AddChanges()
    FoodReserve += ChangeFood
    WoodReserve += ChangeWood
    MetalReserve += ChangeMetal
    EquipmentReserve += ChangeEquipment
    CoinReserve += ChangeCoin
    
    if FoodReserve < 0
        FoodReserve = 0
    endif
    
    if WoodReserve < 0
        WoodReserve = 0
    endif
    
    if MetalReserve < 0
        MetalReserve = 0
    endif
    
    if EquipmentReserve < 0
        EquipmentReserve = 0
    endif
    
    if CoinReserve < 0
        CoinReserve = 0
    endif
    
    if factionnum == 0
        EconomyActorFood.RemoveAllItems()
        float HuntedPercentage
        if FoodHunted > 0
           HuntedPercentage = (FoodHunted as float)/((GetSum(FoodImport) + FoodHunted + FoodFarmed) as float)
        endif
        float FarmedPercentage
        if FoodFarmed > 0
           FarmedPercentage = (FoodFarmed as float)/((GetSum(FoodImport) + FoodHunted + FoodFarmed) as float)
        endif
        float FoodImportedPercentage
        if GetSum(FoodImport) > 0
            FoodImportedPercentage = (GetSum(FoodImport) as float)/((GetSum(FoodImport) + FoodHunted + FoodFarmed) as float)
        endif
        if FoodReserve > 0
            EconomyActorFood.AddItem(CS_LItemFoodHunted, (HuntedPercentage*FoodReserve) as int)
            EconomyActorFood.AddItem(CS_LItemFoodFarmed, (FarmedPercentage*FoodReserve) as int)
            EconomyActorFood.AddItem(CS_LItemFoodImported, (FoodImportedPercentage*FoodReserve) as int)
        endif
        
        EconomyActorMetal.RemoveAllItems()
        float IronMinedPercentage
        if MinesIron > 0
            IronMinedPercentage = MinesIron as float/((MinesIron + MinesGold + MinesOrc + MinesMoonstone) as float)
        endif

        float GoldMinedPercentage
        if MinesGold > 0
            GoldMinedPercentage = MinesGold as float/((MinesIron + MinesGold + MinesOrc + MinesMoonstone) as float)
        endif

        float OrcMinedPercentage
        if MinesOrc > 0
            OrcMinedPercentage = MinesOrc as float/((MinesIron + MinesGold + MinesOrc + MinesMoonstone) as float)
        endif

        float MoonstoneMinedPercentage
        if MinesMoonstone > 0
            MoonstoneMinedPercentage = MinesMoonstone as float/((MinesIron + MinesGold + MinesOrc + MinesMoonstone) as float)
        endif

        float MinedPercentage
        if MetalMined + GetSum(MetalImport) > 0
            MinedPercentage = MetalMined as float/((GetSum(MetalImport) + MetalMined) as float)
        endif

        float IronPercentage = IronMinedPercentage*MinedPercentage
        float GoldPercentage = GoldMinedPercentage*MinedPercentage
        float OrcPercentage = OrcMinedPercentage*MinedPercentage
        float MoonstonePercentage = MoonstoneMinedPercentage*MinedPercentage

        float MetalImportedPercentage
        if GetSum(MetalImport) + MetalMined > 0
            MetalImportedPercentage = GetSum(MetalImport) as float/((GetSum(MetalImport) + MetalMined) as float)
        endif
        EconomyActorMetal.AddItem(IngotIron, (IronPercentage*MetalReserve) as int)
        EconomyActorMetal.AddItem(IngotGold, (GoldPercentage*MetalReserve) as int)
        EconomyActorMetal.AddItem(IngotOrichalcum, (OrcPercentage*MetalReserve) as int)
        EconomyActorMetal.AddItem(IngotMoonstone, (MoonstonePercentage*MetalReserve) as int)
        EconomyActorMetal.AddItem(CS_LItemIngots, (MetalImportedPercentage*MetalReserve) as int)
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

Function ImmediateUpdateFaction()
    UpdateResources()
EndFunction

Function ImmediateUpdate()
    UpdateResources()
EndFunction

Event OnUpdate()
    if EconomyUpdater.UpdatePhase == 0
        Updated = false
        UpdateResources()
        Updated = true
    elseif EconomyUpdater.UpdatePhase == 7
        Updated = false
        AddChanges()
        Updated = true
    endif
EndEvent