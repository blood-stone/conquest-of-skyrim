Scriptname CS_AttackCityScript extends Quest  Conditional

; ----------------------------- Global Properties --------------------------------------

FormList Property AllLocations Auto
FormList Property AllLocationsCS Auto
FormList Property AllHoldings Auto
FormList Property TriggerBoxes Auto
FormList Property AttackMarkers1 Auto
FormList Property AttackMarkers2 Auto
FormList Property JarlMarkers Auto
FormList Property GuardMarkers Auto
FormList Property CrimeFactions Auto
FormList Property EnterCityTriggerBoxes Auto
FormList Property CatapultsList Auto
FormList Property CatapultOpsList Auto
FormList Property InvasionObjectivesQuest Auto
FormList Property MarkersImpLists Auto
FormList Property MarkersSonsLists Auto

Scene Property JarlConfrontScene Auto
Scene Property JarlSurrenderScene Auto
Scene Property ToVictoryScene Auto

bool Property BatteringRamEnabled Auto
bool Property DoubleAttack Auto

int Property AttackEntrance Auto

LocationAlias Property City Auto

Location Property CityCS Auto

int Property citynum Auto

GlobalVariable Property CS_BattleSize Auto
GlobalVariable Property CS_BattleSpeed Auto

Faction Property EnemyTroopFaction Auto
Faction Property EnemyTroopFactionNPC Auto
Faction Property PlayerArmyFaction Auto
Faction Property PlayerFaction Auto
Faction Property RetreatFaction Auto
Faction Property POWFaction Auto
Faction Property DrummerFaction Auto

ObjectReference Property PrisonerMarker Auto

MusicType Property MUSCombatCivilWar Auto

Armor Property PrisonerCuffs Auto
Armor Property WarDrums Auto

Sound Property BattleDrumsSound Auto

Quest Property CitizensQuest Auto

bool Property TriggerBoxActivated Auto

Keyword Property CS_StoryTransferHoldingCity Auto
Keyword Property CS_StoryLeaderSurrender Auto

ActorBase Property GeneralTullius Auto
ActorBase Property Rikke Auto
ActorBase Property Ulfric Auto
ActorBase Property Galmar Auto

CS_RecruitJarl Property JarlScript Auto
CS_TransferOwnershipScript Property TransferOwnership Auto
CS_AttackCityStagingScript Property StagingScript Auto

; ----------------------------- Attacker Properties -----------------------------------

int Property AttackersInitial Auto
int Property TroopsRemainingAttackers Auto
int Property NumCatapults Auto
int Property NumLadders Auto Conditional
int Property HealersDeployed Auto
int Property BuffersDeployed Auto

bool Property AttackLadders Auto Conditional
bool Property AttackGates Auto Conditional

GlobalVariable Property TroopsRemainingAttackersPercent Auto

FormList Property AttackTroops Auto
FormList Property AttackTroopsMelee Auto
FormList Property AttackTroopsRanged Auto
FormList Property AttackTroopsBuffers Auto
FormList Property AttackTroopsHealers Auto
FormList Property AttackCommanders Auto
FormList Property AttackerSpawns1 Auto
FormList Property AttackerSpawns2 Auto

Faction Property CS_ArmyMeleeFaction Auto
Faction Property CS_ArmyRangedFaction Auto
Faction Property CS_ArmyHealerFaction Auto
Faction Property CS_ArmyBufferFaction Auto

ReferenceAlias[] Property Attackers Auto
ReferenceAlias[] Property Commanders Auto
ReferenceAlias[] Property AttackersInterior Auto
ReferenceAlias Property AttackerSpawn Auto
ReferenceAlias Property AttackMarker Auto
ReferenceAlias Property AttackMarker2 Auto
ReferenceAlias Property BatteringRam Auto
ReferenceAlias Property Ladder1 Auto
ReferenceAlias Property Ladder2 Auto

Faction Property AttackFaction Auto
Faction Property AttackGateFaction Auto

ActorBase Property RestorationMage Auto
ActorBase Property AlterationMage Auto

; -------------------------- Defender Properties -----------------------------------

int Property DefendersInitial Auto
int Property TroopsRemainingDefenders Auto
int Property DefenderCommandersInitial Auto
int Property DefenderCommandersDeployed Auto
int Property enemyfactionnum Auto

GlobalVariable Property TroopsRemainingDefendersPercent Auto
GlobalVariable Property CityDoorHealth Auto

ReferenceAlias[] Property DefenseMarkersMelee Auto
ReferenceAlias[] Property DefenseMarkersRanged Auto
ReferenceAlias[] Property Defenders Auto
ReferenceAlias[] Property DefenderCommanders Auto
ReferenceAlias[] Property JarlGuards Auto
ReferenceAlias[] Property JarlGuardMarkers Auto
ReferenceAlias[] Property FoodBarrels Auto
ReferenceAlias[] Property WoodBarrels Auto
ReferenceAlias[] Property MetalBarrels Auto
ReferenceAlias[] Property CoinBarrels Auto
ReferenceAlias Property DefendMarker Auto
ReferenceAlias Property CityDoor Auto
ReferenceAlias Property CityDoorCollision Auto
ReferenceAlias Property JarlMarker Auto
ReferenceAlias Property Jarl Auto
ReferenceAlias Property Housecarl Auto
ReferenceAlias Property Barricade1 Auto
ReferenceAlias Property Barricade2 Auto
ReferenceAlias Property LeadersSurrenderAlias Auto
ReferenceAlias Property ASICsSurrenderAlias Auto

Keyword Property CityGarrison Auto
Keyword Property BarracksLevel Auto

int Property CoinInitial Auto
int Property FoodInitial Auto
int Property MetalInitial Auto
int Property WoodInitial Auto

