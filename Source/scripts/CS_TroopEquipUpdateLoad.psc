Scriptname CS_TroopEquipUpdateLoad extends ReferenceAlias  
;/
Event OnPlayerLoadGame()
    (GetOwningQuest() as CS_TroopEquipmentUpdaterScript).UpdateAllLists()
EndEvent/;