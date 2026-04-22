Scriptname CS_TradeAgreementTrackerScript extends ObjectReference  

import CS_CommonFunctions

ObjectReference Property PlayerStorage Auto hidden
ObjectReference Property AIStorage Auto hidden

Form[] Property PlayerExportItems Auto hidden
Form[] Property PlayerImportItems Auto hidden

ObjectReference[] Property PlayerExports Auto hidden
ObjectReference[] Property PlayerImports Auto hidden

MiscObject Property CS_TradeAgreementItem Auto

Function SetUpTradeAgreement(ObjectReference PlayerFactionStorage, ObjectReference FactionStorage)
    PlayerStorage = PlayerFactionStorage
    AIStorage = FactionStorage
EndFunction

Function SetTradeItem(Form Item, int Amount, string type)
    if type == "Export"
        int ExportIndex = PlayerExportItems.Find(Item)
        if ExportIndex >= 0
            CS_TradeAgreementItemScript ItemScript = PlayerExports[ExportIndex] as CS_TradeAgreementItemScript
            ItemScript.SetUp(Item, Amount)
        else
            AddTradeItem(Item, Amount, type)
        endif
    elseif type == "Import"
        int ImportIndex = PlayerImportItems.Find(Item)
        if ImportIndex >= 0
            CS_TradeAgreementItemScript ItemScript = PlayerImports[ImportIndex] as CS_TradeAgreementItemScript
            ItemScript.SetUp(Item, Amount)
        else
            AddTradeItem(Item, Amount, type)
        endif
    endif
EndFunction

Function AddTradeItem(Form Item, int Amount, string type)
    ObjectReference NewTradeItem = PlaceAtMe(CS_TradeAgreementItem)
    (NewTradeItem as CS_TradeAgreementItemScript).SetUp(Item, Amount)
    
    if type == "Export"
        PlayerExports = AddToArray(NewTradeItem, PlayerExports)
        PlayerExportItems = AddToFormArray(Item, PlayerExportItems)
    elseif type == "Import"
        PlayerImports = AddToArray(NewTradeItem, PlayerImports)
        PlayerImportItems = AddToFormArray(Item, PlayerImportItems)
    endif
EndFunction

CS_TradeAgreementItemScript Function GetTradeItem(Form Item, string type)
    if type == "Export"
        int i = 0
        while i < PlayerExports.Length
            if (PlayerExports[i] as CS_TradeAgreementItemScript).Item == Item
                return PlayerExports[i] as CS_TradeAgreementItemScript
            endif
            i += 1
        endwhile
    elseif type == "Import"
        int i = 0
        while i < PlayerImports.Length
            if (PlayerImports[i] as CS_TradeAgreementItemScript).Item == Item
                return PlayerImports[i] as CS_TradeAgreementItemScript
            endif
            i += 1
        endwhile
    endif
    
    return None
EndFunction

Function SendExports()
    CS_FactionMajor PlayerFaction = (PlayerStorage as CS_StorageFactionScript).FactionOwner
    ObjectReference Treasury = PlayerFaction.StorageTreasury as ObjectReference
    MiscObject Gold001 = (Treasury as CS_StorageTreasuryScript).Gold001
    
    int i = 0
    while i < PlayerExports.Length
        CS_TradeAgreementItemScript ItemScript = PlayerExports[i] as CS_TradeAgreementItemScript
        int AmountToSend = ItemScript.Amount
        int TotalRevenue
        if ItemScript.ItemList
            int index = 0
            while index < ItemScript.ItemList.GetSize() && AmountToSend > 0
                Form Item = ItemScript.ItemList.GetAt(index)
                PlayerStorage.RemoveItem(Item, AmountToSend, true, self as ObjectReference)
                int ItemRemoved = GetItemCount(Item)
                AmountToSend -= ItemRemoved
                RemoveItem(Item, ItemRemoved)
                TotalRevenue += ItemRemoved*ItemScript.ItemCost
                index += 1
            endwhile
            AddItem(Gold001, TotalRevenue)
            RemoveItem(Gold001, TotalRevenue, true, Treasury)
        else
            PlayerStorage.RemoveItem(ItemScript.Item, AmountToSend, true, self as ObjectReference)
            int ItemRemoved = GetItemCount(ItemScript.Item)
            RemoveItem(ItemScript.Item, ItemRemoved)
            int Revenue = ItemRemoved*ItemScript.ItemCost
            AddItem(Gold001, Revenue)
            RemoveItem(Gold001, Revenue, true, Treasury)
        endif
        i += 1
    endwhile
    
EndFunction

Function ReceiveImports()
    CS_FactionMajor PlayerFaction = (PlayerStorage as CS_StorageFactionScript).FactionOwner
    ObjectReference Treasury = PlayerFaction.StorageTreasury as ObjectReference
    MiscObject Gold001 = (Treasury as CS_StorageTreasuryScript).Gold001
    
    int i = 0
    while i < PlayerImports.Length
        CS_TradeAgreementItemScript ItemScript = PlayerImports[i] as CS_TradeAgreementItemScript
        int ItemCost = ItemScript.ItemCost
        if ItemScript.ItemLeveledItem
            int MaxAmount = math.floor(Treasury.GetItemCount(Gold001) as float/ItemCost) as int
            if MaxAmount >= ItemScript.Amount
                Treasury.RemoveItem(Gold001, ItemScript.ItemCost*ItemScript.Amount, true, self as ObjectReference)
                PlayerStorage.AddItem(ItemScript.ItemLeveledItem, ItemScript.Amount)
            elseif MaxAmount > 0
                Treasury.RemoveItem(Gold001, ItemScript.ItemCost*MaxAmount, true, self as ObjectReference)
                PlayerStorage.AddItem(ItemScript.ItemLeveledItem, MaxAmount)
            endif
        else
            int MaxAmount = math.floor(Treasury.GetItemCount(Gold001) as float/ItemCost) as int
            if MaxAmount >= ItemScript.Amount
                Treasury.RemoveItem(Gold001, ItemScript.ItemCost*ItemScript.Amount, true, self as ObjectReference)
                PlayerStorage.AddItem(ItemScript.Item, ItemScript.Amount)
            elseif MaxAmount > 0
                Treasury.RemoveItem(Gold001, ItemScript.ItemCost*MaxAmount, true, self as ObjectReference)
                PlayerStorage.AddItem(ItemScript.Item, MaxAmount)
            endif
        endif
        i += 1
    endwhile
    
EndFunction

Event OnUpdate()
    SendExports()
    ReceiveImports()
EndEvent
    