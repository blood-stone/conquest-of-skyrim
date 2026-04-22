Scriptname CS_BountyScript extends Quest  

ReferenceAlias Property Commander  Auto

LocationAlias Property Alias_Palace Auto

Quest Property TroopManage  Auto 

ObjectReference Property BountyTarget Auto
   
CS_TroopManageMenuScript Property TroopManageScript Auto
CS_PatrolHoldScript Property CommanderQuest Auto

int Property PlayerDecision Auto
; If PlayerDecision = 2, Commander sent, if = 3, Bounty Hunter sent

int Property TroopCountCertain Auto

Event OnUpdateGameTime()
    If PlayerDecision == 2 && Commander.GetActorRef().Is3DLoaded() != 1
        int armynum = CommanderQuest.GetCommanderArmyNum(Commander.GetActorRef())
        float chanceofvictory = (TroopManageScript.TroopCounts.GetAt(armynum) as GlobalVariable).GetValue()/(TroopCountCertain as float)
        float victoryroll = utility.randomfloat(0, 1)
        SimulateCasualties(chanceofvictory, victoryroll, armynum)
        if chanceofvictory > victoryroll
            SetStage(101)
        else
            ReturnCommander()
            Commander.Clear()
            UnRegisterForUpdateGameTime()
            SetObjectiveFailed(25)
            SetStage(20)
        endif
    ElseIf PlayerDecision == 3
        SetStage(102)
    EndIf
EndEvent

function PlayerChangedLocation()

    if getStage() < 10
        if Game.GetPlayer().IsInLocation(Alias_Palace.GetLocation()) == False
;           debug.trace(self + " player is no longer in location and hasn't picked up quest, so shutting down quest so it can happen elsewhere.")
            ;Hold.GetLocation().setKeywordData(BQActiveQuest, 0)
            stop()
        
        EndIf
    
    EndIf

EndFunction

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

Function MoveCommanderToBounty()
    if Commander.GetActorRef()
        Commander.GetActorRef().MoveTo(BountyTarget)
        CommanderQuest.MoveTroopsToCommander(Commander.GetActorRef())
    endif
EndFunction

Function ReturnCommander()
    if Commander.GetActorRef()
        CommanderQuest.ReturnToJob(Commander.GetActorRef())
    endif
EndFunction

int Function GetTimeToFinish()
    int distance = CommanderQuest.GetCommanderDistance(Commander.GetActorRef(), BountyTarget)
    CS_ArmyTroopDeath ArmyScript = CommanderQuest.ArmyScripts[CommanderQuest.GetCommanderArmyNum(Commander.GetActorRef())]

    if ArmyScript.MovingArrivalTimePotential > 0
        return ArmyScript.MovingArrivalTimePotential
    elseif distance > 0
        return distance
    else
        return 2
    endif
EndFunction