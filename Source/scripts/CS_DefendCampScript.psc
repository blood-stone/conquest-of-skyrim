Scriptname CS_DefendCampScript extends Quest  


int Property holdnum Auto
int Property enemyfactionnum Auto

bool Property DefendersSpawned Auto
bool Property AttackersSpawned Auto

LocationAlias Property Hold Auto

ReferenceAlias Property CampMarker Auto
ReferenceAlias[] Property Defenders Auto
ReferenceAlias[] Property Attackers Auto
ReferenceAlias[] Property AttackerCommanders Auto
ReferenceAlias[] Property DefenderCommanders Auto
ReferenceAlias[] Property DefenderSpawn Auto
ReferenceAlias[] Property AttackerSpawn Auto

FormList Property AllHolds Auto
FormList Property CampMarkers Auto
FormList Property DefenseTroops Auto
FormList Property DefenseTroopsMelee Auto
FormList Property DefenseTroopsRanged Auto
FormList Property DefenseTroopsHealers Auto
FormList Property DefenseTroopsBuffers Auto
FormList Property DefenseCommanders Auto
FormList Property AllPatrolCommandersHolds Auto

Faction Property RetreatFaction Auto

ActorBase Property Soldier Auto
ActorBase Property Archer Auto
ActorBase Property Commander Auto

int Property AttackersInitial Auto
int Property TroopsRemainingAttackers Auto
int Property DefendersInitial Auto
int Property TroopsRemainingDefenders Auto
int Property AttackerCommandersDeployed Auto
int Property MaxAttackers Auto
int Property MaxDefenders Auto

int Property CompositionMelee Auto
int Property CompositionRanged Auto
int Property CompositionHealer Auto
int Property CompositionBuffer Auto

Faction Property CS_ArmyMeleeFaction Auto
Faction Property CS_ArmyRangedFaction Auto
Faction Property CS_ArmyHealerFaction Auto
Faction Property CS_ArmyBufferFaction Auto

GlobalVariable Property AttackerCount Auto
GlobalVariable Property TroopsRemainingAttackersPercent Auto
GlobalVariable Property TroopsRemainingDefendersPercent Auto
GlobalVariable Property CS_BattleSize Auto
GlobalVariable Property CS_BattleSpeed Auto

Message Property DefendCampImpMessage Auto

CS_TMScript Property TMDataScript Auto

CS_TroopManageMenuScript Property ManageArmy Auto
CS_PatrolHoldScript Property CommanderScript Auto
CS_PrisonerQuestScript Property PrisonerScript Auto
CS_BattleTrackerScript Property BattleTracker Auto

Function SetUp()
    holdnum = CampMarkers.Find(CampMarker.GetRef())
    (TMDataScript.TriggerBoxesCamp.GetAt(holdnum) as ObjectReference).disable()
    BattleTracker.PlayerCamps[holdnum] = true
    DefenseCommanders = AllPatrolCommandersHolds.GetAt(holdnum) as FormList
    BlockadeDefenders()
    Hold.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
    TroopsRemainingAttackersPercent.SetValue(100)
    TroopsRemainingDefendersPercent.SetValue(100)
    UpdateCurrentInstanceGlobal(TroopsRemainingDefendersPercent)
    UpdateCurrentInstanceGlobal(TroopsRemainingAttackersPercent)
    AssignAllTroops()
    AttackersInitial = 20*TMDataScript.AttackingArmies
    ;DefendersInitial = DefenseTroops.GetSize()
    if AttackersInitial >= DefendersInitial ; Replaced 20 with "CS_BattleSize.GetValueInt()")
        MaxDefenders = math.floor(CS_BattleSize.GetValueInt()*(DefendersInitial as float)/(AttackersInitial as float))
        MaxAttackers = CS_BattleSize.GetValueInt()
    else
        MaxDefenders = CS_BattleSize.GetValueInt()
        MaxAttackers = math.floor(CS_BattleSize.GetValueInt()*(AttackersInitial as float)/(DefendersInitial as float))
    endif
    TroopsRemainingDefenders = DefendersInitial
    TroopsRemainingAttackers = AttackersInitial
    CS_ReinforcementControllerD ReinforcementScript = ((self as Quest) as CS_ReinforcementControllerD)
    ReinforcementScript.DefenseTroops = DefenseTroops
    ReinforcementScript.Defenders = Defenders
    ReinforcementScript.DefenderSpawn = DefenderSpawn
    ReinforcementScript.Attackers = Attackers
    ReinforcementScript.AttackerSpawn = AttackerSpawn
    AttackerCount.SetValue(AttackersInitial)
    UpdateCurrentInstanceGlobal(AttackerCount)
    
    DisableAllDefenders()
    if CampMarker.GetRef().Is3DLoaded()
        SpawnAll()
    endif
    DefendCampImpMessage.show()
    debug.notification("You have " + TroopsRemainingDefenders + " troops defending it!")

    SetObjectiveDisplayed(5)
    SetObjectiveDisplayed(10)

    RegisterForUpdateGameTime(0.5)
