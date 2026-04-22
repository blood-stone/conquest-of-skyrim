Scriptname CS_StorageFactionScript extends ObjectReference  

import CS_CommonFunctions

CS_FactionMajor Property FactionOwner Auto

string Property StorageType Auto

Form[] Property StorageItems Auto hidden ;All items currently in the inventory, used for consumption
Form[] Property TodayRevenueStorageItems Auto hidden ;Items received since last update
Form[] Property TodayExpenseStorageItems Auto hidden ;Items lost since last update
Form[] Property AllReceivedStorageItems Auto hidden ;All items received, ignoring player input, used to get item indexes

int Property TodayTotalRevenue Auto hidden
int Property TodayTotalExpenses Auto hidden

int[] Property StorageRevenuesHoldings Auto hidden
int[] Property StorageRevenuesFaction Auto hidden
int[] Property StorageRevenuesPlayer Auto hidden

int[] Property StorageExpensesHoldings Auto hidden
int[] Property StorageExpensesConsumption Auto hidden
int[] Property StorageExpensesFaction Auto hidden
int[] Property StorageExpensesPlayer Auto hidden

FormList Property IncomeStorageItems Auto hidden ;Items received through regular production sources such as Holdings
FormList Property StorageItemKeywords Auto
FormList Property AllStorageItems Auto
FormList Property NPCTradeItems Auto

FormList Property AllStorageTypeGroupTexts Auto ;/ A list of the names of the storage types
that is  also used to fill the item in the trade agreement script/;

ObjectReference[] Property TradeAgreements Auto hidden
Container Property CS_TradeAgreement Auto

ObjectReference[] Property IncomeSources Auto hidden
ObjectReference[] Property TradeHoldings Auto hidden

bool Property Consumable Auto
int Property ConsumeAmount Auto hidden

; Processes ---------------------------

Function ResetStorageAmounts()
    Form[] EmptyFormArray
    TodayRevenueStorageItems = EmptyFormArray
    TodayExpenseStorageItems = EmptyFormArray
    
    TodayTotalRevenue = 0
    TodayTotalExpenses = 0
    
    StorageRevenuesHoldings = new int[20]
    StorageRevenuesFaction = new int[20]
    StorageRevenuesPlayer = new int[20]
    StorageExpensesHoldings = new int[20]
    StorageExpensesConsumption = new int[20]
    StorageExpensesFaction = new int[20]
    StorageExpensesPlayer = new int[20]
EndFunction
;/
Function SetTradeItemWithHolding(ObjectReference Holding, Form Item, int Amount)
    int TradeHoldingIndex = TradeHoldings.Find(Holding)
    if TradeHoldingIndex < 0
        TradeHoldings = AddToArray(Holding, TradeHoldings)
    EndFunction/;
    
int Function Consume(ObjectReference Storage, int Amount)
    int RemainingAmount = Amount

    int i = 0
    while i < StorageItems.Length && RemainingAmount > 0
        int initialamount = Storage.GetItemCount(StorageItems[i])
        RemoveItem(StorageItems[i], RemainingAmount, true, Storage)
        int ItemReceived = Storage.GetItemCount(StorageItems[i]) - initialamount
        RemainingAmount -= ItemReceived
        i += 1
    endwhile
    
    return RemainingAmount
EndFunction
    
; Storage Item Trackers ----------------------------

Function AddListToIncomeItems(FormList ItemList)
    int i = 0
    while i < ItemList.GetSize()
        if !IncomeStorageItems.HasForm(ItemList.GetAt(i) as Form)
            AddToIncomeStorageItems(ItemList.GetAt(i))
        endif
        i += 1
    endwhile
EndFunction

