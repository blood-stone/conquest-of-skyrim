Scriptname CS_TroopFormUpScript extends Quest conditional

ReferenceAlias[] Property Troops Auto

ReferenceAlias Property Commander Auto

ObjectReference Property EntranceMarker Auto

Actor Property PlayerRef Auto

Package Property WaitPackage Auto

int Property FormedUp Auto conditional
int Property Waiting Auto conditional
int Property TempWait Auto conditional

float Property PlayerX Auto
float Property PlayerY Auto

CS_PatrolHoldScript Property CommanderScript Auto

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
    debug.trace("Form Up Quest Started")
    CS_ArmyTroopDeath ArmyScript = CommanderScript.ArmyScripts[aiValue1]
    
    Actor[] ArmyTroops = ArmyScript.GetAllTroops()
    
    int i = 0
    int formationnum = 0
    while i < ArmyTroops.Length
        if ArmyTroops[i]
            Troops[i].ForceRefTo(ArmyTroops[i])
            formationnum += 1
        endif
        i += 1
    endwhile
    
    ;FormUpArmy()
    
    MoveArmyToPlayer()
    
    debug.trace("Forming Up Army...")
    FormUpArmy()
EndEvent

Function MoveArmyToCommander()
    ResetTroopFormation()
    Actor CommanderActor = Commander.GetActorRef()
    
    TryToMoveTroopToActor(Troops[0].GetActorRef(), CommanderActor, 0, -60)
    TryToMoveTroopToActor(Troops[1].GetActorRef(), CommanderActor, 60, -60)
    TryToMoveTroopToActor(Troops[2].GetActorRef(), CommanderActor, -60, -60)
    TryToMoveTroopToActor(Troops[3].GetActorRef(), CommanderActor, 120, -60)
    TryToMoveTroopToActor(Troops[4].GetActorRef(), CommanderActor, -120, -60)
    Utility.Wait(0.5)
    
    TryToMoveTroopToActor(Troops[5].GetActorRef(), CommanderActor, 0, -120)
    TryToMoveTroopToActor(Troops[6].GetActorRef(), CommanderActor, 60, -120)
    TryToMoveTroopToActor(Troops[7].GetActorRef(), CommanderActor, -60, -120)
    TryToMoveTroopToActor(Troops[8].GetActorRef(), CommanderActor, 120, -120)
    TryToMoveTroopToActor(Troops[9].GetActorRef(), CommanderActor, -120, -120)
    Utility.Wait(0.5)
    
    TryToMoveTroopToActor(Troops[10].GetActorRef(), CommanderActor, 0, -180)
    TryToMoveTroopToActor(Troops[11].GetActorRef(), CommanderActor, 60, -180)
    TryToMoveTroopToActor(Troops[12].GetActorRef(), CommanderActor, -60, -180)
    TryToMoveTroopToActor(Troops[13].GetActorRef(), CommanderActor, 120, -180)
    TryToMoveTroopToActor(Troops[14].GetActorRef(), CommanderActor, -120, -180)
    Utility.Wait(0.5)
    
    TryToMoveTroopToActor(Troops[15].GetActorRef(), CommanderActor, 0, -240)
    TryToMoveTroopToActor(Troops[16].GetActorRef(), CommanderActor, 60, -240)
    TryToMoveTroopToActor(Troops[17].GetActorRef(), CommanderActor, -60, -240)
    TryToMoveTroopToActor(Troops[18].GetActorRef(), CommanderActor, 120, -240)
    TryToMoveTroopToActor(Troops[19].GetActorRef(), CommanderActor, -120, -240)
EndFunction

Function MoveArmyToPlayer()
    ResetTroopFormation()
    Actor CommanderActor = Commander.GetActorRef()
    
    TryToMoveTroopToActor(CommanderActor, PlayerRef, 60, 0)
    
    TryToMoveTroopToActor(Troops[0].GetActorRef(), PlayerRef, 0, -60)
    TryToMoveTroopToActor(Troops[1].GetActorRef(), PlayerRef, 60, -60)
    TryToMoveTroopToActor(Troops[2].GetActorRef(), PlayerRef, -60, -60)
    TryToMoveTroopToActor(Troops[3].GetActorRef(), PlayerRef, 120, -60)
    TryToMoveTroopToActor(Troops[4].GetActorRef(), PlayerRef, -120, -60)
    Utility.Wait(0.5)
    
    TryToMoveTroopToActor(Troops[5].GetActorRef(), PlayerRef, 0, -120)
    TryToMoveTroopToActor(Troops[6].GetActorRef(), PlayerRef, 60, -120)
    TryToMoveTroopToActor(Troops[7].GetActorRef(), PlayerRef, -60, -120)
    TryToMoveTroopToActor(Troops[8].GetActorRef(), PlayerRef, 120, -120)
    TryToMoveTroopToActor(Troops[9].GetActorRef(), PlayerRef, -120, -120)
    Utility.Wait(0.5)
    
    TryToMoveTroopToActor(Troops[10].GetActorRef(), PlayerRef, 0, -180)
    TryToMoveTroopToActor(Troops[11].GetActorRef(), PlayerRef, 60, -180)
    TryToMoveTroopToActor(Troops[12].GetActorRef(), PlayerRef, -60, -180)
    TryToMoveTroopToActor(Troops[13].GetActorRef(), PlayerRef, 120, -180)
    TryToMoveTroopToActor(Troops[14].GetActorRef(), PlayerRef, -120, -180)
    Utility.Wait(0.5)
    
    TryToMoveTroopToActor(Troops[15].GetActorRef(), PlayerRef, 0, -240)
    TryToMoveTroopToActor(Troops[16].GetActorRef(), PlayerRef, 60, -240)
    TryToMoveTroopToActor(Troops[17].GetActorRef(), PlayerRef, -60, -240)
    TryToMoveTroopToActor(Troops[18].GetActorRef(), PlayerRef, 120, -240)
    TryToMoveTroopToActor(Troops[19].GetActorRef(), PlayerRef, -120, -240)
    Utility.Wait(0.5)
