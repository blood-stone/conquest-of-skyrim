Scriptname CS_Holding extends ObjectReference

import CS_HoldingFunctions ; contains back-end functions

; Government ----------------------------------------------------------------------------------------

CS_Name Property Name Auto

Location Property VanillaLocation Auto

CS_Faction Property FactionOwner Auto

Function SetGovernment(CS_Faction NewFactionOwner)
    FactionOwner = NewFactionOwner
EndFunction
    
;Tax Properties
float Property IncomeTaxRate Auto hidden
int Property HousingTax Auto hidden

int Property TotalIncomeTax Auto hidden
int Property TotalWages Auto hidden

GlobalVariable Property GameDaysPassed Auto

;Resource Change Properties
int Property ResourceChangeFarmFood Auto
int Property ResourceChangeHuntingFood Auto
int Property ResourceChangeHuntingMaterials Auto
int Property ResourceChangeFishingFood Auto
int Property ResourceChangeMineMaterials Auto
int Property ResourceChangeLumberMaterials Auto

;Population Properties
int Property PopulationCommoners Auto hidden
int Property CommonerIncreaseRate Auto hidden
int Property TotalPopulation Auto hidden
int Property MaxPopulation Auto hidden
int Property TotalWorkers Auto hidden
int Property MaxWorkers Auto hidden
int Property Guards Auto hidden
int Property MaxGuards Auto hidden
int Property Unemployed Auto hidden
int Property Unassigned Auto hidden
int Property FoodDeficit Auto hidden
int Property Happiness Auto hidden


; Buildings ------------------------------------------------------------------------------------------------

; Base Production
CS_BuildingManagementScript[] Property BuildingsFarms Auto
CS_BuildingManagementScript[] Property BuildingsHunting Auto
CS_BuildingManagementScript[] Property BuildingsFishing Auto
CS_BuildingManagementScript[] Property BuildingsLoggingCamps Auto
CS_BuildingManagementScript[] Property BuildingsMines Auto

;Refining
CS_BuildingManagementScript[] Property BuildingsLumberMills Auto
CS_BuildingManagementScript[] Property BuildingsTanneries Auto
CS_BuildingManagementScript[] Property BuildingsSmelters Auto
CS_BuildingManagementScript[] Property BuildingsCookeries Auto

;Crafting
CS_BuildingManagementScript[] Property BuildingsBlacksmiths Auto

Function AddBuilding(CS_BuildingManagementScript Building, string BuildingType)
    debug.trace("Adding " + Building.GetBaseObject().GetName() + " to array")
    
    if BuildingType == "Farm"
        BuildingsFarms = AddToBuildingArray(Building, BuildingsFarms)
    elseif BuildingType == "Hunting"
        BuildingsHunting = AddToBuildingArray(Building, BuildingsHunting)
    elseif BuildingType == "Fishing"
        BuildingsFishing = AddToBuildingArray(Building, BuildingsFishing)
    elseif BuildingType == "LoggingCamp"
        BuildingsLoggingCamps = AddToBuildingArray(Building, BuildingsLoggingCamps)
    elseif BuildingType == "Mine"
        BuildingsMines = AddToBuildingArray(Building, BuildingsMines)
    elseif BuildingType == "LumberMill"
        BuildingsLumberMills = AddToBuildingArray(Building, BuildingsLumberMills)
    elseif BuildingType == "Tannery"
        BuildingsTanneries = AddToBuildingArray(Building, BuildingsTanneries)
    elseif BuildingType == "Smelter"
        BuildingsSmelters = AddToBuildingArray(Building, BuildingsSmelters)
    elseif BuildingType == "Cookery"
        BuildingsSmelters = AddToBuildingArray(Building, BuildingsCookeries)
    elseif BuildingType == "Blacksmith"
        BuildingsBlacksmiths = AddToBuildingArray(Building, BuildingsBlacksmiths);/
    elseif BuildingType == "GuardPost"
        BuildingsGuardPosts = AddToBuildingArray(Building, BuildingsGuardPosts)/;
    endif
    debug.trace(Building.GetBaseObject().GetName() + " added to array")
