Scriptname CS_CoronationPlayerSitOnThrone extends ReferenceAlias  

Event OnSit(ObjectReference Chair)
	if Chair == (GetOwningQuest() as CS_CoronationScript).Throne.GetReference()
		if GetOwningQuest().GetStage() == 25
			GetOwningQuest().SetStage(30)
		endif
	endif
EndEvent