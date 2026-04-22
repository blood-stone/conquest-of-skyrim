Scriptname CS_AttackCityBarricadeScript extends ReferenceAlias  

Int Property OldStage = 3 Auto
{The destruction stage that is before the stage you want to trigger at
- Default = 3}

Int Property NewStage = 4 Auto
{The destruction stage that you want the trigger to happen at
- Default = 4}

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	if (aiCurrentStage == NewStage)
	
		(GetOwningQuest() as CS_AttackCityScript).EvaluateAttackerPackages()

	endif
EndEvent