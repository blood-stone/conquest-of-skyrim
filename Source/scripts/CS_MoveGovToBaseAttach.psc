Scriptname CS_MoveGovToBaseAttach extends ReferenceAlias  

Event OnCellAttach()
	(GetOwningQuest() as CS_GovScriptFunctions).MoveGovToBase()
EndEvent