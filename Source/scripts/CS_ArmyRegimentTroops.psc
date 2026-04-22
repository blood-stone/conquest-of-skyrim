Scriptname CS_ArmyRegimentTroops extends ObjectReference  

import CS_CommonFunctions

int[] Property TroopCounts Auto hidden

ActorBase[] Property TroopBases Auto hidden
ActorBase[] Property AliveTroopBases Auto hidden
Actor[] Property Troops Auto hidden
ReferenceAlias[] Property TroopAliases Auto hidden
CS_ArmyTroopSpawnerScript[] Property TroopSpawners Auto hidden

CS_TroopTemplateScript Property CS_StarterTroopTemplate Auto

Activator Property CS_ArmyTroopSpawner Auto

int Property TotalTroopCount Auto hidden
int Property AliveTroopCount Auto hidden

bool Property Activated Auto hidden

Function SetUp()
    TroopCounts = new int[10]
    TroopBases = new ActorBase[10]
    UseTroopTemplate(CS_StarterTroopTemplate)
    ;CreateSpawners()
    AliveTroopBases = new ActorBase[10]
    Troops = new Actor[10]
    Activated = false
EndFunction
;/
Function CreateSpawners()
    debug.trace("Setting up spawners")
    TroopSpawners = new CS_ArmyTroopSpawnerScript[10]
    ObjectReference HomeStation = ((self as ObjectReference) as CS_ArmyRegimentOrders).HomeStation
    CS_CityManagementPopulation HomeStationPopulation = HomeStation as CS_CityManagementPopulation
    
    int i = 0
    while i < 10
        TroopSpawners[i] = PlaceAtMe(CS_ArmyTroopSpawner) as CS_ArmyTroopSpawnerScript
        TroopSpawners[i].SetTroop(i, self as ObjectReference)
        i += 1
    endwhile
    debug.trace("Spawners set up")
EndFunction/;

Function UseTroopTemplate(CS_TroopTemplateScript TroopTemplate)
    ObjectReference FactionOwnerActivator = ((self as ObjectReference) as CS_ArmyRegimentOrders).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    FormList TroopTypes = MilitaryScript.TroopTypes
    TotalTroopCount = 0
    
    int TroopBaseNum
    int i = 0
    while i < TroopTemplate.TroopCounts.Length
        ActorBase TroopBase = TroopTypes.GetAt(i) as ActorBase
        TroopCounts[i] = TroopTemplate.TroopCounts[i]
        int index = 0
        while index < TroopCounts[i]
            TroopBases[TroopBaseNum] = TroopBase
            TroopBaseNum += 1
            TotalTroopCount += 1
            index += 1
        endwhile
        i += 1
    endwhile
EndFunction

Function UpdateTroop(int TroopNum, ObjectReference OptionalSpawnPoint = None)
    if OptionalSpawnPoint
        TroopSpawners[TroopNum].SpawnPoint = OptionalSpawnPoint
    endif
    
    TroopSpawners[TroopNum].RegisterForSingleUpdate(0.1)
EndFunction

Function AddTroop(int TroopTypeNum)
    ObjectReference FactionOwnerActivator = ((self as ObjectReference) as CS_ArmyRegimentOrders).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    ObjectReference HomeStation = ((self as ObjectReference) as CS_ArmyRegimentOrders).HomeStation
    CS_CityManagementPopulation PopulationScript = HomeStation as CS_CityManagementPopulation
    ActorBase TroopBase = MilitaryScript.TroopTypes.GetAt(TroopTypeNum) as ActorBase
    
    TroopCounts[TroopTypeNum] = TroopCounts[TroopTypeNum] + 1
    int troopnum = TroopBases.Find(None)
    TroopBases[troopnum] = TroopBase
    TotalTroopCount += 1
    ;/
    CS_ArmyMissionScript CurrentMission = ((self as ObjectReference) as CS_ArmyRegimentOrders).CurrentMission

    if CurrentMission
        CurrentMission.AssignNewTroop(troopnum)
    endif/;
        
    ;RecruitTroop(TroopNum)
EndFunction

Function RemoveTroop(int TroopTypeNum)
    ObjectReference FactionOwnerActivator = ((self as ObjectReference) as CS_ArmyRegimentOrders).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    
    ActorBase TroopBase = MilitaryScript.TroopTypes.GetAt(TroopTypeNum) as ActorBase
    
    TroopCounts[TroopTypeNum] = TroopCounts[TroopTypeNum] - 1
    int troopnum = TroopBases.Find(TroopBase)
    TroopBases[troopnum] = None
    TotalTroopCount -= 1
    
    if AliveTroopBases[troopnum]
        RetireTroop(troopnum)
    endif
EndFunction

int Function RespawnTroops(int availablecommoners)
    int remainingcommoners = availablecommoners

    int i = 0
    while i < TroopBases.Length && remainingcommoners > 0
        if TroopBases[i] && !AliveTroopBases[i]
            RecruitTroop(i)
            remainingcommoners -= 1
        endif
        i += 1
    endwhile
    
    return remainingcommoners
