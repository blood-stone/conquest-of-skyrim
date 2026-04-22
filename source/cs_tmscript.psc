Scriptname CS_TMScript extends Quest  conditional



; All Faction Data ---------------------------------------------------------------

int Property FactionNum Auto

Location Property TMData Auto ;All the data for the faction is stored here.
Location Property TMDataEnemy Auto ;All the data for the enemy faction is stored here.

FormList Property TroopCountKeywords Auto
FormList Property AllGarrisonMarkers Auto
FormList Property AllGarrisonMarkersFort Auto
FormList Property AllGarrisonMarkersCamp Auto
FormList Property CommanderPatrolLists Auto
FormList Property TriggerBoxesCamp Auto

Keyword Property Aggressiveness Auto
Keyword Property WarPriority Auto
Keyword Property CWOwner Auto
Keyword Property ActiveCommanderCount Auto
Keyword Property TotalCommanderCount Auto
Keyword Property AttackingArmies Auto
Keyword Property Capital Auto

Keyword Property CS_StoryDefendCamp Auto
Keyword Property CS_StoryDefendFort Auto
Keyword Property CS_StoryDefendCity Auto

GlobalVariable Property CityCount Auto
GlobalVariable Property MinorCityCount Auto
GlobalVariable Property FortCount Auto
GlobalVariable Property VillageCount Auto
GlobalVariable Property WarScore Auto
GlobalVariable Property CS_EnemyRecovery Auto
GlobalVariable Property CS_EnemyRespawns Auto

LocationAlias Property DefendCityStaging Auto
Quest Property DefendCityQuest Auto
Quest Property DefendCityQuestNew Auto
LocationAlias Property DefendFortStaging Auto
Quest Property DefendFortQuest Auto
ReferenceAlias Property DefendCampStaging Auto
Quest Property DefendCampQuest Auto

Faction Property ArmyFaction Auto
Faction Property ArmyFactionNPC Auto

int[] Property ChanceToInvade Auto

ReferenceAlias[] Property Commanders Auto

ReferenceAlias Property Leader Auto
ReferenceAlias Property LeaderCitizen Auto
ReferenceAlias Property ASIC Auto
ReferenceAlias Property ASICCitizen Auto

ActorBase Property CommanderBase Auto

bool Property AtWarPlayer Auto conditional
bool Property TrucePlayer Auto conditional
bool Property AtWarSons Auto conditional
bool Property TruceSons Auto conditional
bool Property Defeated Auto conditional

;------------------------------------------------------------------------------------

FormList Property AllHoldings Auto
FormList Property AllHoldingsFort Auto
FormList Property AllLocations Auto
FormList Property AllLocationsFort Auto
FormList Property AllLocationsCS Auto
FormList Property AllHolds Auto
FormList Property AllGarrisonMarkersFortMonster Auto
FormList Property AllGarrisonMarkersCampPlayer Auto
FormList Property MapMarkersCities Auto
FormList Property MapMarkersForts Auto
FormList Property TriggerBoxes Auto
FormList Property TriggerBoxesFort Auto
FormList Property InvasionObjectiveQuests Auto

Quest Property WarMapReset Auto
Quest Property AttackCampQuest Auto
Quest Property PatrolQuest Auto
Quest Property ObjectiveQuest Auto
Quest Property EconReport Auto

Quest Property CWStartQuest Auto

ObjectReference Property RaidTriggerDragonBridge Auto
ObjectReference Property RaidTriggerIvarstead Auto
ObjectReference Property RaidTriggerKarthwasten Auto
ObjectReference Property RaidTriggerRiverwood Auto
ObjectReference Property RaidTriggerRorikstead Auto
ObjectReference Property RaidTriggerShorsStone Auto

Location Property MarkarthLocation Auto

FormList Property AllHoldingLinks Auto
FormList Property LinkedHoldsChecked Auto

Keyword Property ArmiesDefending Auto
Keyword Property ArmiesPatrolling Auto
Keyword Property MinPatrolArmies Auto
Keyword Property LandSuperiority Auto
Keyword[] Property ArmyPatrols Auto
Keyword Property Contested Auto
Keyword Property Invading Auto
Keyword Property Attackable Auto

Message Property TestLinkMessage1 Auto
Message Property TestLinkMessage2 Auto
Message Property TestLocationInfoStartMessage Auto
Message Property TestLocationInfoMessage Auto
Message Property LSMessage Auto
Message Property LSLostMessage Auto
Message Property WarCampMessage Auto
Message Property WarCampLostMessage Auto
Message Property CapitulationMessage Auto

GlobalVariable Property TestLocationCityArmies Auto
GlobalVariable Property TestLocationPatrolArmies Auto
GlobalVariable Property TestLocationFortArmies Auto
GlobalVariable Property GameDaysPassed Auto

Faction Property PlayerArmyFaction Auto
Faction Property PlayerArmyCommanders Auto
Faction Property PlayerFaction Auto

LocationAlias Property TestLocation Auto
LocationAlias Property LSHoldLocation Auto
LocationAlias Property MessageHoldLoc Auto

int Property MaxAggressiveness Auto
int Property PrisonerNumsTroop Auto
int Property PrisonerNumsCommander Auto
int Property HoldJustBeaten=-1 Auto

float[] Property RecoveryTimes Auto

bool Property IsSonsQuest Auto

int Property TestLinkInt1 Auto
int Property TestLinkInt2 Auto
int Property EnemyFactionNum Auto

CS_PatrolHoldScript Property CommanderScript Auto
CS_CommanderMovingScript Property MovingScript Auto
CS_HoldBordersScript Property BordersScript Auto
CS_TMScript Property TMPlayerScript Auto
CS_TMScript Property TMEnemyScript Auto
CS_ChangeBanners Property BannerScript Auto
CS_RefreshTroopRespawn Property TroopRespawn Auto

Function SetUpInitial()
    if CWStartQuest.IsRunning()
        CWStartQuest.FailAllObjectives()
        CWStartQuest.Stop()
    endif
    CityCount.SetValue(0)
    MinorCityCount.SetValue(0)
    FortCount.SetValue(0)
    VillageCount.SetValue(0)
    TMData.SetKeywordData(WarPriority, -1)
    int i = 0
    while i < AllLocations.GetSize()
        (AllGarrisonMarkersCamp.GetAt(i) as ObjectReference).disable()
        if (AllLocations.GetAt(i) as Location).GetKeywordData(CWOwner) == (FactionNum - 10) || (AllGarrisonMarkers.GetAt(i) as ObjectReference).IsEnabled() == true
            (AllHoldings.GetAt(i) as GlobalVariable).SetValue(FactionNum)
            (AllLocations.GetAt(i) as Location).SetKeywordData(CWOwner, (FactionNum - 10))
            (AllLocationsCS.GetAt(i) as Location).SetKeywordData(LandSuperiority, FactionNum)
            (AllGarrisonMarkersCamp.GetAt(i) as ObjectReference).enable()
            int initialCommanderCount = TMData.GetKeywordData(TotalCommanderCount) as int
            if FactionNum == 11 && i == 2
                TMData.SetKeywordData(Capital, 2)
            elseif FactionNum == 12 && i == 4
                TMData.SetKeywordData(Capital, 4)
            endif
            if i < 5
                CityCount.Mod(1)
                if i == TMData.GetKeywordData(Capital) as int
                    TMData.SetKeywordData(TotalCommanderCount, initialCommanderCount + 10)
                else
                    TMData.SetKeywordData(TotalCommanderCount, initialCommanderCount + 6)
                endif               
            elseif i >= 5 && i < 9
                MinorCityCount.Mod(1)
                TMData.SetKeywordData(TotalCommanderCount, initialCommanderCount + 4)
            else
                VillageCount.Mod(1)
            endif
            if ((AllGarrisonMarkersFort.GetAt(i) as ObjectReference).IsEnabled() == 1 || (AllLocationsFort.GetAt(i) as Location).GetKeywordData(CWOwner) == (FactionNum - 10)) && (AllLocationsFort.GetAt(i) as Location).GetKeywordData(CWOwner) != 69
                (AllLocationsFort.GetAt(i) as Location).SetKeywordData(CWOwner, (FactionNum - 10))
            endif
        endif
        i += 1
    endwhile
    ChooseRandomCapital()
    DistributeCommandersInitial()
    DistributeCommandersHold()
    AssignAllPatrols()
EndFunction

Function FortTakeover()
    int i = 0
    while i < AllLocationsFort.GetSize()
        if (AllLocationsFort.GetAt(i) as Location).GetKeywordData(CWOwner) == (FactionNum - 10)
            (AllGarrisonMarkersFortMonster.GetAt(i) as ObjectReference).disable()
            (AllGarrisonMarkersFort.GetAt(i) as ObjectReference).enable()
            (AllHoldingsFort.GetAt(i) as GlobalVariable).SetValue(FactionNum)
            (TriggerBoxesFort.GetAt(i) as ObjectReference).enable()
            (MapMarkersForts.GetAt(i) as ObjectReference).disable()
            TMData.SetKeywordData(TotalCommanderCount, TMData.GetKeywordData(TotalCommanderCount) + 1)
            FortCount.Mod(1)
        endif
        i += 1
    endwhile
EndFunction