Keyword Property Treasury Auto
Keyword Property FoodReserve Auto
Keyword Property MetalReserve Auto
Keyword Property WoodReserve Auto

FormList Property DefenderSpawns Auto
FormList Property DefenderSpawnsInterior Auto
FormList Property CityDoors Auto

Faction Property EnemyJarlFaction Auto
Faction Property DefendingCityFaction Auto

Actor[] Property RetreatingDefenders Auto

; Imperial Defender Properties -------------------

Faction Property CWImperialFaction Auto
Faction Property CWImperialFactionNPC Auto

ActorBase Property ImperialSoldier Auto
ActorBase Property ImperialArcher Auto
ActorBase Property ImperialCommander Auto
ActorBase[] Property HoldGuardsImp Auto

CS_TMScript Property TMImperial Auto

; Stormcloak Defender Properties ----------------

Faction Property CWSonsFaction Auto
Faction Property CWSonsFactionNPC Auto

ActorBase Property SonsSoldier Auto
ActorBase Property SonsArcher Auto
ActorBase Property SonsCommander Auto
ActorBase[] Property HoldGuardsSons Auto

CS_TMScript Property TMSons Auto

CS_AttackCitySiegeScript Property SiegeScript Auto
CS_PatrolHoldScript Property CommanderScript Auto
CS_PrisonerQuestScript Property PrisonerScript Auto
CS_GovPositions Property GovPositions Auto
CS_BattleTrackerScript Property BattleTracker Auto