EndFunction

Function SpawnAll()
    if !DefendersSpawned
        SpawnDefenders()
    endif

    if !AttackersSpawned
        SpawnAttackers()
    endif

    RegisterForUpdate(5)
EndFunction

Function BlockadeDefenders()
    int i = 0
    while i < DefenseCommanders.GetSize()
        int armynum = CommanderScript.GetCommanderArmyNum(DefenseCommanders.GetAt(i) as Actor)
        CommanderScript.ArmyScripts[armynum].Blockaded = true
        i += 1
    endwhile
EndFunction

Function UnBlockadeDefenders()
    int i = 0
    while i < DefenseCommanders.GetSize()
        int armynum = CommanderScript.GetCommanderArmyNum(DefenseCommanders.GetAt(i) as Actor)
        CommanderScript.ArmyScripts[armynum].Blockaded = false
        i += 1
    endwhile
EndFunction

Function SpawnDefenders()
    debug.trace("--------------Defender Spawn Started-------------")
    GetTroopComposition()
    int i = 0
    int MeleeSpawned = 0
    int RangedSpawned = 0
    int HealerSpawned = 0
    int BufferSpawned = 0
    while i < DefenseCommanders.GetSize()
        Actor DCommander = DefenseCommanders.GetAt(i) as Actor
        int randomspawn = utility.randomint(0, DefenderSpawn.Length - 1)
        DCommander.MoveTo(DefenderSpawn[randomspawn].GetRef())
        i += 1
    endwhile
    i = 0
    while i < MaxDefenders
        int randomspawn = utility.randomint(0, DefenderSpawn.Length - 1)
        Actor Troop
        if CompositionMelee > MeleeSpawned
            Troop = GetFromList("Melee")
            MeleeSpawned += 1
        elseif CompositionRanged > RangedSpawned
            Troop = GetFromList("Ranged")
            RangedSpawned += 1
        elseif CompositionHealer > HealerSpawned
            Troop = GetFromList("Healers")
            HealerSpawned += 1
        elseif CompositionBuffer > BufferSpawned
            Troop = GetFromList("Buffers")
            BufferSpawned += 1
        endif
        Troop.enable()
        Defenders[i].ForceRefTo(Troop)
        DefenseTroops.RemoveAddedForm(Troop)
        RemoveTroopFromList(Troop)
        Troop.MoveTo(DefenderSpawn[randomspawn].GetRef())
        i += 1
    endwhile
    DefendersSpawned = true
    debug.trace("--------------Defender Spawn Finished-------------")
EndFunction

Function SpawnAttackers()
    int i = 0
    while i < MaxAttackers
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
    AttackerCommanders[0].ForceRefTo(CommanderRef)
    AttackerCommandersDeployed += 1
    AttackersSpawned = true
EndFunction

Function DisableAllDefenders()
    int i = 0
    while i < DefenseTroops.GetSize()
        (DefenseTroops.GetAt(i) as Actor).disable()
        i += 1
    endwhile
EndFunction

Function AssignAllTroops()
    DefenseTroops.Revert()
    DefenseTroopsMelee.Revert()
    DefenseTroopsRanged.Revert()
    DefenseTroopsHealers.Revert()
    DefenseTroopsBuffers.Revert()
    int i = 0
    while i < DefenseCommanders.GetSize()
        CommanderScript.ClearDisabler(DefenseCommanders.GetAt(i) as Actor)
        DefenderCommanders[i].ForceRefTo(DefenseCommanders.GetAt(i) as Actor)
        int armynum = CommanderScript.GetCommanderArmyNum(DefenseCommanders.GetAt(i) as Actor)
        CommanderScript.FollowCommander[armynum].SetValue(0)
        i += 1
    endwhile
    i = 0
    while i < DefenseCommanders.GetSize()
        int armynum = CommanderScript.GetCommanderArmyNum(DefenseCommanders.GetAt(i) as Actor)
        AssignTroops(armynum)
        i += 1
    endwhile
EndFunction

