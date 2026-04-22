Scriptname CS_StorageTreasuryScript extends ObjectReference  

import CS_CommonFunctions

CS_Faction Property FactionOwner Auto hidden

int Property TodayTotalRevenue Auto hidden
int Property TodayTotalExpenses Auto hidden

int Property RevenuesTaxes Auto hidden
int Property RevenuesTrade Auto hidden
int Property RevenuesPlayer Auto hidden

int Property ExpensesWagesWork Auto hidden
int Property ExpensesWagesTroop Auto hidden
int Property ExpensesTrade Auto hidden
int Property ExpensesPlayer Auto hidden

FormList Property StorageKeywords Auto

MiscObject Property Gold001 Auto

; Processes -----------------------------------

Function ResetStorageAmounts()
    TodayTotalRevenue = 0
    TodayTotalExpenses = 0
    
    RevenuesTaxes = 0
    RevenuesTrade = 0
    RevenuesPlayer = 0
    ExpensesWagesWork = 0
    ExpensesWagesTroop = 0
    ExpensesTrade = 0
    ExpensesPlayer = 0
EndFunction

int Function GetRevenue()
    int Revenue = RevenuesTaxes + RevenuesTrade + RevenuesPlayer
    
    return Revenue
EndFunction

Function SetItemIncomeSource(int amount, ObjectReference Source)
    if Source == Game.GetPlayer()
        if ExpensesPlayer > 0
            if ExpensesPlayer > amount
                TodayTotalExpenses -= amount
                ExpensesPlayer -= amount
                amount = 0
            elseif ExpensesPlayer == amount
                TodayTotalExpenses -= amount
                ExpensesPlayer = 0
                amount = 0
            elseif ExpensesPlayer < amount
                TodayTotalExpenses -= ExpensesPlayer
                ExpensesPlayer = 0
                amount -= ExpensesPlayer
            endif
        endif
        
        if amount > 0
            
            TodayTotalRevenue += amount
            RevenuesPlayer += amount
            
        endif
    elseif Source as CS_StorageTaxScript
        TodayTotalRevenue += amount
        RevenuesTaxes += amount
    elseif Source as CS_TradeAgreementTrackerScript
        TodayTotalRevenue += amount
        RevenuesTrade += amount
    endif
EndFunction

int Function GetExpenses()
    int Expenses = ExpensesWagesWork + ExpensesWagesTroop + ExpensesTrade + ExpensesPlayer
    
    return Expenses
EndFunction

Function SetItemExpenseDestination(int amount, ObjectReference Source)
    if Source == Game.GetPlayer()
        if RevenuesPlayer > 0
            if RevenuesPlayer > amount
                TodayTotalRevenue -= amount
                RevenuesPlayer -= amount
                amount = 0
            elseif RevenuesPlayer == amount
                TodayTotalRevenue -= amount
                RevenuesPlayer = 0
                amount = 0
            elseif RevenuesPlayer < amount
                TodayTotalRevenue -= RevenuesPlayer
                RevenuesPlayer = 0
                amount -= RevenuesPlayer
            endif
        endif
        
        if amount > 0
        
            TodayTotalExpenses += amount
            ExpensesPlayer += amount
            
        endif
    elseif Source as CS_StorageWageScript
        ExpensesWagesWork += amount
        TodayTotalExpenses += amount
    elseif Source as CS_TradeAgreementTrackerScript
        TodayTotalExpenses += amount
        ExpensesTrade += amount
        ;/elseif Source as CS_StorageFactionScript
        StorageExpensesFaction[ItemIndex] = StorageExpensesFaction[ItemIndex] + amount/;
        ;/elseif Source as CS_StorageCityScript
        StorageExpensesHoldings[ItemIndex] = StorageExpensesHoldings[ItemIndex] + amount
    
        if TodayExpenseStorageItems.Find(Item) < 0
            AddToTodayExpenseStorageItems(Item)
        endif
        TodayTotalExpenses += amount
        ;/elseif Source as CS_StorageFactionScript
        StorageExpensesFaction[ItemIndex] = StorageExpensesFaction[ItemIndex] + amount/;
    endif
EndFunction

; Events -------------------

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    SetItemIncomeSource(aiItemCount, akSourceContainer)
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    SetItemExpenseDestination(aiItemCount, akDestContainer)
EndEvent