Function InitialSetUp()
    citynum = AllLocations.Find(City.GetLocation())
    BattleTracker.Cities[citynum] = true
    CityCS = AllLocationsCS.GetAt(citynum) as Location
    CoinInitial = math.floor(0.75*CityCS.GetKeywordData(Treasury))
    FoodInitial = math.floor(0.75*CityCS.GetKeywordData(FoodReserve))
    MetalInitial = math.floor(0.75*CityCS.GetKeywordData(MetalReserve))
    WoodInitial = math.floor(0.75*CityCS.GetKeywordData(WoodReserve))
    DefenderCommandersInitial = CityCS.GetKeywordData(CityGarrison) as int
    DefendersInitial = 20*DefenderCommandersInitial
    if SiegeScript.holdnum == citynum
        DoubleAttack = SiegeScript.DoubleAttack
        AttackEntrance = SiegeScript.AttackEntrance
        AttackGates = true
        if NumLadders > 0
            AttackLadders = true
        endif
        NumCatapults = SiegeScript.NumCatapults
        int CatapultDeaths = math.floor((0.05*(NumCatapults as float))*(DefendersInitial as float))
        DefendersInitial -= CatapultDeaths
        ;SiegeScript.Stop()
    else
        DisableGuards()
    endif
    AttackersInitial = AttackTroops.GetSize()
    (TriggerBoxes.GetAt(citynum) as ObjectReference).disable()
    TroopsRemainingDefenders = DefendersInitial
    TroopsRemainingAttackers = AttackersInitial
    TroopsRemainingDefendersPercent.SetValue(100)
    TroopsRemainingAttackersPercent.SetValue(100)
    UpdateCurrentInstanceGlobal(TroopsRemainingDefendersPercent)
    UpdateCurrentInstanceGlobal(TroopsRemainingAttackersPercent)
    if Barricade1.GetRef()
        Barricade1.GetRef().enable()
        Barricade1.GetRef().reset()
    endif
    if Barricade2.GetRef()
        Barricade2.GetRef().enable()
        Barricade2.GetRef().reset()
    endif
    Jarl.ForceRefTo(JarlScript.JarlAliases[citynum].GetActorRef())
    JarlMarker.ForceRefTo(JarlMarkers.GetAt(citynum) as ObjectReference)
    AttackMarker.ForceRefTo(AttackMarkers1.GetAt(citynum) as ObjectReference)
    AttackMarker2.ForceRefTo(AttackMarkers2.GetAt(citynum) as ObjectReference)
    DefendMarker.ForceRefTo(Game.GetPlayer())
    PrisonerMarker.MoveTo(Game.GetPlayer())
    ((self as Quest) as CS_AttackCityTroopDeathAttacker).SetUpSpawns()
    ((self as Quest) as CS_AttackCityTroopDeathDefender).SetUpSpawns()
    CS_ReinforcementControllerACity ReinforcementController = (self as Quest) as CS_ReinforcementControllerACity
    ReinforcementController.Attackers = Attackers
    ReinforcementController.AttackTroops = AttackTroops
    ReinforcementController.AttackerSpawn = ((self as Quest) as CS_AttackCityTroopDeathAttacker).Spawns1
    ReinforcementController.Defenders = Defenders
    ReinforcementController.DefenderSpawn = ((self as Quest) as CS_AttackCityTroopDeathDefender).Spawns1
    CitizensQuest.Start()

    MUSCombatCivilWar.Add()
    SetObjectiveDisplayed(5)
    SetObjectiveDisplayed(10)

    if citynum < 5
        (EnterCityTriggerBoxes.GetAt(citynum) as ObjectReference).enable()
        CityDoorCollision.GetRef().enable()
        CityDoor.GetRef().enable()
        CityDoor.GetRef().reset()
        CityDoor.GetRef().ClearDestruction()
        CityDoorHealth.SetValue(100)
        UpdateCurrentInstanceGlobal(CityDoorHealth)
    elseif citynum >= 5
        CityDoorCollision.TryToEnable()
    endif

    if (AllHoldings.GetAt(citynum) as GlobalVariable).GetValue() == 11
        enemyfactionnum = 11
        EnemyTroopFaction = CWImperialFaction
        EnemyTroopFactionNPC = CWImperialFactionNPC
        Housecarl.ForceRefTo(GovPositions.HousecarlsImp[citynum])
        if TMImperial.TMData.GetKeywordData(TMImperial.Capital) == citynum && (TMImperial.CityCount.GetValue() + TMImperial.MinorCityCount.GetValue()) > 1
            TMImperial.DisableLeaders()
        elseif TMImperial.TMData.GetKeywordData(TMImperial.Capital) == citynum && (TMImperial.CityCount.GetValue() + TMImperial.MinorCityCount.GetValue()) == 1
            TMImperial.EnableLeaders()
            Jarl.ForceRefTo(TMImperial.Leader.GetActorRef())
            Housecarl.ForceRefTo(TMImperial.ASIC.GetActorRef())
        endif   
        int i = 0
        while i < CS_BattleSize.GetValueInt() && i < TroopsRemainingDefenders + 10
            ObjectReference DefenderTroopSpawnMelee =  DefenseMarkersMelee[i].GetRef()
            ObjectReference DefenderTroopSpawnRanged =  DefenseMarkersRanged[i].GetRef()
            if DefenderCommandersDeployed == 0
                DefenderCommanders[0].ForceRefTo(DefenderTroopSpawnMelee.PlaceAtMe(ImperialCommander) as Actor)
                DefenderCommanders[0].GetActorRef().AddToFaction(DefendingCityFaction)
                DefenderCommanders[0].GetActorRef().EvaluatePackage()
                DefenderCommandersDeployed += 1
            endif
            int randomtype = utility.randomint(0, 1)
            if randomtype == 0
                Actor NewTroop = DefenderTroopSpawnMelee.PlaceAtMe(ImperialSoldier) as Actor
                Defenders[i].ForceRefTo(NewTroop)
            elseif randomtype == 1
                Actor NewTroop = DefenderTroopSpawnRanged.PlaceAtMe(ImperialArcher) as Actor
                Defenders[i].ForceRefTo(NewTroop)
            endif
            if i == 5 || i == 10 || i == 15
                Utility.Wait(0.5)
            endif
            i += 1
        endwhile
    elseif (AllHoldings.GetAt(citynum) as GlobalVariable).GetValue() == 12
        enemyfactionnum = 12
        EnemyTroopFaction = CWSonsFaction
        EnemyTroopFactionNPC = CWSonsFactionNPC
        Housecarl.ForceRefTo(GovPositions.HousecarlsSons[citynum])
        ;debug.notification("Sons Capital = " + TMSons.TMData.GetKeywordData(TMSons.Capital)+ ", CityCounts = " +  (TMSons.CityCount.GetValueInt() + TMSons.MinorCityCount.GetValueInt()) + " citynum = " + citynum)
        if (TMSons.CityCount.GetValue() + TMSons.MinorCityCount.GetValue()) > 1 && citynum == 4
            ;debug.notification("Sons Capital = " + citynum + ", CityCounts = " +  (TMSons.CityCount.GetValueInt() + TMSons.MinorCityCount.GetValueInt()) + " citynum = " + citynum)
            ;debug.notification("Giving Jarlship to Steward")
            TMSons.DisableLeaders()
            Jarl.ForceRefTo(GovPositions.StewardsSons[citynum])
            Housecarl.Clear()
        elseif TMSons.TMData.GetKeywordData(TMSons.Capital) == citynum && (TMSons.CityCount.GetValue() + TMSons.MinorCityCount.GetValue()) > 1 && citynum != 4
            TMSons.DisableLeaders()
            ;debug.notification("Sons Capital = " + citynum + ", CityCounts = " +  (TMSons.CityCount.GetValueInt() + TMSons.MinorCityCount.GetValueInt()) + " citynum = " + citynum)
            ;debug.notification("Disabling Leaders")
        elseif TMSons.TMData.GetKeywordData(TMSons.Capital) == citynum && (TMSons.CityCount.GetValue() + TMSons.MinorCityCount.GetValue()) == 1
            ;debug.notification("Sons Capital = " + citynum + ", CityCounts = " +  (TMSons.CityCount.GetValueInt() + TMSons.MinorCityCount.GetValueInt()) + " citynum = " + citynum)
            ;debug.notification("Enabling Leaders")
            TMSons.EnableLeaders()
            Jarl.ForceRefTo(TMSons.Leader.GetActorRef())
            Housecarl.ForceRefTo(TMSons.ASIC.GetActorRef())
        endif   
        int i = 0
        while i < CS_BattleSize.GetValueInt() && i < TroopsRemainingDefenders + 10
            ObjectReference DefenderTroopSpawnMelee =  DefenseMarkersMelee[i].GetRef()
            ObjectReference DefenderTroopSpawnRanged =  DefenseMarkersRanged[i].GetRef()
            if DefenderCommandersDeployed == 0
                DefenderCommanders[0].ForceRefTo(DefenderTroopSpawnMelee.PlaceAtMe(SonsCommander) as Actor)
                DefenderCommanders[0].GetActorRef().AddToFaction(DefendingCityFaction)
                DefenderCommanders[0].GetActorRef().EvaluatePackage()
                DefenderCommandersDeployed += 1
            endif
            int randomtype = utility.randomint(0, 1)
            if randomtype == 0
                Actor NewTroop = DefenderTroopSpawnMelee.PlaceAtMe(SonsSoldier) as Actor
                Defenders[i].ForceRefTo(NewTroop)
            elseif randomtype == 1
                Actor NewTroop = DefenderTroopSpawnRanged.PlaceAtMe(SonsArcher) as Actor
                Defenders[i].ForceRefTo(NewTroop)
            endif
            if i == 5 || i == 10 || i == 15
                Utility.Wait(0.5)
            endif
            i += 1
        endwhile
    endif
    
    if SiegeScript.holdnum == citynum
        SiegeScript.Stop()
    endif
    
    ToVictoryScene.ForceStart()

    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef() != None
            Attackers[i].GetActorRef().RemoveFromFaction(AttackFaction)
            Attackers[i].GetActorRef().EvaluatePackage()
            Attackers[i].GetActorRef().AddToFaction(AttackFaction)
            Attackers[i].GetActorRef().EvaluatePackage()
        endif
        i += 1
    endwhile
    i = 0
    while i < Commanders.Length
        if Commanders[i].GetActorRef() != None
            Commanders[i].GetActorRef().RemoveFromFaction(AttackFaction)
            Commanders[i].GetActorRef().EvaluatePackage()
            Commanders[i].GetActorRef().AddToFaction(AttackFaction)
            Commanders[i].GetActorRef().EvaluatePackage()
        endif
        i += 1
    endwhile

    RegisterForUpdate(5)
    RegisterForUpdateGameTime(0.5)