EndFunction

Function FormUpArmy()
    debug.trace("Forming Up Army")
    Actor CommanderActor = Commander.GetActorRef()
    
    FormedUp = 1
    TempWait = 0
    
    EvaluateAllPackages()

    debug.trace("Army Formed Up")
EndFunction

Function PlayerEnterInterior()
    Commander.GetActorRef().MoveTo(Game.GetPlayer(), 60, -60)
    
    if Troops[0].GetActorRef()
        Troops[0].GetActorRef().MoveTo(Game.GetPlayer(), 60, -120)
    endif
    
    if Troops[1].GetActorRef()
        Troops[1].GetActorRef().MoveTo(Game.GetPlayer(), -60, -60)
    endif
    
    if Troops[2].GetActorRef()
        Troops[2].GetActorRef().MoveTo(Game.GetPlayer(), -60, -120)
    endif
EndFunction

Function ResetTroopFormation()
    int i = 0
    while i < Troops.Length
        if !Troops[i].GetActorRef() || Troops[i].GetActorRef().IsDead()
            FillInHole(Troops[i])
        endif
       i += 1
   endwhile
EndFunction

Function FillInHole(ReferenceAlias DeadTroop)
    int troopnum = Troops.Find(DeadTroop)
    bool foundtroop = false
    while troopnum < 19 && !foundtroop
        if Troops[troopnum + 1].GetActorRef() && !Troops[troopnum + 1].GetActorRef().IsDead()
            foundtroop = true
            Troops[troopnum].ForceRefTo(Troops[troopnum + 1].GetActorRef())
            debug.trace("Filling " + troopnum + " with " + troopnum+1)
            Troops[troopnum + 1].Clear()
            if !Troops[troopnum].GetActorRef().Is3DLoaded()
                Troops[troopnum].TryToMoveTo(EntranceMarker)
            endif
        endif
        troopnum += 1
    endwhile
EndFunction

Function EvaluateAllPackages()
    Commander.GetActorRef().EvaluatePackage()
    int i = 0
    while i < Troops.Length
        Troops[i].TryToEvaluatePackage()
        i += 1
    endwhile
EndFunction

Function ArmyWaitTemp()
    TempWait = 1
    
    EvaluateAllPackages()
    
    Commander.GetActorRef().ClearKeepOffsetFromActor()
    int i = 0
    while i < Troops.Length
        TryToClearOffsetFromActor(Troops[i].GetActorRef())
        i += 1
    endwhile
    
    debug.trace("Army waiting temporarily")
EndFunction

Function ArmyWait()
    Waiting = 1
    
    EvaluateAllPackages()
    
    Commander.GetActorRef().ClearKeepOffsetFromActor()
    int i = 0
    while i < Troops.Length
        TryToClearOffsetFromActor(Troops[i].GetActorRef())
        i += 1
    endwhile
EndFunction

Function ArmyStopWait()
    Waiting = 0
    
    EvaluateAllPackages()
EndFunction

Function DisbandArmy()
    debug.trace("Disbanding Army...")
    FormedUp = 0
    TempWait = 0
    
    TryToClearOffsetFromActor(Commander.GetActorRef())
    int i = 0
    while i < Troops.Length
        TryToClearOffsetFromActor(Troops[i].GetActorRef())
        i += 1
    endwhile
    
    EvaluateAllPackages()
EndFunction

Function TryToMoveTroopToActor(Actor FormationTroop, Actor Leader, float XOffset, float YOffset)
    if FormationTroop && FormationTroop.GetDistance(Game.GetPlayer()) >= 800
        FormationTroop.enable()
        FormationTroop.MoveTo(Leader, XOffset, YOffset, 0 as float)
    endif
EndFunction

Function TryToKeepOffsetFromActor(Actor FormationTroop, Actor Leader, float XOffset, float YOffset, float CatchUpRadius)
    if FormationTroop
        FormationTroop.KeepOffsetFromActor(Leader, XOffset, YOffset, 0 as float, afCatchUpRadius = CatchUpRadius, afFollowRadius = 0 as float)
        FormationTroop.KeepOffsetFromActor(Leader, XOffset, YOffset, 0 as float, afCatchUpRadius = CatchUpRadius, afFollowRadius = 0 as float)
        FormationTroop.KeepOffsetFromActor(Leader, XOffset, YOffset, 0 as float, afCatchUpRadius = CatchUpRadius, afFollowRadius = 0 as float)
        FormationTroop.KeepOffsetFromActor(Leader, XOffset, YOffset, 0 as float, afCatchUpRadius = CatchUpRadius, afFollowRadius = 0 as float)
        FormationTroop.KeepOffsetFromActor(Leader, XOffset, YOffset, 0 as float, afCatchUpRadius = CatchUpRadius, afFollowRadius = 0 as float)
        FormationTroop.ClearLookAt()
        FormationTroop.SetLookAt(Leader, true)
        FormationTroop.EvaluatePackage()
    endif
EndFunction

Function TryToClearOffsetFromActor(Actor FormationTroop)
    if FormationTroop
        FormationTroop.ClearKeepOffsetFromActor()
        FormationTroop.EvaluatePackage()
    endif
EndFunction