Function ChooseRandomCapital()

        bool capitalfound = false
        if FactionNum == 11 && (AllLocations.GetAt(2) as Location).GetKeywordData(CWOwner) == 1
            TMData.SetKeywordData(Capital, 2)
            capitalfound = true
        elseif FactionNum == 12 && (AllLocations.GetAt(4) as Location).GetKeywordData(CWOwner) == 2
            TMData.SetKeywordData(Capital, 4)
            capitalfound = true
        endif

        int i = 0
        while i < 9 && capitalfound == false
            if (AllLocations.GetAt(i) as Location).GetKeywordData(CWOwner) == (FactionNum - 10)
                TMData.SetKeywordData(Capital, i)
                capitalfound = true
            endif
            i += 1
        endwhile

    if TMData.GetKeywordData(Capital) == -1
        MakeLeadersCitizens()
    endif
EndFunction

Function DisableLeaders()
    Leader.GetActorRef().Disable()
    ASIC.GetActorRef().Disable()
EndFunction

Function EnableLeaders()
    Leader.GetActorRef().Enable()
    ASIC.GetActorRef().Enable()
EndFunction

Function MakeLeadersCitizens()
    LeaderCitizen.ForceRefTo(Leader.GetActorRef())
    ASICCitizen.ForceRefTo(ASIC.GetActorRef())
EndFunction

Function DistributeCommandersInitial()
    int UnusedCommanders = (TMData.GetKeywordData(TotalCommanderCount) - TMData.GetKeywordData(ActiveCommanderCount)) as int
    int i = 0
    while i < AllLocationsCS.GetSize() && UnusedCommanders > 0
        Location Holding = AllLocationsCS.GetAt(i) as Location
        if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == FactionNum
            if i < 5
                if i == TMData.GetKeywordData(Capital) as int
                    while Holding.GetKeywordData(ArmiesDefending) < 10 && UnusedCommanders > 0
                        Holding.SetKeywordData(ArmiesDefending, Holding.GetKeywordData(ArmiesDefending) + 1)
                        TMData.SetKeywordData(ActiveCommanderCount, TMData.GetKeywordData(ActiveCommanderCount) + 1)
                        UnusedCommanders -= 1
                    endwhile
                else
                    while Holding.GetKeywordData(ArmiesDefending) < 6 && UnusedCommanders > 0
                        Holding.SetKeywordData(ArmiesDefending, Holding.GetKeywordData(ArmiesDefending) + 1)
                        TMData.SetKeywordData(ActiveCommanderCount, TMData.GetKeywordData(ActiveCommanderCount) + 1)
                        UnusedCommanders -= 1
                    endwhile
                endif
            elseif i >=5 && i < 9
                while Holding.GetKeywordData(ArmiesDefending) < 4 && UnusedCommanders > 0
                    Holding.SetKeywordData(ArmiesDefending, Holding.GetKeywordData(ArmiesDefending) + 1)
                    TMData.SetKeywordData(ActiveCommanderCount, TMData.GetKeywordData(ActiveCommanderCount) + 1)
                    UnusedCommanders -= 1
                endwhile
            endif
        endif
        i += 1
    endwhile
    i = 0
    while i < AllLocationsFort.GetSize() && UnusedCommanders > 0
        if (AllHoldingsFort.GetAt(i) as GlobalVariable).GetValue() == FactionNum
            UnusedCommanders -= 1           
        endif
        i += 1
    endwhile
    TMData.SetKeywordData(ActiveCommanderCount, TMData.GetKeywordData(TotalCommanderCount) - UnusedCommanders)
EndFunction

Function DistributeCommandersHold()
    int i = 0
    while i < AllLocationsCS.GetSize()
        Location Holding = AllLocationsCS.GetAt(i) as Location
        if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == FactionNum && Holding.GetKeywordData(LandSuperiority) == FactionNum
            if AttackCampQuest.IsRunning() && (AttackCampQuest as CS_AttackFortCampScript).enemyfactionnum == FactionNum && (AttackCampQuest as CS_AttackFortCampScript).holdnum == i
                debug.trace("Stopped patrol refresh due to camp under attack")
            else
                if i < 5
                    if i == TMData.GetKeywordData(Capital) as int
                        while Holding.GetKeywordData(ArmiesDefending) > 6
                            Holding.SetKeywordData(ArmiesDefending, Holding.GetKeywordData(ArmiesDefending) - 1)
                            Holding.SetKeywordData(ArmiesPatrolling, Holding.GetKeywordData(ArmiesPatrolling) + 1)
                        endwhile
                    else
                        while Holding.GetKeywordData(ArmiesDefending) > 4
                            Holding.SetKeywordData(ArmiesDefending, Holding.GetKeywordData(ArmiesDefending) - 1)
                            Holding.SetKeywordData(ArmiesPatrolling, Holding.GetKeywordData(ArmiesPatrolling) + 1)
                        endwhile
                    endif
                elseif i >=5 && i < 9
                    while Holding.GetKeywordData(ArmiesDefending) > 2
                        Holding.SetKeywordData(ArmiesDefending, Holding.GetKeywordData(ArmiesDefending) - 1)
                        Holding.SetKeywordData(ArmiesPatrolling, Holding.GetKeywordData(ArmiesPatrolling) + 1)
                    endwhile
                endif
                ;AssignPatrols(i)
            endif
        endif
        i += 1
    endwhile
EndFunction

Function SetCommanderCount()
    int i = 0
    int commandercount = 0
    int commandercountactive = 0
    commandercountactive += TMData.GetKeywordData(AttackingArmies) as int
    while i < 9
        if (AllLocations.GetAt(i) as Location).GetKeywordData(CWOwner) == (FactionNum - 10)
            commandercountactive += (AllLocationsCS.GetAt(i) as Location).GetKeywordData(ArmiesDefending) as int
            if i == TMData.GetKeywordData(Capital) as int
                commandercount += 10
            elseif i < 5
                commandercount += 6
            else
                commandercount += 4
            endif
        endif
        if (AllLocationsCS.GetAt(i) as Location).GetKeywordData(LandSuperiority) == FactionNum
            commandercountactive += (AllLocationsCS.GetAt(i) as Location).GetKeywordData(ArmiesPatrolling) as int
        endif
        if (AllLocationsFort.GetAt(i) as Location).GetKeywordData(CWOwner) == (FactionNum - 10)
            commandercount += 1
            commandercountactive += 1
        endif
        i += 1
    endwhile
    TMData.SetKeywordData(TotalCommanderCount, commandercount)
    TMData.SetKeywordData(ActiveCommanderCount, commandercountactive)
EndFunction

bool Function GetIsHoldLinked(int holdnum1, int holdnum2, bool initialhold = true, bool directly = false, bool nofirsthold = false)
    debug.trace("Checking if " + holdnum1 + " is linked to " + holdnum2)
    Location Holding1 = AllLocationsCS.GetAt(holdnum1) as Location
    Location Holding2 = AllLocationsCS.GetAt(holdnum2) as Location
    FormList LinkedHoldings = AllHoldingLinks.GetAt(holdnum1) as FormList

    if initialhold == true
        LinkedHoldsChecked.Revert()
    endif

    LinkedHoldsChecked.AddForm(Holding1)
    bool foundlink = false

    if Holding1.GetKeywordData(LandSuperiority) == FactionNum || nofirsthold
        debug.trace(holdnum1 + " is owned by correct faction")

        if LinkedHoldings.Find(Holding2) != -1
            debug.trace(holdnum1 + " is adjacent to " + holdnum2)
            foundlink = true
        endif

        if foundlink == false && directly == false
            int i = 0
            while i < LinkedHoldings.GetSize() && foundlink == false
                if LinkedHoldsChecked.Find(LinkedHoldings.GetAt(i) as Location) == -1
                    int newholdnum = AllLocationsCS.Find(LinkedHoldings.GetAt(i) as Location)
                    if GetIsHoldLinked(holdnum1, newholdnum, initialhold = false)
                        foundlink = GetIsHoldLinked(newholdnum, holdnum2, initialhold = false)
                    endif
                endif
                i += 1
            endwhile
        endif

    endif

    if foundlink == false
        debug.trace("Link not found between " + holdnum1 + " and " + holdnum2)
    else
        debug.trace("Link found between " + holdnum1 + " and " + holdnum2)
    endif

    return foundlink
EndFunction

int Function GetOwnHoldsBordering(int holdnum)
    FormList LinkedHolds = AllHoldingLinks.GetAt(holdnum) as FormList
    int ownholdbordering = 0
    int i = 0
    while i < LinkedHolds.GetSize()
        int vanillanum = AllLocationsCS.Find(LinkedHolds.GetAt(i) as Location)
        if (AllHoldings.GetAt(vanillanum) as GlobalVariable).GetValue() == FactionNum && (AllLocationsCS.GetAt(vanillanum) as Location).GetKeywordData(LandSuperiority) == FactionNum
            ownholdbordering += 1
        endif
        i += 1
    endwhile

    return ownholdbordering
EndFunction

int Function GetOwnSuperiorHoldsBordering(int holdnum)
    FormList LinkedHolds = AllHoldingLinks.GetAt(holdnum) as FormList
    int ownholdbordering = 0
    int i = 0
    while i < LinkedHolds.GetSize()
        if (LinkedHolds.GetAt(i) as Location).GetKeywordData(LandSuperiority) == FactionNum
            ownholdbordering += 1
        endif
        i += 1
    endwhile

    return ownholdbordering