EndFunction

Function DisableGuards()
    FormList ImpList = MarkersImpLists.GetAt(citynum) as FormList
    FormList SonsList = MarkersSonsLists.GetAt(citynum) as FormList
    int i = 0
    while i < ImpList.GetSize()
        (ImpList.GetAt(i) as ObjectReference).disable()
        (SonsList.GetAt(i) as ObjectReference).disable()
        i += 1
    endwhile
EndFunction

Function EnableGuards()
    FormList ImpList = MarkersImpLists.GetAt(citynum) as FormList
    FormList SonsList = MarkersSonsLists.GetAt(citynum) as FormList
    int i = 0
    while i < ImpList.GetSize()
        if enemyfactionnum == 11
            (ImpList.GetAt(i) as ObjectReference).enable()
        elseif enemyfactionnum == 12
            (SonsList.GetAt(i) as ObjectReference).enable()
        endif
        i += 1
    endwhile
EndFunction

Function UpdateAttackerTarget()
    AttackMarker.ForceRefTo(AttackMarker2.GetRef())
    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef()
            Attackers[i].GetActorRef().RemoveFromFaction(AttackFaction)
            Attackers[i].GetActorRef().EvaluatePackage()
            Attackers[i].GetActorRef().AddToFaction(AttackFaction)
            Attackers[i].GetActorRef().EvaluatePackage()
        endif
        i += 1
    endwhile
    i = 0
    while i < Commanders.Length
        if Commanders[i].GetActorRef() != None
            Commanders[i].GetActorRef().RemoveFromFaction(AttackFaction)
            Commanders[i].GetActorRef().EvaluatePackage()
            Commanders[i].GetActorRef().AddToFaction(AttackFaction)
            Commanders[i].GetActorRef().EvaluatePackage()
        endif
        i += 1
    endwhile
EndFunction

Function UnlockCityDoors()
    if citynum < 5
        CityDoor.GetReference().Lock(false)
    endif
EndFunction

Function AssignToGate()
    if AttackGates == true
        int i = 0
        int troopsongate = 0
        while i < Attackers.Length && troopsongate < 5
            if Attackers[i].GetActorRef() != None
                Attackers[i].GetActorRef().AddToFaction(AttackGateFaction)
                troopsongate += 1
            endif
            i += 1
        endwhile
    endif
EndFunction

Function DamageCityDoor(int newstate)
    CityDoorHealth.SetValue(100 - newstate*25)
    UpdateCurrentInstanceGlobal(CityDoorHealth)
    if CityDoorHealth.GetValue() == 0
        CityDoor.GetRef().disable()
        SetObjectiveCompleted(11)
        SetStage(15)
    else
        SetObjectiveDisplayed(11, true, true)
    endif
EndFunction

Function SpawnInteriorDefenders()
    DefendMarker.Clear()
    RetreatDefenders()
    int i = 0

    if (AllHoldings.GetAt(citynum) as GlobalVariable).GetValue() == 11
        i = 0
        while i < 10 && i < DefendersInitial
            ObjectReference DefenderTroopSpawn =  (DefenderSpawnsInterior.GetAt(citynum) as FormList).GetAt(utility.randomint(0, (DefenderSpawnsInterior.GetAt(citynum) as FormList).GetSize() - 1)) as ObjectReference
            if DefenderCommandersDeployed < DefenderCommandersInitial
                DefenderCommanders[DefenderCommandersDeployed].GetActorRef().MoveTo(DefenderTroopSpawn)
                DefenderCommanders[DefenderCommandersDeployed].GetActorRef().AddToFaction(DefendingCityFaction)
                DefenderCommanders[DefenderCommandersDeployed].GetActorRef().EvaluatePackage()
                DefenderCommandersDeployed += 1
            endif       
            int randomtype = utility.randomint(0, 1)
            if randomtype == 0
                Actor NewTroop = DefenderTroopSpawn.PlaceAtMe(ImperialSoldier) as Actor
                Defenders[i].ForceRefTo(NewTroop)
            elseif randomtype == 1
                Actor NewTroop = DefenderTroopSpawn.PlaceAtMe(ImperialArcher) as Actor
                Defenders[i].ForceRefTo(NewTroop)
            endif
            if i == 5 || i == 10 || i == 15
                Utility.Wait(0.5)
            endif
            i += 1
        endwhile
    elseif (AllHoldings.GetAt(citynum) as GlobalVariable).GetValue() == 12
        i = 0
        while i < 10 && i < DefendersInitial
            ObjectReference DefenderTroopSpawn =  (DefenderSpawnsInterior.GetAt(citynum) as FormList).GetAt(utility.randomint(0, (DefenderSpawnsInterior.GetAt(citynum) as FormList).GetSize() - 1)) as ObjectReference
            if DefenderCommandersDeployed < DefenderCommandersInitial
                DefenderCommanders[DefenderCommandersDeployed].GetActorRef().MoveTo(DefenderTroopSpawn)
                DefenderCommanders[DefenderCommandersDeployed].GetActorRef().AddToFaction(DefendingCityFaction)
                DefenderCommanders[DefenderCommandersDeployed].GetActorRef().EvaluatePackage()
                DefenderCommandersDeployed += 1
            endif       
            int randomtype = utility.randomint(0, 1)
            if randomtype == 0
                Actor NewTroop = DefenderTroopSpawn.PlaceAtMe(SonsSoldier) as Actor
                Defenders[i].ForceRefTo(NewTroop)
            elseif randomtype == 1
                Actor NewTroop = DefenderTroopSpawn.PlaceAtMe(SonsArcher) as Actor
                Defenders[i].ForceRefTo(NewTroop)
            endif
            if i == 5 || i == 10 || i == 15
                Utility.Wait(0.5)
            endif
            i += 1
        endwhile
    endif

    RegisterForUpdate(5)
