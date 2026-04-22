Scriptname CS_ArmyRegimentEquipment extends ObjectReference  

import CS_CommonFunctions

Armor[] Property CustomEquipment Auto hidden

LeveledItem[] Property CustomItems Auto hidden
int[] Property CustomItemsAmount Auto hidden

int Property EquipmentTier Auto hidden

float Property TroopEquipmentModifier=1.0 Auto hidden

FormList Property CS_CraftingResourcesOutputsEquipmentTroop Auto

Function SetNewTier(int NewTier, bool getequipment=true)
    ObjectReference FactionOwner = ((self as ObjectReference) as CS_ArmyRegimentOrders).FactionOwnerActivator
    ObjectReference StorageEquipment = (FactionOwner as CS_FactionManagementEconomy).StorageEquipment
    
    int OldEquipmentTier = EquipmentTier
    EquipmentTier = NewTier
    TroopEquipmentModifier = 1 + math.floor(EquipmentTier as float/5)
    if getequipment && NewTier > 0 ; since the formlist has tier 1 = 0, if the new tier is 0 it should result in no equipment
        StorageEquipment.RemoveItem(CS_CraftingResourcesOutputsEquipmentTroop.GetAt(NewTier - 1), 1, true, self as ObjectReference)
    endif
    if OldEquipmentTier > 0
        RemoveItem(CS_CraftingResourcesOutputsEquipmentTroop.GetAt(OldEquipmentTier - 1), 1, true, StorageEquipment)
    endif
    
    ReEquipTroops()
EndFunction

Function ReEquipTroops()
    GoToState("ReEquippingTroops")
    
    CS_ArmyRegimentTroops RegimentTroops = ((self as ObjectReference) as CS_ArmyRegimentTroops)
    
    int i = 0
    while i < RegimentTroops.TroopSpawners.Length
        RegimentTroops.TroopSpawners[i].RegisterforSingleUpdate(0.1)
        i += 1
    endwhile
    GoToState("Normal")
EndFunction

State ReEquippingTroops
    
    Function ReEquipTroops()
        ;Block
    EndFunction
    
EndState