Function AddCraftingListToIncomeItems(FormList ItemList, FormList RequirementList)
    ObjectReference MaterialsStorage = FactionOwner.StorageMaterials
    FormList MaterialsIncome = (MaterialsStorage as CS_StorageFactionScript).IncomeStorageItems
    
    if ItemList.GetSize() == 1
        int i = 0
        while i < RequirementList.GetSize()
            if MaterialsIncome.HasForm(RequirementList.GetAt(i) as Form)
                AddToIncomeStorageItems(ItemList.GetAt(0))
                return
            endif
            i += 1
        endwhile
    else
        int i = 0
        while i < ItemList.GetSize()
            debug.trace("Checking Crafting Validity for " + (ItemList.GetAt(i)).GetName() +", needs " + (RequirementList.GetAt(i) as Form).GetName())
            if MaterialsIncome.HasForm(RequirementList.GetAt(i) as Form)
                debug.trace((ItemList.GetAt(i)).GetName() + " HAS required " + (RequirementList.GetAt(i) as Form).GetName() + " in income")
                AddToIncomeStorageItems(ItemList.GetAt(i))
            endif
            i += 1
        endwhile
    endif
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
    IncomeStorageItems.AddForm(Item)
EndFunction

Function RemoveFromIncomeStorageItems(Form Item) ;Keeps track of what types of items are being stored here
    IncomeStorageItems.RemoveAddedForm(Item)
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
    endif
    AddListToIncomeItems(ItemList)
EndFunction

Function AddToIncomeSourcesCrafting(ObjectReference Source, FormList ItemList, FormList RequirementsList)
    if IncomeSources.Find(Source) < 0
        IncomeSources = AddToArray(Source, IncomeSources)
    endif
    AddCraftingListToIncomeItems(ItemList, RequirementsList)
EndFunction

int Function GetStorageAmount()
    int itemcount = GetItemCount(AllStorageItems)
    
    return itemcount
EndFunction

int Function GetItemIndex(Form Item)
    int itemindex = AllStorageItems.Find(Item) ;AllReceivedStorageItems.Find(Item)
    return itemindex
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


int Function GetTotalRevenueFromHoldings()
    int Revenue
    
    int i = 0
    while i < StorageRevenuesHoldings.Length
        Revenue += StorageRevenuesHoldings[i]
        i += 1
    endwhile
    
    return Revenue
EndFunction

int Function GetItemRevenue(Form Item)
    int ItemIndex = AllStorageItems.Find(Item)
    int RevenueHoldings = StorageRevenuesHoldings[ItemIndex]
    int RevenueFaction = StorageRevenuesFaction[ItemIndex]
    int RevenuePlayer = StorageRevenuesPlayer[ItemIndex]
    
    int ItemRevenue = RevenueHoldings + RevenueFaction + RevenuePlayer
    return ItemRevenue
EndFunction

int Function GetRevenueHoldings(Form Item)
    int ItemIndex = GetItemIndex(Item)
    if ItemIndex < 0
        return 0
    endif
    return StorageRevenuesHoldings[ItemIndex]
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
    elseif Source as CS_StorageCityScript || !Source
    
        if TodayRevenueStorageItems.Find(Item) < 0
            AddToTodayRevenueStorageItems(Item)
        endif
        
        if !IncomeStorageItems.HasForm(Item)
            AddToIncomeStorageItems(Item)
        endif
        
        TodayTotalRevenue += amount
        StorageRevenuesHoldings[ItemIndex] = StorageRevenuesHoldings[ItemIndex] + amount
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

