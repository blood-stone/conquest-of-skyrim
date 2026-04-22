Scriptname CS_AttackFortCampScript extends Quest  conditional

int Property holdnum Auto
int Property enemyfactionnum Auto

int Property FailingQuest Auto conditional
int Property AdditionalTroopsDead Auto

Quest Property AttackFortQuest Auto

LocationAlias Property FortLoc Auto
LocationAlias Property HoldLoc Auto
LocationAlias Property Camp Auto

string Property type Auto

ReferenceAlias[] Property AttackerMarkers1 Auto
ReferenceAlias[] Property AttackerMarkers2 Auto
ReferenceAlias[] Property CommanderMarkers1 Auto
ReferenceAlias[] Property CommanderMarkers2 Auto
ReferenceAlias[] Property Attackers Auto
ReferenceAlias[] Property Commanders Auto

ReferenceAlias Property AttackMarker Auto
ReferenceAlias Property BatteringRam Auto
ReferenceAlias Property BatteringRam2 Auto
ReferenceAlias Property FortGate Auto
ReferenceAlias Property FortGate2 Auto
ReferenceAlias Property Ladder1 Auto
ReferenceAlias Property Ladder2 Auto
ReferenceAlias Property CampMarker1 Auto
ReferenceAlias Property CampMarker2 Auto
ReferenceAlias Property BackDoorTrigger Auto

ReferenceAlias[] Property DefenderMarkersMelee Auto
ReferenceAlias[] Property DefenderMarkersRanged Auto
ReferenceAlias[] Property Defenders Auto
ReferenceAlias[] Property DefenderCommanders Auto

ReferenceAlias Property FireMarker Auto

int Property AttackersInitial Auto
int Property TroopsRemainingAttackers Auto
int Property DefendersInitial Auto
int Property TroopsRemainingDefenders Auto
int Property DefenderCommandersDeployed Auto
int Property AttackEntrance Auto conditional
int Property NumCatapults Auto
int Property NumLadders Auto conditional
int Property MaxAttackers Auto
int Property MaxDefenders Auto

int Property CompositionMelee Auto
int Property CompositionRanged Auto
int Property CompositionHealer Auto
int Property CompositionBuffer Auto

bool Property DoubleAttack Auto conditional
bool Property AttackGates Auto conditional
bool Property AttackLadders Auto conditional
bool Property BatteringRamEnabled Auto
bool Property LaddersActivated Auto conditional
bool Property BattleWon Auto

ReferenceAlias Property TriggerBox Auto
bool Property TriggerBoxActivated Auto

Faction Property AttackSpawn1Faction Auto
Faction Property AttackSpawn2Faction Auto
Faction Property RetreatFaction Auto
Faction Property RangedFaction Auto

Faction Property CS_ArmyMeleeFaction Auto
Faction Property CS_ArmyRangedFaction Auto
Faction Property CS_ArmyBufferFaction Auto
Faction Property CS_ArmyHealerFaction Auto

GlobalVariable Property TroopsRemainingAttackersPercent Auto
GlobalVariable Property TroopsRemainingDefendersPercent Auto
GlobalVariable Property FortDoorHealth Auto
GlobalVariable Property CS_BattleSize Auto
GlobalVariable Property CS_BattleSpeed Auto

ActorBase Property ImperialSoldier Auto
ActorBase Property ImperialArcher Auto
ActorBase Property ImperialCommander Auto

ActorBase Property StormcloakSoldier Auto
ActorBase Property StormcloakArcher Auto
ActorBase Property StormcloakCommander Auto

FormList Property AttackingCommanders Auto
FormList Property AttackTroops Auto
FormList Property AttackTroopsMelee Auto
FormList Property AttackTroopsRanged Auto
FormList Property AttackTroopsHealers Auto
FormList Property AttackTroopsBuffers Auto
FormList Property AllLocationsCS Auto
FormList Property AllHolds Auto
FormList Property TriggerBoxesFort Auto
FormList Property TriggerBoxesCampImp Auto
FormList Property TriggerBoxesCampSons Auto
FormList Property CampMarkers1 Auto
FormList Property CampMarkers2 Auto
FormList Property InvasionObjectivesQuest Auto
FormList Property DefenderSpawnsFortAll Auto
FormList Property AllLocationsFort Auto

Keyword Property CWOwner Auto
Keyword Property CS_StoryTransferHoldingFort Auto

ObjectReference Property PrisonerMarker Auto

Scene Property ToVictoryScene Auto