EndFunction

int Function GetLandSuperiorityNum()
    int landsuperioritynum = 0
    int i = 0
    while i < AllLocationsCS.GetSize()
        if (AllLocationsCS.GetAt(i) as Location).GetKeywordData(LandSuperiority) == FactionNum
            landsuperioritynum += 1
        endif
        i += 1
    endwhile

    return landsuperioritynum
EndFunction

Function SendPatrolsToBorderingHolds()

    int prioritynum = TMData.GetKeywordData(WarPriority) as int
    FormList LinkedHolds = AllHoldingLinks.GetAt(prioritynum) as FormList

    int i = 0
    while i < LinkedHolds.GetSize()
        Location HoldLocBordering = LinkedHolds.GetAt(i) as Location
        int linkedholdnum = AllLocationsCS.Find(HoldLocBordering)
        if HoldLocBordering.GetKeywordData(LandSuperiority) == FactionNum
            int holdnum = 0
            while holdnum < 9 && HoldLocBordering.GetKeywordData(ArmiesPatrolling) < 4
                Location HoldLoc = AllLocationsCS.GetAt(holdnum) as Location
                if HoldLoc.GetKeywordData(LandSuperiority) == FactionNum && HoldLoc.GetKeywordData(ArmiesPatrolling) > 1 && LinkedHolds.Find(HoldLoc) == -1 && holdnum != prioritynum
                    if GetIsHoldLinked(holdnum, i)
                        HoldLoc.SetKeywordData(ArmiesPatrolling, HoldLoc.GetKeywordData(ArmiesPatrolling) - 1)
                        HoldLocBordering.SetKeywordData(ArmiesPatrolling, HoldLocBordering.GetKeywordData(ArmiesPatrolling) + 1)
                        ;AssignPatrols(holdnum)
                    endif
                endif
                holdnum += 1
            endwhile
            ;AssignPatrols(linkedholdnum)
        endif
        i += 1
    endwhile

EndFunction

Function RespawnArmies()

    debug.trace("Respawning armies...")

    int UnusedCommanders = (TMData.GetKeywordData(TotalCommanderCount) - TMData.GetKeywordData(ActiveCommanderCount)) as int
    debug.trace("TotalCommanderCount = " + TMData.GetKeywordData(TotalCommanderCount) + ", ActiveCommanderCount = " + TMData.GetKeywordData(ActiveCommanderCount))
    int NewCommanders = CityCount.GetValueint() + MinorCityCount.GetValueint()
    debug.trace("NewCommanders = " + NewCommanders)
    int i = 0
    while i < AllLocationsCS.GetSize() && UnusedCommanders > 0 && NewCommanders > 0
        Location Holding = AllLocationsCS.GetAt(i) as Location
        if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == FactionNum && (AllLocationsCS.GetAt(i) as Location).GetKeywordData(LandSuperiority) == FactionNum
            if i < 5
                if i == TMData.GetKeywordData(Capital) as int
                    while (Holding.GetKeywordData(ArmiesDefending) < 6 || Holding.GetKeywordData(ArmiesPatrolling) < 4) && UnusedCommanders > 0 && NewCommanders > 0
                        Holding.SetKeywordData(ArmiesDefending, Holding.GetKeywordData(ArmiesDefending) + 1)
                        UnusedCommanders -= 1
                        TMData.SetKeywordData(ActiveCommanderCount, TMData.GetKeywordData(ActiveCommanderCount) + 1)
                        NewCommanders -= 1
                    endwhile
                else
                    while (Holding.GetKeywordData(ArmiesDefending) < 4 || Holding.GetKeywordData(ArmiesPatrolling) < 2) && UnusedCommanders > 0 && NewCommanders > 0
                        Holding.SetKeywordData(ArmiesDefending, Holding.GetKeywordData(ArmiesDefending) + 1)
                        TMData.SetKeywordData(ActiveCommanderCount, TMData.GetKeywordData(ActiveCommanderCount) + 1)
                        UnusedCommanders -= 1
                        NewCommanders -= 1
                    endwhile
                endif
            elseif i >=5 && i < 9
                while (Holding.GetKeywordData(ArmiesDefending) < 2 || Holding.GetKeywordData(ArmiesPatrolling) < 2) && UnusedCommanders > 0 && NewCommanders > 0
                    Holding.SetKeywordData(ArmiesDefending, Holding.GetKeywordData(ArmiesDefending) + 1)
                    TMData.SetKeywordData(ActiveCommanderCount, TMData.GetKeywordData(ActiveCommanderCount) + 1)
                    UnusedCommanders -= 1
                    NewCommanders -= 1
                endwhile
            endif
        endif
        i += 1
    endwhile

    debug.trace("Armies respawned")

EndFunction

Function StartWar()
    Game.GetPlayer().RemoveFromFaction(ArmyFaction)
    Game.GetPlayer().RemoveFromFaction(ArmyFactionNPC)
    PlayerArmyFaction.SetEnemy(ArmyFaction)
    PlayerArmyCommanders.SetEnemy(ArmyFaction)
    PlayerFaction.SetEnemy(ArmyFaction)
    PlayerArmyFaction.SetEnemy(ArmyFactionNPC)
    PlayerArmyCommanders.SetEnemy(ArmyFactionNPC)
    PlayerArmyFaction.SetReaction(ArmyFaction, 1)
    PlayerFaction.SetEnemy(ArmyFactionNPC)
    ArmyFaction.SetEnemy(PlayerArmyFaction)
    ArmyFaction.SetEnemy(PlayerArmyCommanders)
    ArmyFaction.SetEnemy(PlayerFaction)
    ArmyFactionNPC.SetEnemy(PlayerArmyFaction)
    ArmyFactionNPC.SetEnemy(PlayerArmyCommanders)
    ArmyFactionNPC.SetEnemy(PlayerFaction)
    ArmyFaction.SetReaction(PlayerArmyFaction, 1)
    ArmyFaction.SetPlayerEnemy(true)
    ArmyFactionNPC.SetPlayerEnemy(true)
    (EconReport as CS_EconomyMenuFunctions).CancelMetalImports(FactionNum - 10)
    (EconReport as CS_EconomyMenuFunctions).CancelMetalExports(FactionNum - 10)
    (EconReport as CS_EconomyMenuFunctions).CancelWoodImports(FactionNum - 10)
    (EconReport as CS_EconomyMenuFunctions).CancelWoodExports(FactionNum - 10)
    (EconReport as CS_EconomyMenuFunctions).CancelFoodImports(FactionNum - 10)
    (EconReport as CS_EconomyMenuFunctions).CancelFoodExports(FactionNum - 10)
    if !IsSonsQuest
        debug.notification("All trading with the Imperials and their cities has been halted")
    else
        debug.notification("All trading with the Stormcloaks and their cities has been halted")
    endif
    TMData.SetKeywordData(Aggressiveness, 2)
    TMData.SetKeywordData(WarPriority, -1)
    WarScore.SetValue(0)
    AtWarPlayer = true
    TrucePlayer = false
    if !ObjectiveQuest.IsRunning()
        ObjectiveQuest.Start()
    endif
    int i = 0
    while i < 9
        if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == FactionNum || (AllLocationsFort.GetAt(i) as Location).GetKeywordData(CWOwner) == FactionNum - 10
            (AllLocationsCS.GetAt(i) as Location).SetKeywordData(Attackable, 1)
            (TriggerBoxes.GetAt(i) as ObjectReference).enable()
            (TriggerBoxesCamp.GetAt(i) as ObjectReference).enable()
            FormList CityMapMarkers = MapMarkersCities.GetAt(i) as FormList
            int index = 0
            while index < CityMapMarkers.GetSize()
                (CityMapMarkers.GetAt(index) as ObjectReference).disable()
                index += 1
            endwhile
            ObjectiveQuest.SetObjectiveDisplayed(i, true, true)
            if (i) == 0
                RaidTriggerKarthwasten.Enable()
            elseif (i) == 1
                RaidTriggerIvarstead.Enable()
                RaidTriggerShorsStone.Enable()
            elseif (i) == 2
                RaidTriggerDragonBridge.Enable()
            elseif (i) == 3
                RaidTriggerRiverwood.Enable()
                RaidTriggerRorikstead.Enable()
            endif
        endif
        i += 1
    endwhile
    FortTakeover()
    RegisterForUpdateGameTime(CS_EnemyRespawns.GetValue())
EndFunction

