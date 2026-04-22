Scriptname CS_ResearchFetchScript extends Quest  

ReferenceAlias Property Commander  Auto

Quest Property TroopManage  Auto 

ReferenceAlias Property QuestItem Auto
ReferenceAlias Property QuestContainer Auto
   
CS_TroopManageMenuScript Property TroopManageScript Auto
CS_PatrolHoldScript Property CommanderQuest Auto
CS_ResearchMenuScript Property ResearchMenu Auto

int Property PlayerDecision Auto
; If PlayerDecision = 2, Commander sent

int Property TroopCountCertain Auto

Event OnUpdateGameTime()
	If PlayerDecision == 2; && Commander.GetActorRef().Is3DLoaded() != 1
		int armynum = CommanderQuest.GetCommanderArmyNum(Commander.GetActorRef())
		float chanceofvictory = (TroopManageScript.TroopCounts.GetAt(armynum) as GlobalVariable).GetValue()/(TroopCountCertain as float)
		float victoryroll = utility.randomfloat(0, 1)
		SimulateCasualties(chanceofvictory, victoryroll, armynum)
		MoveCommanderToContainer()
		ReturnCommander()
		Commander.Clear()
		if chanceofvictory > victoryroll
			SetStage(101)
		else
			UnRegisterForUpdateGameTime()
			SetObjectiveFailed(90)
			SetStage(0)
		endif
	EndIf
EndEvent

Function SimulateCasualties(float chanceofvictory, float victoryroll, int armynum)
	int deadtroops = 0
	if chanceofvictory > victoryroll && chanceofvictory < 1
		deadtroops = math.floor((1 - (chanceofvictory - victoryroll))*(TroopManageScript.TroopCounts.GetAt(armynum) as GlobalVariable).GetValue())
	elseif chanceofvictory <= victoryroll && chanceofvictory < 1
		deadtroops = (TroopManageScript.TroopCounts.GetAt(armynum) as GlobalVariable).GetValue() as int
	endif
	debug.notification(deadtroops + " Troops were lost")
	TroopManageScript.KillTroops(armynum, deadtroops)
EndFunction

Function MoveCommanderToContainer()
	if Commander.GetActorRef()
		Commander.GetActorRef().MoveTo(QuestContainer.GetRef())
		CommanderQuest.MoveTroopsToCommander(Commander.GetActorRef())
	endif
EndFunction

Function ReturnCommander()
	if Commander.GetActorRef()
		CommanderQuest.ReturnToJob(Commander.GetActorRef())
	endif
EndFunction

int Function GetTimeToFinish()
	int distance = CommanderQuest.GetCommanderDistance(Commander.GetActorRef(), QuestContainer.GetRef())
	CS_ArmyTroopDeath ArmyScript = CommanderQuest.ArmyScripts[CommanderQuest.GetCommanderArmyNum(Commander.GetActorRef())]

	if ArmyScript.MovingArrivalTimePotential > 0
		return ArmyScript.MovingArrivalTimePotential
	elseif distance > 0
		return distance
	else
		return 2
	endif
EndFunction

Function StartUpgrade()
	Game.GetPlayer().RemoveItem(QuestItem.GetRef())
	ResearchMenu.RegisterForResearch(QuestItem.GetRef())
EndFunction