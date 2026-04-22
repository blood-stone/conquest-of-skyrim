Scriptname CS_StorageEquipmentGuardsScript extends ObjectReference  

ObjectReference Property City Auto hidden

FormList Property TroopEquipment Auto

int Property GuardEquipmentTier Auto hidden

float Property TroopEquipmentModifier=1.0 Auto hidden

Function SetNewTier(int NewTier, bool getequipment=true)
    ObjectReference StorageEquipment = (City as CS_CityManagementEconomy).StorageEquipment
    
    int OldEquipmentTier = GuardEquipmentTier
    GuardEquipmentTier = NewTier
    TroopEquipmentModifier = 1 + math.floor(GuardEquipmentTier as float/5)
    if getequipment && NewTier > 0 ; since the formlist has tier 1 = 0, if the new tier is 0 it should result in no equipment
        StorageEquipment.RemoveItem(TroopEquipment.GetAt(NewTier - 1), 1, true, self as ObjectReference)
    endif
    if OldEquipmentTier > 0
        RemoveItem(TroopEquipment.GetAt(OldEquipmentTier - 1), 1, true, (City as CS_CityManagementEconomy).StorageEquipment)
    endif
    
    ReEquipGuards()
    ReEquipTroops()
EndFunction

Function ReEquipGuards()
    GoToState("ReEquippingGuards")
    
    CS_CityManagementPopulation Population = City as CS_CityManagementPopulation
    
    int i = 0
    while i < Population.GuardActors.Length
        (Population.GuardActors[i] as CS_ResourceEquipmentReceiver).GoToState("EquipTroop")
        (Population.GuardActors[i] as CS_ResourceEquipmentReceiver).RegisterforSingleUpdate(0.1)
        i += 1
    endwhile
    GoToState("Normal")
EndFunction

Function ReEquipTroops()
    GoToState("ReEquippingTroops")
    
    CS_CityManagementPopulation Population = City as CS_CityManagementPopulation
    CS_ArmyRegimentTroops RegimentTroops
    if Population.TroopRegiments
        RegimentTroops = Population.TroopRegiments[0] as CS_ArmyRegimentTroops
    endif
    
    int i = 0
    while i < RegimentTroops.Troops.Length
        (RegimentTroops.Troops[i] as CS_ResourceEquipmentReceiver).EquipmentTier = GuardEquipmentTier
        (RegimentTroops.Troops[i] as CS_ResourceEquipmentReceiver).GoToState("EquipTroop")
        (RegimentTroops.Troops[i] as CS_ResourceEquipmentReceiver).RegisterforSingleUpdate(0.1)
        i += 1
    endwhile
    GoToState("Normal")
EndFunction

State ReEquippingGuards
    
    Function ReEquipGuards()
        ;Block
    EndFunction
    
EndState

State ReEquippingTroops
    
    Function ReEquipTroops()
        ;Block
    EndFunction
    
EndState