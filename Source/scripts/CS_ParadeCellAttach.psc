Scriptname CS_ParadeCellAttach extends ReferenceAlias  

Event OnCellAttach()
	If GetOwningQuest().GetStage() == 10
		GetOwningQuest().SetStage(20)
	EndIf
EndEvent