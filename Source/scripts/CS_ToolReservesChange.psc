Scriptname CS_ToolReservesChange extends ObjectReference  

import CS_CommonFunctions

FormList Property CS_ResourceOutputListEquipment Auto

int[] EquipmentReceived
int[] EquipmentReceivedAmounts

Function AssignHighestEquipment(ObjectReference Building, int amount)
    GoToState("Busy")
    debug.trace("Assigning highest work equipment")
    if GetItemCount(CS_ResourceOutputListEquipment) == 0
        GoToState("Ready")
        return
    endif
    
    ObjectReference CityManagementActivator = ((self as ObjectReference) as CS_ReservesScript).FactionOwnerActivator
    CS_CityManagementEconomy EconomyScript = CityManagementActivator as CS_CityManagementEconomy
        
    int[] NewEquipment
    int[] NewEquipmentAmounts = new int[10]
    
    int i = CS_ResourceOutputListEquipment.GetSize() - 1
    int amountsindex = 0
    while i >= 0 && amount > 0
        MiscObject Equipment = CS_ResourceOutputListEquipment.GetAt(i) as MiscObject
        int equipmentamount = GetItemCount(Equipment)
        debug.trace("Reserves currently has " + equipmentamount + " Equipment " + i)
        if equipmentamount >= amount
            NewEquipment = AddToIntArray(i, NewEquipment)
            NewEquipmentAmounts[amountsindex] = amount
            amountsindex += 1
            amount = 0
            ;RemoveItem(Equipment, amount, true, Regiment)
            ;return
        elseif equipmentamount > 0
            NewEquipment = AddToIntArray(i, NewEquipment)
            NewEquipmentAmounts[amountsindex] = equipmentamount
            ;RemoveItem(Equipment, equipmentamount, true, Regiment)
            amountsindex += 1
            amount -= equipmentamount
        endif
        i -= 1
    endwhile
    
    i = 0
    while i < NewEquipment.Length
        MiscObject Equipment = CS_ResourceOutputListEquipment.GetAt(NewEquipment[i]) as MiscObject
        RemoveItem(Equipment, NewEquipmentAmounts[i], true, Building)
        i += 1
    endwhile
    ;/
    if NewEquipment.Length > 0
        utility.wait(1)
        (Regiment as CS_ArmyRegimentEquipment).DistributeEquipment()
    endif/;
    debug.trace("Finished assigning highest work equipment")
    GoToState("Ready")
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    while GetState() == "Busy"
        utility.wait(0.1)
    endwhile
    GoToState("Busy")
    int EquipmentNum = CS_ResourceOutputListEquipment.Find(akBaseItem)
    
    if EquipmentNum >= 0
        debug.trace("Added " + aiItemCount + " Equipment " + EquipmentNum + " to reserves")
        ObjectReference CityManagementActivator = ((self as ObjectReference) as CS_ReservesScript).FactionOwnerActivator
        CS_CityManagementEconomy EconomyScript = CityManagementActivator as CS_CityManagementEconomy
        ;/
        if EconomyScript.NeedsTools
            ObjectReference[] BuildingsNeedingTools = GetEqualObjectReferenceArray(EconomyScript.NeedsTools)
            int remainingitems = aiItemCount
            
            int i = 0
            while i < BuildingsNeedingTools.Length && remainingitems > 0
                ObjectReference Building = BuildingsNeedingTools[i]
            
                int neededtools = (Building as CS_BuildingScriptToolThread).ToolRequests
                if neededtools <= remainingitems
                    RemoveItem(CS_ResourceOutputListEquipment.GetAt(EquipmentNum) as MiscObject, neededtools, true, Building)
                    remainingitems -= neededtools
                elseif neededtools > remainingitems
                    RemoveItem(CS_ResourceOutputListEquipment.GetAt(EquipmentNum) as MiscObject, aiItemCount, true, Building)
                    remainingitems = 0
                endif
                i += 1
            endwhile
        endif
            
        ;/
        int i = 0
        while i < itemstocheck
            int TroopToGive = RegimentScript.GiveTroopEquipmentToNextTroop(EquipmentNum)
            if TroopToGive >= 0
                ;RegimentScript.GiveTroopEquipment(EquipmentNum, TroopToGive)
            else
                return
            endif
            i += 1
        endwhile/;
    endif
    GoToState("Ready")
