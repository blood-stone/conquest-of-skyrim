Scriptname CS_ArmyUnitTroopScript extends ReferenceAlias

ActorBase Property TroopBase Auto hidden

ReferenceAlias Property CurrentMissionAlias Auto hidden

int Property TroopNum Auto hidden

bool Property Dead Auto hidden

CS_ArmyUnitAliasScript UnitScript
    
Function SetUp(ActorBase NewBase)
    if GetActorRef()
        GetActorRef().disable()
        GetActorRef().delete()
        Clear()
        if CurrentMissionAlias
            CurrentMissionAlias.Clear()
        endif
        
        if !Dead
            UnitScript.RemoveFromAliveTroopCount()
        endif
    
        TroopBase = NewBase
        UnitScript = GetOwningQuest() as CS_ArmyUnitAliasScript
        GoToState("Filled")
        RegisterForSingleUpdate(0.1)
    else
        TroopBase = NewBase
        UnitScript = GetOwningQuest() as CS_ArmyUnitAliasScript
        GoToState("Filled")
    endif
EndFunction

Function RemoveTroop()
    GoToState("Unfilled")
    if GetActorRef()
        GetActorRef().disable()
        GetActorRef().delete()
        Clear()
        if CurrentMissionAlias
            CurrentMissionAlias.Clear()
        endif
        
        if !Dead
            UnitScript.RemoveFromAliveTroopCount()
        endif
    endif
    
    TroopBase = None
EndFunction

Event OnDying(Actor akKiller)
    Dead = true
    UnitScript.RemoveFromAliveTroopCount()
EndEvent

State Filled
    
    Event OnUpdate() ; Fills Unit with an Actor of ActorBase that was just set.
        GoToState("Spawning")
        ObjectReference SpawnPoint = UnitScript.Commander.GetRef()
        if !SpawnPoint
            SpawnPoint = (UnitScript.HomeStation as CS_CityManagementOwnership).HQExteriorMarker
        endif
            
        Actor NewTroop = SpawnPoint.PlaceAtMe(TroopBase, abForcePersist=true, abinitiallydisabled=true) as Actor
        ForceRefTo(NewTroop)
        if CurrentMissionAlias
            CurrentMissionAlias.ForceRefTo(NewTroop)
        endif
        Dead = false
        UnitScript.AddToAliveTroopCount()
        
        if UnitScript.Activated ; Actor is initially disabled unless unit is activated
            GoToState("Enabled")
            RegisterForSingleUpdate(0.1)
        else
            GoToState("Disabled")
        endif
    EndEvent
    
EndState

State Enabled
    
    Event OnUpdate() ;Resets and enables unit, including setting unit outfit
        
        if GetRef() && !Dead && UnitScript.OrdersNum != 3;/
            ObjectReference SpawnPoint = UnitScript.Commander.GetRef()
            if !SpawnPoint
                SpawnPoint = (UnitScript.HomeStation as CS_CityManagementOwnership).HQExteriorMarker
            endif
            /;
            TryToMoveTo(UnitScript.Commander.GetRef())
            TryToEnable()
            (GetRef() as CS_ResourceEquipmentReceiver).SetTroopOutfit(UnitScript)
        endif
        
    EndEvent
    
    Event OnCellAttach() ;Making sure outfit is current
        
        if GetRef() && !Dead
            (GetRef() as CS_ResourceEquipmentReceiver).SetTroopOutfit(UnitScript)
        endif
        
    EndEvent
        
EndState

State Disabled
    
    Event OnCellDetach()
        
        TryToDisable()
        
    EndEvent
    
    Event OnUpdate()
        
        TryToDisable()
        
    EndEvent
    
    Event OnLoad()
        
        TryToDisable()
        
    EndEvent
    
    Event OnCellAttach()
        
        TryToDisable()
        
    EndEvent
    
EndState

State Respawn
    
    Event OnUpdate()
        
        if TroopBase
            SetUp(TroopBase)
        else
            GoToState("Unfilled")
        endif
        
    EndEvent
    
EndState