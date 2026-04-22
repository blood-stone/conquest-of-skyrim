Scriptname CS_CityManagementPlayerLeaveCity extends ReferenceAlias

CS_CityManagementScript Property CS_CityManagement Auto
;/
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if CS_CityManagement.CityAlias.GetLocation().IsChild(akNewLoc) || CS_CityManagement.CityAlias.GetLocation() == akNewLoc || CheckIfNewCity(akNewLoc)
        debug.trace("Player is still in City")
    else
        debug.trace("Player has left city, stopping city management")
        GetOwningQuest().UnregisterForUpdateGameTime()
        GetOwningQuest().Stop()
    endif
EndEvent

bool Function CheckIfNewCity(Location NewLoc)
    FormList AllLocations = CS_CityManagement.CS_AllLocations
    int i = 0
    while i < AllLocations.GetSize()
        if (AllLocations.GetAt(i) as Location).IsChild(NewLoc) || (AllLocations.GetAt(i) as Location) == NewLoc
            CS_CityManagement.DeleteGuards()
            CS_CityManagement.CityAlias.ForceLocationTo(AllLocations.GetAt(i) as Location)
            CS_CityManagement.SetUp()
            return true
        endif
        i += 1
    endwhile
    
    return false
EndFunction/;