Scriptname CS_StorageCityScript extends ObjectReference  

import CS_CommonFunctions

Form[] Property FactionDemands Auto hidden
FormList[] Property FactionDemandGroups Auto hidden
ObjectReference[] Property FactionDemandAgreements Auto hidden
ObjectReference[] Property FactionDemandGroupAgreements Auto hidden

Form[] Property FactionGifts Auto hidden
FormList[] Property FactionGiftGroups Auto hidden
ObjectReference[] Property FactionGiftAgreements Auto hidden
ObjectReference[] Property FactionGiftGroupAgreements Auto hidden

string Property StorageType Auto

Form[] Property StorageItems Auto hidden ;All items currently in the inventory, used for consumption
Form[] Property IncomeStorageItems Auto hidden ;Items received through regular production sources such as buildings
Form[] Property TodayRevenueStorageItems Auto hidden ;Items received since last update
Form[] Property TodayExpenseStorageItems Auto hidden ;Items lost since last update
Form[] Property AllReceivedStorageItems Auto hidden ;All items received, ignoring player input, used to get item indexes

int Property TodayTotalRevenue Auto hidden
int Property TodayTotalExpenses Auto hidden

int[] Property StorageRevenuesBuildings Auto hidden
int[] Property StorageRevenuesFaction Auto hidden
int[] Property StorageRevenuesPlayer Auto hidden

int[] Property StorageExpensesConsumption Auto hidden
int[] Property StorageExpensesFaction Auto hidden
int[] Property StorageExpensesPlayer Auto hidden

FormList Property StorageItemKeywords Auto
FormList Property AllStorageItems Auto

ObjectReference Property City Auto hidden

ObjectReference[] Property IncomeSources Auto hidden

MiscObject Property CS_TradeAgreementTracker Auto

FormList Property AllStorageTypeGroups Auto ; A list of lists where each list contains the items in each storage type
FormList Property AllStorageTypeGroupTexts Auto ;/ A list of the names of the storage types
that is  also used to fill the item in the trade agreement script/;

FormList Property StorageTypeGroupsBase Auto; Groups that are in the Base Production Class
FormList Property StorageTypeGroupsRefining Auto; Groups that are in the Refining Class
FormList Property StorageTypeGroupsCrafting Auto; Groups that are in the Crafting Class

bool Property Consumable Auto
int Property ConsumeAmount Auto hidden
float[] NextFactionDemandAmount

; Processes ---------------------------------

Function ResetStorageAmounts()
    Form[] EmptyFormArray
    TodayRevenueStorageItems = EmptyFormArray
    TodayExpenseStorageItems = EmptyFormArray
    
    TodayTotalRevenue = 0
    TodayTotalExpenses = 0
    
    StorageRevenuesBuildings = new int[20]
    StorageRevenuesFaction = new int[20]
    StorageRevenuesPlayer = new int[20]
    StorageExpensesConsumption = new int[20]
    StorageExpensesFaction = new int[20]
    StorageExpensesPlayer = new int[20]
    NextFactionDemandAmount = new float[20]
EndFunction

Function ConsumeItems()
    debug.trace("Started Food Consumption")
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
    debug.trace("Food Consumption Finished!")
EndFunction

; Storage Item Trackers ----------------------------

Function AddListToIncomeItems(FormList ItemList)
    int i = 0
    while i < ItemList.GetSize()
        if IncomeStorageItems.Find(ItemList.GetAt(i) as Form) < 0
            AddToIncomeStorageItems(ItemList.GetAt(i))
            ;AddToStorageItems(ItemList)
        endif
        i += 1
    endwhile
EndFunction

Function AddToAllReceivedStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    AllReceivedStorageItems = AddToFormArray(Item, AllReceivedStorageItems)
EndFunction

Function AddToTodayRevenueStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    TodayRevenueStorageItems = AddToFormArray(Item, TodayRevenueStorageItems)
EndFunction

Function RemoveFromTodayRevenueStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    TodayRevenueStorageItems = RemoveFromFormArray(Item, TodayRevenueStorageItems)
EndFunction

Function AddToTodayExpenseStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    TodayExpenseStorageItems = AddToFormArray(Item, TodayExpenseStorageItems)
EndFunction

Function RemoveFromTodayExpenseStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    TodayExpenseStorageItems = RemoveFromFormArray(Item, TodayExpenseStorageItems)
EndFunction

Function AddToIncomeStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    if IncomeStorageItems.Find(Item) < 0
        IncomeStorageItems = AddToFormArray(Item, IncomeStorageItems)
    endif
EndFunction

Function RemoveFromIncomeStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    IncomeStorageItems = RemoveFromFormArray(Item, IncomeStorageItems)
EndFunction

Function AddToStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    StorageItems = AddToFormArray(Item, StorageItems)
EndFunction

Function RemoveFromStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    StorageItems = RemoveFromFormArray(Item, StorageItems)
EndFunction

Function AddToIncomeSources(ObjectReference Source, FormList ItemList)
    if IncomeSources.Find(Source) < 0
        IncomeSources = AddToArray(Source, IncomeSources)
        AddListToIncomeItems(ItemList)
    endif
