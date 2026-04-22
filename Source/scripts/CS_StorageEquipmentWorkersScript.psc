Scriptname CS_StorageEquipmentWorkersScript extends ObjectReference  

ObjectReference Property City Auto hidden

FormList Property WorkerEquipment Auto

int Property WorkerEquipmentTier Auto hidden

float Property WorkerEquipmentModifier=1.0 Auto hidden

Function SetNewTier(int NewTier, bool getequipment=true)
    ObjectReference StorageEquipment = (City as CS_CityManagementEconomy).StorageEquipment
    
    int OldEquipmentTier = WorkerEquipmentTier
    WorkerEquipmentTier = NewTier
    WorkerEquipmentModifier = 1 + math.floor(WorkerEquipmentTier as float/5)
    if getequipment && NewTier > 0 ; since the formlist has tier 1 = 0, if the new tier is 0 it should result in no equipment
        StorageEquipment.RemoveItem(WorkerEquipment.GetAt(NewTier - 1), 1, true, self as ObjectReference)
    endif
    if OldEquipmentTier > 0
        RemoveItem(WorkerEquipment.GetAt(OldEquipmentTier - 1), 1, true, (City as CS_CityManagementEconomy).StorageEquipment)
    endif
    
    ReEquipWorkers()
EndFunction

Function ReEquipWorkers()
    GoToState("ReEquippingWorkers")
    
    CS_CityManagementPopulation Population = City as CS_CityManagementPopulation
    
    int i = 0
    while i < Population.Settlers.Length
        ((Population.Settlers[i] as ObjectReference) as CS_SettlementSettlerScript).RegisterforSingleUpdate(0.1)
        i += 1
    endwhile
    GoToState("Normal")
EndFunction

State ReEquippingWorkers
    
    Function ReEquipWorkers()
        ;Block
    EndFunction
    
EndState