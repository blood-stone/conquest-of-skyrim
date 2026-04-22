Scriptname CS_AttackCityDoorScript extends ObjectReference  

Int Property OldStage = 3 Auto
{The destruction stage that is before the stage you want to trigger at
- Default = 3}

Int Property NewStage = 4 Auto
{The destruction stage that you want the trigger to happen at
- Default = 4}

Quest Property AttackCityQuest Auto

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)

	(AttackCityQuest as CS_AttackCityScript).DamageCityDoor(aiCurrentStage)

EndEvent