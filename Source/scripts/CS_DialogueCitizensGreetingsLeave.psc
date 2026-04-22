Scriptname CS_DialogueCitizensGreetingsLeave extends ReferenceAlias

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if !City.GetLocation().IsChild(akNewLoc) && akNewLoc != City.GetLocation()
        GetOwningQuest().Stop()
    endif
EndEvent

LocationAlias Property City Auto