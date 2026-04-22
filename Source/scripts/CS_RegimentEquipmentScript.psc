Scriptname CS_RegimentEquipmentScript extends ObjectReference  

CS_RegimentScript Property RegimentScript Auto

ObjectReference Property TroopEquipmentReserves Auto

ReferenceAlias[] Property Troops Auto

FormList Property CS_ResourceOutputListEquipmentTroop Auto

CS_ArmyRegimentTroopScript[] Property Threads Auto
;/
Function DistributeEquipment()
    int troopnum = 0
    int i = 0
    while i < CS_ResourceOutputListEquipmentTroop.GetSize()
        MiscObject Equipment = CS_ResourceOutputListEquipmentTroop.GetAt(i) as MiscObject
        int equipmentcount = GetItemCount(Equipment)
        while equipmentcount > 0 && troopnum < 10
            if Threads[troopnum].EquipmentTier < i
                RemoveItem(CS_ResourceOutputListEquipmentTroop.GetAt(Threads[troopnum].EquipmentTier) as MiscObject, 1, true, TroopEquipmentReserves)
                Threads[troopnum].EquipmentTier = i
                if Threads[i].GetActorRef()
                    Threads[i].SetTroopOutfit(Threads[i].GetActorRef())
                endif
                equipmentcount -= 1
            endif
            troopnum += 1
        endwhile
        i += 1
    endwhile
EndFunction

int Function GetNumTroopsWithLesserEquipment(int EquipmentNum)
    int numtroops
    int i = 0
    while i < Threads.Length
        if Threads[i].TroopType && Threads[i].EquipmentTier < EquipmentNum
            numtroops += 1
        endif
        i += 1
    endwhile
    
    return numtroops
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    int EquipmentNum = CS_ResourceOutputListEquipmentTroop.Find(akBaseItem)
    int itemtocheck = aiItemCount
    
    int i = 0
    while i < Threads.Length && itemtocheck > 0
        int OldEquipmentTier = Threads[i].EquipmentTier
        if Threads[i].TroopType && OldEquipmentTier < EquipmentNum
            Threads[i].EquipmentTier = EquipmentNum
            if OldEquipmentTier >= 0
                RemoveItem(CS_ResourceOutputListEquipmentTroop.GetAt(OldEquipmentTier) as MiscObject, 1, true, TroopEquipmentReserves)
            endif
            if Threads[i].GetActorRef()
                string initialstate = Threads[i].GetState()
                Threads[i].GoToState("ForceWait")
                Threads[i].SetTroopOutfit(Threads[i].GetActorRef())
                Threads[i].GoToState(initialstate)
            endif
            itemtocheck -= 1
        endif
        i += 1
    endwhile
    
    if itemtocheck > 0
        RemoveItem(CS_ResourceOutputListEquipmentTroop.GetAt(EquipmentNum) as MiscObject, itemtocheck, true, TroopEquipmentReserves)
    endif
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    if akDestContainer == Game.GetPlayer()
        int EquipmentNum = CS_ResourceOutputListEquipmentTroop.Find(akBaseItem)
        int itemtocheck = aiItemCount
        
        int i = 0
        while i < Threads.Length && itemtocheck > 0
            if Threads[i].EquipmentTier == EquipmentNum
                Threads[i].EquipmentTier = -1
                if Threads[i].GetActorRef()
                    string initialstate = Threads[i].GetState()
                    Threads[i].GoToState("ForceWait")
                    Threads[i].SetTroopOutfit(Threads[i].GetActorRef())
                    Threads[i].GoToState(initialstate)
                endif
                itemtocheck -= 1
                (TroopEquipmentReserves as CS_TroopEquipmentReservesChange).AssignHighestEquipment()
            endif
            i += 1
        endwhile
    endif
EndEvent/;