EndFunction

Function MoveTroopsToInterior()
    Game.GetPlayer().StopCombat()
    int i = 0
    int TroopsSpawned = 0
    while i < Attackers.Length
        if Attackers[i].GetRef()
            Attackers[i].GetActorRef().StopCombat()
            if TroopsSpawned < 10
                int randomspawn = utility.randomint(0, 2)
                if randomspawn == 0
                    if AttackGates == true
                        Attackers[i].GetRef().MoveTo(CityDoor.GetRef().GetLinkedRef())
                    else
                        if NumLadders == 1
                            Attackers[i].GetRef().MoveTo(Ladder1.GetRef().GetLinkedRef())
                        elseif NumLadders == 2
                            Attackers[i].GetRef().MoveTo(Ladder2.GetRef().GetLinkedRef())
                        endif
                    endif
                elseif randomspawn == 1
                    if Ladder1.GetRef().GetLinkedRef()
                        Attackers[i].GetRef().MoveTo(Ladder1.GetRef().GetLinkedRef())
                    else
                        Attackers[i].GetRef().MoveTo(CityDoor.GetRef().GetLinkedRef())
                    endif
                elseif randomspawn == 2
                    if Ladder2.GetRef().GetLinkedRef()
                        Attackers[i].GetRef().MoveTo(Ladder2.GetRef().GetLinkedRef())
                    elseif Ladder1.GetRef().GetLinkedRef()
                        Attackers[i].GetRef().MoveTo(Ladder1.GetRef().GetLinkedRef())
                    else
                        Attackers[i].GetRef().MoveTo(CityDoor.GetRef().GetLinkedRef())
                    endif
                endif
                if TroopsSpawned == 5 || TroopsSpawned == 10 || TroopsSpawned == 15
                    Utility.Wait(0.5)
                endif
                TroopsSpawned += 1
            else
                Attackers[i].GetRef().disable()
            endif
        endif
        i += 1
    endwhile
EndFunction

Function MoveTroopsToPlayer()
    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef()
            Attackers[i].GetActorRef().MoveTo(Game.GetPlayer())
        endif
        i += 1
    endwhile
EndFunction

Function ClearDefenders()
    debug.trace("Clearing Defenders")
    int troopscaptured = 0
    int i = 0
    while i < RetreatingDefenders.Length
        RetreatingDefenders[i] = None
        i += 1
    endwhile
    i = 0
    while i < 20
        RetreatingDefenders[i] = Defenders[i].GetActorRef()
        Defenders[i].Clear()
        i += 1
    endwhile
EndFunction

Function RetreatDefenders()
    debug.trace("Retreating Defenders")
    UnRegisterForUpdate()
    ClearDefenders()
    int troopscaptured = 0
    int troopsfleeing = 0
    int i = 0
    int maxtroops = 20
    if GetStage() >= 15 && citynum < 5
        maxtroops = 10
    endif
    while i < maxtroops
        debug.trace("maxtroops loop entered")
        Actor DefeatedTroop = RetreatingDefenders[i]
        if DefeatedTroop
            int randomnum = utility.randomint(0, 4)
            if randomnum < 4 && PrisonerScript.ASICPrisonersTotal < 10
                troopscaptured += 1
                (DefeatedTroop as CS_DefenderDeath).MarkForSurrender()
                PrisonerScript.PlayerTakePrisoner(DefeatedTroop, "Troop", enemyfactionnum)
            else
                troopsfleeing += 1
                DefeatedTroop.AddToFaction(RetreatFaction)
                DefeatedTroop.EvaluatePackage()
            endif
        endif
        i += 1
    endwhile
    i = 0
    while i < DefenderCommanders.Length
        debug.trace("Commander retreat entered")
        if DefenderCommanders[i].GetActorRef()
            if DefenderCommanders[i].GetActorRef().Is3DLoaded() && !DefenderCommanders[i].GetActorRef().IsInFaction(PrisonerScript.PrisonerPlayerFaction) && PrisonerScript.ASICPrisonersTotal < 10
                (DefenderCommanders[i].GetActorRef() as CS_DefenderDeath).MarkForSurrender()
                PrisonerScript.PlayerTakePrisoner(DefenderCommanders[i].GetActorRef(), "Commander", enemyfactionnum)
                troopscaptured += 1
            elseif DefenderCommanders[i].GetActorRef().Is3DLoaded() && !DefenderCommanders[i].GetActorRef().IsInFaction(PrisonerScript.PrisonerPlayerFaction)
                DefenderCommanders[i].GetActorRef().AddToFaction(RetreatFaction)
                troopsfleeing += 1
            endif
            DefenderCommanders[i].Clear()
        endif
        i += 1
    endwhile
    i = 0
    while i < JarlGuards.Length
        debug.trace("JarlGuards retreat entered")
        if JarlGuards[i].GetActorRef()
            if !JarlGuards[i].GetActorRef().IsDead()
                JarlGuards[i].GetActorRef().AddToFaction(RetreatFaction)
                JarlGuards[i].GetActorRef().RemoveFromFaction(EnemyTroopFaction)
                JarlGuards[i].GetActorRef().RemoveFromFaction(EnemyTroopFactionNPC)
                JarlGuards[i].GetActorRef().StopCombat()
                Actor Guard = JarlGuards[i].GetActorRef()
                JarlGuards[i].Clear()
                Guard.EvaluatePackage()
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

