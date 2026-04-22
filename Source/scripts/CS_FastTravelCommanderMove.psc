Scriptname CS_FastTravelCommanderMove extends ReferenceAlias

Event OnPlayerFastTravelEnd(float afTravelGameTimeHours)
	(GetOwningQuest() as CS_AttackPlanningScript).MoveToCommanderMarker()
	;(GetOwningQuest() as CS_AttackPlanningScript).UpgradeAttackers()
EndEvent  
