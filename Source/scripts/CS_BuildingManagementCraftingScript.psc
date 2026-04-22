Scriptname CS_BuildingManagementCraftingScript extends ObjectReference  

CS_BuildingManagementScript Property Building Auto hidden
CS_CraftingResourcesScript Property CraftingType Auto hidden

int[] Property CraftedItemsAmount Auto

ObjectReference Property StorageFood Auto hidden
ObjectReference Property StorageMaterials Auto hidden
ObjectReference Property StorageEquipment Auto hidden
;/
LeveledItem Property CraftingResultsMaterials Auto hidden
LeveledItem Property CraftingResultsEquipment Auto hidden/;

int Function SendToNextInputChest(Form InputItem, int amount)
    ObjectReference[] InputChests = Building.InputChests
    if InputChests
        int i = 0
        while i < InputChests.Length
            if InputChests[i] != self as ObjectReference
                CS_BuildingManagementCraftingScript CraftingScript = (InputChests[i] as CS_BuildingManagementCraftingScript)
                CS_CraftingResourcesScript ResourceScript = CraftingScript.CraftingType
                if ResourceScript.Inputs.HasForm(InputItem)
                    int ItemAmountRequired = ResourceScript.ConversionAmount*Building.Workers*Building.Level
                    if amount >= ItemAmountRequired
                        RemoveItem(InputItem, ItemAmountRequired, true, InputChests[i])
                        amount -= ItemAmountRequired
                    elseif amount >= ResourceScript.ConversionAmount
                        RemoveItem(InputItem, amount, true, InputChests[i])
                        amount = 0
                    endif
                endif
            endif
            i += 1
        endwhile
    endif
    return amount
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    CS_CraftingResourcesScript ResourceScript
    debug.trace("Received " + aiItemCount + " " + akBaseItem.GetName())
    
    if CraftingType.Inputs.HasForm(akBaseItem); && CraftedItemsAmount[0] < Building.Workers*Building.Level
        ResourceScript = CraftingType
    
        FormList Inputs = ResourceScript.Inputs
        FormList Outputs = ResourceScript.Outputs
        int craftingindex = Inputs.Find(akBaseItem)
        int outputindex
        int ConversionAmount = ResourceScript.ConversionAmount
        int MaxOutput = math.floor(aiItemCount as float/ConversionAmount) as int
        debug.trace(akBaseItem.GetName() + " craftingindex = " + craftingindex + ", ConversionAmount = " + ConversionAmount + ", OriginalMaxOutput = " + MaxOutput)
        Form OutputItem
        ObjectReference Destination
        if (Outputs.GetSize() - 1) >= craftingindex
            OutputItem = Outputs.GetAt(craftingindex)
            outputindex = craftingindex
        else
            OutputItem = Outputs.GetAt(0)
            outputindex = 0
        endif
        
        debug.trace("MaxOutput: " + MaxOutput + " + CraftedItemsAmount[outputindex]: " + CraftedItemsAmount[outputindex] + " >= " + Building.Workers*Building.Level + "?")
        if (MaxOutput + CraftedItemsAmount[outputindex]) > Building.Workers*Building.Level
            MaxOutput = Building.Workers*Building.Level - CraftedItemsAmount[outputindex]
        endif
        int OutputAmount = ResourceScript.OutputAmounts[craftingindex]
        string OutputType = ResourceScript.OutputType
        
        debug.trace("MaxOutput of " + OutputItem.GetName() + " = " + MaxOutput)
    
        if MaxOutput > 0
            
            if OutputType == "Food"
                Destination = StorageFood
            elseif OutputType == "Materials"
                Destination = StorageMaterials
            elseif OutputType == "Equipment"
                Destination = StorageEquipment
            endif
            
            int MaterialUsed = ConversionAmount*MaxOutput
            int Excess = aiItemCount - ConversionAmount*MaxOutput
            RemoveItem(akBaseItem, MaterialUsed)
            
            int FinalOutput = MaxOutput*OutputAmount
            debug.trace("Crafted " + FinalOutput + " " + OutputItem.GetName() + " from " + MaterialUsed + " " + akBaseItem.GetName())
            Destination.AddItem(OutputItem, FinalOutput)
            Building.CraftingOutput += FinalOutput
            CraftedItemsAmount[outputindex] = CraftedItemsAmount[outputindex] + MaxOutput
            
            int remainder = SendToNextInputChest(akBaseItem, aiItemCount)
            if remainder > 0
                RemoveItem(akBaseItem, aiItemCount, false, akSourceContainer)
            endif
            
        else
            int remainder = SendToNextInputChest(akBaseItem, aiItemCount)
            if remainder > 0
                RemoveItem(akBaseItem, aiItemCount, false, akSourceContainer)
            endif
        endif
    else
        int remainder = SendToNextInputChest(akBaseItem, aiItemCount)
        if remainder > 0
            RemoveItem(akBaseItem, aiItemCount, false, akSourceContainer)
        endif
    endif
EndEvent