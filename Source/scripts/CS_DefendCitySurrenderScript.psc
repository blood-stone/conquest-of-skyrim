Scriptname CS_DefendCitySurrenderScript extends ReferenceAlias  

Event OnCellDetach()
	GetOwningQuest().Stop()
EndEvent