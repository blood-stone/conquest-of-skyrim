Scriptname CS_CityEventManagerPlayerChangeLoc extends ReferenceAlias  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	if (GetOwningQuest() as CS_CityEventManagerScript).AllVanillaLocations.HasForm(akOldLoc)
		debug.trace("Moving out of city... stopping quests")
		debug.trace("num = " + (GetOwningQuest() as CS_CityEventManagerScript).AllVanillaLocations.Find(akOldLoc))
		(GetOwningQuest() as CS_CityEventManagerScript).StopQuests()
	endif

	if (GetOwningQuest() as CS_CityEventManagerScript).AllVanillaLocations.HasForm(akNewLoc)
		debug.trace("Moving into city... starting quests")
		debug.trace("num = " + (GetOwningQuest() as CS_CityEventManagerScript).AllVanillaLocations.Find(akNewLoc))
		(GetOwningQuest() as CS_CityEventManagerScript).StartQuests()
	endif

EndEvent