Function AssignTroops(int armynum)

    CS_ArmyTroopDeath ArmyScript = CommanderScript.ArmyScripts[armynum]
    Actor[] ArmyTroops = ArmyScript.GetAllTroops()

    int troopnum = 0
    while troopnum < ArmyTroops.Length
        if ArmyTroops[troopnum]
            DefendersInitial += 1
            DefenseTroops.AddForm(ArmyTroops[troopnum])
            if ArmyTroops[troopnum].IsInFaction(CS_ArmyMeleeFaction)
                DefenseTroopsMelee.AddForm(ArmyTroops[troopnum])
            elseif ArmyTroops[troopnum].IsInFaction(CS_ArmyRangedFaction)
                DefenseTroopsRanged.AddForm(ArmyTroops[troopnum])
            elseif ArmyTroops[troopnum].IsInFaction(CS_ArmyHealerFaction)
                DefenseTroopsHealers.AddForm(ArmyTroops[troopnum])
            elseif ArmyTroops[troopnum].IsInFaction(CS_ArmyBufferFaction)
                DefenseTroopsBuffers.AddForm(ArmyTroops[troopnum])
            endif
        endif
        troopnum += 1
    endwhile
EndFunction

Function GetTroopComposition()
    int MeleeSize = DefenseTroopsMelee.GetSize()
    int RangedSize = DefenseTroopsRanged.GetSize()
    int HealerSize = DefenseTroopsHealers.GetSize()
    int BufferSize = DefenseTroopsBuffers.GetSize()
    
    int TotalTroops = DefenseTroopsMelee.GetSize() + DefenseTroopsRanged.GetSize() + DefenseTroopsHealers.GetSize() + DefenseTroopsBuffers.GetSize()
    
    string HighestComposition
    
    CompositionMelee = math.floor((MeleeSize as float)/(TotalTroops as float)*CS_BattleSize.GetValue())
    if CompositionMelee == 0 && MeleeSize > 0
        CompositionMelee = 1
    endif
    HighestComposition = "Melee"
    
    CompositionRanged = math.floor((RangedSize as float)/(TotalTroops as float)*CS_BattleSize.GetValue())
    if CompositionRanged == 0 && RangedSize > 0
        CompositionRanged = 1
    endif
    if CompositionRanged > CompositionMelee
        HighestComposition = "Ranged"
    endif
    
    CompositionHealer = math.floor((HealerSize as float)/(TotalTroops as float)*CS_BattleSize.GetValue())
    if CompositionHealer == 0 && HealerSize > 0
        CompositionHealer = 1
    endif
    if CompositionHealer > CompositionRanged && CompositionHealer > CompositionMelee
        HighestComposition = "Healer"
    endif
    
    CompositionBuffer = math.floor((BufferSize as float)/(TotalTroops as float)*CS_BattleSize.GetValue())
    if CompositionBuffer == 0 && BufferSize > 0
        CompositionBuffer = 1
    endif
    if CompositionBuffer > CompositionRanged && CompositionBuffer > CompositionMelee && CompositionBuffer > CompositionHealer
        HighestComposition = "Buffer"
    endif
    
    int TotalComposition = CompositionMelee + CompositionRanged + CompositionHealer + CompositionBuffer
    
    if TotalComposition > CS_BattleSize.GetValueInt()
        if HighestComposition == "Melee"
            CompositionMelee -= (TotalComposition - CS_BattleSize.GetValueInt())
        elseif HighestComposition == "Ranged"
            CompositionRanged -= (TotalComposition - CS_BattleSize.GetValueInt())
        elseif HighestComposition == "Healer"
            CompositionHealer -= (TotalComposition - CS_BattleSize.GetValueInt())
        elseif HighestComposition == "Buffer"
            CompositionBuffer -= (TotalComposition - CS_BattleSize.GetValueInt())
        endif
    endif
EndFunction

Actor Function GetFromList(string trooptype)
    int i = 0
    bool foundtroop = false
    
    if trooptype == "Melee"
        while i < DefenseTroopsMelee.GetSize() && !foundtroop
            Actor Troop = (DefenseTroopsMelee.GetAt(i) as Actor)
            if Troop && Troop.IsDisabled()
                foundtroop = true
                DefenseTroopsMelee.RemoveAddedForm(Troop)
                return Troop
            endif
            i += 1
        endwhile
    elseif trooptype == "Ranged"
        while i < DefenseTroopsRanged.GetSize() && !foundtroop
            Actor Troop = (DefenseTroopsRanged.GetAt(i) as Actor)
            if Troop && Troop.IsDisabled()
                foundtroop = true
                DefenseTroopsRanged.RemoveAddedForm(Troop)
                return Troop
            endif
            i += 1
        endwhile
    elseif trooptype == "Healers"
        while i < DefenseTroopsHealers.GetSize() && !foundtroop
            Actor Troop = (DefenseTroopsHealers.GetAt(i) as Actor)
            if Troop && Troop.IsDisabled()
                foundtroop = true
                DefenseTroopsHealers.RemoveAddedForm(Troop)
                return Troop
            endif
            i += 1
        endwhile
    elseif trooptype == "Buffers"
        while i < DefenseTroopsBuffers.GetSize() && !foundtroop
            Actor Troop = (DefenseTroopsBuffers.GetAt(i) as Actor)
            if Troop && Troop.IsDisabled()
                foundtroop = true
                DefenseTroopsBuffers.RemoveAddedForm(Troop)
                return Troop
            endif
            i += 1
        endwhile
    endif
