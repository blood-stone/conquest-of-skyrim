Scriptname CS_ExecutionCellStart extends ReferenceAlias  

Event OnCellAttach()
	GetOwningQuest().SetStage(10)
EndEvent

Event OnCellDetach()
	GetOwningQuest().Stop()
EndEvent