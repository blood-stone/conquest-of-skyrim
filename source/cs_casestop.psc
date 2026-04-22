Scriptname CS_CaseStop extends ReferenceAlias

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    (GetOwningQuest() as CS_BountyScript).PlayerChangedLocation()

EndEvent