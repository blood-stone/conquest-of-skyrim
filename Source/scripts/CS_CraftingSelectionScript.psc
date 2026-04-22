Scriptname CS_CraftingSelectionScript extends ObjectReference  

CS_BuildingManagementScript CraftingBuilding

Actor Property PlayerRef Auto

Function InitiateCraftingSelectionMenu(CS_BuildingManagementScript Building, bool Selecting=true)
    CraftingBuilding = Building
    if Selecting
        GoToState("Selecting")
    else
        GoToState("Removing")
    endif
    SetUpInventory()
    ((self as ObjectReference) as Actor).ShowGiftMenu(false, CraftingBuilding.CraftingOptions)
EndFunction

Function SetUpInventory()
    
EndFunction

State Selecting
    
    Function SetUpInventory()
        RemoveAllItems()
        FormList CraftingOptions = CraftingBuilding.CraftingOptions
        FormList CraftingTypes = CraftingBuilding.CraftingTypes
        Form[] CraftingSelections = CraftingBuilding.CraftingSelections
        AddItem(CraftingOptions, 1)
        int i = 0
        while i < CraftingSelections.Length
            int CraftingIndex = CraftingTypes.Find(CraftingSelections[i])
            RemoveItem(CraftingOptions.GetAt(CraftingIndex))
            i += 1
        endwhile
    EndFunction
    
    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        if akDestContainer == PlayerRef
            PlayerRef.RemoveItem(akBaseItem, aiItemCount, true)
            CraftingBuilding.AddOptionToCrafting(akBaseItem)
        endif
    EndEvent
    
EndState

State Removing
    
    Function SetUpInventory()
        RemoveAllItems()
        FormList CraftingOptions = CraftingBuilding.CraftingOptions
        FormList CraftingTypes = CraftingBuilding.CraftingTypes
        Form[] CraftingSelections = CraftingBuilding.CraftingSelections
        int i = 0
        while i < CraftingSelections.Length
            int CraftingIndex = CraftingTypes.Find(CraftingSelections[i])
            AddItem(CraftingOptions.GetAt(CraftingIndex), 1)
            i += 1
        endwhile
    EndFunction
    
    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        if akDestContainer == PlayerRef
            PlayerRef.RemoveItem(akBaseItem, aiItemCount, true)
            CraftingBuilding.RemoveOptionFromCrafting(akBaseItem)
        endif
    EndEvent
    
EndState