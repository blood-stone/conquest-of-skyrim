Scriptname CS_AttackPlanningPlaceBanner extends ReferenceAlias  

Event OnCellAttach()
	(GetOwningQuest() as CS_AttackPlanningScript).PlaceCampBanner()
EndEvent