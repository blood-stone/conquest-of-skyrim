Scriptname CS_PlayerEnterpriseStopScript extends ReferenceAlias

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if !(GetOwningQuest() as CS_PlayerEnterprisesScript).City.GetLocation().IsChild(akNewLoc) && (GetOwningQuest() as CS_PlayerEnterprisesScript).City.GetLocation() != akNewLoc
        debug.trace("Player has left city, stopping enterprise quest")
        GetOwningQuest().Stop()
    else
        debug.trace("Player is still in City")
    endif
EndEvent