CS_TroopManageMenuScript Property ManageArmy Auto
CS_PatrolHoldScript Property CommanderScript Auto
CS_AttackPlanningNewScript Property AttackPlanning Auto
CS_TransferOwnershipScript Property TransferOwnership Auto
CS_PrisonerQuestScript Property PrisonerScript Auto
CS_AttackFortStagingScript Property FortStaging Auto
CS_AttackCampStagingScript Property CampStaging Auto
CS_TMScript Property TMScriptImp Auto
CS_TMScript Property TMScriptSons Auto
CS_BattleTrackerScript Property BattleTracker Auto

Function SetUp()
    

    if type == "Fort"

        ;holdnum = FortStaging.holdnum
        ;FortStaging.holdnum = -1

        if holdnum <= 0
            holdnum =  AllLocationsFort.Find(FortLoc.GetLocation())
        endif

        BackDoorTrigger.TryToEnable()

        ;TriggerBoxActivated = FortStaging.TriggerBoxTriggered
        ;FortStaging.TriggerBoxTriggered = false

        BattleTracker.Forts[holdnum] = true

        if !TriggerBoxActivated
            debug.notification("Providing plan to Commanders...")
            AttackEntrance = AttackPlanning.AttackEntrance
            DoubleAttack = AttackPlanning.DoubleAttack
            BatteringRamEnabled = AttackPlanning.BatteringRams.GetValueInt() as bool
            NumCatapults = AttackPlanning.Catapults.GetValueInt()
            NumLadders = AttackPlanning.Ladders.GetValueInt()
        endif

        TriggerBox.ForceRefTo(TriggerBoxesFort.GetAt(holdnum) as ObjectReference)
        TriggerBox.GetRef().disable()

        if holdnum != 5 && holdnum != 8
            FortGate.GetRef().enable()
            FortGate2.TryToEnable()
            FortDoorHealth.SetValue(100)
        endif

        if FortLoc.GetLocation().GetKeywordData(CWOwner) == 1
            enemyfactionnum = 11
        elseif FortLoc.GetLocation().GetKeywordData(CWOwner) == 2
            enemyfactionnum = 12
        endif

        int i = 0
        bool foundmarker = false
        while i < CampMarkers1.GetSize() && foundmarker == false
            if (CampMarkers1.GetAt(i) as ObjectReference).IsInLocation(FortLoc.GetLocation())
                CampMarker1.ForceRefTo(CampMarkers1.GetAt(i) as ObjectReference)
                foundmarker = true
            endif
            i += 1
        endwhile

        i = 0
        foundmarker = false
        while i < CampMarkers2.GetSize() && foundmarker == false
            if (CampMarkers2.GetAt(i) as ObjectReference).IsInLocation(FortLoc.GetLocation())
                CampMarker2.ForceRefTo(CampMarkers2.GetAt(i) as ObjectReference)
                foundmarker = true
            endif
            i += 1
        endwhile

    elseif type == "Camp"

        ;holdnum = CampStaging.holdnum
        ;CampStaging.holdnum = -1
        HoldLoc.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)

        ;enemyfactionnum = CampStaging.enemyfactionnum
        ;CampStaging.enemyfactionnum = 0

        if enemyfactionnum == 11
            TriggerBox.ForceRefTo(TriggerBoxesCampImp.GetAt(holdnum) as ObjectReference)
        elseif enemyfactionnum == 12
            TriggerBox.ForceRefTo(TriggerBoxesCampSons.GetAt(holdnum) as ObjectReference)
        endif

        if (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(TMScriptImp.LandSuperiority) != 1

            if enemyfactionnum == 11
                TMScriptImp.RemovePatrols(holdnum)
            elseif enemyfactionnum == 12
                TMScriptSons.RemovePatrols(holdnum)
            endif

        endif

        TriggerBox.GetRef().disable()

        ;TriggerBoxActivated = CampStaging.TriggerBoxActivated
        ;CampStaging.TriggerBoxActivated = false

        AttackEntrance = 1
        DoubleAttack = false
        
    endif

    ((self as Quest) as CS_AttackFortCampTroopDeathAttacker).SetUpSpawn()
    ;((self as Quest) as CS_AttackFortCampTroopDeathDefender).SetUpSpawn()

    if !TriggerBoxActivated

        AssignAllTroops()
        DisableAllAttackers()

        if type == "Fort"

            if DoubleAttack == true
                CampMarker1.GetRef().enable()
                CampMarker2.GetRef().enable()
                CampMarker1.GetRef().AddToMap(true)
                CampMarker2.GetRef().AddToMap(true)
            elseif AttackEntrance == 1
                CampMarker1.GetRef().enable()
                CampMarker1.GetRef().AddToMap(true)
            elseif AttackEntrance == 2
                CampMarker2.GetRef().enable()
                CampMarker2.GetRef().AddToMap(true)
            endif

        endif
        
        debug.notification("Invasion Launched!")

        SetObjectiveDisplayed(0)

    else

        PreBattle()
        SetStage(10)

    endif

EndFunction

Function PreBattle()

    AttackersInitial = AttackTroops.GetSize()
    if type == "Fort"
        AttackGates = true
        DefendersInitial = 40
        if holdnum != 5 && holdnum != 8
            if BatteringRamEnabled
                BatteringRam.GetRef().enable()
                BatteringRam2.TryToEnable()
            endif
            if (AttackEntrance == 1 || DoubleAttack) && NumLadders == 1
                Ladder1.GetRef().enable()
                AttackLadders = true
            elseif AttackEntrance == 2 && NumLadders == 1
                Ladder2.GetRef().enable()
                AttackLadders = true
            elseif NumLadders == 2
                Ladder1.GetRef().enable()
                Ladder2.GetRef().enable()
                AttackLadders = true
            endif
        endif
    elseif type == "Camp"
        if enemyfactionnum == 11
            if (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(TMScriptImp.LandSuperiority) != enemyfactionnum
                DefendersInitial = 20*(TMScriptImp.TMData.GetKeywordData(TMScriptImp.AttackingArmies) as int)
            else
                DefendersInitial = 20*((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(TMScriptImp.ArmiesPatrolling) as int)
            endif
        elseif enemyfactionnum == 12
            if (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(TMScriptSons.LandSuperiority) != enemyfactionnum
                DefendersInitial = 20*(TMScriptSons.TMData.GetKeywordData(TMScriptSons.AttackingArmies) as int)
            else
                DefendersInitial = 20*((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(TMScriptSons.ArmiesPatrolling) as int)
            endif
        endif
    endif

    if AttackersInitial >= DefendersInitial ; Replaced 20 with "CS_BattleSize.GetValueInt()")
        MaxDefenders = math.floor(CS_BattleSize.GetValueInt()*(DefendersInitial as float)/(AttackersInitial as float))
        MaxAttackers = CS_BattleSize.GetValueInt()
    else
        MaxDefenders = CS_BattleSize.GetValueInt()
        MaxAttackers = math.floor(CS_BattleSize.GetValueInt()*(AttackersInitial as float)/(DefendersInitial as float))
    endif

    CS_ReinforcementControllerA ReinforcementController = (self as Quest) as CS_ReinforcementControllerA

    ReinforcementController.Attackers = Attackers
    ReinforcementController.AttackTroops = AttackTroops
    ReinforcementController.Defenders = Defenders
    ReinforcementController.DefenderSpawn = DefenderMarkersMelee

    SpawnDefenders()

    TroopsRemainingAttackersPercent.SetValue(100)
    TroopsRemainingDefendersPercent.SetValue(100)
    UpdateCurrentInstanceGlobal(TroopsRemainingDefendersPercent)
    UpdateCurrentInstanceGlobal(TroopsRemainingAttackersPercent)
    TroopsRemainingAttackers = AttackersInitial
    TroopsRemainingDefenders = DefendersInitial

    TroopsRemainingAttackersPercent.SetValue(100)
    TroopsRemainingDefendersPercent.SetValue(100)
    UpdateCurrentInstanceGlobal(TroopsRemainingDefendersPercent)
    UpdateCurrentInstanceGlobal(TroopsRemainingAttackersPercent)

    SetObjectiveCompleted(0)
    SetObjectiveDisplayed(10)
    SetObjectiveDisplayed(11)

    if type == "Fort"
        ReinforcementController.DefenderSpawnFort = DefenderSpawnsFortAll.GetAt(holdnum) as FormList
    endif

    if !TriggerBoxActivated
        SpawnAttackers()
    endif

    RegisterForUpdate(5)

EndFunction

Function SpawnDefenders()
    int i = 0
    while i < MaxDefenders
        Actor Troop
        if type == "Fort"
            int randomint = utility.randomint(0, 1)
            if randomint == 0
                ObjectReference SpawnPoint = DefenderMarkersMelee[i].GetRef()
                if !DefenderMarkersMelee[i].GetRef()
                    SpawnPoint = DefenderMarkersMelee[0].GetRef()
                endif
                if enemyfactionnum == 11
                    Troop = SpawnPoint.PlaceAtMe(ImperialSoldier) as Actor
                elseif enemyfactionnum == 12
                    Troop = SpawnPoint.PlaceAtMe(StormcloakSoldier) as Actor
                endif
            elseif randomint == 1
                ObjectReference SpawnPoint = DefenderMarkersRanged[i].GetRef()
                if !DefenderMarkersRanged[i].GetRef()
                    SpawnPoint = DefenderMarkersRanged[0].GetRef()
                endif
                if enemyfactionnum == 11
                    Troop = SpawnPoint.PlaceAtMe(ImperialArcher) as Actor
                elseif enemyfactionnum == 12
                    Troop = SpawnPoint.PlaceAtMe(StormcloakArcher) as Actor
                endif
            endif
        elseif type == "Camp"
            int randomspawn = utility.randomint(0, DefenderMarkersMelee.Length - 1)
            ObjectReference SpawnPoint = DefenderMarkersMelee[randomspawn].GetRef()
            if !DefenderMarkersMelee[randomspawn].GetRef()
                SpawnPoint = DefenderMarkersMelee[0].GetRef()
            endif
            if enemyfactionnum == 11
                Troop = SpawnPoint.PlaceAtMe(ImperialSoldier) as Actor
            elseif enemyfactionnum == 12
                Troop = SpawnPoint.PlaceAtMe(StormcloakSoldier) as Actor
            endif
        endif
        Defenders[i].ForceRefTo(Troop)
        if i == 5 || i == 10 || i == 15
            Utility.Wait(0.5)
        endif
        i += 1
    endwhile
    Actor CommanderRef
    if enemyfactionnum == 11
        CommanderRef = DefenderMarkersMelee[0].GetRef().PlaceAtMe(ImperialCommander) as Actor
    elseif enemyfactionnum == 12
        CommanderRef = DefenderMarkersMelee[0].GetRef().PlaceAtMe(StormcloakCommander) as Actor
    endif
    DefenderCommanders[0].ForceRefTo(CommanderRef)
    DefenderCommandersDeployed += 1
EndFunction

Function SpawnAttackers()
    debug.trace("-------------------Attacker Spawn Started----------------------")
    GetTroopComposition()
    int i = 0
    int MeleeSpawned = 0
    int RangedSpawned = 0
    int HealerSpawned = 0
    int BufferSpawned = 0
    int NumCommanders = AttackingCommanders.GetSize()
    if DoubleAttack == true
        int NumCommandersHalf = math.floor(0.5*(NumCommanders as float))
        while i < NumCommandersHalf
            Commanders[i].GetActorRef().MoveTo(CommanderMarkers1[i].GetRef())
            Commanders[i].GetActorRef().SetActorValue("Confidence", 4)
            Commanders[i].GetActorRef().SetActorValue("Assistance", 1)
            Commanders[i].GetActorRef().SetActorValue("Aggression", 1)
            i += 1
        endwhile
        while i < NumCommanders
            Commanders[i].GetActorRef().MoveTo(CommanderMarkers2[i].GetRef())
            Commanders[i].GetActorRef().SetActorValue("Confidence", 4)
            Commanders[i].GetActorRef().SetActorValue("Assistance", 1)
            Commanders[i].GetActorRef().SetActorValue("Aggression", 1)
            i += 1
        endwhile
        int SpawnAttackers
        if AttackTroops.GetSize() >= MaxAttackers
            SpawnAttackers = MaxAttackers
        else
            SpawnAttackers = AttackTroops.GetSize()
        endif
        int SpawnAttackersHalf = math.floor(0.5*(SpawnAttackers as float)) 
        i = 0
        while i < SpawnAttackersHalf
            Actor Troop
            if math.floor((CompositionMelee as float)/2) > MeleeSpawned
                Troop = GetFromList("Melee")
                MeleeSpawned += 1
            elseif math.floor((CompositionRanged as float)/2) > RangedSpawned
                Troop = GetFromList("Ranged")
                RangedSpawned += 1
            elseif math.floor((CompositionHealer as float)/2) > HealerSpawned
                Troop = GetFromList("Healers")
                HealerSpawned += 1
            elseif math.floor((CompositionBuffer as float)/2) > BufferSpawned
                Troop = GetFromList("Buffers")
                BufferSpawned += 1
            endif
            Troop.enable()
            Troop.reset()
            Attackers[i].ForceRefTo(Troop)
            AttackTroops.RemoveAddedForm(Troop)
            RemoveTroopFromList(Troop)
            Troop.MoveTo(AttackerMarkers1[i].GetRef())
            Attackers[i].GetActorRef().AddToFaction(AttackSpawn1Faction)
            i += 1
        endwhile
        while i < SpawnAttackers
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
            Troop.reset()
            Attackers[i].ForceRefTo(Troop)
            AttackTroops.RemoveAddedForm(Troop)
            RemoveTroopFromList(Troop)
            Troop.MoveTo(AttackerMarkers2[i].GetRef())
            Attackers[i].GetActorRef().AddToFaction(AttackSpawn2Faction)
            i += 1
        endwhile
    else
        while i < NumCommanders
            if AttackEntrance == 1
                if type == "Fort"
                    Commanders[i].GetActorRef().MoveTo(CommanderMarkers1[i].GetRef())
                    Commanders[i].GetActorRef().SetActorValue("Confidence", 4)
                    Commanders[i].GetActorRef().SetActorValue("Assistance", 1)
                    Commanders[i].GetActorRef().SetActorValue("Aggression", 1)
                elseif type == "Camp"
                    int randomspawn = utility.randomint(0, AttackerMarkers1.Length - 1)
                    Commanders[i].GetActorRef().MoveTo(AttackerMarkers1[randomspawn].GetRef())
                    Commanders[i].GetActorRef().SetActorValue("Confidence", 4)
                    Commanders[i].GetActorRef().SetActorValue("Assistance", 1)
                    Commanders[i].GetActorRef().SetActorValue("Aggression", 1)
                endif
            else
                Commanders[i].GetActorRef().MoveTo(CommanderMarkers2[i].GetRef())
                Commanders[i].GetActorRef().SetActorValue("Confidence", 4)
                Commanders[i].GetActorRef().SetActorValue("Assistance", 1)
                Commanders[i].GetActorRef().SetActorValue("Aggression", 1)
            endif
            i += 1
        endwhile
        i = 0
        int attackersspawned = 0
        while i < MaxAttackers ;Attackers.Length

            if AttackEntrance == 1
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
                Troop.reset()
                Attackers[i].ForceRefTo(Troop)
                AttackTroops.RemoveAddedForm(Troop)
                ;RemoveTroopFromList(Troop)
                if type == "Fort"
                    Attackers[i].GetActorRef().reset()
                    Attackers[i].GetActorRef().MoveTo(AttackerMarkers1[i].GetRef())
                    Troop.AddToFaction(AttackSpawn1Faction)
                elseif type == "Camp"
                    int randomspawn = utility.randomint(0, AttackerMarkers1.Length - 1)
                    if AttackerMarkers1[randomspawn].GetRef().IsDisabled() == true
                        AttackerMarkers1[randomspawn].GetRef().enable()
                    endif
                    Attackers[i].GetActorRef().reset()
                    Attackers[i].GetActorRef().MoveTo(AttackerMarkers1[randomspawn].GetRef())
                    Attackers[i].GetActorRef().StopCombat()
                    if AttackerMarkers1[randomspawn].GetRef() != None && Attackers[i].GetActorRef() != None && Attackers[i].GetActorRef().IsEnabled() == 1
                        attackersspawned += 1
                        debug.trace("Attacker " + attackersspawned + " Spawned!")
                    endif
                endif
            else
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
                Troop.reset()
                Attackers[i].ForceRefTo(Troop)
                AttackTroops.RemoveAddedForm(Troop)
                RemoveTroopFromList(Troop)
                Attackers[i].GetActorRef().reset()
                Attackers[i].GetActorRef().MoveTo(AttackerMarkers2[i].GetRef())
                Troop.AddToFaction(AttackSpawn2Faction)
            endif
            if i == 5 || i == 10 || i == 15
                Utility.Wait(0.5)
            endif
            i += 1
        endwhile
       
        debug.trace("-------------------Attacker Spawn Finished----------------------")
    endif
EndFunction

Actor Function GetFromList(string trooptype)
    int i = 0
    bool foundtroop = false
    
    if trooptype == "Melee"
        while i < AttackTroopsMelee.GetSize() && !foundtroop
            Actor Troop = (AttackTroopsMelee.GetAt(i) as Actor)
            if Troop && Troop.IsDisabled()
                foundtroop = true
                AttackTroopsMelee.RemoveAddedForm(Troop)
                return Troop
            endif
            i += 1
        endwhile
    elseif trooptype == "Ranged"
        while i < AttackTroopsRanged.GetSize() && !foundtroop
            Actor Troop = (AttackTroopsRanged.GetAt(i) as Actor)
            if Troop && Troop.IsDisabled()
                foundtroop = true
                AttackTroopsRanged.RemoveAddedForm(Troop)
                return Troop
            endif
            i += 1
        endwhile
    elseif trooptype == "Healers"
        while i < AttackTroopsHealers.GetSize() && !foundtroop
            Actor Troop = (AttackTroopsHealers.GetAt(i) as Actor)
            if Troop && Troop.IsDisabled()
                foundtroop = true
                AttackTroopsHealers.RemoveAddedForm(Troop)
                return Troop
            endif
            i += 1
        endwhile
    elseif trooptype == "Buffers"
        while i < AttackTroopsBuffers.GetSize() && !foundtroop
            Actor Troop = (AttackTroopsBuffers.GetAt(i) as Actor)
            if Troop && Troop.IsDisabled()
                foundtroop = true
                AttackTroopsBuffers.RemoveAddedForm(Troop)
                return Troop
            endif
            i += 1
        endwhile
    endif
EndFunction

Function EnableAllAttackers()
    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef() != None
            Attackers[i].GetActorRef().enable()
            Attackers[i].GetActorRef().reset()
            Attackers[i].GetActorRef().MoveTo(Game.GetPlayer())
            if Attackers[i].GetActorRef().IsEnabled()
                debug.trace("Attacker " + i + " is enabled and is " + Attackers[i].GetActorRef().GetDistance(Game.GetPlayer()) + " away!")
            else
                debug.trace("Attacker " + i + " is disabled!")
            endif
        endif
        i += 1
    endwhile
EndFunction

Function DisableAllAttackersInitial()
    int i = 0
    while i < AttackTroops.GetSize()
        Actor Troop = AttackTroops.GetAt(i) as Actor
        if Troop.Is3DLoaded()
            (Troop as CS_AttackingTroopDeath).MarkForDisable()
        else
            Troop.disable()
        endif
        i += 1
    endwhile
EndFunction

Function DisableAllAttackers()
    int i = 0
    while i < AttackTroops.GetSize()
        if !(AttackTroops.GetAt(i) as Actor).IsDisabled()
            (AttackTroops.GetAt(i) as Actor).disable()
        endif
        i += 1
    endwhile
EndFunction

Function RemoveAllDeadFromList()
    int i = 0
    while i < AttackTroops.GetSize()
        if (AttackTroops.GetAt(i) as Actor).IsDead() == 1
            AttackTroops.RemoveAddedForm(AttackTroops.GetAt(i))
        endif
        i += 1
    endwhile
EndFunction

Function AssignAllTroops()
    debug.notification("Distributing plan to Commanders...")
    AttackTroops.Revert()
    AttackTroopsMelee.Revert()
    AttackTroopsRanged.Revert()
    AttackTroopsHealers.Revert()
    AttackTroopsBuffers.Revert()
    int i = 0
    while i < AttackingCommanders.GetSize()
        CommanderScript.ClearDisabler(AttackingCommanders.GetAt(i) as Actor)
        int armynum = CommanderScript.GetCommanderArmyNum(AttackingCommanders.GetAt(i) as Actor)
        CommanderScript.ArmyScripts[armynum].SpawnCommander = CommanderScript.Commanders[armynum].GetActorRef()
        CommanderScript.ArmyScripts[armynum].RegisterForSingleUpdate(0.2)
        CommanderScript.FollowCommander[armynum].SetValue(0)
        Commanders[i].ForceRefTo(AttackingCommanders.GetAt(i) as Actor)
        i += 1
    endwhile
    utility.wait(5)
    debug.notification("Commanders assigning orders to troops...")
    i = 0
    while i < AttackingCommanders.GetSize()
        int armynum = CommanderScript.GetCommanderArmyNum(AttackingCommanders.GetAt(i) as Actor)
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
            AttackTroops.AddForm(ArmyTroops[troopnum])
            if ArmyTroops[troopnum].IsInFaction(CS_ArmyMeleeFaction)
                AttackTroopsMelee.AddForm(ArmyTroops[troopnum])
            elseif ArmyTroops[troopnum].IsInFaction(CS_ArmyRangedFaction)
                AttackTroopsRanged.AddForm(ArmyTroops[troopnum])
            elseif ArmyTroops[troopnum].IsInFaction(CS_ArmyHealerFaction)
                AttackTroopsHealers.AddForm(ArmyTroops[troopnum])
            elseif ArmyTroops[troopnum].IsInFaction(CS_ArmyBufferFaction)
                AttackTroopsBuffers.AddForm(ArmyTroops[troopnum])
            endif
        endif
        troopnum += 1
    endwhile
EndFunction

Function GetTroopComposition()
    int MeleeSize = AttackTroopsMelee.GetSize()
    int RangedSize = AttackTroopsRanged.GetSize()
    int HealerSize = AttackTroopsHealers.GetSize()
    int BufferSize = AttackTroopsBuffers.GetSize()
    
    int TotalTroops = AttackTroopsMelee.GetSize() + AttackTroopsRanged.GetSize() + AttackTroopsHealers.GetSize() + AttackTroopsBuffers.GetSize()
    
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

Function RemoveTroopFromList(Actor Troop)
    if Troop.IsInFaction(CS_ArmyMeleeFaction)
        AttackTroopsMelee.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(CS_ArmyRangedFaction)
        AttackTroopsRanged.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(CS_ArmyHealerFaction)
        AttackTroopsHealers.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(CS_ArmyBufferFaction)
        AttackTroopsBuffers.RemoveAddedForm(Troop)
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
    i = 0
    while i < Commanders.Length
        if Commanders[i].GetActorRef()
            Commanders[i].GetActorRef().EvaluatePackage()
        endif
        i += 1
    endwhile
EndFunction

Function ClearAttackerFactions()
    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef()
            Attackers[i].GetActorRef().RemoveFromFaction(AttackSpawn1Faction)
            Attackers[i].GetActorRef().RemoveFromFaction(AttackSpawn2Faction)
        endif
        i += 1
    endwhile
EndFunction

Function DeleteDefenders()
    int i = 0
    while i < Defenders.Length
        Defenders[i].GetActorRef().delete()
        i += 1
    endwhile
EndFunction

Function ReturnCommanders()
    int i = 0
    while i < Commanders.Length
        if Commanders[i].GetActorRef() != None
            int armynum = CommanderScript.GetCommanderArmyNum(Commanders[i].GetActorRef())
            CommanderScript.ReturnToJob(Commanders[i].GetActorRef(), true)
            CommanderScript.FollowCommander[armynum].SetValue(1)
            CommanderScript.ArmyScripts[armynum].KillFlaggedTroops()
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

Function SetUpTroopRespawn()
    int i = 0
    while i < Commanders.Length
        CommanderScript.SetUpForTroopRespawn(Commanders[i].GetActorRef())
        i += 1
    endwhile
EndFunction

Function SetEnemyCasualties()
    if type == "Camp"
        int armiesleft = math.ceiling(TroopsRemainingAttackers as float/20) as int
        if enemyfactionnum == 11
            if (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(TMScriptImp.LandSuperiority) != enemyfactionnum
                TMScriptImp.TMData.SetKeywordData(TMScriptImp.AttackingArmies, armiesleft)
            else
                (AllLocationsCS.GetAt(holdnum) as Location).SetKeywordData(TMScriptImp.ArmiesPatrolling, armiesleft)
            endif
            TMScriptImp.AssignPatrols(holdnum)
        elseif enemyfactionnum == 12
            if (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(TMScriptSons.LandSuperiority) != enemyfactionnum
                TMScriptSons.TMData.SetKeywordData(TMScriptSons.AttackingArmies, armiesleft)
            else
                (AllLocationsCS.GetAt(holdnum) as Location).SetKeywordData(TMScriptSons.ArmiesPatrolling, armiesleft)
            endif
            TMScriptSons.AssignPatrols(holdnum)
        endif
    endif
EndFunction

Function DamageFortDoor(int newstate)
    FortDoorHealth.SetValue(100 - newstate*25)
    UpdateCurrentInstanceGlobal(FortDoorHealth)
    if FortDoorHealth.GetValue() == 0
        FortGate.GetRef().disable()
        FortGate2.TryToDisable()
        if !IsObjectiveDisplayed(15)
            SetObjectiveDisplayed(15)
        endif
        SetObjectiveCompleted(15)
        EvaluateAllPackages()
    else
        SetObjectiveDisplayed(15, true, true)
    endif
EndFunction

Function DisableSiegeEquipment()
    BatteringRam.GetRef().disable()
    BatteringRam2.TryToDisable()
    Ladder1.GetRef().disable()
    Ladder2.GetRef().disable()
    FortGate.GetRef().disable()
    FortGate2.TryToDisable()
EndFunction

Function TroopsSurrender()
    UnRegisterForUpdate()
    int i = 0
    int troopscaptured = 0
    int troopsfleeing = 0
    while i < DefenderCommanders.Length
        if DefenderCommanders[i].GetActorRef() != None
            if PrisonerScript.ASICPrisonersTotal < 10
                (DefenderCommanders[i].GetActorRef() as CS_DefenderDeath).MarkForSurrender()
                PrisonerScript.PlayerTakePrisoner(DefenderCommanders[i].GetActorRef(), "Commander", enemyfactionnum)
                troopscaptured += 1
            else
                DefenderCommanders[i].GetActorRef().AddToFaction(RetreatFaction)
                troopsfleeing += 1
            endif
            DefenderCommanders[i].Clear()
        endif
        i += 1
    endwhile
    i = 0
    while i < Defenders.Length
        if Defenders[i].GetActorRef().IsDead() == 0 && Defenders[i].GetActorRef() != None
            int randomsurrender = utility.randomint(0, 4)
            if randomsurrender == 4 && PrisonerScript.ASICPrisonersTotal < 10
                (Defenders[i].GetActorRef() as CS_DefenderDeath).MarkForSurrender()
                PrisonerScript.PlayerTakePrisoner(Defenders[i].GetActorRef(), "Troop", enemyfactionnum)
                Defenders[i].Clear()
                troopscaptured += 1
            else
                Defenders[i].GetActorRef().AddToFaction(RetreatFaction)
                Defenders[i].Clear()
                troopsfleeing += 1
            endif
        endif
        i += 1
    endwhile

    if troopscaptured > 0
        debug.notification(troopscaptured + " Troops were captured! " + troopsfleeing + " are fleeing!")
    endif
    StopCombatAttackers()
EndFunction

Function StopCombatAttackers()
    Game.GetPlayer().StopCombat()
    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef() && !Attackers[i].GetActorRef().IsDead()
            Attackers[i].GetActorRef().StopCombat()
        endif
        i += 1
    endwhile
EndFunction

Function WinQuest()
    UnRegisterForUpdateGameTime()
    if type == "Fort"
        CS_StoryTransferHoldingFort.SendStoryEvent(aiValue1 = holdnum, aiValue2 = 1)
        if enemyfactionnum == 11
            TMScriptImp.AdjustWarScore(15)
        elseif enemyfactionnum == 12
            TMScriptSons.AdjustWarScore(15)
        endif
    elseif type == "Camp"
        if enemyfactionnum == 11
            if (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(TMScriptImp.LandSuperiority) != enemyfactionnum
                TMScriptImp.RemoveArmiesFromHold(holdnum)
            else
                TMScriptImp.LoseLandSuperiority(holdnum)
            endif
        elseif enemyfactionnum == 12
            if (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(TMScriptSons.LandSuperiority) != enemyfactionnum
                TMScriptSons.RemoveArmiesFromHold(holdnum)
            else
                TMScriptSons.LoseLandSuperiority(holdnum)
            endif
        endif
    endif
    BattleWon = true
EndFunction

Function DisableEnemyCamp()
    FireMarker.GetRef().disable()
    if enemyfactionnum == 11
        TMScriptImp.DisableCamp(holdnum)
    elseif enemyfactionnum == 12
        TMScriptSons.DisableCamp(holdnum)
    endif
EndFunction

Function FailQuest()
    FailingQuest = 1
    UnRegisterForUpdate()
    if type == "Camp"
        SetEnemyCasualties()
    elseif type == "Fort"
        ;Nothing
    endif
    TriggerBox.GetRef().enable()
    ClearAttackerFactions()
    DeleteDefenders()
    ;SetUpTroopRespawn()
    SetStage(21)
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
    enemyfactionnum = aiValue1
    holdnum = aiValue2
    if akRef1
        TriggerBoxActivated = true
    endif
    SetUp()
endEvent

Event OnUpdateGameTime()
    if !FortLoc.GetLocation().IsLoaded()
        if type == "Fort"
            if FortLoc.GetLocation().GetKeywordData(CWOwner) != 69
                FailQuest()
            endif
        elseif type == "Camp"
            if BattleWon == false
                FailQuest()
            endif
        endif
    endif
EndEvent