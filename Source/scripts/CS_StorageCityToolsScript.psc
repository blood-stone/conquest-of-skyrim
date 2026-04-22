Scriptname CS_StorageCityToolsScript extends ObjectReference  

FormList Property WorkEquipment Auto

float Property ToolModifier=1.0 Auto hidden

Function SetModifier(FormList List)
    ObjectReference City = ((self as ObjectReference) as CS_StorageCityScript).City
    float modifier = 1 ;base amount without equipment
    int TotalWorkers = (City as CS_CityManagementPopulation).TotalWorkers
    
    int i = List.GetSize() - 1
    int usedtools = 0
    while i >= 0 && usedtools < TotalWorkers
        int toolitemcount = GetItemCount(List.GetAt(i))
        if toolitemcount > 0
            if toolitemcount > TotalWorkers
                toolitemcount = TotalWorkers
            endif
            
            float ModifierAddition = 0.2*(i + 1)*(toolitemcount as float/TotalWorkers)
            modifier += ModifierAddition
            usedtools += toolitemcount
        endif
        i -= 1
    endwhile
    
    ToolModifier = modifier
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    if WorkEquipment.HasForm(akBaseItem)
        SetModifier(WorkEquipment)
    endif
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    if WorkEquipment.HasForm(akBaseItem)
        SetModifier(WorkEquipment)
    endif
EndEvent
