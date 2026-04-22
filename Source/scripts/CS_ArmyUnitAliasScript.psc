Scriptname CS_ArmyUnitAliasScript extends Quest conditional

ObjectReference Property HomeStation Auto hidden

Location Property UnitName Auto hidden

CS_FactionManagementMilitary Property CS_FactionPlayer Auto

; Orders ----------------------------------------------

CS_UnitTaskScript Property CurrentTask Auto hidden ; What the unit is currently working on
CS_UnitTaskScript OriginalTask ; Used when asked to follow player or clear dungeon so that the unit can go back to its original task

ReferenceAlias Property RallyPoint Auto
ObjectReference OriginalRallyPoint; Used when asked to follow player or clear dungeon so that the unit can go back to its original task

int Property OrdersNum Auto hidden conditional; 0 = stay at home station, 1 = Follow CC, 2 = Follow Player, 3 = In Operation
int OriginalOrders ; Used when asked to follow player or clear dungeon so that the unit can go back to its original task

FormList Property CS_UnitTasks Auto

CS_TroopFormUpScript Property CS_UnitOrders02TroopFormUp Auto

; Troops ----------------------------------------------

ReferenceAlias Property Commander Auto
CS_ArmyUnitTroopScript[] Property TroopAliases Auto
int[] Property TroopCounts Auto hidden
CS_TroopTemplateScript Property CS_StarterTroopTemplate Auto

ActorBase[] Property TroopBases Auto hidden

int Property AliveTroopCount Auto hidden
int Property TotalTroopCount Auto hidden

int Property CommanderRecruitable Auto hidden conditional

bool Property Activated Auto hidden

; Equipment -------------------------------------------
ObjectReference Property UnitEquipmentStorage Auto hidden

Armor[] Property CustomEquipment Auto hidden

Form[] Property CustomItems Auto hidden
int[] Property CustomItemsAmount Auto hidden

int Property EquipmentTier Auto hidden

float Property TroopEquipmentModifier=1.0 Auto hidden

Container Property CS_ArmyUnitStorageEquipment Auto

FormList Property CS_CraftingResourcesOutputsEquipmentTroop Auto

; Troop Functions --------------------------------------

Function SetUp(ObjectReference NewHomeStation)
    Start()
    HomeStation = NewHomeStation
    GoToState("StartSetUp")
    RegisterForSingleUpdate(0.1)
EndFunction

Function SetVariables()
    UnitEquipmentStorage = HomeStation.PlaceAtMe(CS_ArmyUnitStorageEquipment)
    UnitName = (HomeStation as CS_CityManagementOwnership).VanillaCity
    ObjectReference HomeStationExteriorMarker = (HomeStation as CS_CityManagementOwnership).HQExteriorMarker
    RallyPoint.ForceRefTo(HomeStationExteriorMarker)
    (HomeStation as CS_CityManagementMilitary).SetUnit(self)
    
    TroopBases = new ActorBase[20]
    TroopCounts = new int[20]
    CommanderRecruitable = 1
    
    int i = 0
    while i < TroopAliases.Length
        TroopAliases[i].TroopNum = i
        i += 1
    endwhile
    
    ;UseTroopTemplate(CS_StarterTroopTemplate)
EndFunction

Function HireCommander(Actor NewCommander)
    ;/
    if CurrentMission && CurrentMission.Commander
        CurrentMission.Commander.ForceRefTo(NewCommander)
    endif/;
    Commander.ForceRefTo(NewCommander)
    NewCommander.EvaluatePackage()
    CommanderRecruitable = 0
EndFunction

Function FireCommander()
    Actor OldCommander = Commander.GetActorRef()
    Commander.Clear();/
    if CurrentMission
        CurrentMission.Commander.Clear()
    endif/;
    
    OldCommander.EvaluatePackage()
    CommanderRecruitable = 1
EndFunction

Function ActivateUnit()
    Activated = true
    int i = 0
    while i < TroopAliases.Length
        if TroopAliases[i].GetState() == "Disabled"
            TroopAliases[i].GoToState("Enabled")
            TroopAliases[i].RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
EndFunction
        
Function DeactivateUnit()
    Activated = false
    int i = 0
    while i < TroopAliases.Length
        if TroopAliases[i].GetState() == "Enabled"
            TroopAliases[i].GoToState("Disabled")
            TroopAliases[i].RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
EndFunction

Function UseTroopTemplate(CS_TroopTemplateScript TroopTemplate)
    FormList TroopTypes = CS_FactionPlayer.TroopTypes
    
    TotalTroopCount = 0
    int TroopBaseNum
    int i = 0
    while i < TroopTemplate.TroopCounts.Length
        ActorBase TroopBase = TroopTypes.GetAt(i) as ActorBase
        TroopCounts[i] = TroopTemplate.TroopCounts[i]
        int index = 0
        while index < TroopCounts[i]
            TroopBases[TroopBaseNum] = TroopBase
            TroopAliases[TroopBaseNum].SetUp(TroopBase)
            TroopBaseNum += 1
            TotalTroopCount += 1
            index += 1
        endwhile
        i += 1
    endwhile
EndFunction

Function RecruitTroop(int TroopTypeNum)
    ActorBase TroopBase = CS_FactionPlayer.TroopTypes.GetAt(TroopTypeNum) as ActorBase
    
    TotalTroopCount += 1
    TroopCounts[TroopTypeNum] = TroopCounts[TroopTypeNum] + 1
    int troopnum = TroopBases.Find(None)
    TroopBases[troopnum] = TroopBase
    TroopAliases[troopnum].SetUp(TroopBase)
EndFunction

