Scriptname CS_FactionEconomyReportScript extends Quest conditional

ObjectReference Property FactionActivator Auto hidden

LocationAlias Property FactionName Auto
LocationAlias Property TradeFactionName Auto
LocationAlias Property ResourceType Auto

ReferenceAlias[] Property Resources Auto

Message Property CS_FactionEconomyReportStart Auto
Message Property CS_FactionEconomyReportTreasury Auto
Message Property CS_FactionEconomyReportTreasuryAdd Auto
Message Property CS_FactionEconomyReportTreasuryRemove Auto
Message Property CS_FactionEconomyReportTreasuryRevenue Auto
Message Property CS_FactionEconomyReportTreasuryExpenses Auto
Message Property CS_FactionEconomyReportResources Auto
Message Property CS_FactionEconomyReportResourcesSpecific Auto
Message Property CS_FactionEconomyReportResourcesSpecificTrade Auto
Message Property CS_FactionEconomyReportResourcesSpecificTradeFaction Auto

FormList Property CS_FactionEconomyResourceRevenueMenus Auto
FormList Property CS_FactionEconomyResourceExpenseMenus Auto

FormList Property CS_MajorFactions Auto

Location Property CS_TextSettlementManagementResourceTypeFood Auto
Location Property CS_TextSettlementManagementResourceTypeMaterials Auto
Location Property CS_TextSettlementManagementResourceTypeEquipment Auto

MiscObject Property Gold001 Auto
MiscObject Property Leather01 Auto
MiscObject Property CS_ResourceWoodLog Auto

Actor Property CS_TradeAgreementActorExports Auto
Actor Property CS_TradeAgreementActorImports Auto

Quest Property CS_TutorialQuests00FirstSteps Auto

int Property TreasuryAmount Auto conditional hidden
int Property HasPreviousPage Auto conditional hidden
int Property HasNextPage Auto conditional hidden
int[] Property ResourceAmounts Auto hidden

string StorageTypeString
ObjectReference Property StorageType Auto hidden

bool forcequit

CS_FactionManagementEconomy Economy
CS_FactionManagementDiplomacy Diplomacy
CS_FactionManagementMilitary Military
CS_FactionManagementOwnership Ownership

Function Menu(ObjectReference FactionActivatorRef)
    Start()
    SetUp(FactionActivatorRef)
    
    int Response
    
    while !forcequit && Response != 4
        Response = CS_FactionEconomyReportStart.show()
        if Response == 0
            MenuTreasury()
        elseif Response == 1
            MenuResourcesSpecific("Food")
        elseif Response == 2
            MenuResourcesSpecific("Materials")
        elseif Response == 3
            MenuResourcesSpecific("Equipment")
        endif
    endwhile
    
    Stop()
EndFunction

Function MenuTreasury()
    int Response
    StorageType = Economy.StorageTreasury
    CS_StorageTreasuryScript Treasury = StorageType as CS_StorageTreasuryScript
    
    while !forcequit && Response != 4
        TreasuryAmount = Treasury.GetItemCount(Treasury.Gold001)
        
        int Revenue = Treasury.GetRevenue()
        int Expenses = Treasury.GetExpenses()
        
        int NetChange = Revenue - Expenses
        
        Response = CS_FactionEconomyReportTreasury.show(TreasuryAmount, Revenue, Expenses, NetChange)
        if Response == 0
            MenuTreasuryAdd()
        elseif Response == 1
            MenuTreasuryRemove()
        elseif Response == 2
            MenuTreasuryRevenue()
        elseif Response == 3
            MenuTreasuryExpenses()
        endif
    endwhile
EndFunction

Function MenuTreasuryAdd()
    int Response
    CS_StorageTreasuryScript Treasury = StorageType as CS_StorageTreasuryScript
    
    while !forcequit && Response != 7
        TreasuryAmount = Treasury.GetItemCount(Treasury.Gold001)
        
        Response = CS_FactionEconomyReportTreasuryAdd.show(TreasuryAmount)
        if Response < 7
            int amounttoadd = math.pow(10, Response) as int
            Game.GetPlayer().RemoveItem(Treasury.Gold001, amounttoadd, false, Treasury as ObjectReference)
            if CS_TutorialQuests00FirstSteps.GetStage() == 20 && Treasury.GetItemCount(Treasury.Gold001) >= 1000
                CS_TutorialQuests00FirstSteps.SetStage(30)
                utility.wait(0.3)
            endif
        endif
    endwhile
