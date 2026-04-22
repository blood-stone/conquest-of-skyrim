Scriptname CS_AttackCampCommanderDisable extends ReferenceAlias  

Event OnCellAttach()
	if GetRef().IsEnabled() == true
		GetRef().MoveTo(UnusedNPCMarker)
	endif
EndEvent
ObjectReference Property UnusedNPCMarker  Auto  
