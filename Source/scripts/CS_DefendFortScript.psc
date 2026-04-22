Scriptname CS_DefendFortScript extends Quest  

LocationAlias Property Fort Auto

FormList Property AllFortLocations Auto
FormList Property AllFortGarrisons Auto
FormList Property TriggerBoxes Auto
FormList Property InvasionObjectivesQuest Auto

int Property fortnum Auto
int Property enemyfactionnum Auto

FormList Property FortGarrison Auto
FormList Property DefenseTroopsMelee Auto
FormList Property DefenseTroopsRanged Auto
FormList Property DefenseTroopsHealers Auto
FormList Property DefenseTroopsBuffers Auto

CS_TransferOwnershipScript Property TransferOwnership Auto

Message Property DefenselessMessage Auto
Message Property DefendFortMessage Auto

Activator Property FortGateActivator Auto

ReferenceAlias Property FortCommander Auto
ReferenceAlias Property AttackerCommander Auto
ReferenceAlias Property FortGate Auto
ReferenceAlias Property BatteringRamTrigger Auto
ReferenceAlias Property BatteringRam Auto
ReferenceAlias Property Button1 Auto
ReferenceAlias Property Button2 Auto
ReferenceAlias[] Property Defenders Auto
ReferenceAlias[] Property DefenderSpawnMelee Auto
ReferenceAlias[] Property DefenderSpawnRanged Auto
ReferenceAlias[] Property Attackers Auto
ReferenceAlias[] Property AttackerSpawn Auto

ActorBase Property Soldier Auto
ActorBase Property Archer Auto
ActorBase Property Commander Auto

int Property AttackersInitial Auto
int Property TroopsRemainingAttackers Auto
int Property DefendersInitial Auto
int Property NumDefenders Auto
int Property TroopsRemainingDefenders Auto

bool Property GuaranteedFail Auto

GlobalVariable Property AttackerCount Auto
GlobalVariable Property TroopsRemainingAttackersPercent Auto
GlobalVariable Property TroopsRemainingDefendersPercent Auto
GlobalVariable Property FortDoorHealth Auto
GlobalVariable Property CS_BattleSize Auto
GlobalVariable Property CS_BattleSpeed Auto

Faction Property RetreatFaction Auto
Faction Property MeleeFaction Auto
Faction Property RangedFaction Auto

Faction Property CS_ArmyMeleeFaction Auto
Faction Property CS_ArmyRangedFaction Auto
Faction Property CS_ArmyHealerFaction Auto
Faction Property CS_ArmyBufferFaction Auto

Keyword Property CS_StoryTransferHoldingFort Auto

CS_TMScript Property TMDataScript Auto
CS_TMScript Property TMPlayer Auto

CS_TroopManageMenuScript Property ManageArmy Auto
CS_PatrolHoldScript Property CommanderScript Auto
CS_PrisonerQuestScript Property PrisonerScript Auto
CS_BattleTrackerScript Property BattleTracker Auto
CS_FortCommandersScript Property FortCommanders Auto


