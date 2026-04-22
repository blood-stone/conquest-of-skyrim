Scriptname CS_PrisonEntranceScript extends ObjectReference  

int Property citynum Auto

CS_PrisonScript Property PrisonScript Auto

Event OnCellAttach()
	PrisonScript.MoveToPrisonMarkers(citynum)
EndEvent