Function AssignInteriorTroops()
    debug.trace("Assigning Interior Troops")
    int i = 0
    int aliasnum = 0
    while i < Attackers.Length && aliasnum < AttackersInterior.Length
        if Attackers[i].GetActorRef() != None && Attackers[i].GetActorRef().IsDead() == 0
            AttackersInterior[aliasnum].ForceRefTo(Attackers[i].GetActorRef())
            AttackersInterior[aliasnum].GetActorRef().EvaluatePackage()
            aliasnum += 1
        endif
        i += 1
    endwhile

    if citynum >= 5
        EnableResourceBarrels()
        SetObjectiveDisplayed(16)
    endif
EndFunction

Function MoveInteriorTroopsToPlayer()
    Game.GetPlayer().StopCombat()
    int i = 0
    while i < AttackersInterior.Length
        if AttackersInterior[i].GetActorRef() != None
            Game.GetPlayer().MoveTo(Game.GetPlayer(), 120.0 * Math.Sin(Game.GetPlayer().GetAngleZ()), 120.0 * Math.Cos(Game.GetPlayer().GetAngleZ()))
            AttackersInterior[i].GetActorRef().MoveTo(Game.GetPlayer(), -120.0 * Math.Sin(Game.GetPlayer().GetAngleZ()), -120.0 * Math.Cos(Game.GetPlayer().GetAngleZ()))
            AttackersInterior[i].GetActorRef().StopCombat()
        endif
        i += 1
    endwhile
    Game.GetPlayer().StopCombat()
EndFunction

Function EnableResourceBarrels()
    ;Enable Food Barrels
    int maxbarrels = 0
    if FoodInitial == 0
        maxbarrels = 0
    elseif FoodInitial >= 1 && FoodInitial < 4
        maxbarrels = 1
    elseif FoodInitial >= 4 && FoodInitial < 12
        maxbarrels = 2
    elseif FoodInitial >= 12 && FoodInitial < 20
        maxbarrels = 3
    elseif FoodInitial >= 20
        maxbarrels = 4
    endif
    int i = 0
    while i < maxbarrels
        FoodBarrels[i].TryToEnable()
        i += 1
    endwhile

    ;Enable Wood Barrels
    maxbarrels = 0
    if WoodInitial == 0
        maxbarrels = 0
    elseif WoodInitial >= 1 && WoodInitial < 4
        maxbarrels = 1
    elseif WoodInitial >= 4 && WoodInitial < 12
        maxbarrels = 2
    elseif WoodInitial >= 12 && WoodInitial < 20
        maxbarrels = 3
    elseif WoodInitial >= 20
        maxbarrels = 4
    endif
    i = 0
    while i < maxbarrels
        WoodBarrels[i].TryToEnable()
        i += 1
    endwhile

    ;Enable Metal Barrels
    maxbarrels = 0
    if MetalInitial == 0
        maxbarrels = 0
    elseif MetalInitial >= 1 && MetalInitial < 4
        maxbarrels = 1
    elseif MetalInitial >= 4 && MetalInitial < 12
        maxbarrels = 2
    elseif MetalInitial >= 12 && MetalInitial < 20
        maxbarrels = 3
    elseif MetalInitial >= 20
        maxbarrels = 4
    endif
    i = 0
    while i < maxbarrels
        MetalBarrels[i].TryToEnable()
        i += 1
    endwhile

    ;Enable Coin Barrels
    maxbarrels = 0
    if CoinInitial == 0
        maxbarrels = 0
    elseif CoinInitial >= 1 && CoinInitial < 4
        maxbarrels = 1
    elseif CoinInitial >= 4 && CoinInitial < 12
        maxbarrels = 2
    elseif CoinInitial >= 12 && CoinInitial < 20
        maxbarrels = 3
    elseif CoinInitial >= 20
        maxbarrels = 4
    endif
    i = 0
    while i < maxbarrels
        CoinBarrels[i].TryToEnable()
        i += 1
    endwhile
    
EndFunction

Function TakePrisoner(Actor Victim)
    PrisonerScript.PlayerTakePrisoner(Victim)
EndFunction

Function DisableResourceBarrels()
    int i = 0
    while i < FoodBarrels.Length
        FoodBarrels[i].TryToDisable()
        WoodBarrels[i].TryToDisable()
        MetalBarrels[i].TryToDisable()
        CoinBarrels[i].TryToDisable()
        i += 1
    endwhile
EndFunction

