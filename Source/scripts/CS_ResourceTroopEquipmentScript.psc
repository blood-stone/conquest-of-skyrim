Scriptname CS_ResourceTroopEquipmentScript extends ObjectReference  

int Property EquipmentTier Auto

Outfit Function GetEquipmentOutfit(FormList OutfitList)
    return OutfitList.GetAt(EquipmentTier) as Outfit
    
    ;Get mage robes later
EndFunction

LeveledItem Function GetEquipmentItems(FormList EquipmentList)
    return EquipmentList.GetAt(EquipmentTier) as LeveledItem
EndFunction
    