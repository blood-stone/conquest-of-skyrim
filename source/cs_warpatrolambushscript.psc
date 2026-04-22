Scriptname CS_WarPatrolAmbushScript extends Quest  

int Property PatrolFactionNum Auto

int Property TroopsRemaining Auto
int Property TroopsRemainingInitial Auto

Location Property HoldLoc Auto

Keyword Property PatrolNum Auto

ReferenceAlias Property AmbushTrigger Auto
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

bool Property AtWarPlayer Auto
bool Property AtWarSons Auto

Function SetUpValues()
    CS_WarStartAmbushScript AmbushStartScript = AmbushTrigger.GetRef() as CS_WarStartAmbushScript
    
    HoldLoc = AmbushStartScript.HoldLocation  
    PatrolFactionNum = HoldLoc.GetKeywordData(AmbushStartScript.LandSuperiority) as int
    PatrolNum = AmbushStartScript.PatrolKeyword
    
    PatrolMarker.ForceRefTo(AmbushTrigger.GetRef().GetLinkedRef())
    if PatrolFactionNum == 11 && TMDataImp.AtWarPlayer == true
        AtWarPlayer = true
    elseif PatrolFactionNum == 12 && TMDataSons.AtWarPlayer == true
        AtWarPlayer = true
    endif
    PercentRemaining.SetValue(100)
    UpdateCurrentInstanceGlobal(PercentRemaining)
    TroopsRemainingInitial = HoldLoc.GetKeywordData(PatrolNum) as int
    TroopsRemaining = TroopsRemainingInitial
EndFunction

Function SpawnTroops()
    if PatrolFactionNum == 11
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
    endif
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
    if PatrolFactionNum != 1
        CommanderAlias.GetActorRef().disable()
        CommanderAlias.GetActorRef().delete()
        int i = 0
        while i < Troops.Length
            Troops[i].GetActorRef().disable()
            Troops[i].GetActorRef().delete()
            i += 1
        endwhile
        FailAllObjectives()
    endif
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