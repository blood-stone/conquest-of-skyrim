Scriptname CS_WarPatrolAmbushScript extends Quest  

import CS_CommonFunctions

int Property PatrolFactionNum Auto

int Property TroopsRemaining Auto
int Property TroopsRemainingInitial Auto

Location Property HoldLoc Auto

Keyword Property PatrolNum Auto

ReferenceAlias Property AmbushTrigger Auto
ReferenceAlias Property Regiment Auto
ReferenceAlias Property CommanderAlias Auto
ReferenceAlias Property PatrolMarker Auto

ReferenceAlias[] Property Troops Auto

ActorBase Property ImperialSoldier Auto
ActorBase Property ImperialArcher Auto
ActorBase Property ImperialCommander Auto

ActorBase Property StormcloakSoldier Auto
ActorBase Property StormcloakArcher Auto
ActorBase Property StormcloakCommander Auto

CS_TMScript Property TMDataImp Auto
CS_TMScript Property TMDataSons Auto
CS_POWScript Property POWScript Auto
CS_PatrolHoldScript Property CommanderScript Auto
CS_PrisonerQuestScript Property PrisonerScript Auto

Faction Property PlayerArmyFaction Auto

GlobalVariable Property PercentRemaining Auto

ObjectReference Property PatrolFaction Auto
ObjectReference Property CS_FactionPlayer Auto

bool Property AtWarPlayer Auto
bool Property AtWarSons Auto

Function SetUpValues()
    CS_WarStartAmbushScript AmbushStartScript = AmbushTrigger.GetRef() as CS_WarStartAmbushScript
    
    HoldLoc = AmbushStartScript.HoldLocation
    PatrolNum = AmbushStartScript.PatrolKeyword
    PatrolFaction = (Regiment.GetRef() as CS_FactionWarAIRegimentScript).FactionOwnerActivator
    
    PatrolMarker.ForceRefTo(AmbushTrigger.GetRef().GetLinkedRef())
    if GetFactionsAtWar(CS_FactionPlayer, PatrolFaction)
        AtWarPlayer = true
    endif
    PercentRemaining.SetValue(100)
    UpdateCurrentInstanceGlobal(PercentRemaining)
    TroopsRemainingInitial = 20 ; Add actual troop count later
    TroopsRemaining = TroopsRemainingInitial
EndFunction

Function SpawnTroops()
    
    ActorBase CommanderType = (PatrolFaction as CS_FactionManagementMilitary).CommanderTroopType
    
    (CommanderAlias as CS_FactionWarBattleCommanderScript).SpawnPoint = AmbushTrigger.GetRef()
    (CommanderAlias as CS_FactionWarBattleCommanderScript).TroopRegiment = Regiment.GetRef()
    (CommanderAlias as CS_FactionWarBattleCommanderScript).EquipmentTier = (Regiment.GetRef() as CS_FactionWarAIRegimentScript).AverageEquipmentLevel
    (CommanderAlias as CS_FactionWarBattleCommanderScript).TroopType = CommanderType
    (CommanderAlias as CS_FactionWarBattleCommanderScript).GoToState("SpawnTroop")
    (CommanderAlias as CS_FactionWarBattleCommanderScript).RegisterForSingleUpdate(0.1)
    
    FormList TroopTypeList = (PatrolFaction as CS_FactionManagementMilitary).InitialTroopTypes
    int TroopCount = (Regiment.GetRef() as CS_FactionWarAIRegimentScript).TroopCount
    
    int i = 0
    while i < Troops.Length
        if i < TroopCount
            int randint = utility.randomint(0, 1)
            if randint == 1
                randint = 2
            endif
            (Troops[i] as CS_FactionWarBattleTroopScript).SpawnPoint = AmbushTrigger.GetRef()
            (Troops[i] as CS_FactionWarBattleTroopScript).TroopRegiment = Regiment.GetRef()
            (Troops[i] as CS_FactionWarBattleTroopScript).EquipmentTier = (Regiment.GetRef() as CS_FactionWarAIRegimentScript).AverageEquipmentLevel
            (Troops[i] as CS_FactionWarBattleTroopScript).TroopType = TroopTypeList.GetAt(randint) as ActorBase
            (Troops[i] as CS_FactionWarBattleTroopScript).GoToState("SpawnTroop")
            (Troops[i] as CS_FactionWarBattleTroopScript).RegisterForSingleUpdate(0.1)
        else
            (Troops[i] as CS_FactionWarBattleTroopScript).GoToState("Empty")
        endif
        i += 1
    endwhile
    
    ;/if PatrolFactionNum == 11
        Actor Commander = AmbushTrigger.GetRef().PlaceAtMe(ImperialCommander) as Actor
        if TMDataImp.TrucePlayer
            Commander.SetGhost()
        endif
        CommanderAlias.ForceRefTo(Commander)
        int i = 0
        while i < TroopsRemainingInitial
            Actor Troop
            int randint = utility.randomint(0, 1)
            if randint == 0
                debug.trace("Spawning Soldier")
                Troop = AmbushTrigger.GetRef().PlaceAtMe(ImperialSoldier) as Actor
            else
                debug.trace("Spawning Archer")
                Troop = AmbushTrigger.GetRef().PlaceAtMe(ImperialArcher) as Actor
            endif
            if TMDataImp.TrucePlayer
                Troop.SetGhost()
            endif
            Troops[i].ForceRefTo(Troop)
            i += 1
        endwhile
    elseif PatrolFactionNum == 12
        Actor Commander = AmbushTrigger.GetRef().PlaceAtMe(StormcloakCommander) as Actor
        if TMDataSons.TrucePlayer
            Commander.SetGhost()
        endif
        CommanderAlias.ForceRefTo(Commander)
        int i = 0
        while i < HoldLoc.GetKeywordData(PatrolNum)
            Actor Troop
            int randint = utility.randomint(0, 1)
            if randint == 0
                Troop = AmbushTrigger.GetRef().PlaceAtMe(StormcloakSoldier) as Actor
            else
                Troop = AmbushTrigger.GetRef().PlaceAtMe(StormcloakArcher) as Actor
            endif
            if TMDataSons.TrucePlayer
                Troop.SetGhost()
            endif
            Troops[i].ForceRefTo(Troop)
            i += 1
        endwhile
    elseif PatrolFactionNum == 1
        debug.trace("PatrolNum = " + HoldLoc.GetKeywordData(PatrolNum) as int)
        CommanderAlias.ForceRefTo(CommanderScript.Commanders[HoldLoc.GetKeywordData(PatrolNum) as int].GetActorRef())
        CommanderAlias.GetActorRef().EvaluatePackage()
        CommanderAlias.GetActorRef().MoveTo(AmbushTrigger.GetRef())
        CommanderScript.MoveTroopsToCommander(CommanderAlias.GetActorRef())
    endif/;
