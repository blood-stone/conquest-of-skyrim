Scriptname CS_CustomOutfitAddItem extends ObjectReference

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	CustomOutfit.AddForm(akBaseItem)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	CustomOutfit.RemoveAddedForm(akBaseItem)
EndEvent

FormList Property CustomOutfit  Auto  
