Scriptname CS_FortCommanderAliasScript extends ReferenceAlias  

Event OnCellDetach()
	(GetOwningQuest() as CS_FortCommandersScript).MoveCommanderToPosition(self)
EndEvent

Event OnCellAttach()
	(GetOwningQuest() as CS_FortCommandersScript).MovePersonnelToPosition(self)
EndEvent