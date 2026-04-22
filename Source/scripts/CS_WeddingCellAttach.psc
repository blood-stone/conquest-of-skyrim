Scriptname CS_WeddingCellAttach extends ReferenceAlias  

Event OnCellAttach()
	GetOwningQuest().SetObjectiveCompleted(20)
	(GetOwningQuest() as CS_MarriageWeddingScript).WeddingScene.ForceStart()
EndEvent