Function RemoveTroop(int TroopTypeNum)
    ActorBase TroopBase = CS_FactionPlayer.TroopTypes.GetAt(TroopTypeNum) as ActorBase
    
    TotalTroopCount -= 1
    TroopCounts[TroopTypeNum] = TroopCounts[TroopTypeNum] - 1
    int troopnum = TroopBases.Find(TroopBase)
    TroopBases[troopnum] = None
    TroopAliases[troopnum].RemoveTroop()
EndFunction

Function RespawnTroops()
    int i = 0
    while i < TroopAliases.Length
        if TroopAliases[i].Dead
            TroopAliases[i].GoToState("Respawn")
        endif
        TroopAliases[i].RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
EndFunction

Function AddToAliveTroopCount()
    AliveTroopCount += 1
EndFunction

Function RemoveFromAliveTroopCount()
    AliveTroopCount -= 1
EndFunction

Function UpdateTroops()
    int i = 0
    while i < TroopAliases.Length
        if TroopAliases[i].GetState() == "Enabled"
            TroopAliases[i].RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
EndFunction

; Equipment Functions -----------------------------------------------

Function SetNewTier(int NewTier, bool getequipment=true)
    ObjectReference StorageEquipment = ((CS_FactionPlayer as ObjectReference) as CS_FactionManagementEconomy).StorageEquipment
    
    int OldEquipmentTier = EquipmentTier
    EquipmentTier = NewTier
    TroopEquipmentModifier = 1 + math.floor(EquipmentTier as float/5)
    if getequipment && NewTier > 0 ; since the formlist has tier 1 = 0, if the new tier is 0 it should result in no equipment
        StorageEquipment.RemoveItem(CS_CraftingResourcesOutputsEquipmentTroop.GetAt(NewTier - 1), 1, true, UnitEquipmentStorage)
    endif
    if OldEquipmentTier > 0
        UnitEquipmentStorage.RemoveItem(CS_CraftingResourcesOutputsEquipmentTroop.GetAt(OldEquipmentTier - 1), 1, true, StorageEquipment)
    endif
    
    UpdateTroops()
EndFunction

; Orders Functions -------------------------------------------------

Function SetNewTask(int TaskNum, ObjectReference TaskTarget=None, Location TaskLoc=None)
    MiscObject NewTaskObject = CS_UnitTasks.GetAt(TaskNum) as MiscObject
    CS_UnitTaskScript NewTask = HomeStation.PlaceAtMe(NewTaskObject) as CS_UnitTaskScript
    
    OrdersNum = NewTask.TaskNum
    if NewTask.TempTask && CurrentTask
        SetCurrentTaskToOriginal()
    else
        OriginalTask = None
    endif
    CurrentTask = NewTask
    NewTask.SetTask(self, TaskTarget, TaskLoc)
EndFunction

Function CompleteTaskMovement()
    int TaskNum = CurrentTask.TaskNum
    debug.trace("Completed Task Movement, TaskNum = " + TaskNum)
    if TaskNum == 1
        RegisterForFollowPlayer()
    endif
EndFunction

Function FinishTask()
    int TaskNum = CurrentTask.TaskNum
    if TaskNum == 1
        StopFollowPlayer()
    endif
EndFunction

Function RegisterForFollowPlayer()
    debug.trace("Registering for Follow Player")
    if !Activated
        ActivateUnit()
    endif
    
    if CS_UnitOrders02TroopFormUp.IsRunning()
        CS_UnitOrders02TroopFormUp.UnitScript.StopFollowPlayer()
    endif
    
    CS_UnitOrders02TroopFormUp.InitiateFormUp(self)
    ;/GrandMission = CS_StoryArmyFormUp
    CS_StoryArmyMoving.SendStoryEvent(akRef1 = Game.GetPlayer(), akRef2 = self as ObjectReference)/;
EndFunction

Function StopFollowPlayer();/
    if CurrentMission
        CurrentMission.ClearTroops()
        CurrentMission = None
    endif/;
    ;GrandMission = None
    CS_UnitOrders02TroopFormUp.DisbandArmy()
    CS_UnitOrders02TroopFormUp.Stop()
    ReturnToOriginalOrders()
EndFunction

Function SetCurrentTaskToOriginal()
    if !CurrentTask.TempTask
        OriginalTask = CurrentTask
        OriginalTask.UnRegisterForMoving()
    endif
EndFunction

Function ClearTask()
    if CurrentTask
        FinishTask()
        CS_UnitTaskScript OldTask = CurrentTask
        CurrentTask = None
        OldTask.RemoveTask()
    endif
    
    CS_UnitTaskScript OldOriginalTask = OriginalTask
    if OldOriginalTask
        OriginalTask = None
        OldOriginalTask.RemoveTask()
    endif
EndFunction

Function ClearOrders()
    ClearTask()
    
    ObjectReference HQMarker = (HomeStation as CS_CityManagementOwnership).HQExteriorMarker
    Location HQLoc = (HomeStation as CS_CityManagementOwnership).VanillaCity
    
    SetNewTask(0, HQMarker, HQLoc)
    if (HomeStation as CS_CityManagementOwnership).VanillaCity.IsLoaded()
        DeactivateUnit()
    endif
EndFunction

Function ReturnToOriginalOrders()
    if CurrentTask
        CS_UnitTaskScript OldTask = CurrentTask
        CurrentTask = None
        OldTask.RemoveTask()
    endif
    
    if OriginalTask
        CurrentTask = OriginalTask
        OriginalTask = None
        
        CurrentTask.SetTask(self)
    endif
EndFunction

Event OnUpdate()
    RespawnTroops()
EndEvent

State StartSetUp
    
    Event OnUpdate()
        SetVariables()
        GoToState("Ready")
    EndEvent
    
EndState