Scriptname CS_CellDetachStop   extends ReferenceAlias

Event OnCellDetach()
	if !Game.GetPlayer().IsInLocation((GetOwningQuest() as CS_RaidVillageScript).Village.GetLocation())
		GetOwningQuest().Stop()
	endif
EndEvent
