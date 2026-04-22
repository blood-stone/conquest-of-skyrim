Scriptname CS_RefreshWhiterunPrison1 extends ReferenceAlias  

Event OnCellLoad()
	if Self.GetReference().GetParentCell() == Prison
		Self.GetReference().MoveTo(Marker)
	endif
endEvent

ObjectReference Property Marker  Auto  

Cell Property Prison  Auto  