Function CheckAllBarrels()
    int i = 0
    bool foundbarrel = false
    while i < FoodBarrels.Length && foundbarrel == false
        if FoodBarrels[i].GetRef().IsEnabled() == true || CoinBarrels[i].GetRef().IsEnabled() == true || MetalBarrels[i].GetRef().IsEnabled() == true || WoodBarrels[i].GetRef().IsEnabled() == true
            foundbarrel = true
        endif
        i += 1
    endwhile

    if foundbarrel == false
        SetObjectiveCompleted(16)
    endif
EndFunction

Function EnableLadders()
    if NumLadders == 1
        Ladder1.TryToEnable()
    elseif NumLadders ==2
        Ladder1.TryToEnable()
        Ladder2.TryToEnable()
    endif
EndFunction

Function DisableLadders()
    Ladder1.TryToDisable()
    Ladder2.TryToDisable()
EndFunction

Function DisableCatapults()
    int i = 0
    while i < (CatapultsList.GetAt(citynum) as FormList).GetSize()
        ((CatapultsList.GetAt(citynum) as FormList).GetAt(i) as ObjectReference).disable()
        ((CatapultOpsList.GetAt(citynum) as FormList).GetAt(i) as ObjectReference).disable()
        i += 1
    endwhile
EndFunction

Function StopCombatAll()
    PlayerArmyFaction.SetAlly(EnemyTroopFaction)
    PlayerArmyFaction.SetAlly(EnemyTroopFactionNPC)
    PlayerFaction.SetAlly(EnemyTroopFaction)
    PlayerFaction.SetAlly(EnemyTroopFactionNPC)
    RetreatDefenders()
EndFunction

Function JarlJoinBattle()
    debug.trace("Jarl joining battle")
    if Jarl.GetActorRef().GetActorBase() == GeneralTullius
        Actor NewTullius = Jarl.GetActorRef().PlaceAtMe(GeneralTullius) as Actor
        Jarl.GetActorRef().disable()
        Jarl.ForceRefTo(NewTullius)
        Actor NewRikke = Housecarl.GetActorRef().PlaceAtMe(Rikke) as Actor
        Housecarl.GetActorRef().disable()
        Housecarl.ForceRefTo(NewRikke)  
    elseif Jarl.GetActorRef().GetActorBase() == Ulfric
        Actor NewUlfric = Jarl.GetActorRef().PlaceAtMe(Ulfric) as Actor
        Jarl.GetActorRef().disable()
        Jarl.ForceRefTo(NewUlfric)
        Actor NewGalmar = Housecarl.GetActorRef().PlaceAtMe(Galmar) as Actor
        Housecarl.GetActorRef().disable()
        Housecarl.ForceRefTo(NewGalmar) 
    endif
    if CityDoorCollision.GetRef().IsEnabled()
        CityDoorCollision.TryToDisable()
    endif
    Jarl.GetActorRef().Enable()
    Housecarl.GetActorRef().Enable()
    Jarl.GetActorRef().RemoveFromFaction(EnemyTroopFaction)
    Jarl.GetActorRef().RemoveFromFaction(EnemyTroopFactionNPC)
    Jarl.GetActorRef().SetCrimeFaction(None)
    Housecarl.GetActorRef().RemoveFromFaction(EnemyTroopFaction)
    Housecarl.GetActorRef().RemoveFromFaction(EnemyTroopFactionNPC)
    Housecarl.GetActorRef().SetCrimeFaction(None)
    ;Jarl.GetActorRef().AddToFaction(EnemyJarlFaction)
    ;Housecarl.GetActorRef().AddToFaction(EnemyJarlFaction)
    RegisterForSingleLOSGain(Jarl.GetActorRef(), Game.GetPlayer())
    Jarl.GetActorRef().RemoveFromFaction(CrimeFactions.GetAt(citynum) as Faction)
    Housecarl.GetActorRef().RemoveFromFaction(CrimeFactions.GetAt(citynum) as Faction)
    Jarl.GetActorRef().MoveTo(JarlMarker.GetRef())
    Housecarl.GetActorRef().MoveTo(JarlMarker.GetRef())

    if Jarl.GetActorRef().GetActorBase() != GeneralTullius && Jarl.GetActorRef().GetActorBase() != Ulfric

        int i = 0
        while i < JarlGuards.Length
            Actor Guard
            if enemyfactionnum == 11
                Guard = ((GuardMarkers.GetAt(citynum) as FormList).GetAt(i) as ObjectReference).PlaceAtMe(HoldGuardsImp[citynum]) as Actor
            elseif enemyfactionnum == 12
                Guard = ((GuardMarkers.GetAt(citynum) as FormList).GetAt(i) as ObjectReference).PlaceAtMe(HoldGuardsSons[citynum]) as Actor
            endif
            JarlGuards[i].ForceRefTo(Guard)
            JarlGuards[i].GetActorRef().RemoveFromFaction(EnemyTroopFaction)
            JarlGuards[i].GetActorRef().RemoveFromFaction(EnemyTroopFactionNPC)
            ;JarlGuards[i].GetActorRef().StartCombat(Game.GetPlayer())
            i += 1
        endwhile
        ;Jarl.GetActorRef().StartCombat(Game.GetPlayer())

    endif
EndFunction

Function JarlAttack()
    Game.EnablePlayerControls()
    Jarl.GetActorRef().AddToFaction(EnemyJarlFaction)
    Housecarl.GetActorRef().AddToFaction(EnemyJarlFaction)
    Jarl.GetActorRef().StartCombat(Game.GetPlayer())
    Housecarl.GetActorRef().StartCombat(Game.GetPlayer())
EndFunction

Function GuardsAttack()
    int i = 0
    while i < JarlGuards.Length
        JarlGuards[i].GetActorRef().StartCombat(Game.GetPlayer())
        i += 1
    endwhile
EndFunction

