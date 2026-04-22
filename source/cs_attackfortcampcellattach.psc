Scriptname CS_AttackFortCampCellAttach extends ReferenceAlias  

Event OnCellAttach()
	if GetOwningQuest().GetStage() < 5
		GetOwningQuest().SetStage(5)
	endif
EndEvent