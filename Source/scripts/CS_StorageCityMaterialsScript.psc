Scriptname CS_StorageCityMaterialsScript extends ObjectReference  

CS_BuildingManagementScript Property Blacksmith Auto
FormList Property MaterialsBlacksmith Auto

ObjectReference Property LumberMill Auto
FormList Property MaterialsLumberMill Auto

FormList Property KeywordsBlacksmith Auto
FormList Property KeywordsLumberMill Auto
;/
Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    debug.trace("Received " + aiItemCount + " " + akBaseItem.GetName())
    if MaterialsBlacksmith.HasForm(akBaseItem)
        int i = 0
        while i < Blacksmith.InputMaterials.GetSize()
            FormList MaterialTypeList = Blacksmith.InputMaterials.GetAt(i) as FormList
            if MaterialTypeList.HasForm(akBaseItem)
                ObjectReference City = ((self as ObjectReference) as CS_StorageCityScript).City
                MiscObject ResourceRecipe = Blacksmith.OutputMaterialsList.GetAt(i) as MiscObject
                ObjectReference ResourceRecipeRef = PlaceAtMe(ResourceRecipe)
                CS_CraftingResourcesScript ResourcesScript = (ResourceRecipeRef as CS_CraftingResourcesScript)
                ResourcesScript.SetOutput(akBaseItem, aiItemCount, City)
                
                Form OutputItem = ResourcesScript.OutputItem
                int OutputAmount = ResourcesScript.OutputAmount
                ObjectReference OutputDestination = ResourcesScript.Destination
                ResourceRecipeRef.delete()
                LeveledItem CraftingResults = (OutputDestination as CS_StorageCityScript).CraftingResults
                CraftingResults.AddForm(OutputItem, 1, OutputAmount)
                debug.trace(OutputAmount + " Added to CraftingResults from " + aiItemCount + " " + akBaseItem.GetName())
                return
            endif
            i += 1
        endwhile
    endif
EndEvent/;