Function JarlSurrender()
    if Jarl.GetActorRef().GetActorBase() != GeneralTullius && Jarl.GetActorRef().GetActorBase() != Ulfric
        Jarl.GetActorRef().SetGhost()
        Housecarl.GetActorRef().SetGhost()
    endif
    MUSCombatCivilWar.Remove()
    Jarl.GetActorRef().RemoveFromFaction(EnemyJarlFaction)
    Housecarl.GetActorRef().RemoveFromFaction(EnemyJarlFaction)
    Jarl.GetActorRef().StopCombat()
    Housecarl.GetActorRef().StopCombat()
    StopCombatAll()
    JarlSurrenderScene.ForceStart()
    CS_StoryTransferHoldingCity.SendStoryEvent(aiValue1 = citynum, aiValue2 = 69)
    if enemyfactionnum == 11
        if citynum < 5
            TMImperial.AdjustWarScore(30)
        else
            TMImperial.AdjustWarScore(20)
        endif
    elseif enemyfactionnum == 12
        if citynum < 5
            TMSons.AdjustWarScore(30)
        else
            TMSons.AdjustWarScore(20)
        endif
    endif
EndFunction

Function JarlSurrenderNoScene()
    MUSCombatCivilWar.Remove()
    Jarl.GetActorRef().RemoveFromFaction(EnemyJarlFaction)
    Housecarl.GetActorRef().RemoveFromFaction(EnemyJarlFaction)
    if Jarl.GetActorRef().GetActorBase() != GeneralTullius && Jarl.GetActorRef().GetActorBase() != Ulfric
        Jarl.GetActorRef().StopCombat()
        Housecarl.GetActorRef().StopCombat()
    endif
    ;StopCombatAll()
    CS_StoryTransferHoldingCity.SendStoryEvent(aiValue1 = citynum, aiValue2 = 69)
    if enemyfactionnum == 11
        TMImperial.SetObjectiveCompleted(10*citynum + 1)
        if citynum < 5
            TMImperial.AdjustWarScore(30)
        else
            TMImperial.AdjustWarScore(20)
        endif
    elseif enemyfactionnum == 12
        TMSons.SetObjectiveCompleted(10*citynum + 1)
        if citynum < 5
            TMSons.AdjustWarScore(30)
        else
            TMSons.AdjustWarScore(20)
        endif
    endif
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

Function LeaderSurrender(Actor Leader)
    CS_StoryLeaderSurrender.SendStoryEvent(akRef1 = Leader,  akRef2 = Housecarl.GetActorRef(), aiValue1 = citynum)
EndFunction

Function RestoreEnemies()
    PlayerArmyFaction.SetEnemy(EnemyTroopFaction)
    PlayerArmyFaction.SetEnemy(EnemyTroopFactionNPC)
    PlayerFaction.SetEnemy(EnemyTroopFaction)
    PlayerFaction.SetEnemy(EnemyTroopFactionNPC)
EndFunction

Function TroopSurrender(Actor Troop)
    Troop.SetGhost()
    Troop.RemoveFromFaction(DefendingCityFaction)
    Troop.RemoveFromFaction(EnemyTroopFaction)
    Troop.RemoveFromFaction(EnemyTroopFactionNPC)
    Troop.AddToFaction(POWFaction)
    Troop.StopCombat()
    Troop.SetAV("health", 100)
    Troop.EvaluatePackage()
EndFunction

Function AssignCommandersToHold()
    int i = 0
    while i < Commanders.Length
        if Commanders[i].GetActorRef()
            AssignCommanderToHold(Commanders[i].GetActorRef())
        endif
        i += 1
    endwhile
EndFunction

Function AssignCommanderToHold(Actor Commander)
    if CityCS.GetKeywordData(CityGarrison) < CityCS.GetKeywordData(BarracksLevel)
        CommanderScript.StartPatrol(Commander, citynum, forcestart = true)
    endif
EndFunction

Function ReturnCommanders()
    int i = 0
    while i < Commanders.Length
        if Commanders[i].GetActorRef() != None
            CommanderScript.ReturnToJob(Commanders[i].GetActorRef(), true)
            CommanderScript.FollowCommander[CommanderScript.GetCommanderArmyNum(Commanders[i].GetActorRef())].SetValue(1)
        endif
        i += 1
    endwhile
EndFunction

Function DisableDefenders()
    int i = 0
    while i < Defenders.Length
        if Defenders[i].GetActorRef() != None
            Defenders[i].GetActorRef().disable()
            Defenders[i].GetActorRef().delete()
        endif
        i += 1
    endwhile
EndFunction

Function DisableAllSiege()
    DisableDefenders()
    DisableCatapults()
    DisableLadders()
    DisableResourceBarrels()
    CityDoor.TryToDisable()
    CityDoorCollision.TryToDisable()
    BatteringRam.TryToDisable()
    Barricade1.TryToDisable()
    Barricade2.TryToDisable()
    Jarl.GetActorRef().SetGhost(false)
    if Housecarl.GetActorRef()
        Housecarl.GetActorRef().SetGhost(false)
    endif
EndFunction

Function EvaluateAttackerPackages()
    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef()
            Attackers[i].GetActorRef().EvaluatePackage()
        endif
        i += 1
    endwhile
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
    if akRef1
        TriggerBoxActivated = true
    endif
    InitialSetUp()
EndEvent

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
    Game.DisablePlayerControls(false, abMenu = false, abActivate = false)
    JarlConfrontScene.ForceStart()
EndEvent

Event OnUpdateGameTime()
    if !City.GetLocation().IsLoaded() && GetStage() < 20
        SetStage(26)
    elseif !City.GetLocation().IsLoaded() && GetStage() >= 20
        SetStage(27)
    endif
EndEvent