Scriptname CS_TradeAgreementActorScript extends ObjectReference conditional

ObjectReference Property SendingStorage Auto hidden
ObjectReference Property ReceivingStorage Auto hidden

ObjectReference Property TempItem Auto hidden

Location Property CS_TradeAgreementTotalText Auto
Location Property CS_TradeAgreementUniformText Auto
Location Property CS_NoneLocation Auto

Message Property CS_TradeAgreementResourceImportAmount Auto
Message Property CS_TradeAgreementResourceImportAddAmount Auto
Message Property CS_TradeAgreementResourceImportSubtractAmount Auto
Message Property CS_TradeAgreementResourceExportAmount Auto
Message Property CS_TradeAgreementResourceExportAddAmount Auto
Message Property CS_TradeAgreementResourceExportSubtractAmount Auto

Message Property CS_TradeAgreementResourceFreeImportAmount Auto
Message Property CS_TradeAgreementResourceFreeImportAddAmount Auto
Message Property CS_TradeAgreementResourceFreeImportSubtractAmount Auto
Message Property CS_TradeAgreementResourceFreeExportAmount Auto
Message Property CS_TradeAgreementResourceFreeExportAddAmount Auto
Message Property CS_TradeAgreementResourceFreeExportSubtractAmount Auto

ReferenceAlias Property ResourceText Auto
LocationAlias Property SendingText Auto
LocationAlias Property ReceivingText Auto
LocationAlias Property TotalOrUniformText Auto

Form Item
CS_TradeAgreementTrackerScript TradeScript
CS_TradeAgreementItemScript TradeItemScript
int Property NewAmount Auto conditional hidden
int Property GroupedItem Auto conditional hidden
bool ChangeDetected
float ChangeModifier
int Cost

Function InitiateTradeMenu(ObjectReference Sending, ObjectReference Receiving, String TradeType)
    GoToState("None")
    SendingStorage = Sending
    ReceivingStorage = Receiving
    
    GoToState(TradeType)
    while utility.IsInMenuMode()
        utility.wait(0.1)
    endwhile
    ResourceText.GetOwningQuest().Stop()
EndFunction

; Exports -------------------------------------------------

Function MenuChooseAmountExport()
    if TradeScript && TradeItemScript
        NewAmount = TradeItemScript.Amount
    else
        NewAmount = 0
    endif
    Cost = Item.GetGoldValue()
    
    int Response
    
    while Response != 2
        int TotalCost = Cost*NewAmount
        
        Message ExportMessage
        Response = CS_TradeAgreementResourceExportAmount.show(Cost, NewAmount, TotalCost)
        
        if Response == 0
            MenuChooseAmountExportAdd()
        elseif Response == 1
            MenuChooseAmountExportSubtract()
        endif
    endwhile
    
    if ChangeDetected
        SetAmount(NewAmount)
    endif
    Item = None
    ObjectReference ItemToDelete = TempItem
    TempItem = None
    ItemToDelete.delete()
EndFunction

Function MenuChooseAmountExportAdd()
    int Response
    
    while Response != 4
        int TotalCost = Cost*NewAmount
        Response = CS_TradeAgreementResourceExportAddAmount.show(Cost, NewAmount, TotalCost)
        if Response < 4
            NewAmount += math.pow(10, Response) as int
            ChangeDetected = true
        endif
    endwhile
EndFunction

Function MenuChooseAmountExportSubtract()
    int Response
    
    while Response != 4
        int TotalCost = Cost*NewAmount
        Response = CS_TradeAgreementResourceExportSubtractAmount.show(Cost, NewAmount, TotalCost)
        if Response < 4
            NewAmount -= math.pow(10, Response) as int
            ChangeDetected = true
        endif
    endwhile
EndFunction

; Imports ---------------------------------------------------------

Function MenuChooseAmountImport()
    if TradeScript && TradeItemScript
        NewAmount = TradeItemScript.Amount
    else
        NewAmount = 0
    endif
    Cost = Item.GetGoldValue()
    
    int Response
    
    while Response != 2
        
        int TotalCost = Cost*NewAmount
        Response = CS_TradeAgreementResourceImportAmount.show(Cost, NewAmount, TotalCost)
        
        if Response == 0
            MenuChooseAmountImportAdd()
        elseif Response == 1
            MenuChooseAmountImportSubtract()
        endif
    endwhile
    
    if ChangeDetected
        SetAmount(NewAmount)
    endif
    Item = None
    ObjectReference ItemToDelete = TempItem
    TempItem = None
    ItemToDelete.delete()
EndFunction

Function MenuChooseAmountImportAdd()
    int Response
    
    while Response != 4
        
        int TotalCost = Cost*NewAmount
        Response = CS_TradeAgreementResourceImportAddAmount.show(Cost, NewAmount, TotalCost)
        
        if Response < 4
            ChangeDetected = true
            NewAmount += math.pow(10, Response) as int
        endif
    endwhile