EndFunction

Function MenuTreasuryRemove()
    int Response
    CS_StorageTreasuryScript Treasury = StorageType as CS_StorageTreasuryScript
    
    while !forcequit && Response != 7
        TreasuryAmount = Treasury.GetItemCount(Treasury.Gold001)
        
        Response = CS_FactionEconomyReportTreasuryRemove.show(TreasuryAmount)
        if Response < 7
            int amounttoremove = math.pow(10, Response) as int
            (Treasury as ObjectReference).RemoveItem(Treasury.Gold001, amounttoremove, false, Game.GetPlayer())
            debug.notification(amounttoremove + " Gold Added")
        endif
    endwhile
EndFunction

Function MenuTreasuryRevenue()
    CS_StorageTreasuryScript Treasury = StorageType as CS_StorageTreasuryScript
    
    int Taxes = Treasury.RevenuesTaxes
    int Trade = Treasury.RevenuesTrade
    int Player = Treasury.RevenuesPlayer
    
    int TotalRevenue = Taxes + Trade + Player
    
    CS_FactionEconomyReportTreasuryRevenue.show(Taxes, Trade, Player, TotalRevenue)
EndFunction

Function MenuTreasuryExpenses()
    CS_StorageTreasuryScript Treasury = StorageType as CS_StorageTreasuryScript
    
    int WagesWorkers = -1*Treasury.ExpensesWagesWork
    int WagesTroop = -1*Treasury.ExpensesWagesTroop
    int Trade = -1*Treasury.ExpensesTrade
    int Player = -1*Treasury.ExpensesPlayer
    
    int TotalExpenses = WagesWorkers + WagesTroop + Trade + Player
    
    CS_FactionEconomyReportTreasuryExpenses.show(WagesWorkers, WagesTroop, Trade, Player, TotalExpenses)
EndFunction

Function MenuResources()
    int Response
    
    while !forcequit && Response != 3
        Response = CS_FactionEconomyReportResources.show()
        if Response == 0
            MenuResourcesSpecific("Food")
        elseif Response == 1
            MenuResourcesSpecific("Materials")
        elseif Response == 2
            MenuResourcesSpecific("Equipment")
        endif
    endwhile
EndFunction

Function MenuResourcesSpecific(string ResourceTypeString)
    StorageTypeString = ResourceTypeString
    SetResourceType(ResourceTypeString)
    CS_StorageFactionScript StorageScript = (StorageType as CS_StorageFactionScript)
    
    int Response
    while !forcequit && Response != 5
        int Storage = StorageScript.GetStorageAmount()
        int Revenue = StorageScript.TodayTotalRevenue
        int Expenses = StorageScript.TodayTotalExpenses
        int DailyGained = Revenue - Expenses
        
        Response = CS_FactionEconomyReportResourcesSpecific.show(Storage, Revenue, -1*Expenses, DailyGained)
        if Response == 0
            (StorageType as Actor).SetActorValue("CarryWeight", 50000)
            (StorageType as Actor).ShowGiftMenu(True, StorageScript.StorageItemKeywords)
            while utility.IsInMenuMode()
                utility.wait(0.1)
            endwhile
            
            if CS_TutorialQuests00FirstSteps.GetStage() == 30 && ResourceTypeString == "Food" && StorageScript.GetStorageAmount() >= 10
                CS_TutorialQuests00FirstSteps.SetStage(31)
            elseif CS_TutorialQuests00FirstSteps.GetStage() == 31 && ResourceTypeString == "Materials" && StorageScript.GetItemCount(Leather01) >= 5
                CS_TutorialQuests00FirstSteps.SetStage(32)
            elseif CS_TutorialQuests00FirstSteps.GetStage() == 32 && ResourceTypeString == "Materials" && StorageScript.GetItemCount(CS_ResourceWoodLog) >= 3
                CS_TutorialQuests00FirstSteps.SetStage(40)
            endif
        elseif Response == 1
            (StorageType as Actor).SetActorValue("CarryWeight", 50000)
            (StorageType as Actor).ShowGiftMenu(False, StorageScript.StorageItemKeywords)
            while utility.IsInMenuMode()
                utility.wait(0.1)
            endwhile
        elseif Response == 2
            MenuResourceRevenue()
        elseif Response == 3
            MenuResourceExpense()
        elseif Response == 4
            MenuResourceTrade()
        endif
    endwhile