EndFunction

int Function GetStorageAmount()
    int itemcount = GetItemCount(AllStorageItems)
    
    return itemcount
EndFunction

int Function GetItemIndex(Form Item)
    int itemindex = AllStorageItems.Find(Item) ;AllReceivedStorageItems.Find(Item)
    return itemindex
EndFunction

FormList Function GetGroupedItemList(MiscObject GroupText)
    int GroupIndex = AllStorageTypeGroupTexts.Find(GroupText)
    
    return AllStorageTypeGroups.GetAt(GroupIndex) as FormList
EndFunction

; Revenues ---------------

int Function GetRevenue()
    int Revenue
    
    int i = 0
    while i < TodayRevenueStorageItems.Length
        Revenue += GetItemRevenue(TodayRevenueStorageItems[i])
        i += 1
    endwhile
    
    return Revenue
EndFunction

int Function GetTotalRevenueFromBuildings()
    int Revenue
    
    int i = 0
    while i < StorageRevenuesBuildings.Length
        Revenue += StorageRevenuesBuildings[i]
        i += 1
    endwhile
    
    return Revenue
EndFunction

int Function GetTotalRevenueFromFaction()
    int Revenue
    
    int i = 0
    while i < StorageRevenuesFaction.Length
        Revenue += StorageRevenuesFaction[i]
        i += 1
    endwhile
    
    return Revenue
EndFunction

int Function GetItemRevenue(Form Item)
    int ItemIndex = AllStorageItems.Find(Item)
    int RevenueBuildings = StorageRevenuesBuildings[ItemIndex]
    int RevenueFaction = StorageRevenuesFaction[ItemIndex]
    int RevenuePlayer = StorageRevenuesPlayer[ItemIndex]
    
    int ItemRevenue = RevenueBuildings + RevenueFaction + RevenuePlayer
    return ItemRevenue
EndFunction

int Function GetRevenueBuildings(Form Item)
    int ItemIndex = GetItemIndex(Item)
    if ItemIndex < 0
        return 0
    endif
    return StorageRevenuesBuildings[ItemIndex]
EndFunction

int Function GetRevenueFaction(Form Item)
    int ItemIndex = GetItemIndex(Item)
    if ItemIndex < 0
        return 0
    endif
    return StorageRevenuesFaction[ItemIndex]
EndFunction

int Function GetRevenuePlayer(Form Item)
    int ItemIndex = GetItemIndex(Item)
    if ItemIndex < 0
        return 0
    endif
    return StorageRevenuesPlayer[ItemIndex]
EndFunction

Function SetItemIncomeSource(Form Item, int amount, ObjectReference Source)
    int ItemIndex = GetItemIndex(Item)
    if Source == Game.GetPlayer()
        int ExpensePlayer = GetExpensePlayer(Item)
        if ExpensePlayer > 0
            int ItemExpenseIndex = GetItemIndex(Item)
            if ExpensePlayer > amount
                TodayTotalExpenses -= amount
                StorageExpensesPlayer[ItemExpenseIndex] = StorageExpensesPlayer[ItemExpenseIndex] - amount
                amount = 0
            elseif ExpensePlayer == amount
                TodayTotalExpenses -= amount
                StorageExpensesPlayer[ItemExpenseIndex] = 0
                if GetItemExpenses(Item) <= 0
                    RemoveFromTodayExpenseStorageItems(Item)
                endif
                amount = 0
            elseif ExpensePlayer < amount
                StorageExpensesPlayer[ItemExpenseIndex] = 0
                if GetItemExpenses(Item) <= 0
                    RemoveFromTodayExpenseStorageItems(Item)
                endif
                TodayTotalExpenses -= ExpensePlayer
                amount -= ExpensePlayer
            endif
        endif
        
        if amount > 0
    
            if TodayRevenueStorageItems.Find(Item) < 0
                AddToTodayRevenueStorageItems(Item)
            endif
            
            TodayTotalRevenue += amount
            StorageRevenuesPlayer[ItemIndex] = StorageRevenuesPlayer[ItemIndex] + amount
            
        endif
    elseif !Source
    
        if TodayRevenueStorageItems.Find(Item) < 0
            AddToTodayRevenueStorageItems(Item)
        endif
        
        TodayTotalRevenue += amount
        StorageRevenuesBuildings[ItemIndex] = StorageRevenuesBuildings[ItemIndex] + amount
    elseif Source as CS_BuildingManagementCraftingScript
        TodayTotalExpenses -= amount
        StorageExpensesConsumption[ItemIndex] = StorageExpensesConsumption[ItemIndex] - amount
        
        if GetItemExpenses(Item) <= 0
            RemoveFromTodayExpenseStorageItems(Item)
        endif
    elseif Source as CS_StorageFactionScript
    
        if TodayRevenueStorageItems.Find(Item) < 0
            AddToTodayRevenueStorageItems(Item)
        endif
        
        TodayTotalRevenue += amount
        StorageRevenuesFaction[ItemIndex] = StorageRevenuesFaction[ItemIndex] + amount
    endif
