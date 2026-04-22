Scriptname CS_ProtestCellAttach extends ReferenceAlias  

Event OnCellAttach()
	if GetOwningQuest().GetStage() == 10
		(GetOwningQuest() as CS_ProtestScript).MoveCitizensToMarkers()
		(GetOwningQuest() as CS_ProtestScript).SpawnGuard()
	endif
EndEvent
