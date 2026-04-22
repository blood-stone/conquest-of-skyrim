Scriptname CS_CustomOutfitArmyAddItem extends ObjectReference  

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	(ArmyCustomOutfits.GetAt(armynum) as FormList).AddForm(akBaseItem)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	(ArmyCustomOutfits.GetAt(armynum) as FormList).RemoveAddedForm(akBaseItem)
EndEvent

FormList Property ArmyCustomOutfits  Auto  
int Property armynum Auto