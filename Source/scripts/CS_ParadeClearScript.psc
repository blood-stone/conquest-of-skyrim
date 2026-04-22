Scriptname CS_ParadeClearScript extends ReferenceAlias  

Event OnCellDetach()
	debug.trace("Event triggered")
	if GetOwningQuest().GetStage() == 40
		debug.trace("Starting Clear Parade Command")
		(GetOwningQuest() as CS_ParadeScript).ClearParade()
	endif
EndEvent