Scriptname CS_AttackCityEnterPalace extends ReferenceAlias

LocationAlias Property Palace Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if akNewLoc == Palace.GetLocation()
		GetOwningQuest().SetStage(11)
	endif
endEvent
