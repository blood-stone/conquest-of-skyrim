Scriptname CS_AttackCityJarlBleedoutTrigger extends ReferenceAlias  

Event OnEnterBleedout()
	if GetOwningQuest().GetStage() < 25
		if GetActorRef().GetActorBase() == (GetOwningQuest() as CS_AttackCityScript).GeneralTullius || GetActorRef().GetActorBase() == (GetOwningQuest() as CS_AttackCityScript).Ulfric
			(GetOwningQuest() as CS_AttackCityScript).LeaderSurrender(GetActorRef())
		endif
		GetOwningQuest().SetStage(25)
	endif
EndEvent

Event OnCellAttach()
	if (GetOwningQuest() as CS_AttackCityScript).citynum < 5
		(GetOwningQuest() as CS_AttackCityScript).MoveInteriorTroopsToPlayer()
	endif
EndEvent

Event OnCellDetach()
	Game.EnablePlayerControls()
EndEvent