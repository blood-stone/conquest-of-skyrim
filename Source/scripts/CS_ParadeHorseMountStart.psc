Scriptname CS_ParadeHorseMountStart extends ReferenceAlias  

Event OnActivate(ObjectReference akActionRef)
	if GetOwningQuest().GetStage() == 20
		if akActionRef == Game.GetPlayer()
			GetOwningQuest().SetStage(30)
		endif
	endif
EndEvent