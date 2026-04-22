Scriptname CS_RegimentEquipmentCustomScript extends ObjectReference  

import CS_CommonFunctions

CS_RegimentScript RegimentScript

bool changedetected

Function SetUp(CS_RegimentScript Regiment)
    RegimentScript = Regiment
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    if (akBaseItem as Armor)
        int CustomEquipmentIndex = RegimentScript.CustomEquipment.Find(akBaseItem as Armor)
        if CustomEquipmentIndex >= 0
            RegimentScript.CustomEquipmentAmount[CustomEquipmentIndex] = RegimentScript.CustomEquipmentAmount[CustomEquipmentIndex] + aiItemCount
        else
            RegimentScript.CustomEquipment = AddToArmorArray(akBaseItem as Armor, RegimentScript.CustomEquipment)
            RegimentScript.CustomEquipmentAmount = AddToIntArray(aiItemCount, RegimentScript.CustomEquipmentAmount)
        endif
    else
        int CustomItemsIndex = RegimentScript.CustomItems.Find(akBaseItem)
        if CustomItemsIndex >= 0
            RegimentScript.CustomItemsAmount[CustomItemsIndex] = RegimentScript.CustomItemsAmount[CustomItemsIndex] + aiItemCount
        else
            RegimentScript.CustomItems = AddToFormArray(akBaseItem, RegimentScript.CustomItems)
            RegimentScript.CustomItemsAmount = AddToIntArray(aiItemCount, RegimentScript.CustomItemsAmount)
        endif
    endif
    changedetected = true
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    if (akBaseItem as Armor)
        int CustomEquipmentIndex = RegimentScript.CustomEquipment.Find(akBaseItem as Armor)
        if CustomEquipmentIndex >= 0
            RegimentScript.CustomEquipmentAmount[CustomEquipmentIndex] = RegimentScript.CustomEquipmentAmount[CustomEquipmentIndex] - aiItemCount
            if RegimentScript.CustomEquipmentAmount[CustomEquipmentIndex] == 0
                RegimentScript.CustomEquipment = RemoveFromArmorArray(akBaseItem as Armor, RegimentScript.CustomEquipment)
                RegimentScript.CustomEquipmentAmount = RemoveFromIntArray(aiItemCount, RegimentScript.CustomEquipmentAmount)
            endif
        endif
    else
        int CustomItemsIndex = RegimentScript.CustomItems.Find(akBaseItem)
        if CustomItemsIndex >= 0
            RegimentScript.CustomItemsAmount[CustomItemsIndex] = RegimentScript.CustomItemsAmount[CustomItemsIndex] - aiItemCount
            if RegimentScript.CustomItemsAmount[CustomItemsIndex] == 0
                RegimentScript.CustomItems = RemoveFromFormArray(akBaseItem, RegimentScript.CustomItems)
                RegimentScript.CustomItemsAmount = RemoveFromIntArray(aiItemCount, RegimentScript.CustomItemsAmount)
            endif
        endif
    endif
    changedetected = true
EndEvent

Function CheckEquipmentUpdate()
    if changedetected
        RegimentScript.UpdateTroopOutfits()
        changedetected = false
    endif
EndFunction