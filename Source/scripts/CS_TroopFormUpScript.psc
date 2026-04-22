Scriptname CS_TroopFormUpScript extends Quest conditional

ReferenceAlias[] Property Troops Auto

ReferenceAlias Property Commander Auto

ObjectReference Property EntranceMarker Auto
ObjectReference Property Regiment Auto

FormList Property CS_ArmyAllRegiments Auto

Actor Property PlayerRef Auto

Package Property WaitPackage Auto

int Property FormedUp Auto hidden conditional
int Property Waiting Auto hidden conditional
int Property TempWait Auto hidden conditional

float Property PlayerX Auto hidden
float Property PlayerY Auto hidden

CS_ArmyUnitAliasScript Property UnitScript Auto hidden

Function InitiateFormUp(CS_ArmyUnitAliasScript Unit)
    Start()
    UnitScript = Unit
    if Unit.Commander.GetActorRef()
        Commander.ForceRefTo(Unit.Commander.GetActorRef())
    endif
    
    FormUpArmy()
    MoveArmyToPlayer()
    GoToState("Open")
EndFunction

Function ResetFormation()
    GoToState("Busy")
    debug.trace("Resetting Formation...")
    ClearFormation()
    CS_ArmyUnitTroopScript[] ArmyTroops = UnitScript.TroopAliases
    bool PlayerInInterior = PlayerRef.IsInInterior()
    
    ;RegimentScript.SpawnTroops((self as Quest) as CS_ArmyMissionScript)
    int i = 0
    int formationnum = 0
    while formationnum < Troops.Length && i < ArmyTroops.Length
        Troops[i].Clear()
        (Troops[formationnum] as CS_TroopFormUpTroopThread).GoToState("UnFilled")
        Actor Troop = ArmyTroops[i].GetActorRef()
        if Troop
    
            ArmyTroops[i].CurrentMissionAlias = Troops[formationnum]
            
            Troops[formationnum].ForceRefTo(Troop)
            (Troops[formationnum] as CS_TroopFormUpTroopThread).GoToState("Filled")
            if PlayerInInterior && formationnum < 4 && !Troop.IsInLocation(PlayerRef.GetCurrentLocation())
                Troop.MoveTo(EntranceMarker)
            endif
            formationnum += 1
        endif
        i += 1
    endwhile
    
    GoToState("Open")
    EvaluateAllPackages()
    debug.trace("Formation Reset!...")
EndFunction

Function MoveArmyToPlayer()
    
    debug.trace("Moving Army to Player...")
    
    (Commander as CS_TroopFormUpCommanderThread).GoToState("TeleportToPlayer")
    Commander.RegisterForSingleUpdate(0.001)
    
    int i = 0
    while i < Troops.Length
        if (Troops[i] as CS_TroopFormUpTroopThread).GetState() == "Filled"
            (Troops[i] as CS_TroopFormUpTroopThread).GoToState("TeleportToPlayer")
            Troops[i].RegisterForSingleUpdate(0.001)
        endif
        i += 1
    endwhile
    
    i = 0
    while i < Troops.Length
        while (Troops[i] as CS_TroopFormUpTroopThread).GetState() == "TeleportToPlayer"
            utility.wait(0.1)
        endwhile
        i += 1
    endwhile
EndFunction

Function FormUpArmy()
    debug.trace("Forming Up Army")
    Actor CommanderActor = Commander.GetActorRef()
    
    FormedUp = 1
    TempWait = 0
    
    ResetFormation()
    
    ;EvaluateAllPackages()

    debug.trace("Army Formed Up")
EndFunction

Function PlayerEnterInterior()
    EntranceMarker.MoveTo(PlayerRef)
    Commander.GetActorRef().MoveTo(PlayerRef);, 60, -60)
    
    if Troops[0].GetActorRef()
        Troops[0].GetActorRef().MoveTo(PlayerRef);, 60, -120)
    endif
    
    if Troops[1].GetActorRef()
        Troops[1].GetActorRef().MoveTo(PlayerRef);, -60, -60)
    endif
    
    if Troops[2].GetActorRef()
        Troops[2].GetActorRef().MoveTo(PlayerRef);, -60, -120)
    endif
EndFunction

Function EvaluateAllPackages()
    GoToState("Busy");/
    Commander.GetActorRef().EvaluatePackage()
    int i = 0
    while i < Troops.Length
        Troops[i].TryToEvaluatePackage()
        i += 1
    endwhile/;
    (Commander as CS_TroopFormUpCommanderThread).GoToState("EvaluateTroopPackage")
    Commander.RegisterForSingleUpdate(0.001)
    
    int i = 0
    while i < Troops.Length
        if (Troops[i] as CS_TroopFormUpTroopThread).GetState() == "Filled"
            (Troops[i] as CS_TroopFormUpTroopThread).GoToState("EvaluateTroopPackage")
            Troops[i].RegisterForSingleUpdate(0.001)
        endif
        i += 1
    endwhile
    
    i = 0
    while i < Troops.Length
        while (Troops[i] as CS_TroopFormUpTroopThread).GetState() == "EvaluateTroopPackage"
            utility.wait(0.1)
        endwhile
        i += 1
    endwhile
    GoToState("Open")
EndFunction

Function ClearFormation()
    GoToState("Busy")
    debug.trace("Clearing formation...")
    (Commander as CS_TroopFormUpCommanderThread).GoToState("ClearFormation")
    Commander.RegisterForSingleUpdate(0.001)
    
    int i = 0
    while i < Troops.Length
        if (Troops[i] as CS_TroopFormUpTroopThread).GetState() == "Filled"
            (Troops[i] as CS_TroopFormUpTroopThread).GoToState("ClearFormation")
            Troops[i].RegisterForSingleUpdate(0.001)
        endif
        i += 1
    endwhile
    
    i = 0
    while i < Troops.Length
        while (Troops[i] as CS_TroopFormUpTroopThread).GetState() == "ClearFormation"
            utility.wait(0.1)
        endwhile
        ;(Troops[i] as CS_TroopFormUpTroopThread).GoToState("Filled")
        i += 1
    endwhile
    debug.trace("Formation cleared!")
    GoToState("Open")
EndFunction

Function ArmyWaitTemp()
    TempWait = 1
    
    ;/EvaluateAllPackages()
    
    Commander.GetActorRef().ClearKeepOffsetFromActor()
    int i = 0
    while i < Troops.Length
        TryToClearOffsetFromActor(Troops[i].GetActorRef())
        i += 1
    endwhile/;
    ClearFormation()
    
    debug.trace("Army waiting temporarily")
EndFunction

Function ArmyWait()
    debug.trace("Triggered Army Wait")
    Waiting = 1
    
    ;/EvaluateAllPackages()
    
    Commander.GetActorRef().ClearKeepOffsetFromActor()
    int i = 0
    while i < Troops.Length
        TryToClearOffsetFromActor(Troops[i].GetActorRef())
        i += 1
    endwhile/;
    ClearFormation()
    debug.trace("Army Wait Complete")
EndFunction

Function ArmyStopWait()
    Waiting = 0
    
    EvaluateAllPackages()
EndFunction

Function DisbandArmy()
    debug.trace("Disbanding Army...")
    FormedUp = 0
    TempWait = 0
    ClearFormation()
    ;RegimentOrders.CancelOrders()
    Stop()
EndFunction