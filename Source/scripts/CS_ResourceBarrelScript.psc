Scriptname CS_ResourceBarrelScript extends ObjectReference  

int Property citynum Auto hidden

string Property ResourceType Auto

MiscObject Property Gold001 Auto
LeveledItem Property CS_LItemResourceAllFood Auto
LeveledItem Property CS_LItemResourceAllMaterials Auto
LeveledItem Property CS_LItemResourceAllEquipment Auto

Sound Property CoinSound Auto
Sound Property FoodSound Auto
Sound Property MetalSound Auto
Sound Property WoodSound Auto

bool Property Village Auto

CS_FactionManagementEconomy Property CS_FactionPlayer Auto
CS_AttackCityFinalScript Property CS_AttackCityFinal Auto

Event OnActivate(ObjectReference akActivator)
    GoToState("StopActivation")
    if ResourceType == "Food"
        PillageFood()
    elseif ResourceType == "Equipment"
        PillageEquipment()
    elseif ResourceType == "Materials"
        PillageMaterials()
    elseif ResourceType == "Gold"
        PillageGold()
    endif
    disable()
    
    if CS_AttackCityFinal.IsRunning() && CS_AttackCityFinal.citynum == citynum
        CS_AttackCityFinal.CheckAllBarrels()
    endif
EndEvent

Function PillageGold()
    int NewGold
    if citynum < 5
        NewGold = utility.randomint(2000, 4000)
    elseif citynum >= 5 && citynum < 9
        NewGold = utility.randomint(1000, 2000)
    else
        NewGold = utility.randomint(500, 1000)
    endif
    CS_FactionPlayer.StorageTreasury.AddItem(Gold001, NewGold)
    ;City.SetKeywordData(EconomyScript.Treasury, City.GetKeywordData(EconomyScript.Treasury) - NewGold)
    CoinSound.Play(Game.GetPlayer())
    debug.notification(NewGold + " gold has been raided!")
EndFunction

Function PillageFood()
    int NewFood
    if citynum < 5
        NewFood = utility.randomint(20, 40)
    elseif citynum >= 5 && citynum < 9
        NewFood = utility.randomint(10, 20)
    else
        NewFood = utility.randomint(5, 10)
    endif
    CS_FactionPlayer.StorageFood.AddItem(CS_LItemResourceAllFood, NewFood)
    ;City.SetKeywordData(EconomyScript.FoodReserve, City.GetKeywordData(EconomyScript.FoodReserve) - NewFood)
    FoodSound.Play(Game.GetPlayer())
    debug.notification(NewFood + " food has been raided!")
EndFunction

Function PillageMaterials()
    int NewMaterials
    if citynum < 5
        NewMaterials = utility.randomint(20, 40)
    elseif citynum >= 5 && citynum < 9
        NewMaterials = utility.randomint(10, 20)
    else
        NewMaterials = utility.randomint(5, 10)
    endif
    CS_FactionPlayer.StorageMaterials.AddItem(CS_LItemResourceAllMaterials, NewMaterials)
    ;City.SetKeywordData(EconomyScript.MaterialsReserve, City.GetKeywordData(EconomyScript.MaterialsReserve) - NewMaterials)
    WoodSound.Play(Game.GetPlayer())
    debug.notification(NewMaterials + " Materials has been raided!")
EndFunction

Function PillageEquipment()
    int NewEquipment
    if citynum < 5
        NewEquipment = utility.randomint(10, 20)
    elseif citynum >= 5 && citynum < 9
        NewEquipment = utility.randomint(5, 10)
    else
        NewEquipment = utility.randomint(1, 5)
    endif
    CS_FactionPlayer.StorageEquipment.AddItem(CS_LItemResourceAllEquipment, NewEquipment)
    ;City.SetKeywordData(EconomyScript.EquipmentReserve, City.GetKeywordData(EconomyScript.EquipmentReserve) - NewEquipment)
    MetalSound.Play(Game.GetPlayer())
    debug.notification(NewEquipment + " Equipment has been raided!")
EndFunction

State StopActivation
    
    Event OnActivate(ObjectReference akActivator)
        ;None
    EndEvent
    
EndState