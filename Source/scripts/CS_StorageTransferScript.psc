Scriptname CS_StorageTransferScript extends ObjectReference  

ObjectReference SendingStorage
ObjectReference ReceivingStorage

Actor Property PlayerRef Auto

Function SetTransfer(ObjectReference Sending, ObjectReference Receiving, FormList Keywords)
    SendingStorage = Sending
    ReceivingStorage = Receiving
    RemoveAllItems()
    CS_StorageFactionScript StorageScript = Sending as CS_StorageFactionScript
    int i = 0
    while i < StorageScript.StorageItems.Length
        if StorageScript.StorageItems[i].HasKeyword(Keywords.GetAt(0) as Keyword)
            AddItem(StorageScript.StorageItems[i], 1)
        endif
        i += 1
    endwhile
    GoToState("ReadyForTransfer")
    ((self as ObjectReference) as Actor).ShowGiftMenu(false, Keywords)
    GoToState("Ready")
EndFunction

State ReadyForTransfer

    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        RemoveAllItems()
        if akDestContainer == PlayerRef
            PlayerRef.RemoveItem(akBaseItem, aiItemCount, true, self as ObjectReference)
            RemoveItem(akBaseItem, 1, true, ReceivingStorage)
            ObjectReference FactionOwner = ((self as ObjectReference) as CS_StorageFactionScript).FactionOwner
            (FactionOwner as CS_FactionManagementEconomy).StorageEquipment = None
        endif 
    EndEvent
        
EndState