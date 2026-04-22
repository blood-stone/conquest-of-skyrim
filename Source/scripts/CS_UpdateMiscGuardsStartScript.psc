Scriptname CS_UpdateMiscGuardsStartScript extends ReferenceAlias

Quest Property UpdateGuardsQuest Auto

FormList Property HoldingsMiscVanilla Auto
FormList Property HoldingsMisc Auto

Keyword Property PlayerDefended Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	int i = 0
	while i < HoldingsMiscVanilla.GetSize()
		if akNewLoc == HoldingsMiscVanilla.GetAt(i) as Location
			if (HoldingsMisc.GetAt(i) as Location).GetKeywordData(PlayerDefended) > 0
				UpdateGuardsQuest.Start()
			endif
		endif
		i += 1
	endwhile
EndEvent