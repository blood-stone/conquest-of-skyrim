Scriptname CS_WarPatrolAmbushDetach extends ReferenceAlias  

Event OnCellDetach()
	(GetOwningQuest() as CS_WarPatrolAmbushScript).DetachArmy()
EndEvent