EndFunction

Function DisplayObjective()
    if AtWarPlayer == true
        SetObjectiveDisplayed(PatrolFactionNum)
    endif
EndFunction

Function PatrolTroopDeath(ReferenceAlias TroopAlias, Actor Killer)
    if AtWarPlayer == false && (Killer == Game.GetPlayer() || Killer.IsInFaction(PlayerArmyFaction))
        AtWarPlayer = true
        if PatrolFactionNum == 11
            TMDataImp.StartWar()
        elseif PatrolFactionNum == 12
            TMDataSons.StartWar()
        endif
        DisplayObjective()
    endif
    HoldLoc.SetKeywordData(PatrolNum, HoldLoc.GetKeywordData(PatrolNum) - 1)
    TroopsRemaining -= 1
    AdjustDefenderPercentRemaining()
    TroopAlias.clear()
EndFunction

Function AdjustDefenderPercentRemaining()
    int PercentRemainingInitial = PercentRemaining.GetValue() as int
    float NewPercentRemaining = math.floor(100*(TroopsRemaining as float/TroopsRemainingInitial as float))
    if NewPercentRemaining <= PercentRemainingInitial - 10
        int percentchange = PercentRemainingInitial - NewPercentRemaining as int
        If TroopsRemaining <= 0
            PercentRemaining.SetValue(0)
            UpdateCurrentInstanceGlobal(PercentRemaining)
            CompleteAllObjectives()
            DefeatArmy()
        Else
            ModObjectiveGlobal(-percentchange, PercentRemaining, PatrolFactionNum)
            if PercentRemaining.GetValueInt() < 25
                int randomsurrender = utility.randomint(0, 3)
                if randomsurrender == 3
                    CompleteAllObjectives()
                    DefeatArmy()
                endif
            endif
        EndIf
    endif
EndFunction

Function DetachArmy()
    ;/if PatrolFactionNum != 1
        CommanderAlias.GetActorRef().disable()
        CommanderAlias.GetActorRef().delete()/;
    if (CommanderAlias as CS_FactionWarBattleCommanderScript).GetState() == "Spawned"
        (CommanderAlias as CS_FactionWarBattleCommanderScript).GoToState("DeleteTroop")
        (CommanderAlias as CS_FactionWarBattleCommanderScript).RegisterForSingleUpdate(0.1)
    endif
    
    int i = 0
    while i < Troops.Length
        if (Troops[i] as CS_FactionWarBattleTroopScript).GetState() == "Spawned"
            (Troops[i] as CS_FactionWarBattleTroopScript).GoToState("DeleteTroop")
            (Troops[i] as CS_FactionWarBattleTroopScript).RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
    FailAllObjectives()
    
    i = 0
    while i < Troops.Length
        int currentloop = 0
        while (Troops[i] as CS_FactionWarBattleTroopScript).GetState() != "Empty" && currentloop < 50
            utility.wait(0.1)
            currentloop += 1
        endwhile
        i += 1
    endwhile
        ;endif
    Stop()
EndFunction

Function DefeatArmy()
    Actor Commander = CommanderAlias.GetActorRef()
    CommanderAlias.Clear()
    (Commander as CS_DefenderDeath).MarkForSurrender()
    PrisonerScript.PlayerTakePrisoner(Commander, "Commander", PatrolFactionNum)
    POWScript.StartSurrender(Commander)
    int troopssurrendering = 1
    int i = 0
    while i < Troops.Length
        if Troops[i].GetActorRef() != None && Troops[i].GetActorRef().IsDead() == 0
            Actor Troop = Troops[i].GetActorRef()
            Troops[i].Clear()
            (Troop as CS_DefenderDeath).MarkForSurrender()
            PrisonerScript.PlayerTakePrisoner(Troop, "Troop", PatrolFactionNum)
            troopssurrendering += 1
        endif
        i += 1
    endwhile
    HoldLoc.SetKeywordData(PatrolNum, 0)
    if PatrolFactionNum == 11
        TMDataImp.KillPatrollingArmy(HoldLoc)
    elseif PatrolFactionNum == 12
        TMDataSons.KillPatrollingArmy(HoldLoc)
    endif

    debug.notification(troopssurrendering + " troops were taken prisoner!")
    Stop()
EndFunction