EndFunction

Function RemoveBuilding(CS_BuildingManagementScript Building)
    debug.trace("Removing " + Building.GetBaseObject().GetName() + " from array")
    if BuildingsFarms.Find(Building) >= 0
        BuildingsFarms = RemoveFromBuildingArray(Building, BuildingsFarms)
    elseif BuildingsHunting.Find(Building) >= 0
        BuildingsHunting = RemoveFromBuildingArray(Building, BuildingsHunting)
    elseif BuildingsFishing.Find(Building) >= 0
        BuildingsFishing = RemoveFromBuildingArray(Building, BuildingsFishing)
    elseif BuildingsLoggingCamps.Find(Building) >= 0
        BuildingsLoggingCamps = RemoveFromBuildingArray(Building, BuildingsLoggingCamps)
    elseif BuildingsMines.Find(Building) >= 0
        BuildingsMines = RemoveFromBuildingArray(Building, BuildingsMines)
    elseif BuildingsLumberMills.Find(Building) >= 0
        BuildingsLumberMills = RemoveFromBuildingArray(Building, BuildingsLumberMills)
    elseif BuildingsTanneries.Find(Building) >= 0
        BuildingsTanneries = RemoveFromBuildingArray(Building, BuildingsTanneries)
    elseif BuildingsSmelters.Find(Building) >= 0
        BuildingsSmelters = RemoveFromBuildingArray(Building, BuildingsSmelters)
    elseif BuildingsCookeries.Find(Building) >= 0
        BuildingsCookeries = RemoveFromBuildingArray(Building, BuildingsCookeries)
    elseif BuildingsBlacksmiths.Find(Building) >= 0
        BuildingsBlacksmiths = RemoveFromBuildingArray(Building, BuildingsBlacksmiths);/
    elseif BuildingsGuardPosts.Find(Building) >= 0
        BuildingsGuardPosts = RemoveFromBuildingArray(Building, BuildingsGuardPosts)/;
    endif
    
    debug.trace(Building.GetBaseObject().GetName() + " removed from array")
EndFunction

Function AddBaseProduction()

    AddResourceProduction(BuildingsFarms)
    AddResourceProduction(BuildingsHunting)
    AddResourceProduction(BuildingsFishing)
    AddResourceProduction(BuildingsLoggingCamps)
    AddResourceProduction(BuildingsMines)
    
EndFunction

Function AddRefining()
    AddResourceProduction(BuildingsLumberMills)
    AddResourceProduction(BuildingsTanneries)
    AddResourceProduction(BuildingsSmelters)
    AddResourceProduction(BuildingsCookeries)
EndFunction

Function AddCrafting()
    AddResourceProduction(BuildingsBlacksmiths)
EndFunction

Function AddResourceProduction(CS_BuildingManagementScript[] BuildingType)
    int i = 0
    while i < BuildingType.Length
        BuildingType[i].GoToState("Update")
        BuildingType[i].RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
EndFunction

Function WaitForResourceProduction(CS_BuildingManagementScript[] BuildingType)
    int i = 0
    while i < BuildingType.Length
        int loopnum = 0
        while BuildingType[i].GetState() != "Updated" && loopnum < 50
            utility.wait(0.1)
            string namestring = Name.NameString
            debug.trace(namestring + " Waiting for Resource Production")
            loopnum += 1
        endwhile
        i += 1
    endwhile
EndFunction

Function WaitForBaseProduction()

    WaitForResourceProduction(BuildingsFarms)
    WaitForResourceProduction(BuildingsHunting)
    WaitForResourceProduction(BuildingsFishing)
    WaitForResourceProduction(BuildingsLoggingCamps)
    WaitForResourceProduction(BuildingsMines)
    
EndFunction

Function WaitForRefining()

    WaitForResourceProduction(BuildingsLumberMills)
    WaitForResourceProduction(BuildingsTanneries)
    WaitForResourceProduction(BuildingsSmelters)
    WaitForResourceProduction(BuildingsCookeries)
    
EndFunction

Function WaitForCrafting()

    WaitForResourceProduction(BuildingsBlacksmiths)
    
EndFunction