EndFunction

; Expenses -----------------

int Function GetExpenses()
    int Expenses
    
    int i = 0
    while i < TodayExpenseStorageItems.Length
        Expenses += GetItemExpenses(TodayExpenseStorageItems[i])
        i += 1
    endwhile
    
    return Expenses
EndFunction

int Function GetTotalExpensesFromFaction()
    int Expenses
    
    int i = 0
    while i < StorageExpensesFaction.Length
        Expenses += StorageExpensesFaction[i]
        i += 1
    endwhile
    
    return Expenses
EndFunction

int Function GetItemExpenses(Form Item)
    int ItemIndex = AllStorageItems.Find(Item)
    int ExpenseConsumption = StorageExpensesConsumption[ItemIndex]
    int ExpenseFaction = StorageExpensesFaction[ItemIndex]
    int ExpensePlayer = StorageExpensesPlayer[ItemIndex]
    
    int ItemExpense = ExpenseConsumption + ExpenseFaction + ExpensePlayer
    return ItemExpense
EndFunction

int Function GetExpenseConsumption(Form Item)
    int ItemIndex = GetItemIndex(Item)
    if ItemIndex < 0
        return 0
    endif
    return StorageExpensesConsumption[ItemIndex]
EndFunction

int Function GetExpenseFaction(Form Item)
    int ItemIndex = GetItemIndex(Item)
    if ItemIndex < 0
        return 0
    endif
    return StorageExpensesFaction[ItemIndex]
EndFunction

int Function GetExpensePlayer(Form Item)
    int ItemIndex = GetItemIndex(Item)
    if ItemIndex < 0
        return 0
    endif
    return StorageExpensesPlayer[ItemIndex]
EndFunction

Function SetItemExpenseDestination(Form Item, int amount, ObjectReference Source)
    int ItemIndex = GetItemIndex(Item)
    if Source == Game.GetPlayer()
        int RevenuePlayer = GetRevenuePlayer(Item)
        if RevenuePlayer > 0
            int ItemRevenueIndex = GetItemIndex(Item)
            if RevenuePlayer > amount
                TodayTotalRevenue -= amount
                StorageRevenuesPlayer[ItemRevenueIndex] = StorageRevenuesPlayer[ItemRevenueIndex] - amount
                amount = 0
            elseif RevenuePlayer == amount
                TodayTotalRevenue -= amount
                StorageRevenuesPlayer[ItemRevenueIndex] = 0
                if GetItemRevenue(Item) <= 0
                    RemoveFromTodayRevenueStorageItems(Item)
                endif
                amount = 0
            elseif RevenuePlayer < amount
                StorageRevenuesPlayer[ItemRevenueIndex] = 0
                if GetItemRevenue(Item) <= 0
                    RemoveFromTodayRevenueStorageItems(Item)
                endif
                TodayTotalRevenue -= RevenuePlayer
                amount -= RevenuePlayer
            endif
        endif
        
        if amount > 0
    
            if TodayExpenseStorageItems.Find(Item) < 0
                AddToTodayExpenseStorageItems(Item)
            endif
        
            TodayTotalExpenses += amount
            StorageExpensesPlayer[ItemIndex] = StorageExpensesPlayer[ItemIndex] + amount
            
        endif
    elseif !Source || Source as CS_BuildingManagementCraftingScript
        StorageExpensesConsumption[ItemIndex] = StorageExpensesConsumption[ItemIndex] + amount
    
        if TodayExpenseStorageItems.Find(Item) < 0
            AddToTodayExpenseStorageItems(Item)
        endif
        TodayTotalExpenses += amount
    elseif Source as CS_StorageFactionScript
        
        if TodayExpenseStorageItems.Find(Item) < 0
            AddToTodayExpenseStorageItems(Item)
        endif
        
        TodayTotalExpenses += amount
        StorageExpensesFaction[ItemIndex] = StorageExpensesFaction[ItemIndex] + amount
    endif
EndFunction

; Events -------------------

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    AllStorageItems.AddForm(akBaseItem)
    if StorageItems.Find(akBaseItem) < 0
        AddToStorageItems(akBaseItem)
    endif
    ;/
    if AllReceivedStorageItems.Find(akBaseItem) < 0
        AddToAllReceivedStorageItems(akBaseItem)
    endif/;
    
    SetItemIncomeSource(akBaseItem, aiItemCount, akSourceContainer)
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    if StorageItems.Find(akBaseItem) >= 0 && IncomeStorageItems.Find(akBaseItem) < 0 && GetItemCount(akBaseItem) == 0
        RemoveFromStorageItems(akBaseItem)
    endif
    
    SetItemExpenseDestination(akBaseItem, aiItemCount, akDestContainer)
EndEvent

State DailyConsumption
    
    Event OnUpdate()
        GoToState("Updating")
        
        if Consumable
        
            ConsumeAmount = (City as CS_CityManagementPopulation).TotalPopulation
            
            if ConsumeAmount > 0
                ConsumeItems()
            endif
            
        endif
        
        GoToState("Updated")
    EndEvent
    
EndState