int Function GetItemExpenses(Form Item)
    int ItemIndex = AllStorageItems.Find(Item)
    int ExpenseHoldings = StorageExpensesHoldings[ItemIndex]
    int ExpenseConsumption = StorageExpensesConsumption[ItemIndex]
    int ExpenseFaction = StorageExpensesFaction[ItemIndex]
    int ExpensePlayer = StorageExpensesPlayer[ItemIndex]
    
    int ItemExpense = ExpenseHoldings + ExpenseConsumption + ExpenseFaction + ExpensePlayer
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
    elseif !Source
        StorageExpensesConsumption[ItemIndex] = StorageExpensesConsumption[ItemIndex] + amount
    
        if TodayExpenseStorageItems.Find(Item) < 0
            AddToTodayExpenseStorageItems(Item)
        endif
        TodayTotalExpenses += amount
        ;/elseif Source as CS_StorageFactionScript
        StorageExpensesFaction[ItemIndex] = StorageExpensesFaction[ItemIndex] + amount/;
    elseif Source as CS_StorageCityScript || Source as CS_BuildingManagementCraftingScript 
        StorageExpensesHoldings[ItemIndex] = StorageExpensesHoldings[ItemIndex] + amount
    
        if TodayExpenseStorageItems.Find(Item) < 0
            AddToTodayExpenseStorageItems(Item)
        endif
        TodayTotalExpenses += amount
        ;/elseif Source as CS_StorageFactionScript
        StorageExpensesFaction[ItemIndex] = StorageExpensesFaction[ItemIndex] + amount/;
    elseif Source as CS_TradeAgreementTrackerScript
        StorageExpensesFaction[ItemIndex] = StorageExpensesFaction[ItemIndex] + amount
    
        if TodayExpenseStorageItems.Find(Item) < 0
            AddToTodayExpenseStorageItems(Item)
        endif
        TodayTotalExpenses += amount
    else
        StorageExpensesConsumption[ItemIndex] = StorageExpensesConsumption[ItemIndex] + amount
    
        if TodayExpenseStorageItems.Find(Item) < 0
            AddToTodayExpenseStorageItems(Item)
        endif
        TodayTotalExpenses += amount
    endif
EndFunction

; Trade ---------------------------

Function SetTradeAgreement(ObjectReference FactionStorage, Form Item, int Amount, string type)
    CS_TradeAgreementTrackerScript TradeScript = GetTradeAgreement(FactionStorage)
    if !TradeScript
        TradeScript = AddTradeAgreement(FactionStorage)
    endif
    
    TradeScript.SetTradeItem(Item, Amount, type)
EndFunction

CS_TradeAgreementTrackerScript Function AddTradeAgreement(ObjectReference NewFactionStorage)
    ObjectReference NewTradeAgreement = PlaceAtMe(CS_TradeAgreement)
    (NewTradeAgreement as CS_TradeAgreementTrackerScript).SetUpTradeAgreement(self as ObjectReference, NewFactionStorage)
    TradeAgreements = AddToArray(NewTradeAgreement, TradeAgreements)
    
    return (NewTradeAgreement as CS_TradeAgreementTrackerScript)
EndFunction

CS_TradeAgreementTrackerScript Function GetTradeAgreement(ObjectReference FactionStorage)
    int i = 0
    while i < TradeAgreements.Length
        if (TradeAgreements[i] as CS_TradeAgreementTrackerScript).AIStorage == FactionStorage
            return TradeAgreements[i] as CS_TradeAgreementTrackerScript
        endif
        i += 1
    endwhile

    return None
EndFunction

int Function GetTradeAgreementIndex(ObjectReference TradeFactionStorage)
    int i = 0
    while i < TradeAgreements.Length
        if (TradeAgreements[i] as CS_TradeAgreementTrackerScript).AIStorage == TradeFactionStorage
            return i
        endif
        i += 1
    endwhile
    
    return -1
EndFunction

Function InitiateTrade()
    int i = 0
    while i < TradeAgreements.Length
        TradeAgreements[i].RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
EndFunction

; Events -------------------

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    AllStorageItems.AddForm(akBaseItem)
    if StorageItems.Find(akBaseItem) < 0
        AddToStorageItems(akBaseItem)
    endif
    
    SetItemIncomeSource(akBaseItem, aiItemCount, akSourceContainer)
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    if StorageItems.Find(akBaseItem) >= 0 && IncomeStorageItems.HasForm(akBaseItem) && GetItemCount(akBaseItem) == 0
        RemoveFromStorageItems(akBaseItem)
    endif
    
    SetItemExpenseDestination(akBaseItem, aiItemCount, akDestContainer)
EndEvent
    