EndFunction

Function RemoveTroopFromList(Actor Troop)
    if Troop.IsInFaction(CS_ArmyMeleeFaction)
        DefenseTroopsMelee.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(CS_ArmyRangedFaction)
        DefenseTroopsRanged.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(CS_ArmyHealerFaction)
        DefenseTroopsHealers.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(CS_ArmyBufferFaction)
        DefenseTroopsBuffers.RemoveAddedForm(Troop)
    endif
EndFunction

Function ReturnTroopsToCommander()
    int i = 0
    while i < DefenseCommanders.GetSize()
        int armynum = CommanderScript.GetCommanderArmyNum(DefenseCommanders.GetAt(i) as Actor)
        CommanderScript.FollowCommander[armynum].SetValue(1)
        i += 1
    endwhile
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
                Attackers[i].TryToAddToFaction(RetreatFaction)
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
            AttackerCommanders[i].TryToAddToFaction(RetreatFaction)
            AttackerCommanders[i].Clear()
            troopsfleeing += 1
        endif
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

Function KillFlaggedTroops()
    debug.trace("Quest kill flagged troops started")
    int i = 0
    while i < DefenderCommanders.Length
        if DefenderCommanders[i].GetActorRef() != None
            int armynum = CommanderScript.GetCommanderArmyNum(DefenderCommanders[i].GetActorRef())
            CommanderScript.ArmyScripts[armynum].KillFlaggedTroops()
        endif
        i += 1
    endwhile
EndFunction

Function SetEnemyCasualties()
    int armiesleft = math.ceiling(TroopsRemainingAttackers as float/20) as int
    TMDataScript.AttackingArmies = armiesleft
EndFunction

Function SimulateCasualties()
    float WinChance = 50
    float TroopsLost = 0
    int AttackerPowerLevel = (TroopsRemainingAttackers - 20)*3
    int DefenderPowerLevel
    debug.trace("Attacker Power Level = " + AttackerPowerLevel)
    int defendernum = 0
    while defendernum < DefenseTroops.GetSize()
        Actor Troop = DefenseTroops.GetAt(defendernum) as Actor
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
    int TroopsLostAttacker = math.floor((WinChance/100)*TroopsRemainingAttackers)
    if WinChance <= 40
        WinChance = 0
    elseif WinChance >= 60
        WinChance = 100
    endif

    int randomwin = utility.randomint(1, 100)
    if WinChance >= randomwin
        int i = 0
        while i < TroopsLost
            if (DefenseTroops.GetAt(i) as Actor)
                ((DefenseTroops.GetAt(i) as Actor) as CS_UpgradeTroopOnAttach).FlaggedForDeath = true
            endif
            i += 1
        endwhile
        debug.notification(TroopsLost as int + " Troops were lost")
        WinQuest()
    else

        int i = 0
        while i < DefenseTroops.GetSize()
            if (DefenseTroops.GetAt(i) as Actor)
                ((DefenseTroops.GetAt(i) as Actor) as CS_UpgradeTroopOnAttach).FlaggedForDeath = true
            endif
            i += 1
        endwhile

        TroopsRemainingAttackers -= TroopsLostAttacker

        FailQuest()

    endif

    DefenseTroops.Revert()

EndFunction

Function DeleteAllAttackers()
    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef()
            Attackers[i].GetActorRef().disable()
            Attackers[i].GetActorRef().delete()
        endif
        i += 1
    endwhile
EndFunction

Function WinQuest()
    UnRegisterForUpdate()
    KillFlaggedTroops()
    TMDataScript.RemoveArmiesFromHold(holdnum)
    UnBlockadeDefenders()
    ReturnTroopsToCommander()
    SetStage(20)
EndFunction

Function FailQuest()
    KillFlaggedTroops()
    UnBlockadeDefenders()
    int i = 0
    while i < DefenseCommanders.GetSize()
        CommanderScript.StopPatrolHold(DefenseCommanders.GetAt(i) as Actor)
        i += 1
    endwhile
    ReturnTroopsToCommander()
    SetEnemyCasualties()
    TMDataScript.EstablishLandSuperiority(holdnum)
    (TMDataScript.TriggerBoxesCamp.GetAt(holdnum) as ObjectReference).enable()
    SetStage(21)
EndFunction

Event OnUpdateGameTime()
    if CampMarker.GetRef().Is3dLoaded() == false
        SimulateCasualties()
    endif
EndEvent