EndFunction

int Function DesertTroops(int desertingtroops)
    CS_ArmyMissionScript CurrentMission = ((self as ObjectReference) as CS_ArmyRegimentOrders).CurrentMission
    int troopstodesert = 0

    int i = 0
    while i < TroopBases.Length && desertingtroops > 0
        if CurrentMission
            if CurrentMission.Troops[i].GetActorRef() && TroopBases[i] && AliveTroopBases[i]
                DesertTroop(i)
                desertingtroops -= 1
                troopstodesert += 1
            endif
        else
            if TroopBases[i] && AliveTroopBases[i]
                DesertTroop(i)
                desertingtroops -= 1
                troopstodesert += 1
            endif
        endif
        i += 1
    endwhile
    
    return troopstodesert
EndFunction

Function RecruitTroop(int troopnum)
    ObjectReference HomeStation = ((self as ObjectReference) as CS_ArmyRegimentOrders).HomeStation
    CS_CityManagementOwnership OwnershipScript = HomeStation as CS_CityManagementOwnership
    
    AliveTroopBases[troopnum] = TroopBases[troopnum]
    AliveTroopCount += 1;/
    CS_ArmyMissionScript CurrentMission = ((self as ObjectReference) as CS_ArmyRegimentOrders).CurrentMission
    if CurrentMission
        CurrentMission.SpawnNewTroop(troopnum)
    else
        
    endif/;
    TroopSpawners[troopnum].SpawnPoint = OwnershipScript.HQExteriorMarker
    
    TroopSpawners[troopnum].GoToState("Alive")
    TroopSpawners[troopnum].RegisterForSingleUpdate(0.1)
EndFunction
    
Function KillTroop(int troopnum)
    ObjectReference HomeStation = ((self as ObjectReference) as CS_ArmyRegimentOrders).HomeStation
    CS_CityManagementPopulation PopulationScript = HomeStation as CS_CityManagementPopulation
    
    AliveTroopBases[troopnum] = None
    AliveTroopCount -= 1
    
    PopulationScript.PopulationCommoners -= 1
    PopulationScript.TotalPopulation -= 1
EndFunction

Function DesertTroop(int troopnum)
    ObjectReference HomeStation = ((self as ObjectReference) as CS_ArmyRegimentOrders).HomeStation
    CS_CityManagementPopulation PopulationScript = HomeStation as CS_CityManagementPopulation
    
    AliveTroopBases[troopnum] = None
    AliveTroopCount -= 1;/
    CS_ArmyMissionScript CurrentMission = ((self as ObjectReference) as CS_ArmyRegimentOrders).CurrentMission
    if CurrentMission
        CurrentMission.DeleteTroop(troopnum)
    endif/;
    
    PopulationScript.PopulationCommoners -= 1
    PopulationScript.TotalPopulation -= 1
EndFunction

Function RetireTroop(int troopnum)
    ObjectReference HomeStation = ((self as ObjectReference) as CS_ArmyRegimentOrders).HomeStation
    CS_CityManagementPopulation PopulationScript = HomeStation as CS_CityManagementPopulation
    
    AliveTroopBases[troopnum] = None
    AliveTroopCount -= 1;/
    CS_ArmyMissionScript CurrentMission = ((self as ObjectReference) as CS_ArmyRegimentOrders).CurrentMission
    if CurrentMission
        CurrentMission.DeleteTroop(troopnum)
    endif/;
EndFunction

Function ActivateUnit()
    ObjectReference HomeStation = ((self as ObjectReference) as CS_ArmyRegimentOrders).HomeStation
    CS_CityManagementPopulation PopulationScript = HomeStation as CS_CityManagementPopulation
    Activated = true
    
    int i = 0
    while i < TroopSpawners.Length
        TroopSpawners[i].SpawnPoint = (PopulationScript.Settlers[i])
        TroopSpawners[i].GoToState("InitiateActivation")
        TroopSpawners[i].RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
EndFunction

Function DeactivateUnit()
    ObjectReference HomeStation = ((self as ObjectReference) as CS_ArmyRegimentOrders).HomeStation
    CS_CityManagementPopulation PopulationScript = HomeStation as CS_CityManagementPopulation
    
    Activated = false
    PopulationScript.UnitActivated = false
    
    int i = 0
    while i < Troops.Length
        if Troops[i]
            ((Troops[i] as ObjectReference) as CS_FactionWarTroopScript).GoToState("Settler")
            ((Troops[i] as ObjectReference) as CS_FactionWarTroopScript).RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
    
EndFunction

State NotSetUp
    
    Event OnUpdate()
        
        GoToState("SettingUp")
        SetUp()
        GoToState("SetUp")
        
    EndEvent
    
EndState