EndEvent
;/
State InitiateEquipmentAssignment
    
    Event OnUpdate()
        AssignHighestEquipment(1)
        GoToState("Ready")
    EndEvent
    
EndState

State ChangingEquipment
    
    Event OnBeginState()
        EquipmentReceived = GetNewIntArray(0)
        EquipmentReceivedAmounts = new int[10]
    EndEvent
    
    Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
        int EquipmentNum = CS_ResourceOutputListEquipment.Find(akBaseItem)
        
        if EquipmentNum >= 0
            int EquipmentIndex = EquipmentReceived.Find(EquipmentNum)
            if EquipmentIndex >= 0
                EquipmentReceivedAmounts[EquipmentIndex] = EquipmentReceivedAmounts[EquipmentIndex] + aiItemCount
            else
                EquipmentReceived = AddToIntArray(EquipmentNum, EquipmentReceived)
                EquipmentIndex = EquipmentReceived.Find(EquipmentNum)
                EquipmentReceivedAmounts[EquipmentIndex] = EquipmentReceivedAmounts[EquipmentIndex] + aiItemCount
            endif
            debug.trace("Worker equipment reserves received " + aiItemCount + " of Equipment " + EquipmentNum)
        endif
    EndEvent
    
    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        int EquipmentNum = CS_ResourceOutputListEquipment.Find(akBaseItem)
        int EquipmentIndex = EquipmentReceived.Find(EquipmentNum)
        
        if EquipmentNum >= 0 && EquipmentIndex >= 0
            EquipmentReceivedAmounts[EquipmentIndex] = EquipmentReceivedAmounts[EquipmentIndex] - aiItemCount
            if EquipmentReceivedAmounts[EquipmentIndex] <= 0
                EquipmentReceived = RemoveFromIntArray(EquipmentNum, EquipmentReceived)
            endif
            debug.trace("Worker equipment reserves removed " + aiItemCount + " of Equipment " + EquipmentNum + " from equipment that was supposed to be added")
        endif
    EndEvent
    
EndState

State InitiateEquipmentDistribution
    
    Event OnUpdate()
        GoToState("Busy")
        ObjectReference CityManagementActivator = ((self as ObjectReference) as CS_ReservesScript).FactionOwnerActivator
        CS_CityManagementEconomy EconomyScript = CityManagementActivator as CS_CityManagementEconomy
        
        if EconomyScript.NeedsTools
            ObjectReference[] BuildingsNeedingTools = GetEqualObjectReferenceArray(EconomyScript.NeedsTools)
            int remainingitems = aiItemCount
            
            int = 0
            while i < BuildingsNeedingTools.Length && remainingitems > 0
                ObjectReference Building = BuildingsNeedingTools[i]
            
                int neededtools = (Building as CS_BuildingScriptToolThread).ToolRequests
                if neededtools <= remainingitems
                    RemoveItem(CS_ResourceOutputListEquipment.GetAt(EquipmentNum) as MiscObject, neededtools, true, Regiment)
                    remainingitems -= neededtools
                elseif neededtools > remainingitems
                    RemoveItem(CS_ResourceOutputListEquipment.GetAt(EquipmentNum) as MiscObject, aiItemCount, true, Regiment)
                    remainingitems = 0
                endif
                i += 1
            endwhile
        endif
        
        if EconomyScript.HomeRegiments
            ObjectReference Regiment = EconomyScript.HomeRegiments[0]
        
            int i = 0
            while i < EquipmentReceived.Length
                MiscObject Equipment = CS_ResourceOutputListEquipment.GetAt(EquipmentReceived[i]) as MiscObject
                RemoveItem(Equipment, EquipmentReceivedAmounts[i], true, Regiment)
                i += 1
            endwhile
        endif
        
        EquipmentReceived = GetNewIntArray(0)
        EquipmentReceivedAmounts = new int[10]
        GoToState("Ready")
        
    EndEvent
    
EndState
        /;
State Busy
    
    Function AssignHighestEquipment(ObjectReference Building, int amount)
        while GetState() == "Busy"
            utility.wait(0.1)
        endwhile
        AssignHighestEquipment(Building, amount)
    EndFunction
    
EndState