EndFunction

Function MenuResourceRevenue()
    
    CS_StorageFactionScript StorageScript = (StorageType as CS_StorageFactionScript)
    int ArrayStartNum = 0
    int ArrayEndNum = StorageScript.TodayRevenueStorageItems.Length
    Message MenuToShow
    
    bool InMenu = true
    int pagenum = 1
    
    while InMenu
        int MenuNum
        int ArrayStart = 5*(pagenum - 1)
        if pagenum > 1
            HasPreviousPage = 1
        else
            HasPreviousPage = 0
        endif
        
        if 5*pagenum >= ArrayEndNum
            HasNextPage = 0
        else
            HasNextPage = 1
        endif
        
        MenuNum = ArrayEndNum - ArrayStart
        if MenuNum > 5
            MenuNum = 5
        endif
        
        SetResourceChangeMenu("Revenue", ArrayStart, ArrayEndNum)
        
        MenuToShow = CS_FactionEconomyResourceRevenueMenus.GetAt(MenuNum) as Message
        int Response = MenuToShow.show(ResourceAmounts[0], ResourceAmounts[1], ResourceAmounts[2], ResourceAmounts[3],ResourceAmounts[4])
        
        if Response == 0
            if HasPreviousPage == 1
                pagenum -= 1
            elseif HasNextPage == 1
                pagenum += 1
            else
                InMenu = false
            endif
        elseif Response == 1
            if HasNextPage == 1
                pagenum += 1
            else
                InMenu = false
            endif
        elseif Response == 2
            InMenu = false
        endif
        
        ClearResourceMenu()
    endwhile
    
EndFunction

Function MenuResourceExpense()
    
    CS_StorageFactionScript StorageScript = (StorageType as CS_StorageFactionScript)
    int ArrayStartNum = 0
    int ArrayEndNum = StorageScript.TodayExpenseStorageItems.Length
    Message MenuToShow
    
    bool InMenu = true
    int pagenum = 1
    
    while InMenu
        int MenuNum
        int ArrayStart = 5*(pagenum - 1)
        if pagenum > 1
            HasPreviousPage = 1
        else
            HasPreviousPage = 0
        endif
        
        if 5*pagenum >= ArrayEndNum
            HasNextPage = 0
        else
            HasNextPage = 1
        endif
        
        MenuNum = ArrayEndNum - ArrayStart
        if MenuNum > 5
            MenuNum = 5
        endif
        
        SetResourceChangeMenu("Expense", ArrayStart, ArrayEndNum)
        
        MenuToShow = CS_FactionEconomyResourceExpenseMenus.GetAt(MenuNum) as Message
        int Response = MenuToShow.show(ResourceAmounts[0], ResourceAmounts[1], ResourceAmounts[2], ResourceAmounts[3],ResourceAmounts[4])
        
        if Response == 0
            if HasPreviousPage == 1
                pagenum -= 1
            elseif HasNextPage == 1
                pagenum += 1
            else
                InMenu = false
            endif
        elseif Response == 1
            if HasNextPage == 1
                pagenum += 1
            else
                InMenu = false
            endif
        elseif Response == 2
            InMenu = false
        endif
        
        ClearResourceMenu()
    endwhile
    
EndFunction

Function MenuResourceTrade()
    CS_StorageFactionScript StorageScript = (StorageType as CS_StorageFactionScript)
    
    int Response
    while Response != 2
        int StorageAmount = StorageScript.GetStorageAmount()
        
        Response = CS_FactionEconomyReportResourcesSpecificTrade.show(StorageAmount)
        if Response != 2
            MenuResourceTradeFaction(CS_MajorFactions.GetAt(Response) as ObjectReference)
        endif
    endwhile
