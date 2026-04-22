Scriptname CS_DefendCityScript extends Quest  

LocationAlias Property City Auto

int Property holdnum Auto
int Property enemyfactionnum Auto

Message Property DefendCityMessage Auto

FormList Property AllLocations Auto
FormList Property AttackMarkers1 Auto
FormList Property AttackMarkers2 Auto
FormList Property AttackerSpawnMarkers Auto
FormList Property GarrisonCommandersAll Auto
FormList Property GarrisonCommanders Auto
FormList Property Garrison Auto
FormList Property DefenseTroopsMelee Auto
FormList Property DefenseTroopsRanged Auto
FormList Property DefenseTroopsHealers Auto
FormList Property DefenseTroopsBuffers Auto
FormList Property TriggerBoxes Auto
FormList Property InvasionObjectivesQuest Auto

ReferenceAlias[] Property DefendMarkersMelee Auto
ReferenceAlias[] Property DefendMarkersRanged Auto
ReferenceAlias[] Property Defenders Auto
ReferenceAlias[] Property Commanders Auto
ReferenceAlias[] Property Attackers Auto
ReferenceAlias[] Property AttackerCommanders Auto

ReferenceAlias Property AttackMarker1 Auto
ReferenceAlias Property AttackMarker2 Auto
ReferenceAlias Property AttackSpawn Auto

GlobalVariable Property TroopsRemainingAttackersPercent Auto
GlobalVariable Property TroopsRemainingDefendersPercent Auto
GlobalVariable Property AttackerCount Auto
GlobalVariable Property CS_BattleSize Auto
GlobalVariable Property CS_BattleSpeed Auto

int Property DefendersInitial Auto
int Property AttackersInitial Auto
int Property AttackerCommandersDeployed Auto
int Property TroopsRemainingAttackers Auto
int Property TroopsRemainingDefenders Auto

ActorBase Property Soldier Auto
ActorBase Property Archer Auto
ActorBase Property EnemyCommander Auto

Faction Property RetreatFaction Auto
Faction Property RangedFaction Auto

Faction Property CS_ArmyMeleeFaction Auto
Faction Property CS_ArmyRangedFaction Auto
Faction Property CS_ArmyBufferFaction Auto
Faction Property CS_ArmyHealerFaction Auto

Keyword Property CS_StoryTransferHoldingCity Auto

bool Property GuaranteedFail Auto

CS_PatrolHoldScript Property CommanderScript Auto
CS_TroopManageMenuScript Property ManageTroops Auto
CS_BattleTrackerScript Property BattleTracker Auto
CS_PrisonerQuestScript Property PrisonerScript Auto
CS_TransferOwnershipScript Property TransferHolding Auto

CS_TMScript Property TMDataScript Auto

Function SetUp()

    holdnum = AllLocations.Find(City.GetLocation())
    BattleTracker.Cities[holdnum] = true
    GarrisonCommanders = GarrisonCommandersAll.GetAt(holdnum) as FormList
    AttackMarker1.ForceRefTo(AttackMarkers1.GetAt(holdnum) as ObjectReference)
    AttackMarker2.ForceRefTo(AttackMarkers2.GetAt(holdnum) as ObjectReference)
    AttackSpawn.ForceRefTo(AttackerSpawnMarkers.GetAt(holdnum) as ObjectReference)
    ((self as Quest) as CS_DefendCityTroopDeathAttacker).SetUpSpawns()
    ((self as Quest) as CS_DefendCityTroopDeathDefender).SetUpSpawns()
    CS_ReinforcementControllerDCity ReinforcementController = (self as Quest) as CS_ReinforcementControllerDCity
    ReinforcementController.Attackers = Attackers
    ReinforcementController.Defenders = Defenders

    TroopsRemainingAttackersPercent.SetValue(100)
    TroopsRemainingDefendersPercent.SetValue(100)
    UpdateCurrentInstanceGlobal(TroopsRemainingDefendersPercent)
    UpdateCurrentInstanceGlobal(TroopsRemainingAttackersPercent)

    AssignDefenders()
    ReinforcementController.DefenseTroops = Garrison
    ;SpawnDefenders()

    AttackersInitial = 20*TMDataScript.AttackingArmies

    AttackerCount.SetValue(AttackersInitial)
    UpdateCurrentInstanceGlobal(AttackerCount)

    TroopsRemainingDefenders = DefendersInitial
    TroopsRemainingAttackers = AttackersInitial

    DefendCityMessage.show()

    ;SpawnAttackers()
    
    SetObjectiveDisplayed(0, true, true)
    SetObjectiveDisplayed(5, true, true)

    if AttackMarker1.GetRef().Is3DLoaded()
        SetStage(5)
    endif

    RegisterForUpdateGameTime(0.5)
