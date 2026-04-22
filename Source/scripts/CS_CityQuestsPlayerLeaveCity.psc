Scriptname CS_CityQuestsPlayerLeaveCity extends ReferenceAlias

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if GetOwningQuest().GetStage() == 0 && !(GetOwningQuest() as CS_CityQuestScript).City.GetLocation().IsChild(akNewLoc) && (GetOwningQuest() as CS_CityQuestScript).City.GetLocation() != akNewLoc
        debug.trace("Player has left city, stopping city quest")
        GetOwningQuest().Stop()
    else
        debug.trace("Player is still in City or Quest started")
    endif
EndEvent
