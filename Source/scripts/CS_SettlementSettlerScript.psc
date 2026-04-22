Scriptname CS_SettlementSettlerScript extends ObjectReference  

int Property SettlerNum Auto

ObjectReference Property Settlement Auto hidden
ObjectReference Property JobBuilding Auto hidden

Outfit Property BaseOutfit Auto

int Property AbandonmentScore Auto ; determines if settler leaves, if = 10, will leave

string Property SettlerType Auto hidden

ReferenceAlias[] Property SettlerNames Auto
ReferenceAlias SettlerName

ReferenceAlias[] Property GuardNames Auto
ReferenceAlias GuardName

Function ResetOutfit()
    ;RemoveAllItems()
    if JobBuilding && (JobBuilding as CS_BuildingManagementScript).WorkerOutfit
        ((self as ObjectReference) as Actor).SetOutfit((JobBuilding as CS_BuildingManagementScript).WorkerOutfit)
    else
        ((self as ObjectReference) as Actor).SetOutfit(BaseOutfit)
    endif
EndFunction

Function SetSettlement(ObjectReference SettlementRef)
    Settlement = SettlementRef
    GoToState("Settler")
EndFunction

Function SetSettlerName()
    SettlerNum = (Settlement as CS_CityManagementPopulation).Settlers.Find((self as ObjectReference) as Actor)
    SettlerName = SettlerNames[SettlerNum]
    if SettlerNum >= 0
        SettlerNames[SettlerNum].ForceRefTo(self as ObjectReference)
    endif
EndFunction

Function RemoveSettlerName()
    SettlerName.Clear()
    SettlerName = None
EndFunction

Function SetJob(ObjectReference NewJob)
    JobBuilding = NewJob
EndFunction

Function RemoveJob()
    JobBuilding = None
EndFunction

Function CheckJobTools()
    
EndFunction

Function LeaveSettlement()
    if JobBuilding
        (JobBuilding as CS_BuildingManagementScript).FireWorker((self as ObjectReference) as Actor, true)
    endif
    (Settlement as CS_CityManagementPopulation).RemoveSettler((self as ObjectReference) as Actor)
    delete()
EndFunction

Function SetAbandonmentScore(int MaxAbandonmentScore)
    int AbandonmentScoreChange = 0
    if MaxAbandonmentScore > 0
        AbandonmentScoreChange = utility.randomint(1, MaxAbandonmentScore)
    elseif MaxAbandonmentScore < 0
        AbandonmentScoreChange = utility.randomint(MaxAbandonmentScore, -1)
    endif
    
    AbandonmentScore += AbandonmentScoreChange
    if AbandonmentScore >= 10
        ;LeaveSettlement()
    elseif AbandonmentScore < 0
       AbandonmentScore = 0
    endif
    debug.trace("Settler abandonmentscore = " + AbandonmentScore)
EndFunction

Function SetGuardName()
    SettlerNum = (Settlement as CS_CityManagementPopulation).GuardActors.Find((self as ObjectReference) as Actor)
    GuardName = GuardNames[SettlerNum]
    if SettlerNum >= 0
        GuardNames[SettlerNum].ForceRefTo(self as ObjectReference)
    endif
EndFunction

Function RemoveGuardName()
    GuardName.Clear()
    GuardName = None
EndFunction

Function ReturnToSettlement()
    GoToState(SettlerType)
EndFunction

Event OnDying(Actor akKiller)
    GoToState("Dead")
EndEvent

State Settler

    Function CheckJobTools()
        if JobBuilding
            Form WorkerTool = (JobBuilding as CS_BuildingManagementScript).WorkerTool
            if WorkerTool
                ObjectReference WorkerEquipmentStorage = (Settlement as CS_CityManagementEconomy).StorageEquipmentWorkers
                if (WorkerEquipmentStorage as CS_StorageEquipmentWorkersScript).WorkerEquipmentTier > 0
                    if GetItemCount(WorkerTool) == 0
                        AddItem(WorkerTool)
                    endif
                else
                    RemoveItem(WorkerTool)
                endif
            endif
        endif
    EndFunction
    
    Event OnBeginState()
        SettlerType = "Settler"
        SetSettlerName()
        ;ResetOutfit()
    EndEvent
    
    Event OnCellAttach()
        SetSettlerName()
    EndEvent
    
    Event OnDying(Actor akKiller)
        GoToState("Dead")
        if JobBuilding
            (JobBuilding as CS_BuildingManagementScript).FireWorker((self as ObjectReference) as Actor, true)
        endif
        (Settlement as CS_CityManagementPopulation).RemoveSettler((self as ObjectReference) as Actor)
    EndEvent
    
    Event OnUpdate()
        CheckJobTools()
    EndEvent
EndState

State Guard
    Event OnBeginState()
        SettlerType = "Guard"
        RemoveSettlerName()
        SetGuardName()
    EndEvent
    
    Event OnCellAttach()
        SetGuardName()
    EndEvent

    Function LeaveSettlement()
        (Settlement as CS_CityManagementPopulation).FireGuard((self as ObjectReference) as Actor, false)
        (Settlement as CS_CityManagementPopulation).RemoveSettler((self as ObjectReference) as Actor)
        delete()
    EndFunction
    
    Event OnDying(Actor akKiller)
        GoToState("Dead")
        (Settlement as CS_CityManagementPopulation).FireGuard((self as ObjectReference) as Actor, true)
        (Settlement as CS_CityManagementPopulation).RemoveSettler((self as ObjectReference) as Actor)
    EndEvent
EndState

State Dead
    
    Event OnCellDetach()
        delete()
    EndEvent
    
EndState