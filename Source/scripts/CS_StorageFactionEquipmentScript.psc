Scriptname CS_StorageFactionEquipmentScript extends ObjectReference  

Actor Property PlayerRef Auto

int[] Property CurrentTroopEquipmentTiers Auto
int[] Property CurrentWorkerEquipmentTiers Auto

FormList Property CS_CraftingResourcesOutputsEquipmentTroop Auto
FormList Property CS_CraftingResourcesOutputsEquipmentTools Auto

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    int TroopIndex = CS_CraftingResourcesOutputsEquipmentTroop.Find(akBaseItem)
    if TroopIndex >= 0
        CurrentTroopEquipmentTiers[TroopIndex + 1] = 1
        return
    endif
    
    int WorkerIndex = CS_CraftingResourcesOutputsEquipmentTools.Find(akBaseItem)
    if WorkerIndex >= 0
        CurrentWorkerEquipmentTiers[WorkerIndex + 1] = 1
        return
    endif
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    int TroopIndex = CS_CraftingResourcesOutputsEquipmentTroop.Find(akBaseItem)
    if TroopIndex >= 0
        if GetItemCount(akBaseItem) == 0
            CurrentTroopEquipmentTiers[TroopIndex + 1] = 0
        endif
        return
    endif
    
    int WorkerIndex = CS_CraftingResourcesOutputsEquipmentTools.Find(akBaseItem)
    if WorkerIndex >= 0
        if GetItemCount(akBaseItem) == 0
            CurrentWorkerEquipmentTiers[WorkerIndex + 1] = 0
        endif
        return
    endif
EndEvent