EndFunction

Function MenuChooseAmountImportSubtract()
    int Response
    
    while Response != 4
        
        Message ImportMessage
        int TotalCost = Cost*NewAmount
        Response = CS_TradeAgreementResourceImportSubtractAmount.show(Cost, NewAmount, TotalCost)
        
        if Response < 4
            ChangeDetected = true
            NewAmount -= math.pow(10, Response) as int
        endif
    endwhile
EndFunction

Function SetAmount(float NewAmount)
    
EndFunction

State Exports
    
    Event OnBeginState()
        
        Item = None
        ;RemoveAllItems()
        ResourceText.GetOwningQuest().Start()
        CS_StorageFactionScript StorageScript = SendingStorage as CS_StorageFactionScript
        if GetItemCount(StorageScript.IncomeStorageItems) == 0
            AddItem(StorageScript.IncomeStorageItems, 1)
        endif
        
        if GetItemCount(StorageScript.AllStorageTypeGroupTexts) == 0
            AddItem(StorageScript.AllStorageTypeGroupTexts, 1)
        endif
        TradeScript = (SendingStorage as CS_StorageFactionScript).GetTradeAgreement(ReceivingStorage)
        ((self as ObjectReference) as Actor).ShowGiftMenu(false, StorageScript.StorageItemKeywords)
        
    EndEvent

    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        if akDestContainer == Game.GetPlayer()
            akDestContainer.RemoveItem(akBaseItem, aiItemCount, true)
            if !Item
                Item = akBaseItem
                ChangeDetected = false
                TempItem = PlaceAtMe(akBaseItem)
                ResourceText.ForceRefTo(TempItem)
                CS_FactionManagementDiplomacy SendingDiplomacy = (SendingStorage as CS_StorageFactionScript).FactionOwner as CS_FactionManagementDiplomacy
                SendingText.ForceLocationTo(SendingDiplomacy.FactionName)
                CS_FactionManagementDiplomacy ReceivingDiplomacy = (ReceivingStorage as CS_StorageFactionScript).FactionOwner as CS_FactionManagementDiplomacy
                ReceivingText.ForceLocationTo(ReceivingDiplomacy.FactionName)
                if TradeScript
                    TradeItemScript = TradeScript.GetTradeItem(Item, "Export")
                endif
                MenuChooseAmountExport()
            endif
        endif
    EndEvent
    
    Function SetAmount(float NewAmount)
        CS_StorageFactionScript StorageScript = SendingStorage as CS_StorageFactionScript
        StorageScript.SetTradeAgreement(ReceivingStorage, Item, NewAmount, "Export")
    EndFunction
    
EndState

State Imports
    
    Event OnBeginState()
        
        Item = None
        ;RemoveAllItems()
        ResourceText.GetOwningQuest().Start()
        CS_StorageFactionScript StorageScript = SendingStorage as CS_StorageFactionScript
        if GetItemCount(StorageScript.NPCTradeItems) == 0
            AddItem(StorageScript.NPCTradeItems, 1)
        endif
        
        if GetItemCount(StorageScript.AllStorageTypeGroupTexts) == 0
            AddItem(StorageScript.AllStorageTypeGroupTexts, 1)
        endif
        TradeScript = (ReceivingStorage as CS_StorageFactionScript).GetTradeAgreement(SendingStorage)
        ((self as ObjectReference) as Actor).ShowGiftMenu(false, StorageScript.StorageItemKeywords)
        
    EndEvent

    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        if akDestContainer == Game.GetPlayer()
            akDestContainer.RemoveItem(akBaseItem, aiItemCount, true, self as ObjectReference)
            if !Item
                Item = akBaseItem
                ChangeDetected = false
                TempItem = PlaceAtMe(akBaseItem)
                ResourceText.ForceRefTo(TempItem)
                CS_FactionManagementDiplomacy SendingDiplomacy = (SendingStorage as CS_StorageFactionScript).FactionOwner as CS_FactionManagementDiplomacy
                SendingText.ForceLocationTo(SendingDiplomacy.FactionName)
                CS_FactionManagementDiplomacy ReceivingDiplomacy = (ReceivingStorage as CS_StorageFactionScript).FactionOwner as CS_FactionManagementDiplomacy
                ReceivingText.ForceLocationTo(ReceivingDiplomacy.FactionName)
                if TradeScript
                    TradeItemScript = TradeScript.GetTradeItem(Item, "Import")
                endif
                MenuChooseAmountImport()
            endif
        endif
    EndEvent
    
    Function SetAmount(float NewAmount)
        CS_StorageFactionScript StorageScript = ReceivingStorage as CS_StorageFactionScript
        StorageScript.SetTradeAgreement(SendingStorage, Item, NewAmount, "Import")
    EndFunction
    
EndState

State Completed
    
    Event OnUpdate()
        
        RemoveAllItems()
        
    EndEvent
    
EndState