Scriptname CS_TroopManageUpdater1 extends Quest  


bool Property Updated Auto

int Property armynum Auto

Actor Property Commander Auto

ReferenceAlias Property ArmyTask Auto
ReferenceAlias Property CommanderAlias Auto

ObjectReference Property Target Auto
GlobalVariable Property ETA Auto

Function FindArmyTask()
    If Commander != None
        if CS_Commander.ArmyScripts[armynum - 1].CurrentTask != None
            ArmyTask.ForceRefTo(CS_Commander.ArmyScripts[armynum - 1].CurrentTask)
        else
            ArmyTask.ForceRefTo(TaskBarrelNoOrder)
        endif
    Else
        debug.trace("Commander " + armynum + " Not Found")
        if (UpdaterProperties.RecruitableCommanders.GetAt(armynum - 1) as GlobalVariable).GetValue() == 1
            CommanderAlias.ForceRefTo(UpdaterProperties.NoCommander)
        else
            CommanderAlias.ForceRefTo(UpdaterProperties.UnavailableCommander)
        endif
        ArmyTask.ForceRefTo(TaskBarrelNoOrder)
    EndIf
    ETA.SetValue(GetDistanceToTarget())
    UpdateCurrentInstanceGlobal(ETA)
EndFunction

float Function GetDistanceToTarget()
    ObjectReference StartPoint
    CS_ArmyTroopDeath ArmyScript = ((CS_ArmyQuests.GetAt(armynum - 1) as Quest) as CS_ArmyTroopDeath)
    if Target != ArmyScript.MovingArrivalRef

        if Commander.GetWorldSpace() != UpdaterProperties.Tamriel
            int i = 0
            bool foundhold = false
            while i < CS_Commander.AllHolds.GetSize() && foundhold == false
                if Commander.IsInLocation(CS_Commander.AllHolds.GetAt(i) as Location)
                    StartPoint = CS_Commander.HoldCenterMarkers.GetAt(i) as ObjectReference
                    foundhold = true
                endif
                i += 1
            endwhile
        else
            StartPoint = Commander as ObjectReference
        endif

        if Target.GetWorldSpace() != UpdaterProperties.Tamriel
            int i = 0
            bool foundhold = false
            while i < CS_Commander.AllHolds.GetSize() && foundhold == false
                if Target.IsInLocation(CS_Commander.AllHolds.GetAt(i) as Location)
                    Target = CS_Commander.HoldCenterMarkers.GetAt(i) as ObjectReference
                    foundhold = true
                endif
                i += 1
            endwhile
        endif

        float time = StartPoint.GetDistance(Target)/20000 as float
        if time < 0.5
            ArmyScript.MovingArrivalTimePotential = 0
            return 0
        else
            ArmyScript.MovingArrivalTimePotential = math.ceiling(time)
            return math.ceiling(time) as int
        endif
    else
        return ArmyScript.MovingArrivalTimeRemaining
    endif
EndFunction

Event OnUpdate()
    debug.trace("Army " + armynum + " Update Received")
    FindArmyTask()
    (UpdaterProperties.TroopCounts.GetAt(armynum - 1) as GlobalVariable).SetValue(((CS_ArmyQuests.GetAt(armynum - 1) as Quest) as CS_ArmyTroopDeath).TroopCount)
    UpdateCurrentInstanceGlobal(UpdaterProperties.TroopCounts.GetAt(armynum - 1) as GlobalVariable)
    Updated = true
    debug.trace("Army " + armynum + " Updated")
EndEvent

CS_TroopManageMenuScript Property TroopManage Auto
CS_PatrolHoldScript Property CS_Commander Auto
CS_TroopManageUpdaterProperties Property UpdaterProperties Auto

Faction Property CS_ArmyTaskFaction Auto
Faction Property CS_PlayerArmyFollowerFaction Auto
Faction Property CS_ArmyHunterFaction Auto
Faction Property CS_ArmyPatrolFaction Auto
Faction Property CS_ArmyAttackFaction Auto
Faction Property CS_ArmyMovingFaction Auto
Faction Property CS_ArmyDefendFortFaction Auto
Faction Property CS_AttackingCityFaction Auto
Faction Property CS_AttackingFortFaction Auto
Faction Property CS_AttackingCampFaction Auto

FormList Property CS_AllLocations Auto
FormList Property CS_ArmyTaskBarrelsAttack Auto
FormList Property CS_ArmyTaskBarrelsDefense Auto
FormList Property CS_ArmyQuests Auto

LocationAlias Property AttackedCity Auto

ObjectReference Property TaskBarrelFollow  Auto  
ObjectReference Property TaskBarrelHunt  Auto  
ObjectReference Property TaskBarrelNoOrder  Auto  
ObjectReference Property TaskBarrelMission  Auto  