EndFunction

Function AssignDefenders()
    Garrison.Revert()
    int i = 0
    while i < GarrisonCommanders.GetSize()
        Actor Commander = GarrisonCommanders.GetAt(i) as Actor
        Commanders[i].ForceRefTo(Commander)
        int armynum = CommanderScript.GetCommanderArmyNum(Commander)
        ((CommanderScript.ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).SpawnNewUnspawnedTroops(Commander)
        Actor[] ArmyTroops = ((CommanderScript.ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).GetAllTroops()
        int index = 0
        while index < ArmyTroops.Length
            if ArmyTroops[index] != None
                Garrison.AddForm(ArmyTroops[index])
                ArmyTroops[index].disable()
            endif
            index += 1
        endwhile
        i += 1
    endwhile
    DefendersInitial = Garrison.GetSize()
EndFunction

Function SpawnDefenders()
    int i = 0
    int maxtroops = 0
    if Garrison.GetSize() >= CS_BattleSize.GetValueInt()
        maxtroops = CS_BattleSize.GetValueInt()
    else
        maxtroops = Garrison.GetSize()
    endif

    while i < maxtroops
        Actor Troop = GetRandomTroopFromList()
        Troop.enable()
        Troop.reset()
        Defenders[i].ForceRefTo(Troop)
        ;Garrison.RemoveAddedForm(Troop)
        if Troop.IsInFaction(RangedFaction)
            Troop.MoveTo(DefendMarkersRanged[i].GetRef())
        else
            Troop.MoveTo(DefendMarkersMelee[i].GetRef())
        endif
        i += 1
    endwhile
EndFunction

Actor Function GetRandomTroopFromList()
    Actor Troop

    while !Troop
        int troopnum = utility.randomint(0, Garrison.GetSize() - 1)
        Troop = Garrison.GetAt(troopnum) as Actor
        if Troop
            Garrison.RemoveAddedForm(Troop)
            return Troop
        endif
    endwhile
EndFunction

Function SpawnAttackers()
    int i = 0
    while i < CS_BattleSize.GetValueInt()
        Actor Troop
        int randomint = utility.randomint(0, 1)
        int randomspawn = utility.randomint(0, 4)
        if randomint == 0
            Troop = AttackSpawn.GetRef().PlaceAtMe(Soldier) as Actor
        elseif randomint == 1
            Troop = AttackSpawn.GetRef().PlaceAtMe(Archer) as Actor
        endif
        Attackers[i].ForceRefTo(Troop)
        i += 1
    endwhile
    Actor CommanderRef = AttackSpawn.GetRef().PlaceAtMe(EnemyCommander) as Actor
    AttackerCommanders[0].ForceRefTo(CommanderRef)
    AttackerCommandersDeployed += 1
EndFunction

Function TroopsSurrender()
    int i = 0
    int troopscaptured = 0
    int troopsfleeing = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef() != None
            int randomsurrender = utility.randomint(0, 4)
            if randomsurrender == 4 && PrisonerScript.ASICPrisonersTotal < 10
                (Attackers[i].GetActorRef() as CS_DefenderDeath).MarkForSurrender()
                PrisonerScript.PlayerTakePrisoner(Attackers[i].GetActorRef(), "Troop", enemyfactionnum)
                troopscaptured += 1
                Attackers[i].Clear()
            else
                Attackers[i].GetActorRef().AddToFaction(RetreatFaction)
                Attackers[i].Clear()
                troopsfleeing += 1
            endif
        endif
        i += 1
    endwhile
    i = 0
    while i < AttackerCommanders.Length
        if AttackerCommanders[i].GetActorRef() != None && PrisonerScript.ASICPrisonersTotal < 10
            (AttackerCommanders[i].GetActorRef() as CS_DefenderDeath).MarkForSurrender()
            PrisonerScript.PlayerTakePrisoner(AttackerCommanders[i].GetActorRef(), "Commander", enemyfactionnum)
            AttackerCommanders[i].Clear()
            troopscaptured += 1
        else
            AttackerCommanders[i].GetActorRef().AddToFaction(RetreatFaction)
            AttackerCommanders[i].Clear()
            troopsfleeing += 1
        endif
        i += 1
    endwhile
    i = 0
    while i < Attackers.Length
        Attackers[i].Clear()
        i += 1
    endwhile
    if troopscaptured > 0
        debug.notification(troopscaptured + " Troops were captured! " + troopsfleeing + " are fleeing!")
    endif
    StopCombatDefenders()
EndFunction

Function StopCombatDefenders()
    Game.GetPlayer().StopCombat()
    int i = 0
    while i < Defenders.Length
        if Defenders[i].GetActorRef() && !Defenders[i].GetActorRef().IsDead()
            Defenders[i].GetActorRef().StopCombat()
        endif
        i += 1
    endwhile
EndFunction

Function DeleteAttackers()
    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetRef()
            Attackers[i].GetRef().delete()
        endif
        i += 1
    endwhile
EndFunction

Function EvaluateAttackerPackages()
    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef()
            Attackers[i].GetActorRef().EvaluatePackage()
        endif
        i += 1
    endwhile
    i = 0
    while i < AttackerCommanders.Length
        if AttackerCommanders[i].GetActorRef()
            AttackerCommanders[i].GetActorRef().EvaluatePackage()
        endif
        i += 1
    endwhile
EndFunction

Function KillFlaggedTroops()
    debug.trace("Quest kill flagged troops started")
    int i = 0
    while i < Commanders.Length
        if Commanders[i].GetActorRef() != None
            int armynum = CommanderScript.GetCommanderArmyNum(Commanders[i].GetActorRef())
            CommanderScript.ArmyScripts[armynum].KillFlaggedTroops()
        endif
        i += 1
    endwhile
EndFunction

Function SimulateCasualties()
    float WinChance = 50
    float TroopsLost = 0
    int AttackerPowerLevel = TroopsRemainingAttackers*3
    int DefenderPowerLevel
    debug.notification("Attacker Power Level = " + AttackerPowerLevel)
    int defendernum = 0
    while defendernum < Garrison.GetSize()
        Actor Troop = Garrison.GetAt(defendernum) as Actor
        ActorBase TroopBase = Troop.GetActorBase()
        DefenderPowerLevel += ManageTroops.TroopPowerLevels[ManageTroops.Troops.Find(TroopBase)]
        defendernum += 1
    endwhile
    debug.trace("Attacker Power Level = " + DefenderPowerLevel)
    if AttackerPowerLevel >= DefenderPowerLevel
        WinChance -= 10*((AttackerPowerLevel as float)/(DefenderPowerLevel as float))
    else
        WinChance += 10*((DefenderPowerLevel as float)/(AttackerPowerLevel as float))
    endif
    if WinChance < 0
        WinChance = 0
    elseif WinChance > 100
        WinChance = 100
    endif
    debug.trace("Win Chance = " + WinChance)
    TroopsLost = ((100 - WinChance)/100)*TroopsRemainingDefenders
    if WinChance <= 40
        WinChance = 0
    elseif WinChance >= 60
        WinChance = 100
    endif

    int randomwin = utility.randomint(1, 100)
    if WinChance >= randomwin
        int i = 0
        while i < TroopsLost
            ((Garrison.GetAt(i) as Actor) as CS_UpgradeTroopOnAttach).FlaggedForDeath = true
            i += 1
        endwhile
        debug.notification(TroopsLost as int + " Troops were lost")
        WinQuest()
    else

        GuaranteedFail = true

        int i = 0
        while i < Garrison.GetSize()
            ((Garrison.GetAt(i) as Actor) as CS_UpgradeTroopOnAttach).FlaggedForDeath = true
            i += 1
        endwhile

        if GetStage() >= 5 && GetStage() <= 7 && City.GetLocation().IsLoaded() && !AttackMarker1.GetRef().Is3DLoaded()
            SetStage(10)
        else
            FailQuest()
        endif

    endif
    Garrison.Revert()

EndFunction

Function WinQuest()
    UnRegisterForUpdate()
    KillFlaggedTroops()
    TroopsSurrender()
    TMDataScript.RemoveArmiesFromHold(holdnum)
    SetStage(20)
EndFunction

Function FailQuest()
    KillFlaggedTroops()
    int i = 0
    while i < GarrisonCommanders.GetSize()
        CommanderScript.ClearFactions(GarrisonCommanders.GetAt(i) as Actor)
        CommanderScript.ArmyScripts[CommanderScript.GetCommanderArmyNum(GarrisonCommanders.GetAt(i) as Actor)].Blockaded = false
        i += 1
    endwhile
    CS_StoryTransferHoldingCity.SendStoryEvent(aiValue1 = holdnum, aiValue2 = enemyfactionnum)
    TMDataScript.AddAttackingArmiesToGarrison(TroopsRemainingAttackers)
    (TriggerBoxes.GetAt(holdnum) as ObjectReference).enable()
    SetStage(21)
EndFunction

Event OnUpdateGameTime()
    if GuaranteedFail == true && !City.GetLocation().IsLoaded()
        FailQuest()
    elseif GetStage() >= 5 && GetStage() <= 7 && City.GetLocation().IsLoaded() && !AttackMarker1.GetRef().Is3DLoaded()
        SimulateCasualties()
    elseif !City.GetLocation().IsLoaded() && GetStage() < 10
        SimulateCasualties()
    endif
EndEvent