EndFunction

Function MenuResourceTradeFaction(ObjectReference FactionOwnerActivator)
    TradeFactionName.ForceLocationTo((FactionOwnerActivator as CS_FactionManagementDiplomacy).FactionName)
    CS_StorageFactionScript StorageScript = (StorageType as CS_StorageFactionScript)
    ObjectReference FactionStorage = (FactionOwnerActivator as CS_FactionManagementEconomy).GetStorage(StorageTypeString)
    ((CS_TradeAgreementActorExports as ObjectReference) as CS_TradeAgreementActorScript).RemoveAllItems()
    ((CS_TradeAgreementActorImports as ObjectReference) as CS_TradeAgreementActorScript).RemoveAllItems()
    
    int Response
    while Response != 2
        ;int StorageAmount = StorageScript.GetStorageAmount()
        
        Response = CS_FactionEconomyReportResourcesSpecificTradeFaction.show()
        if Response == 0
            ((CS_TradeAgreementActorImports as ObjectReference) as CS_TradeAgreementActorScript).InitiateTradeMenu(FactionStorage, StorageType, "Imports")
        elseif Response == 1
            ((CS_TradeAgreementActorExports as ObjectReference) as CS_TradeAgreementActorScript).InitiateTradeMenu(StorageType, FactionStorage, "Exports")
        endif
    endwhile
EndFunction

; SetUp Functions ---------------------------------------

Function SetUp(ObjectReference FactionActivatorRef)
    FactionActivator = FactionActivatorRef
    
    Economy = FactionActivator as CS_FactionManagementEconomy
    Diplomacy = FactionActivator as CS_FactionManagementDiplomacy
    Military = FactionActivator as CS_FactionManagementMilitary
    Ownership = FactionActivator as CS_FactionManagementOwnership
    
    FactionName.ForceLocationTo(Diplomacy.FactionName)
EndFunction

Function SetResourceType(string ResourceTypeString)
    if ResourceTypeString == "Food"
        ResourceType.ForceLocationTo(CS_TextSettlementManagementResourceTypeFood)
        StorageType = Economy.StorageFood
    elseif ResourceTypeString == "Materials"
        ResourceType.ForceLocationTo(CS_TextSettlementManagementResourceTypeMaterials)
        StorageType = Economy.StorageMaterials
    elseif ResourceTypeString == "Equipment"
        ResourceType.ForceLocationTo(CS_TextSettlementManagementResourceTypeEquipment)
        StorageType = Economy.StorageEquipment
    endif
EndFunction

Function SetResourceChangeMenu(string type, int ArrayStart, int ArrayEnd)
    CS_StorageFactionScript StorageScript = (StorageType as CS_StorageFactionScript)
    
    ResourceAmounts = new int[5]
    
    int i = 0
    while i < Resources.Length && (ArrayStart + i) < ArrayEnd;StorageScript.TodayRevenueStorageItems.Length
        if Resources[i]
            CS_FactionEconomyReportResourceScript Thread = Resources[i] as CS_FactionEconomyReportResourceScript
            Thread.ArrayPosition = ArrayStart + i
            Thread.GoToState(type)
            Thread.RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
    
    i = 0
    while i < Resources.Length && (ArrayStart + i) < ArrayEnd
        CS_FactionEconomyReportResourceScript Thread = Resources[i] as CS_FactionEconomyReportResourceScript
        int loopnum
        while Thread.GetState() != "Updated" && loopnum < 50
            utility.wait(0.1)
            loopnum += 1
        endwhile
        ResourceAmounts[i] = Thread.ResourceAmount
        i += 1
    endwhile
EndFunction

Function ClearResourceMenu()
    
    int i = 0
    while i < Resources.Length
        CS_FactionEconomyReportResourceScript Thread = Resources[i] as CS_FactionEconomyReportResourceScript
        if Resources[i].GetRef()
            Resources[i].GetRef().delete()
        endif
        Thread.GoToState("Cleared")
        i += 1
    endwhile
    
EndFunction