Function SetUp()
    fortnum = AllFortLocations.Find(Fort.GetLocation())
    BattleTracker.Forts[fortnum] = true
    FortCommander.ForceRefTo(FortCommanders.FortCommanders[fortnum].GetActorRef())
    FortCommanders.AssignFortPersonnel(FortCommander.GetActorRef(), fortnum)
    FortGarrison = AllFortGarrisons.GetAt(fortnum) as FormList
    ((self as Quest) as CS_ReinforcementControllerD).AttackerSpawn = AttackerSpawn
    ((self as Quest) as CS_ReinforcementControllerD).Attackers = Attackers
    ((self as Quest) as CS_ReinforcementControllerD).Defenders = Defenders
    ((self as Quest) as CS_ReinforcementControllerD).DefenderSpawn = DefenderSpawnRanged
    ((self as Quest) as CS_ReinforcementControllerD).DefenseTroops = FortGarrison
    if FortGarrison.GetSize() == 0 && Game.GetPlayer().IsInLocation(Fort.GetLocation()) == 0
        DefenselessMessage.show()
        FailQuest()
    else

        TroopsRemainingAttackersPercent.SetValue(100)
        TroopsRemainingDefendersPercent.SetValue(100)
        UpdateCurrentInstanceGlobal(TroopsRemainingDefendersPercent)
        UpdateCurrentInstanceGlobal(TroopsRemainingAttackersPercent)
        AttackersInitial = 20*TMDataScript.AttackingArmies
        DefendersInitial = FortGarrison.GetSize()
        TroopsRemainingAttackers = AttackersInitial
        TroopsRemainingDefenders = DefendersInitial
        AssignDefenders()
        AttackerCount.SetValue(AttackersInitial)
        UpdateCurrentInstanceGlobal(AttackerCount)
        if fortnum != 5 && fortnum != 8
            FortGate.GetRef().reset()
            FortGate.GetRef().ClearDestruction()
            FortGate.GetRef().enable()
            Button1.GetRef().enable()
            Button2.GetRef().enable()
            BatteringRamTrigger.GetRef().enable()
            BatteringRam.ForceRefTo(BatteringRamTrigger.GetRef().GetLinkedRef())
        endif
    
        SpawnAttackers()
        DefendFortMessage.show()
        debug.notification("You have " + TroopsRemainingDefenders + " troops defending it!")

        SetObjectiveDisplayed(5)
        SetObjectiveDisplayed(10)

        RegisterForUpdate(5)
        RegisterForUpdateGameTime(0.5)

    endif
EndFunction

Function AssignDefenders()
    Actor[] DefenseTroops = CommanderScript.ArmyScripts[CommanderScript.GetCommanderArmyNum(FortCommander.GetActorRef())].GetAllTroops()
    int i = 0
    NumDefenders = 0
    while i < Defenders.Length
        if DefenseTroops[i]
            DefenseTroops[i].Enable()
            Defenders[NumDefenders].ForceRefTo(DefenseTroops[i])
            if Defenders[NumDefenders].GetActorRef().IsInFaction(RangedFaction)
                if DefenderSpawnRanged[i].GetRef()
                    Defenders[NumDefenders].GetRef().MoveTo(DefenderSpawnRanged[i].GetRef())
                else
                    Defenders[NumDefenders].GetRef().MoveTo(DefenderSpawnRanged[0].GetRef())
                endif
            else
                if DefenderSpawnMelee[i].GetRef()
                    Defenders[NumDefenders].GetRef().MoveTo(DefenderSpawnMelee[i].GetRef())
                else
                    Defenders[NumDefenders].GetRef().MoveTo(DefenderSpawnMelee[0].GetRef())
                endif
            endif
            NumDefenders += 1
        endif
        i += 1
    endwhile
EndFunction

Function SpawnAttackers()
    int i = 0
    while i < CS_BattleSize.GetValueInt()
        Actor Troop
        int randomint = utility.randomint(0, 1)
        int randomspawn = utility.randomint(0, 4)
        if randomint == 0
            Troop = AttackerSpawn[randomspawn].GetRef().PlaceAtMe(Soldier) as Actor
        elseif randomint == 1
            Troop = AttackerSpawn[randomspawn].GetRef().PlaceAtMe(Archer) as Actor
        endif
        Attackers[i].ForceRefTo(Troop)
        i += 1
    endwhile
    int randomspawn = utility.randomint(0, 4)
    Actor CommanderRef = AttackerSpawn[randomspawn].GetRef().PlaceAtMe(Commander) as Actor
    AttackerCommander.ForceRefTo(CommanderRef)
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
    if AttackerCommander.GetActorRef() != None && PrisonerScript.ASICPrisonersTotal < 10
        (AttackerCommander.GetActorRef() as CS_DefenderDeath).MarkForSurrender()
        PrisonerScript.PlayerTakePrisoner(AttackerCommander.GetActorRef(), "Commander", enemyfactionnum)
        AttackerCommander.Clear()
        troopscaptured += 1
    else
        AttackerCommander.GetActorRef().AddToFaction(RetreatFaction)
        AttackerCommander.Clear()
        troopsfleeing += 1
    endif
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