Function StopWar()
    UnRegisterForUpdateGameTime()
    TrucePlayer = true
    AtWarPlayer = false
    PlayerArmyFaction.SetEnemy(ArmyFaction, true, true)
    PlayerArmyCommanders.SetEnemy(ArmyFaction, true, true)
    PlayerFaction.SetEnemy(ArmyFaction, true, true)
    PlayerArmyFaction.SetEnemy(ArmyFactionNPC, true, true)
    PlayerArmyCommanders.SetEnemy(ArmyFactionNPC, true, true)
    PlayerFaction.SetEnemy(ArmyFactionNPC, true, true)
    PlayerArmyFaction.SetReaction(ArmyFaction, 0)
    ArmyFaction.SetEnemy(PlayerArmyFaction, true, true)
    ArmyFaction.SetEnemy(PlayerArmyCommanders, true, true)
    ArmyFaction.SetEnemy(PlayerFaction, true, true)
    ArmyFactionNPC.SetEnemy(PlayerArmyFaction, true, true)
    ArmyFactionNPC.SetEnemy(PlayerArmyCommanders, true, true)
    ArmyFactionNPC.SetEnemy(PlayerFaction, true, true)
    ArmyFaction.SetPlayerEnemy(false)
    ArmyFaction.SetReaction(PlayerArmyFaction, 0)
    ArmyFactionNPC.SetPlayerEnemy(false)
    int i = 0
    while i < 9
        if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == FactionNum || (AllLocationsFort.GetAt(i) as Location).GetKeywordData(CWOwner) == FactionNum - 10
            (AllLocationsCS.GetAt(i) as Location).SetKeywordData(Attackable, 0)
            (AllLocationsCS.GetAt(i) as Location).SetKeywordData(Contested, 0)
            (TriggerBoxes.GetAt(i) as ObjectReference).disable()
            FormList CityMapMarkers = MapMarkersCities.GetAt(i) as FormList
            int index = 0
            while index < CityMapMarkers.GetSize()
                (CityMapMarkers.GetAt(index) as ObjectReference).enable()
                index += 1
            endwhile
            if (i) == 0
                RaidTriggerKarthwasten.Disable()
            elseif (i) == 1
                RaidTriggerIvarstead.Disable()
                RaidTriggerShorsStone.Disable()
            elseif (i) == 2
                RaidTriggerDragonBridge.Disable()
            elseif (i) == 3
                RaidTriggerRiverwood.Disable()
                RaidTriggerRorikstead.Disable()
            endif
            if (AllLocationsCS.GetAt(i) as Location).GetKeywordData(LandSuperiority) == 1
                EstablishLandSuperiority(i)
                TMPlayerScript.PlayerEvacuateCamp(i)
                UnblockadeCommanders(i)
            endif
            (AllLocationsCS.GetAt(i) as Location).SetKeywordData(Contested, 0)
            (InvasionObjectiveQuests.GetAt(i) as Quest).SetStage(11)
        elseif (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
            if (AllGarrisonMarkersCamp.GetAt(i) as ObjectReference).IsEnabled()
                (AllGarrisonMarkersCamp.GetAt(i) as ObjectReference).disable()
                (AllLocationsCS.GetAt(i) as Location).SetKeywordData(Contested, 0)
            endif
            ;(AllLocationsCS.GetAt(i) as Location).SetKeywordData(LandSuperiority, (AllHoldings.GetAt(i) as GlobalVariable).GetValue())
            if (AllLocationsCS.GetAt(i) as Location).GetKeywordData(LandSuperiority) == FactionNum
                LoseLandSuperiority(i)
            endif
        endif

        if (AllHoldingsFort.GetAt(i) as GlobalVariable).GetValue() == FactionNum
            (MapMarkersForts.GetAt(i) as ObjectReference).enable()
        endif

        (TriggerBoxesFort.GetAt(i) as ObjectReference).disable()
        (TriggerBoxesCamp.GetAt(i) as ObjectReference).disable()

        i += 1
    endwhile
    ObjectiveQuest.SetStage(20)
EndFunction

Function WinWar()

EndFunction

Function TempTruce()
    UnRegisterForUpdateGameTime()
    TrucePlayer = true
    ;AtWarPlayer = false
    PlayerArmyFaction.SetEnemy(ArmyFaction, true, true)
    PlayerArmyCommanders.SetEnemy(ArmyFaction, true, true)
    PlayerFaction.SetEnemy(ArmyFaction, true, true)
    PlayerArmyFaction.SetEnemy(ArmyFactionNPC, true, true)
    PlayerArmyCommanders.SetEnemy(ArmyFactionNPC, true, true)
    PlayerFaction.SetEnemy(ArmyFactionNPC, true, true)
    PlayerArmyFaction.SetReaction(ArmyFaction, 0)
    ArmyFaction.SetEnemy(PlayerArmyFaction, true, true)
    ArmyFaction.SetEnemy(PlayerArmyCommanders, true, true)
    ArmyFaction.SetEnemy(PlayerFaction, true, true)
    ArmyFactionNPC.SetEnemy(PlayerArmyFaction, true, true)
    ArmyFactionNPC.SetEnemy(PlayerArmyCommanders, true, true)
    ArmyFactionNPC.SetEnemy(PlayerFaction, true, true)
    ArmyFaction.SetPlayerEnemy(false)
    ArmyFactionNPC.SetPlayerEnemy(false)
    ArmyFaction.SetReaction(PlayerArmyFaction, 0)
    int i = 0
    while i < 9
        if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == FactionNum || (AllLocationsFort.GetAt(i) as Location).GetKeywordData(CWOwner) == FactionNum - 10
            (AllLocationsCS.GetAt(i) as Location).SetKeywordData(Attackable, 0)
            (TriggerBoxes.GetAt(i) as ObjectReference).disable()
            if (i) == 0
                RaidTriggerKarthwasten.Disable()
            elseif (i) == 1
                RaidTriggerIvarstead.Disable()
                RaidTriggerShorsStone.Disable()
            elseif (i) == 2
                RaidTriggerDragonBridge.Disable()
            elseif (i) == 3
                RaidTriggerRiverwood.Disable()
                RaidTriggerRorikstead.Disable()
            endif
        endif
        (TriggerBoxesFort.GetAt(i) as ObjectReference).disable()
        (TriggerBoxesCamp.GetAt(i) as ObjectReference).disable()
        i += 1
    endwhile
EndFunction

Function BreakTruce()
    TrucePlayer = false
    PlayerArmyFaction.SetEnemy(ArmyFaction)
    PlayerArmyCommanders.SetEnemy(ArmyFaction)
    PlayerFaction.SetEnemy(ArmyFaction)
    PlayerArmyFaction.SetEnemy(ArmyFactionNPC)
    PlayerArmyCommanders.SetEnemy(ArmyFactionNPC)
    PlayerFaction.SetEnemy(ArmyFactionNPC)
    PlayerArmyFaction.SetReaction(ArmyFaction, 1)
    ArmyFaction.SetEnemy(PlayerArmyFaction)
    ArmyFaction.SetEnemy(PlayerArmyCommanders)
    ArmyFaction.SetEnemy(PlayerFaction)
    ArmyFactionNPC.SetEnemy(PlayerArmyFaction)
    ArmyFactionNPC.SetEnemy(PlayerArmyCommanders)
    ArmyFactionNPC.SetEnemy(PlayerFaction)
    ArmyFaction.SetPlayerEnemy(true)
    ArmyFactionNPC.SetPlayerEnemy(true)
    ArmyFaction.SetReaction(PlayerArmyFaction, 1)
    TMData.SetKeywordData(Aggressiveness, 2)
    AtWarPlayer = true
    int i = 0
    while i < 9
        if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == FactionNum || (AllLocationsFort.GetAt(i) as Location).GetKeywordData(CWOwner) == FactionNum - 10
            (AllLocationsCS.GetAt(i) as Location).SetKeywordData(Attackable, 1)
            (TriggerBoxes.GetAt(i) as ObjectReference).enable()
            if (i) == 0
                RaidTriggerKarthwasten.Enable()
            elseif (i) == 1
                RaidTriggerIvarstead.Enable()
                RaidTriggerShorsStone.Enable()
            elseif (i) == 2
                RaidTriggerDragonBridge.Enable()
            elseif (i) == 3
                RaidTriggerRiverwood.Enable()
                RaidTriggerRorikstead.Enable()
            endif
        endif

        if (AllHoldingsFort.GetAt(i) as GlobalVariable).GetValue() == FactionNum
            (TriggerBoxesFort.GetAt(i) as ObjectReference).enable()
        endif

        if (AllGarrisonMarkersCamp.GetAt(i) as ObjectReference).IsEnabled()
            (TriggerBoxesCamp.GetAt(i) as ObjectReference).enable()
        endif
        i += 1
    endwhile
    RegisterForUpdateGameTime(CS_EnemyRespawns.GetValue())
EndFunction

Function DisplayInvasionObjectives(int holdnum)

    if AtWarPlayer || Defeated
        
        if !(InvasionObjectiveQuests.GetAt(holdnum) as Quest).IsRunning()
            (InvasionObjectiveQuests.GetAt(holdnum) as Quest).Start()
        endif

        bool HasLandSuperiority
        bool HasFort
        bool HasCity
        bool PlayerCamp

        if (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == FactionNum
            HasLandSuperiority = true
        else
            (InvasionObjectiveQuests.GetAt(holdnum) as Quest).SetObjectiveCompleted(0)
        endif

        if (AllHoldings.GetAt(holdnum) as GlobalVariable).GetValue() == FactionNum
            HasCity = true
        else
            (InvasionObjectiveQuests.GetAt(holdnum) as Quest).SetObjectiveCompleted(1)
        endif

        if (AllHoldingsFort.GetAt(holdnum) as GlobalVariable).GetValue() == FactionNum
            HasFort = true
        else
            (InvasionObjectiveQuests.GetAt(holdnum) as Quest).SetObjectiveCompleted(2)
        endif

        if (AllGarrisonMarkersCampPlayer.GetAt(holdnum) as ObjectReference).IsEnabled()
            PlayerCamp = true
        endif

        if !HasLandSuperiority && !HasFort && !HasCity
            (AllLocationsCS.GetAt(holdnum) as Location).SetKeywordData(Contested, 0)
            (InvasionObjectiveQuests.GetAt(holdnum) as Quest).SetStage(10)
            ObjectiveQuest.SetObjectiveCompleted(holdnum)
        elseif HasLandSuperiority && HasFort && HasCity && !PlayerCamp
            (AllLocationsCS.GetAt(holdnum) as Location).SetKeywordData(Contested, 0)
            (InvasionObjectiveQuests.GetAt(holdnum) as Quest).SetStage(11)
        else

            if HasLandSuperiority
                (InvasionObjectiveQuests.GetAt(holdnum) as Quest).SetObjectiveCompleted(0, false)
                (InvasionObjectiveQuests.GetAt(holdnum) as Quest).SetObjectiveDisplayed(0, true, true)
            endif

            if HasFort
                (InvasionObjectiveQuests.GetAt(holdnum) as Quest).SetObjectiveCompleted(2, false)
                (InvasionObjectiveQuests.GetAt(holdnum) as Quest).SetObjectiveDisplayed(2, true, true)
            endif

            if HasCity
                (InvasionObjectiveQuests.GetAt(holdnum) as Quest).SetObjectiveCompleted(1, false)
                (InvasionObjectiveQuests.GetAt(holdnum) as Quest).SetObjectiveDisplayed(1, true, true)
            endif

            if !ObjectiveQuest.IsObjectiveDisplayed(holdnum)
                ObjectiveQuest.SetObjectiveDisplayed(holdnum, true, true)
            elseif ObjectiveQuest.IsObjectiveCompleted(holdnum)
                ObjectiveQuest.SetObjectiveCompleted(holdnum, false)
                ObjectiveQuest.SetObjectiveDisplayed(holdnum, true, true)
            endif

        endif

    endif

EndFunction

Function CheckAllHoldings()
    bool hascity
    int i = 0
    while i < 9 && !hascity
        if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == FactionNum
            hascity = true
        endif
        i += 1
    endwhile

    if !hascity
        UnRegisterForUpdateGameTime()
        Defeated = true
    endif

    bool hasfort
    i = 0
    while i < AllHoldingsFort.GetSize() && !hasfort
        if (AllHoldingsFort.GetAt(i) as GlobalVariable).GetValue() == FactionNum
            hasfort = true
        endif
        i += 1
    endwhile

    if !hascity && !hasfort
        AtWarPlayer = false
        ObjectiveQuest.SetStage(20)
        CapitulationMessage.show()
    endif
EndFunction

Function GatherArmiesForCampaignIntoHold(int holdnum, bool reinforcements = false)

    if AttackCampQuest.IsRunning() && (AttackCampQuest as CS_AttackFortCampScript).enemyfactionnum == FactionNum && (AttackCampQuest as CS_AttackFortCampScript).holdnum == holdnum
    
        debug.trace("Stopped reinforcements due to camp under attack")
        
    else

        debug.trace("Gathering troops for campaign")

        int DesiredArmies = 0
        if reinforcements == false
            DesiredArmies = TMData.GetKeywordData(Aggressiveness) as int
        else
            TMData.SetKeywordData(Aggressiveness, 4)
            DesiredArmies = TMData.GetKeywordData(Aggressiveness) as int - (AllLocationsCS.GetAt(TMData.GetKeywordData(WarPriority) as int) as Location).GetKeywordData(ArmiesPatrolling) as int
        endif
        int AvailableArmies = 0
        int i = 0
        while i < 9 ;Get number of armies available for campaign
            Location HoldLoc = AllLocationsCS.GetAt(i) as Location
            if HoldLoc.GetKeywordData(LandSuperiority) == FactionNum && i != TMData.GetKeywordData(Capital)
                if GetIsHoldLinked(i, holdnum)
                    if reinforcements == false
                        if HoldLoc.GetKeywordData(ArmiesPatrolling) > 1
                            AvailableArmies += (HoldLoc.GetKeywordData(ArmiesPatrolling) as int) - 1
                        endif
                    else
                        if GetIsHoldLinked(i, holdnum, directly=true)
                            if HoldLoc.GetKeywordData(ArmiesPatrolling) > 1
                                AvailableArmies += (HoldLoc.GetKeywordData(ArmiesPatrolling) as int) - 1
                            endif
                        endif
                    endif
                endif
            endif
            i += 1
        endwhile
        if AvailableArmies < DesiredArmies
            Location HoldLoc = AllLocationsCS.GetAt(TMData.GetKeywordData(Capital) as int) as Location
            if GetIsHoldLinked(TMData.GetKeywordData(Capital) as int, holdnum)
                if HoldLoc.GetKeywordData(ArmiesPatrolling) > 1
                    if reinforcements == false
                        if HoldLoc.GetKeywordData(ArmiesPatrolling) > 1
                            AvailableArmies += (HoldLoc.GetKeywordData(ArmiesPatrolling) as int) - 1
                        endif
                    else
                        if GetIsHoldLinked(TMData.GetKeywordData(Capital) as int, holdnum, directly=true)
                            if HoldLoc.GetKeywordData(ArmiesPatrolling) > 1
                                AvailableArmies += (HoldLoc.GetKeywordData(ArmiesPatrolling) as int) - 1
                            endif
                        endif
                    endif
                endif
            endif
            i += 1      
        endif

        debug.trace("initial AvailableArmies = " + AvailableArmies)
        debug.trace("initial DesiredArmies = " + DesiredArmies)

        int newholdnum = 0
        while TMData.GetKeywordData(AttackingArmies) < DesiredArmies && AvailableArmies > 0
            debug.trace("newholdnum = " + newholdnum)
            Location HoldLoc = AllLocationsCS.GetAt(newholdnum) as Location
            if HoldLoc.GetKeywordData(LandSuperiority) == FactionNum && newholdnum != TMData.GetKeywordData(Capital) && HoldLoc.GetKeywordData(ArmiesPatrolling) > 1
                if GetIsHoldLinked(newholdnum, holdnum)
                    if reinforcements == false
                        HoldLoc.SetKeywordData(ArmiesPatrolling, HoldLoc.GetKeywordData(ArmiesPatrolling) - 1)
                        TMData.SetKeywordData(AttackingArmies, TMData.GetKeywordData(AttackingArmies) + 1)
                        AvailableArmies -= 1
                        debug.trace("Attacking Armies = " + TMData.GetKeywordData(AttackingArmies) as int)
                        debug.trace("AvailableArmies = " + AvailableArmies)
                        ;AssignPatrols(newholdnum)
                    else
                        if GetIsHoldLinked(newholdnum, holdnum, directly=true)
                            HoldLoc.SetKeywordData(ArmiesPatrolling, HoldLoc.GetKeywordData(ArmiesPatrolling) - 1)
                            TMData.SetKeywordData(AttackingArmies, TMData.GetKeywordData(AttackingArmies) + 1)
                            AvailableArmies -= 1
                            debug.trace("Attacking Armies = " + TMData.GetKeywordData(AttackingArmies) as int)
                            debug.trace("AvailableArmies = " + AvailableArmies)
                            ;AssignPatrols(newholdnum)
                        endif
                    endif
                endif
            endif
            newholdnum += 1
            if newholdnum == 9
                newholdnum = TMData.GetKeywordData(Capital) as int
                HoldLoc = AllLocationsCS.GetAt(newholdnum) as Location
                if HoldLoc.GetKeywordData(ArmiesPatrolling) > 1
                    if GetIsHoldLinked(newholdnum, holdnum)
                        if reinforcements == false
                            HoldLoc.SetKeywordData(ArmiesPatrolling, HoldLoc.GetKeywordData(ArmiesPatrolling) - 1)
                            TMData.SetKeywordData(AttackingArmies, TMData.GetKeywordData(AttackingArmies) + 1)
                            AvailableArmies -= 1
                            debug.trace("Attacking Armies = " + TMData.GetKeywordData(AttackingArmies) as int)
                            debug.trace("AvailableArmies = " + AvailableArmies)
                            ;AssignPatrols(newholdnum)
                        else
                            if GetIsHoldLinked(newholdnum, holdnum, directly=true)
                                HoldLoc.SetKeywordData(ArmiesPatrolling, HoldLoc.GetKeywordData(ArmiesPatrolling) - 1)
                                TMData.SetKeywordData(AttackingArmies, TMData.GetKeywordData(AttackingArmies) + 1)
                                AvailableArmies -= 1
                                debug.trace("Attacking Armies = " + TMData.GetKeywordData(AttackingArmies) as int)
                                debug.trace("AvailableArmies = " + AvailableArmies)
                                ;AssignPatrols(newholdnum)
                            endif
                        endif
                    endif
                endif
                newholdnum = 0
            endif
        endwhile

        debug.trace("Armies gathered: " + (TMData.GetKeywordData(AttackingArmies) as int))
            
        if reinforcements == true
             (AllLocationsCS.GetAt(TMData.GetKeywordData(WarPriority) as int) as Location).SetKeywordData(ArmiesPatrolling, (AllLocationsCS.GetAt(TMData.GetKeywordData(WarPriority) as int) as Location).GetKeywordData(ArmiesPatrolling) + TMData.GetKeywordData(AttackingArmies))
            TMData.SetKeywordData(AttackingArmies, 0)
        endif

    endif

EndFunction

Function CalculateAggressiveness()
    TMData.SetKeywordData(Aggressiveness, 2)
    if TMData.GetKeywordData(ActiveCommanderCount) < TMData.GetKeywordData(TotalCommanderCount)
        TMData.SetKeywordData(Aggressiveness, 0)
    else
        int holdpriority = TMData.GetKeywordData(WarPriority) as int
        Location PriorityLoc = AllLocationsCS.GetAt(holdpriority) as Location
        if PriorityLoc.GetKeywordData(LandSuperiority) == FactionNum
            TMData.SetKeywordData(Aggressiveness, 5)
        else
            TMData.SetKeywordData(Aggressiveness, CityCount.GetValueInt() + MinorCityCount.GetValueInt())
        endif
    endif

    if TMData.GetKeywordData(Aggressiveness) > 5
        TMData.SetKeywordData(Aggressiveness, 5)
    endif
EndFunction

Function ChooseHoldPriority()
    
    bool EnemyAtWar = TMEnemyScript.AtWarPlayer

    if IsSonsQuest && EnemyAtWar
        debug.trace("Sons waiting 5 seconds for Imps to move")
        Utility.Wait(5)
    endif

    debug.trace("Choosing Hold Priority")

    int initialpriority = TMData.GetKeywordData(WarPriority) as int

    if (AllLocations.GetAt(initialpriority) as Location).GetKeywordData(CWOwner) == (FactionNum - 10) && (AllLocationsFort.GetAt(initialpriority) as Location).GetKeywordData(CWOwner) == (FactionNum - 10) && (AllLocationsCS.GetAt(initialpriority) as Location).GetKeywordData(LandSuperiority) == FactionNum
        (AllLocationsCS.GetAt(initialpriority) as Location).SetKeywordData(Contested, 0) 
        TMData.SetKeywordData(WarPriority, -1)
    endif

    if TMData.GetKeywordData(WarPriority) == -1 || (TMData.GetKeywordData(WarPriority) == TMDataEnemy.GetKeywordData(WarPriority) && EnemyAtWar) || (AllHoldings.GetAt(initialpriority) as GlobalVariable).GetValueInt() == EnemyFactionNum

        int i = 0
        while i < 9
            ChanceToInvade[i] = 0
            Location HoldLoc = AllLocationsCS.GetAt(i) as Location
            if ((EnemyAtWar && i != TMDataEnemy.GetKeywordData(WarPriority)) || !EnemyAtWar) && (AllHoldings.GetAt(i) as GlobalVariable).GetValueInt() != EnemyFactionNum
                if HoldLoc.GetKeywordData(LandSuperiority) == 1 && GetOwnHoldsBordering(i) > 0 && HoldJustBeaten != i
                    ChanceToInvade[i] = 1
                    ChanceToInvade[i] = ChanceToInvade[i] + GetOwnHoldsBordering(i) + Utility.RandomInt(0, 3)
                    if HoldLoc.GetKeywordData(ArmiesPatrolling) == 0
                        ChanceToInvade[i] = ChanceToInvade[i] + 10
                    endif
                elseif HoldLoc.GetKeywordData(LandSuperiority) == 1 && (CityCount.GetValue() + MinorCityCount.GetValue() == 1) && (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == FactionNum
                    ChanceToInvade[i] = 100
                endif
            endif
            i += 1
        endwhile

        int highestchance = 0
        int highestholdnum = -1
        i = 0
        while i < 9
            if ChanceToInvade[i] > highestchance && ChanceToInvade[i] > 0
                highestchance = ChanceToInvade[i]
                highestholdnum = i
            endif
            i += 1
        endwhile
        
        HoldJustBeaten = -1

        TMData.SetKeywordData(WarPriority, highestholdnum)

        debug.trace("Hold Priority set as " + TMData.GetKeywordData(WarPriority) as int)

    endif
EndFunction

Function LaunchHoldInvasion()
    while TroopRespawn.RespawningTroops
        Utility.Wait(3)
    endwhile
    int holdnum = TMData.GetKeywordData(WarPriority) as int
    Location HoldLoc = AllLocationsCS.GetAt(holdnum) as Location
    if AttackCampQuest.IsRunning() && (AttackCampQuest as CS_AttackFortCampScript).enemyfactionnum == FactionNum && (AttackCampQuest as CS_AttackFortCampScript).holdnum == holdnum

        debug.trace("Stopped patrol refresh due to camp under attack")

    else

        if HoldLoc.GetKeywordData(LandSuperiority) != FactionNum && GameDaysPassed.GetValue() >= RecoveryTimes[holdnum]
            GatherArmiesForCampaignIntoHold(TMData.GetKeywordData(WarPriority) as int)
            if TMData.GetKeywordData(AttackingArmies) > 0
                HoldLoc.SetKeywordData(Contested, 1)
                if HoldLoc.GetKeywordData(ArmiesPatrolling) == 0
                    SetUpCamp(holdnum)
                    debug.notification("You have no armies in the camp protecting this hold")
                    EstablishLandSuperiority(holdnum)
                else
                    if (AllGarrisonMarkersCamp.GetAt(holdnum) as ObjectReference).IsEnabled() == true
                        if TMData.GetKeywordData(AttackingArmies) > 1
                            InvadeCamp(holdnum)
                        endif
                    else
                        SetUpCamp(holdnum)
                    endif
                endif
            endif
        elseif GameDaysPassed.GetValue() >= RecoveryTimes[holdnum]
            GatherArmiesForCampaignIntoHold(holdnum, true) ;Reinforces invasion forces
            AssignPatrols(holdnum)
            if (AllLocationsFort.GetAt(holdnum) as Location).GetKeywordData(CWOwner) == 69
                HoldLoc.SetKeywordData(Contested, 1)
                if HoldLoc.GetKeywordData(ArmiesPatrolling) >= 2
                    InvadeFort(holdnum)
                endif
            elseif (AllLocations.GetAt(holdnum) as Location).GetKeywordData(CWOwner) == 69
                HoldLoc.SetKeywordData(Contested, 1)
                if HoldLoc.GetKeywordData(ArmiesPatrolling) >= 2
                    InvadeCity(holdnum)
                endif
            endif
        endif

    endif
EndFunction

Function SetUpCamp(int holdnum)
    if (AllGarrisonMarkersCamp.GetAt(holdnum) as ObjectReference).IsDisabled()
        (AllGarrisonMarkersCamp.GetAt(holdnum) as ObjectReference).enable()
        (TriggerBoxesCamp.GetAt(holdnum) as ObjectReference).enable()
        if factionnum == 1
            ((BannerScript.CampColors.GetAt(holdnum) as FormList).GetAt(BannerScript.FactionColor.GetValueInt()) as ObjectReference).enable()
            (AllLocationsCS.GetAt(holdnum) as Location).SetKeywordData(Invading, 0)
        endif
        MessageHoldLoc.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
        WarMapReset.Start()
        WarCampMessage.show()
    
        if WarMapReset.IsRunning()
            WarMapReset.Stop()
        endif
    
        WarMapReset.Start()
        (WarMapReset as CS_WarMapResetScript).ResetWarMap(holdnum)
    endif
EndFunction

Function DisableCamp(int holdnum)
    (AllGarrisonMarkersCamp.GetAt(holdnum) as ObjectReference).disable()
    if factionnum == 1
        ((BannerScript.CampColors.GetAt(holdnum) as FormList).GetAt(BannerScript.FactionColor.GetValueInt()) as ObjectReference).disable()
    endif
endFunction

Function AbandonWarCamp(int holdnum)
    (AllGarrisonMarkersCamp.GetAt(holdnum) as ObjectReference).disable()
    MessageHoldLoc.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
    WarCampLostMessage.show()

    if WarMapReset.IsRunning()
        WarMapReset.Stop()
    endif

    WarMapReset.Start()
    (WarMapReset as CS_WarMapResetScript).ResetWarMap(holdnum)
EndFunction

Function ResetWarMap(int holdnum)
    if WarMapReset.IsRunning()
        WarMapReset.Stop()
    endif

    WarMapReset.Start()
    (WarMapReset as CS_WarMapResetScript).ResetWarMap(holdnum)
EndFunction

Function EstablishLandSuperiority(int holdnum)
    Location HoldLoc = AllLocationsCS.GetAt(holdnum) as Location
    LSHoldLocation.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
    LSMessage.show()
    HoldLoc.SetKeywordData(LandSuperiority, FactionNum)
    if FactionNum != 1
        HoldLoc.SetKeywordData(ArmiesPatrolling, TMData.GetKeywordData(AttackingArmies))
        TMData.SetKeywordData(AttackingArmies, 0)
        CommanderScript.ConvertAllFromPatrolToAttack(holdnum)
        (AllGarrisonMarkersCamp.GetAt(holdnum) as ObjectReference).enable()
        (AllGarrisonMarkersCampPlayer.GetAt(holdnum) as ObjectReference).disable()
        (BannerScript.CampColorMarkers.GetAt(holdnum) as ObjectReference).disable()
        ;BlockadeCommanders(holdnum)
        DisplayInvasionObjectives(holdnum)
    else
        FormList CommanderPatrols = CommanderPatrolLists.GetAt(holdnum) as FormList
        HoldLoc.SetKeywordData(ArmiesPatrolling, CommanderPatrols.GetSize())
        CommanderScript.ConvertAllFromAttackToPatrol(holdnum)
        ;UnBlockadeCommanders(holdnum)
    endif
    AssignPatrols(holdnum)
EndFunction

Function LoseLandSuperiority(int holdnum)
    Location HoldLoc = AllLocationsCS.GetAt(holdnum) as Location
    LSHoldLocation.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
    LSLostMessage.show()
    HoldLoc.SetKeywordData(LandSuperiority, 1)
    HoldLoc.SetKeywordData(ArmiesPatrolling, 0)
    if TMData.GetKeywordData(WarPriority) == holdnum && (AllLocationsFort.GetAt(holdnum) as Location).GetKeywordData(CWOwner) != (FactionNum - 10) && (AllLocations.GetAt(holdnum) as Location).GetKeywordData(CWOwner) != (FactionNum - 10)
        HoldJustBeaten = holdnum
        TMData.SetKeywordData(WarPriority, -1)
        HoldLoc.SetKeywordData(Contested, 0) 
    endif
    DisplayInvasionObjectives(holdnum)
    TMPlayerScript.EstablishLandSuperiority(holdnum)
    RecoveryTimes[holdnum] = GameDaysPassed.GetValue() + CS_EnemyRecovery.GetValue()/24
EndFunction

Function BlockadeCommanders(int holdnum)
    FormList GarrisonCommanders = CommanderScript.CommandersGarrisonHolds.GetAt(holdnum) as FormList
    int i = 0
    while i < GarrisonCommanders.GetSize()
        int armynum = CommanderScript.GetCommanderArmyNum(GarrisonCommanders.GetAt(i) as Actor)
        CommanderScript.ArmyScripts[armynum].Blockaded = true
        i += 1
    endwhile

    Actor FortCommander = CommanderScript.FortCommanders.FortCommanders[holdnum].GetActorRef()
    if FortCommander
        int fortarmynum = CommanderScript.GetCommanderArmyNum(FortCommander)
        CommanderScript.ArmyScripts[fortarmynum].Blockaded = true
    endif
EndFunction

Function UnBlockadeCommanders(int holdnum, bool city=true, bool fort=true)

    if city

        FormList GarrisonCommanders = CommanderScript.CommandersGarrisonHolds.GetAt(holdnum) as FormList
        int i = 0
        while i < GarrisonCommanders.GetSize()
            int armynum = CommanderScript.GetCommanderArmyNum(GarrisonCommanders.GetAt(i) as Actor)
            CommanderScript.ArmyScripts[armynum].Blockaded = false
            i += 1
        endwhile

    endif

    if fort

        Actor FortCommander = CommanderScript.FortCommanders.FortCommanders[holdnum].GetActorRef()
        if FortCommander
            int fortarmynum = CommanderScript.GetCommanderArmyNum(FortCommander)
            CommanderScript.ArmyScripts[fortarmynum].Blockaded = false
        endif

    endif
EndFunction

Function RemoveArmiesFromHold(int holdnum)
    Location HoldLoc = AllLocationsCS.GetAt(holdnum) as Location
    KillAttackingArmies()
    AbandonWarCamp(holdnum)
    HoldJustBeaten = holdnum
    RecoveryTimes[holdnum] = GameDaysPassed.GetValue() + CS_EnemyRecovery.GetValue()/24
    TMData.SetKeywordData(WarPriority, -1)
    HoldLoc.SetKeywordData(Contested, 0) 
EndFunction

Function AssignPatrols(int holdnum, bool updatemap = true)
    Location HoldLoc = AllLocationsCS.GetAt(holdnum) as Location
    if HoldLoc.GetKeywordData(LandSuperiority) != 1
        int i = 0
        while i < ArmyPatrols.Length
            HoldLoc.SetKeywordData(ArmyPatrols[i], 0)
            i += 1
        endwhile
        i = 0
        int[] PatrolOrder = GetRandomPatrols()
        while i < HoldLoc.GetKeywordData(ArmiesPatrolling) && i < ArmyPatrols.Length
            int patrolnum = PatrolOrder[i]
            HoldLoc.SetKeywordData(ArmyPatrols[patrolnum], 20)
            i += 1
        endwhile
    else
        debug.trace("Assigning player patrols in " + holdnum)
        FormList PatrolCommanders = CommanderPatrolLists.GetAt(holdnum) as FormList
        int i = 0
        while i < ArmyPatrols.Length
            HoldLoc.SetKeywordData(ArmyPatrols[i], -1)
            i += 1
        endwhile
        i = 0
        int[] PatrolOrder = GetRandomPatrols()
        while i < HoldLoc.GetKeywordData(ArmiesPatrolling) && i < ArmyPatrols.Length
            int patrolnum = PatrolOrder[i]
            debug.trace("Setting ArmyPatrol " + patrolnum + " to " + CommanderScript.GetCommanderArmyNum(PatrolCommanders.GetAt(i) as Actor))
            HoldLoc.SetKeywordData(ArmyPatrols[patrolnum], CommanderScript.GetCommanderArmyNum(PatrolCommanders.GetAt(i) as Actor))
            i += 1
        endwhile
    endif

    if updatemap

        debug.trace("Starting War map reset")

        if WarMapReset.IsRunning()
            WarMapReset.Stop()
        endif

        WarMapReset.Start()
        (WarMapReset as CS_WarMapResetScript).ResetWarMap(holdnum)

        debug.trace("Patrols assigned and war map reset")

    endif
EndFunction

Function AssignAllPatrols()
    int i = 0
    while i < 9
        if (AllLocationsCS.GetAt(i) as Location).GetKeywordData(LandSuperiority) == FactionNum
            AssignPatrols(i)
        endif
        i += 1
    endwhile
EndFunction

Function RemovePatrols(int holdnum)
    Location HoldLoc = AllLocationsCS.GetAt(holdnum) as Location
    if HoldLoc.GetKeywordData(LandSuperiority) != 1
        int i = 0
        while i < ArmyPatrols.Length
            HoldLoc.SetKeywordData(ArmyPatrols[i], 0)
            i += 1
        endwhile
    else
        debug.trace("Assigning player patrols in " + holdnum)
        FormList PatrolCommanders = CommanderPatrolLists.GetAt(holdnum) as FormList
        int i = 0
        while i < ArmyPatrols.Length
            HoldLoc.SetKeywordData(ArmyPatrols[i], -1)
            i += 1
        endwhile
    endif

    if PatrolQuest.IsRunning() && (PatrolQuest as CS_WarPatrolAmbushScript).HoldLoc == HoldLoc
        (PatrolQuest as CS_WarPatrolAmbushScript).DetachArmy()
    endif


    if WarMapReset.IsRunning()
        WarMapReset.Stop()
    endif

    WarMapReset.Start()
    (WarMapReset as CS_WarMapResetScript).ResetWarMap(holdnum)
EndFunction

int[] Function GetRandomPatrols()
    int[] RandomPatrols = new int[4]
    int randomconfig = utility.randomint(1, 24)
    if randomconfig == 1
        RandomPatrols[0] = 0
        RandomPatrols[1] = 1
        RandomPatrols[2] = 2
        RandomPatrols[3] = 3
    elseif randomconfig == 2
        RandomPatrols[0] = 0
        RandomPatrols[1] = 1
        RandomPatrols[2] = 3
        RandomPatrols[3] = 2
    elseif randomconfig == 3
        RandomPatrols[0] = 0
        RandomPatrols[1] = 3
        RandomPatrols[2] = 2
        RandomPatrols[3] = 1
    elseif randomconfig == 4
        RandomPatrols[0] = 0
        RandomPatrols[1] = 2
        RandomPatrols[2] = 3
        RandomPatrols[3] = 1
    elseif randomconfig == 5
        RandomPatrols[0] = 0
        RandomPatrols[1] = 3
        RandomPatrols[2] = 1
        RandomPatrols[3] = 2
    elseif randomconfig == 6
        RandomPatrols[0] = 0
        RandomPatrols[1] = 2
        RandomPatrols[2] = 1
        RandomPatrols[3] = 3
    elseif randomconfig == 7
        RandomPatrols[0] = 1
        RandomPatrols[1] = 0
        RandomPatrols[2] = 3
        RandomPatrols[3] = 2
    elseif randomconfig == 8
        RandomPatrols[0] = 1
        RandomPatrols[1] = 0
        RandomPatrols[2] = 2
        RandomPatrols[3] = 3
    elseif randomconfig == 9
        RandomPatrols[0] = 1
        RandomPatrols[1] = 2
        RandomPatrols[2] = 0
        RandomPatrols[3] = 3
    elseif randomconfig == 10
        RandomPatrols[0] = 1
        RandomPatrols[1] = 2
        RandomPatrols[2] = 3
        RandomPatrols[3] = 0
    elseif randomconfig == 11
        RandomPatrols[0] = 1
        RandomPatrols[1] = 3
        RandomPatrols[2] = 0
        RandomPatrols[3] = 2
    elseif randomconfig == 12
        RandomPatrols[0] = 1
        RandomPatrols[1] = 3
        RandomPatrols[2] = 2
        RandomPatrols[3] = 0
    elseif randomconfig == 13
        RandomPatrols[0] = 2
        RandomPatrols[1] = 0
        RandomPatrols[2] = 3
        RandomPatrols[3] = 1
    elseif randomconfig == 14
        RandomPatrols[0] = 2
        RandomPatrols[1] = 0
        RandomPatrols[2] = 1
        RandomPatrols[3] = 3
    elseif randomconfig == 15
        RandomPatrols[0] = 2
        RandomPatrols[1] = 1
        RandomPatrols[2] = 0
        RandomPatrols[3] = 3
    elseif randomconfig == 16
        RandomPatrols[0] = 2
        RandomPatrols[1] = 1
        RandomPatrols[2] = 3
        RandomPatrols[3] = 0
    elseif randomconfig == 17
        RandomPatrols[0] = 2
        RandomPatrols[1] = 3
        RandomPatrols[2] = 0
        RandomPatrols[3] = 1
    elseif randomconfig == 18
        RandomPatrols[0] = 2
        RandomPatrols[1] = 3
        RandomPatrols[2] = 1
        RandomPatrols[3] = 0
    elseif randomconfig == 19
        RandomPatrols[0] = 3
        RandomPatrols[1] = 0
        RandomPatrols[2] = 1
        RandomPatrols[3] = 2
    elseif randomconfig == 20
        RandomPatrols[0] = 3
        RandomPatrols[1] = 0
        RandomPatrols[2] = 2
        RandomPatrols[3] = 1
    elseif randomconfig == 21
        RandomPatrols[0] = 3
        RandomPatrols[1] = 2
        RandomPatrols[2] = 0
        RandomPatrols[3] = 1
    elseif randomconfig == 22
        RandomPatrols[0] = 3
        RandomPatrols[1] = 2
        RandomPatrols[2] = 1
        RandomPatrols[3] = 0
    elseif randomconfig == 23
        RandomPatrols[0] = 3
        RandomPatrols[1] = 1
        RandomPatrols[2] = 0
        RandomPatrols[3] = 2
    elseif randomconfig == 24
        RandomPatrols[0] = 3
        RandomPatrols[1] = 1
        RandomPatrols[2] = 2
        RandomPatrols[3] = 0
    endif

    return RandomPatrols
EndFunction

Function InvadeCamp(int holdnum)
    ObjectReference PlayerCampMarker = AllGarrisonMarkersCampPlayer.GetAt(holdnum) as ObjectReference
    if DefendCampQuest.IsRunning() == 0 && DefendFortQuest.IsRunning() == 0 && DefendCityQuestNew.IsRunning() == 0 && AttackCampQuest.IsRunning() == 0
        CS_StoryDefendCamp.SendStoryEvent(akRef1 = PlayerCampMarker, aiValue1 = FactionNum)
    endif
EndFunction

Function InvadeFort(int holdnum)
    Location HoldLoc = AllLocationsCS.GetAt(holdnum) as Location
    Location FortLoc = AllLocationsFort.GetAt(holdnum) as Location
    if DefendCampQuest.IsRunning() == 0 && DefendFortQuest.IsRunning() == 0 && DefendCityQuestNew.IsRunning() == 0
        TMData.SetKeywordData(AttackingArmies, 1)
        HoldLoc.SetKeywordData(ArmiesPatrolling, HoldLoc.GetKeywordData(ArmiesPatrolling) - 1)
        AssignPatrols(holdnum)
        CS_StoryDefendFort.SendStoryEvent(akLoc = FortLoc, aiValue1 = FactionNum)
    endif
EndFunction

Function InvadeCity(int holdnum)
    Location HoldLoc = AllLocationsCS.GetAt(holdnum) as Location
    if DefendCampQuest.IsRunning() == 0 && DefendFortQuest.IsRunning() == 0 && DefendCityQuestNew.IsRunning() == 0
        TMData.SetKeywordData(AttackingArmies, HoldLoc.GetKeywordData(ArmiesPatrolling) - 1)
        HoldLoc.SetKeywordData(ArmiesPatrolling, 1)
        AssignPatrols(holdnum)
        ;debug.notification("Attempting to invade city...")
        Location AttackedCity = AllLocations.GetAt(holdnum) as Location
        ;if holdnum == 0
        ;    DefendCityStaging.ForceLocationTo(MarkarthLocation)
        ;endif
        ;DefendCityQuestNew.Stop()
        ;DefendCityQuestNew.Start()
        ;DefendCityQuestNew.SetStage(1)
        CS_StoryDefendCity.SendStoryEvent(akLoc = AttackedCity, aiValue1 = FactionNum)
    endif
EndFunction

Function AddAttackingArmiesToGarrison(int troopsremaining)
    int remainingarmies = math.ceiling(troopsremaining/20)
    int initialarmies = TMData.GetKeywordData(AttackingArmies) as int
    int deadarmies = initialarmies - remainingarmies
    int holdnum = TMData.GetKeywordData(WarPriority) as int
    Location HoldLoc = AllLocationsCS.GetAt(holdnum) as Location
    HoldLoc.SetKeywordData(ArmiesDefending, remainingarmies)
    TMData.SetKeywordData(ActiveCommanderCount, TMData.GetKeywordData(ActiveCommanderCount) - deadarmies)
EndFunction

Function KillAttackingArmies()
    TMData.SetKeywordData(ActiveCommanderCount, TMData.GetKeywordData(ActiveCommanderCount) - TMData.GetKeywordData(AttackingArmies))
    TMData.SetKeywordData(AttackingArmies, 0)
EndFunction

Function KillPatrollingArmy(Location HoldLoc)
    HoldLoc.SetKeywordData(ArmiesPatrolling, HoldLoc.GetKeywordData(ArmiesPatrolling) - 1)
    TMData.SetKeywordData(ActiveCommanderCount, TMData.GetKeywordData(ActiveCommanderCount) - 1)
    if HoldLoc.GetKeywordData(ArmiesPatrolling) == 0
        LoseLandSuperiority(AllLocationsCS.Find(HoldLoc))
        DisableCamp(AllLocationsCS.Find(HoldLoc))
    endif
    int aggressivenessincrease = utility.randomint(1, 2)
    AdjustAggressiveness(aggressivenessincrease)
EndFunction

Function PlayerEvacuateCamp(int holdnum)
    int i = 0
    while i < (CommanderScript.CommandersPatrollingHolds.GetAt(holdnum) as FormList).GetSize()
        CommanderScript.StopPatrolHold((CommanderScript.CommandersPatrollingHolds.GetAt(holdnum) as FormList).GetAt(i) as Actor)
        i += 1
    endwhile

    i = 0
    while i < MovingScript.CommandersIncomingCamp[holdnum].GetSize()
        MovingScript.StopCommanderMoving(MovingScript.CommandersIncomingCamp[holdnum].GetAt(i) as Actor)
        i += 1
    endwhile
EndFunction

Function AdjustAggressiveness(int increasenum)
    if TMData.GetKeywordData(Aggressiveness) + increasenum <= 5
        TMData.SetKeywordData(Aggressiveness, TMData.GetKeywordData(Aggressiveness) + increasenum)
    endif
EndFunction

Function AdjustWarScore(int amount)
    WarScore.Mod(amount)
EndFunction

Function TestPlayerLandSuperiority()
    int i = 0
    while i < 9
        if (AllLocations.GetAt(i) as Location).GetKeywordData(CWOwner) == 69
            (AllLocationsCS.GetAt(i) as Location).SetKeywordData(LandSuperiority, 1)
        endif
        i += 1
    endwhile
EndFunction

Event OnUpdateGameTime()
    SetCommanderCount()
    RespawnArmies()
    DistributeCommandersHold()
    ChooseHoldPriority()
    SendPatrolsToBorderingHolds()
    AssignAllPatrols()
    if DefendFortQuest.IsRunning() == 0 && DefendCityQuest.IsRunning() == 0 && DefendCampQuest.IsRunning() == 0
        LaunchHoldInvasion()
    endif
    ;TestLocationInfoStart()
EndEvent

Function TestLocationInfoStart(int Response = 0)
    Response = TestLocationInfoStartMessage.show()
    TestLocationInfo(Response)
EndFunction

Function TestLocationInfo(int holdingnum, int Response = 0)
    TestLocation.ForceLocationTo(AllLocationsCS.GetAt(holdingnum) as Location)
    TestLocationCityArmies.SetValue(TestLocation.GetLocation().GetKeywordData(ArmiesDefending))
    TestLocationPatrolArmies.SetValue(TestLocation.GetLocation().GetKeywordData(ArmiesPatrolling))
    TestLocationFortArmies.SetValue(1)
    UpdateCurrentInstanceGlobal(TestLocationCityArmies)
    UpdateCurrentInstanceGlobal(TestLocationPatrolArmies)
    UpdateCurrentInstanceGlobal(TestLocationFortArmies)
    Response = TestLocationInfoMessage.show()
    if Response == 0
        TestLocationInfoStart()
    endif
EndFunction

Function TestLinkMenu1(int Response=0)
    Response = TestLinkMessage1.show()
    TestLinkInt1 = Response
    TestLinkMenu2()
EndFunction

Function TestLinkMenu2(int Response=0)
    Response = TestLinkMessage2.show()
    TestLinkInt2 = Response
    bool isholdlinked = GetIsHoldLinked(TestLinkInt1, TestLinkInt2)
    debug.notification("Holds Linked = " + isholdlinked)
EndFunction