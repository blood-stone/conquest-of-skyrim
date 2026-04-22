Scriptname CS_AttackFortDoorScript extends ObjectReference  

Quest Property AttackFortQuest Auto
Quest Property DefendFortQuestImp Auto
Quest Property DefendFortQuestSon Auto

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)

	if AttackFortQuest.IsRunning()

		if (AttackFortQuest as CS_AttackFortCampScript).FortGate.GetRef() == self

			(AttackFortQuest as CS_AttackFortCampScript).DamageFortDoor(aiCurrentStage)

		endif

	elseif DefendFortQuestImp.IsRunning()

		if (DefendFortQuestImp as CS_DefendFortScript).FortGate.GetRef() == self

			(DefendFortQuestImp as CS_DefendFortScript).DamageFortDoor(aiCurrentStage)

		endif

	elseif DefendFortQuestSon.IsRunning()

		if (DefendFortQuestSon as CS_DefendFortScript).FortGate.GetRef() == self

			(DefendFortQuestSon as CS_DefendFortScript).DamageFortDoor(aiCurrentStage)

		endif		

	endif

EndEvent