Scriptname CS_DefendFortSpawnOnAttafch extends ReferenceAlias  

Event OnCellAttach()
	(GetOwningQuest() as CS_DefendFortScript).AssignDefenders()
EndEvent