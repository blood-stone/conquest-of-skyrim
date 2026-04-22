Scriptname CS_CommanderMovingAliasScript extends ReferenceAlias  

Event OnLoad()
	int armynum = (GetOwningQuest() as CS_CommanderMovingScript).CommanderScript.GetCommanderArmyNum(GetActorRef())
	if (((GetOwningQuest() as CS_CommanderMovingScript).CommanderScript.ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).MovingType == "Follow"
		(GetOwningQuest() as CS_CommanderMovingScript).CommanderArrival(GetActorRef())
	endif
EndEvent