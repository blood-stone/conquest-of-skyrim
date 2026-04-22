Scriptname CS_AttackCampCellAttach extends ReferenceAlias  

Event OnCellAttach()
	(GetOwningQuest() as CS_AttackFortCampScript).PreBattle()
	GetOwningQuest().SetStage(10)
EndEvent

Event OnCellDetach()
	if GetOwningQuest().GetStage() == 20
		(GetOwningQuest() as CS_AttackFortCampScript).DisableEnemyCamp()
		GetRef().disable()
		GetOwningQuest().Stop()
	endif
EndEvent