Scriptname CS_StorageFoodReserves extends ObjectReference  

import CS_CommonFunctions

ObjectReference Property City Auto hidden

Form[] Property StorageItems Auto hidden

FormList Property CS_StorageAllItemsFood Auto
FormList Property CS_StorageKeywordsFood Auto

GlobalVariable Property GameDaysPassed Auto

int Property FoodDeficiency Auto hidden
int Property MinimumAmount Auto hidden

float LastUpdate

Function SetUp(ObjectReference NewCity)
    City = NewCity
    LastUpdate = GameDaysPassed.GetValue()
EndFunction

Function AddToStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    StorageItems = AddToFormArray(Item, StorageItems)
EndFunction

Function RemoveFromStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    StorageItems = RemoveFromFormArray(Item, StorageItems)
EndFunction

int Function GetStorageAmount()
    return GetItemCount(CS_StorageAllItemsFood)
EndFunction

Function FillReservesFromFaction()
    ObjectReference FactionOwner = (City as CS_CityManagementOwnership).FactionOwnerActivator
    ObjectReference FactionStorage = (FactionOwner as CS_FactionManagementEconomy).StorageFood
    CS_StorageFactionScript StorageScript = FactionStorage as CS_StorageFactionScript
    Form[] FactionStorageItems = StorageScript.StorageItems
    int AmountToFill = MinimumAmount - GetItemCount(CS_StorageAllItemsFood)
    
    int i = 0
    while i < FactionStorageItems.Length && AmountToFill > 0
        int FactionStorageAmount = FactionStorage.GetItemCount(FactionStorageItems[i])
        FactionStorage.RemoveItem(FactionStorageItems[i], AmountToFill, true, self as ObjectReference)
        AmountToFill = MinimumAmount - GetItemCount(CS_StorageAllItemsFood)
        i += 1
    endwhile
EndFunction

Function ConsumeFactionFood()
    CS_CityManagementOwnership Ownership = City as CS_CityManagementOwnership
    CS_CityManagementPopulation Population = City as CS_CityManagementPopulation
    CS_FactionManagementEconomy FactionEconomy = Ownership.FactionOwnerActivator as CS_FactionManagementEconomy
    CS_StorageFactionScript FoodStorage = FactionEconomy.StorageFood as CS_StorageFactionScript
    
    float FoodAdjustment = math.floor(GameDaysPassed.GetValue() - LastUpdate)
    if FoodAdjustment < 1
        FoodAdjustment = 1
    endif
    int TotalFood = math.floor(FoodAdjustment*Population.TotalPopulation) as int
    LastUpdate = GameDaysPassed.GetValue()
    int RemainingAmount = FoodStorage.Consume(self as ObjectReference, TotalFood)
    if RemainingAmount > 0
        RemainingAmount = ConsumeItems(RemainingAmount)
    endif
    
    FoodDeficiency = RemainingAmount
    debug.trace("Faction gave " + (TotalFood - RemainingAmount) + " Food for " + Ownership.VanillaCity.GetName() + ". Deficiency = " + FoodDeficiency)
EndFunction

int Function ConsumeItems(int ConsumeAmount)
    debug.trace("Started Reserves Food Consumption")
    int AmountToConsume = ConsumeAmount
    int i = StorageItems.Length - 1
    while i >= 0 && AmountToConsume > 0
        Form Item = StorageItems[i]
        int itemcount = GetItemCount(Item)
        if itemcount >= AmountToConsume
            RemoveItem(Item, AmountToConsume)
            AmountToConsume = 0
        elseif itemcount > 0
            RemoveItem(Item, itemcount)
            AmountToConsume -= itemcount
        endif
        i -= 1
    endwhile
    
    return AmountToConsume
    debug.trace("Reserves Food Consumption Finished!")
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    CS_StorageAllItemsFood.AddForm(akBaseItem)
    if StorageItems.Find(akBaseItem) < 0
        AddToStorageItems(akBaseItem)
    endif
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    if StorageItems.Find(akBaseItem) >= 0 && GetItemCount(akBaseItem) == 0
        RemoveFromStorageItems(akBaseItem)
    endif
EndEvent

State InitiateConsumption

    Event OnUpdate()
        GoToState("Consuming")
        ConsumeFactionFood()
        FillReservesFromFaction()
        GoToState("Ready")
    EndEvent
    
EndState