Function KillFlaggedTroops()
    debug.trace("Quest kill flagged troops started")
    if FortCommander.GetActorRef() != None
        int armynum = CommanderScript.GetCommanderArmyNum(FortCommander.GetActorRef())
        CommanderScript.ArmyScripts[armynum].KillFlaggedTroops()
    endif
EndFunction

Function DamageFortDoor(int newstate)
    FortDoorHealth.SetValue(100 - newstate*25)
    UpdateCurrentInstanceGlobal(FortDoorHealth)
    if FortDoorHealth.GetValue() == 0
        Button1.GetRef().disable()
        Button2.GetRef().disable()
        FortGate.GetRef().disable()
        ;BatteringRam.GetRef().disable()
        if !IsObjectiveDisplayed(15)
            SetObjectiveDisplayed(15)
        endif
        SetObjectiveFailed(15)
        EvaluateAllPackages()
    else
        SetObjectiveDisplayed(15, true, true)
    endif
EndFunction

Function EvaluateAllPackages()
    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef()
            Attackers[i].GetActorRef().EvaluatePackage()
        endif
        i += 1
    endwhile
    AttackerCommander.GetActorRef().EvaluatePackage()
EndFunction

Function SimulateCasualties()
    float WinChance = 60
    float TroopsLost = 0
    int AttackerPowerLevel = TroopsRemainingAttackers*3
    int DefenderPowerLevel
    debug.trace("Attacker Power Level = " + AttackerPowerLevel)
    int defendernum = 0
    while defendernum < FortGarrison.GetSize()
        Actor Troop = FortGarrison.GetAt(defendernum) as Actor
        ActorBase TroopBase = Troop.GetActorBase()
        DefenderPowerLevel += (ManageArmy.TroopUpgradeLevels.GetAt(ManageArmy.Troops.Find(TroopBase)) as GlobalVariable).GetValueInt()
        defendernum += 1
    endwhile
    debug.trace("Defender Power Level = " + DefenderPowerLevel)
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
            ((FortGarrison.GetAt(i) as Actor) as CS_UpgradeTroopOnAttach).FlaggedForDeath = true
            i += 1
        endwhile
        debug.notification(TroopsLost as int + " Troops were lost")
        WinQuest()
    else

        GuaranteedFail = true

        int i = 0
        while i < FortGarrison.GetSize()
            ((FortGarrison.GetAt(i) as Actor) as CS_UpgradeTroopOnAttach).FlaggedForDeath = true
            i += 1
        endwhile

        FailQuest()

    endif
    FortGarrison.Revert()

EndFunction

Function DeleteAllAttackers()
    int i = 0
    while i < Attackers.Length
        Attackers[i].GetActorRef().disable()
        Attackers[i].GetActorRef().delete()
        i += 1
    endwhile
EndFunction

Function WinQuest()
    UnRegisterForUpdate()
    UnRegisterForUpdateGameTime()
    KillFlaggedTroops()
    TMDataScript.RecoveryTimes[fortnum] = TMDataScript.GameDaysPassed.GetValue() + 1
    TMDataScript.WarPriority = -1
    TMDataScript.AttackingArmies = 0
    SetStage(20)
EndFunction

Function FailQuest()
    TMDataScript.AttackingArmies = 0
    KillFlaggedTroops()
    CommanderScript.ArmyScripts[CommanderScript.GetCommanderArmyNum(FortCommander.GetActorRef())].Blockaded = false
    CommanderScript.TakeFortFromCommander(FortCommander.GetActorRef())
    SetStage(21)
EndFunction

Event OnUpdateGameTime()
    if !Fort.GetLocation().IsLoaded()
        SimulateCasualties()
    endif
EndEvent

Function LoseFort()
    CS_StoryTransferHoldingFort.SendStoryEvent(aiValue1 = fortnum, aiValue2 = enemyfactionnum)
    (TriggerBoxes.GetAt(fortnum) as ObjectReference).enable()
    CommanderScript.ArmyScripts[CommanderScript.GetCommanderArmyNum(FortCommander.GetActorRef())].Blockaded = false
EndFunction

