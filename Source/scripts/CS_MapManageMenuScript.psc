Scriptname CS_MapManageMenuScript extends Quest  conditional

FormList Property StartMessagesCampIncoming Auto
FormList Property StartMessagesCampInvasionIncoming Auto
Message Property StartMessageCity Auto
FormList Property StartMessagesCityIncoming Auto
Message Property StartMessageFort Auto
Message Property StartMessageFortIncoming Auto
Message Property RemoveArmyCity Auto
Message Property MessageNoSuperiority Auto
Message Property HoldsNotLinked Auto

CS_PatrolHoldScript Property CommanderScript Auto
CS_CommanderMovingScript Property MovingScript Auto

LocationAlias Property CityLoc Auto
LocationAlias Property HoldLoc Auto

ReferenceAlias[] Property GarrisonCommanders Auto
ReferenceAlias[] Property PatrolCommanders Auto
ReferenceAlias[] Property PatrolCommanders2 Auto
ReferenceAlias[] Property IncomingCommanders Auto
ReferenceAlias Property FortCommander Auto

FormList Property AllLocationsCS Auto
FormList Property AllLocationsFort Auto
FormList Property AllHolds Auto
FormList Property IncomingTimes Auto

FormList Property ArmyQuests Auto

GlobalVariable Property PatrolCount Auto
GlobalVariable Property GarrisonCount Auto
GlobalVariable Property IncomingCount Auto
GlobalVariable Property TotalArmies Auto
GlobalVariable Property MaxArmies Auto
GlobalVariable Property PrisonerCount Auto
GlobalVariable Property Capital Auto

FormList Property CommanderPatrolHolds Auto
FormList Property CommanderGarrisonHolds Auto

FormList Property CommanderPatrolHold Auto
FormList Property CommanderGarrisonHold Auto

ObjectReference Property NoneObject Auto

Keyword Property LandSuperiority Auto
Keyword Property ArmiesDefending Auto
Keyword Property BarracksLevel Auto
Keyword Property InBattle Auto

bool Property FortHasCommander Auto conditional

bool Property Army1 Auto conditional
bool Property Army2 Auto conditional
bool Property Army3 Auto conditional
bool Property Army4 Auto conditional
bool Property Army5 Auto conditional
bool Property Army6 Auto conditional
bool Property Army7 Auto conditional
bool Property Army8 Auto conditional
bool Property Army9 Auto conditional
bool Property Army10 Auto conditional

Quest Property TroopManage Auto
Quest Property AttackCityQuest Auto
Quest Property AttackFortQuest Auto
Quest Property DefendCityQuestImp Auto
Quest Property DefendCityQuestSons Auto
Quest Property DefendFortQuestImp Auto
Quest Property DefendFortQuestSons Auto
Quest Property DefendCampQuestImp Auto
Quest Property DefendCampQuestSons Auto

CS_TMScript Property TMPlayer Auto
CS_TMScript Property TMImp Auto
CS_TMScript Property TMSons Auto
CS_FortCommandersScript Property FortCommandersScript Auto
CS_BattleTrackerScript Property BattleTracker Auto
CS_PrisonerQuestScript Property PrisonerScript Auto

Function MenuStart(int holdnum, string type, int Response = 0)
    if type == "Camp" && IsInBattle("Camp", holdnum) == true
        debug.notification("Can not manage this camp while it is under attack!")
    elseif type == "Fort" && IsInBattle("Fort", holdnum) == true
        debug.notification("Can not manage this fort while it is under attack!")
    elseif type == "City" && IsInBattle("City", holdnum) == true
        debug.notification("Can not manage this city while it is under attack!")
    else
        SetUp(holdnum)
        if type == "Camp"
            TotalArmies.SetValue(CommanderPatrolHold.GetSize() + MovingScript.CommandersIncomingCamp[holdnum].GetSize())
            MaxArmies.SetValue(10)
            if TotalArmies.GetValue() > 0
                    int i = 0
                    while i < IncomingCommanders.Length
                        Actor IncomingCommander = MovingScript.CommandersIncomingCamp[holdnum].GetAt(i) as Actor
                        if IncomingCommander
                            IncomingCommanders[i].ForceRefTo(IncomingCommander)
                            int armynum = CommanderScript.GetCommanderArmyNum(IncomingCommanders[i].GetActorRef())
                            (IncomingTimes.GetAt(i) as GlobalVariable).SetValue(((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).MovingArrivalTimeRemaining)
                            UpdateCurrentInstanceGlobal(IncomingTimes.GetAt(i) as GlobalVariable)
                            IncomingCount.Mod(((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).TroopCount)
                        else
                            IncomingCommanders[i].ForceRefTo(NoneObject)
                        endif
                        i += 1
                    endwhile
            endif
            UpdateCurrentInstanceGlobal(IncomingCount)

            if !CheckIfEnemyHasLandSuperiority(holdnum)
                int IncomingCommandersSize = MovingScript.CommandersIncomingCamp[holdnum].GetSize()
                Response = (StartMessagesCampIncoming.GetAt(IncomingCommandersSize) as Message).show()
            else
                int IncomingCommandersSize = MovingScript.CommandersIncomingCamp[holdnum].GetSize()
                Response = (StartMessagesCampInvasionIncoming.GetAt(IncomingCommandersSize) as Message).show()
            endif

                if Response == 0
                    if TMPlayer.GetOwnSuperiorHoldsBordering(holdnum) > 0 || TMPlayer.GetLandSuperiorityNum() == 0 || (TMPlayer.CityCount + TMPlayer.MinorCityCount) == 1
                        TroopManage.Start()
                        Actor NewCommander = (TroopManage as CS_TroopManageMenuScript).ArmiesSelect1Menu(CommanderScript.MovingCampMarkers.GetAt(holdnum) as ObjectReference)
                        TroopManage.Stop()
                        if NewCommander != None
                            if CommanderPatrolHold.HasForm(NewCommander)
                                debug.notification("This army is already patrolling here!")
                            elseif MovingScript.CommandersIncomingCamp[holdnum].HasForm(NewCommander)
                                debug.notification("This army is already moving here!")
                            elseif (NewCommander.IsInFaction(CommanderScript.PatrolFaction) || NewCommander.IsInFaction(CommanderScript.AttackFaction)) && CommanderScript.FindPatrolHold(NewCommander) != holdnum &&  !TMPlayer.GetIsHoldLinked(CommanderScript.FindPatrolHold(NewCommander), holdnum, nofirsthold = true)
                                debug.notification("This army can not move through enemy lines!")
                            else
                                CommanderScript.RegisterForMoving(NewCommander, "Camp", holdnum, map = true)
                            endif
                        endif
                        MenuStart(holdnum, type)
                    else
                        HoldsNotLinked.show()
                    endif
                endif       
        elseif type == "City"
            if MovingScript.CommandersIncomingCity[holdnum].GetSize() > 0
                int i = 0
                while i < IncomingCommanders.Length
                    IncomingCommanders[i].ForceRefTo(NoneObject)
                    Actor IncomingCommander = MovingScript.CommandersIncomingCity[holdnum].GetAt(i) as Actor
                    if IncomingCommander
                        IncomingCommanders[i].ForceRefTo(MovingScript.CommandersIncomingCity[holdnum].GetAt(i) as Actor)
                        int armynum = CommanderScript.GetCommanderArmyNum(IncomingCommanders[i].GetActorRef())
                        (IncomingTimes.GetAt(i) as GlobalVariable).SetValue(((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).MovingArrivalTimeRemaining)
                        UpdateCurrentInstanceGlobal(IncomingTimes.GetAt(i) as GlobalVariable)
                        IncomingCount.Mod(((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).TroopCount)
                    else
                        IncomingCommanders[i].ForceRefTo(NoneObject)
                    endif
                    i += 1
                endwhile
                UpdateCurrentInstanceGlobal(IncomingCount)
                Response = (StartMessagesCityIncoming.GetAt(MovingScript.CommandersIncomingCity[holdnum].GetSize() - 1) as Message).show()
            else
                Response = StartMessageCity.show()
            endif
            if Response == 0
                if !CheckIfEnemyHasLandSuperiority(holdnum) && (MovingScript.CommandersIncomingCity[holdnum].GetSize() +  (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(ArmiesDefending)) < (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(BarracksLevel)
                    TroopManage.Start()
                    Actor NewCommander = (TroopManage as CS_TroopManageMenuScript).ArmiesSelect1Menu(CommanderScript.MovingCityMarkers.GetAt(holdnum) as ObjectReference)
                    TroopManage.Stop()
                    if NewCommander != None
                        if MovingScript.CommandersIncomingCity[holdnum].HasForm(NewCommander) == true
                            debug.notification("This army is already moving here!")
                        elseif CommanderGarrisonHold.HasForm(NewCommander) == true
                            debug.notification("This army is already garrisoned here!")
                        elseif (NewCommander.IsInFaction(CommanderScript.PatrolFaction) || NewCommander.IsInFaction(CommanderScript.AttackFaction)) && CommanderScript.FindPatrolHold(NewCommander) != holdnum && !TMPlayer.GetIsHoldLinked(CommanderScript.FindPatrolHold(NewCommander), holdnum, nofirsthold = true)
                            debug.notification("This army can not move through enemy lines!")
                        else
                            CommanderScript.StartPatrol(NewCommander, holdnum, map = true)
                        endif
                    endif
                elseif (MovingScript.CommandersIncomingCity[holdnum].GetSize() +  (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(ArmiesDefending)) >=  (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(BarracksLevel)
                    debug.notification("This garrison is full!")
                else
                    MessageNoSuperiority.show()
                endif
                MenuStart(holdnum, type)
            elseif Response == 1
                if !CheckIfEnemyHasLandSuperiority(holdnum) || ((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == 11 && !TMImp.AtWarPlayer) || ((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == 12 && !TMSons.AtWarPlayer)
                    RemoveArmyMenu(holdnum, type)
                else
                    MessageNoSuperiority.show()
                endif
            elseif Response == 2
                if !CheckIfEnemyHasLandSuperiority(holdnum) || ((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == 11 && !TMImp.AtWarPlayer) || ((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == 12 && !TMSons.AtWarPlayer)
                    PrisonerScript.PrisonerMenu("City", holdnum)
                else
                    MessageNoSuperiority.show()
                endif
            endif
        elseif type == "Fort"
            FortCommander.Clear()
            FortCommander.ForceRefTo(FortCommandersScript.FortCommanders[holdnum].GetActorRef())
            GarrisonCount.SetValue(CommanderScript.ArmyScripts[CommanderScript.GetCommanderArmyNum(FortCommander.GetActorRef())].TroopCount)
            UpdateCurrentInstanceGlobal(GarrisonCount)
            CityLoc.ForceLocationTo(AllLocationsFort.GetAt(holdnum) as Location)
            FortHasCommander = true
            if FortCommander.GetActorRef() == None
                FortCommander.ForceRefTo(NoneObject)
                FortHasCommander = false
            endif
            PrisonerCount.SetValue(PrisonerScript.FortPrisonersTroopImp[holdnum] + PrisonerScript.FortPrisonersTroopSons[holdnum] + PrisonerScript.FortPrisonersCommanderImp[holdnum] + PrisonerScript.FortPrisonersCommanderSons[holdnum] + PrisonerScript.FortPrisonersCivilian[holdnum])
            UpdateCurrentInstanceGlobal(PrisonerCount)
            if MovingScript.CommandersIncomingFort[holdnum] != None
                int armynum = CommanderScript.GetCommanderArmyNum(MovingScript.CommandersIncomingFort[holdnum])
                IncomingCommanders[0].ForceRefTo(MovingScript.CommandersIncomingFort[holdnum])
                (IncomingTimes.GetAt(0) as GlobalVariable).SetValue(((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).MovingArrivalTimeRemaining)
                UpdateCurrentInstanceGlobal(IncomingTimes.GetAt(0) as GlobalVariable)
                Response = StartMessageFortIncoming.show()
            else
                Response = StartMessageFort.show()
            endif
            if Response == 0 || Response == 2
                if !CheckIfEnemyHasLandSuperiority(holdnum) || ((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == 11 && !TMImp.AtWarPlayer) || ((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == 12 && !TMSons.AtWarPlayer)
                    TroopManage.Start()
                    Actor NewCommander = (TroopManage as CS_TroopManageMenuScript).ArmiesSelect1Menu(FortCommandersScript.Positions[holdnum])
                    TroopManage.Stop()
                    if NewCommander != None
                        if MovingScript.CommandersIncomingFort[holdnum] == NewCommander
                            debug.notification("This army is already moving here!")
                        elseif FortCommandersScript.FortCommanders[holdnum].GetActorRef() == NewCommander
                            debug.notification("This army is already garrisoned here!")
                        elseif (NewCommander.IsInFaction(CommanderScript.PatrolFaction) || NewCommander.IsInFaction(CommanderScript.AttackFaction)) && CommanderScript.FindPatrolHold(NewCommander) != holdnum &&  !TMPlayer.GetIsHoldLinked(CommanderScript.FindPatrolHold(NewCommander), holdnum, nofirsthold = true)
                            debug.notification("This army can not move through enemy lines!")
                        else
                            CommanderScript.GiveFortToCommander(NewCommander, holdnum)
                        endif
                    endif
                else
                    MessageNoSuperiority.show()
                endif
                MenuStart(holdnum, type)
            elseif Response == 1
                if !CheckIfEnemyHasLandSuperiority(holdnum) || ((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == 11 && !TMImp.AtWarPlayer) || ((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == 12 && !TMSons.AtWarPlayer)
                    CommanderScript.TakeFortFromCommander(FortCommander.GetActorRef())
                else
                    MessageNoSuperiority.show()
                endif
                MenuStart(holdnum, type)
            elseif Response == 3
                if !CheckIfEnemyHasLandSuperiority(holdnum) || ((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == 11 && !TMImp.AtWarPlayer) || ((AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == 12 && !TMSons.AtWarPlayer)
                    PrisonerScript.PrisonerMenu("Fort", holdnum)
                else
                    MessageNoSuperiority.show()
                endif
                MenuStart(holdnum, type)
            endif
        endif
    endif
EndFunction

bool Function CheckIfEnemyHasLandSuperiority(int holdnum)
    int factionnum = (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) as int
    if factionnum == 1
        return false
    elseif factionnum == 11
        if (TMImp.AllGarrisonMarkersCamp.GetAt(holdnum) as ObjectReference).IsDisabled()
            (AllLocationsCS.GetAt(holdnum) as Location).SetKeywordData(LandSuperiority, 1)
            return false
        else
            return true
        endif
    elseif factionnum == 12
        if (TMSons.AllGarrisonMarkersCamp.GetAt(holdnum) as ObjectReference).IsDisabled()
            (AllLocationsCS.GetAt(holdnum) as Location).SetKeywordData(LandSuperiority, 1)
            return false
        else
            return true
        endif
    endif
EndFunction

Function RemoveArmyMenu(int holdnum, string type, int Response = 0)
    if type == "City"
        Response = RemoveArmyCity.show()
        if Response < 5
            CommanderScript.ClearFactions(GarrisonCommanders[Response].GetActorRef())
            GarrisonCommanders[Response].Clear()
            MenuStart(holdnum, type)
        elseif Response == 5
            MenuStart(holdnum, type)
        endif
    endif
EndFunction

Function SetUp(int holdnum)
    PatrolCount.SetValue(0)
    GarrisonCount.SetValue(0)
    IncomingCount.SetValue(0)
    HoldLoc.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
    CityLoc.ForceLocationTo(AllLocationsCS.GetAt(holdnum) as Location)
    CommanderPatrolHold = CommanderPatrolHolds.GetAt(holdnum) as FormList
    debug.trace("Commanders patrolling hold = " + CommanderPatrolHold.GetSize())
    CommanderGarrisonHold = CommanderGarrisonHolds.GetAt(holdnum) as FormList
    int i = 0
    int arraynums = 0
    while i < PatrolCommanders.Length
        if PatrolCommanders[i]
            PatrolCommanders[i].Clear()
        endif
        i += 1
    endwhile
    i = 0
    while i < PatrolCommanders.Length
        Actor CommanderPatrol = CommanderPatrolHold.GetAt(i) as Actor
        Actor CommanderGarrison = CommanderGarrisonHold.GetAt(i) as Actor
        if CommanderPatrol != None
            int armynum = CommanderScript.GetCommanderArmyNum(CommanderPatrol)
            PatrolCommanders[i].ForceRefTo(CommanderPatrol)
            PatrolCount.Mod(((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).TroopCount)
            if i == 0
                Army1 = true
            elseif i == 1
                Army2 = true
            elseif i == 2
                Army3 = true
            elseif i == 3
                Army4 = true
            elseif i == 4
                Army5 = true
            elseif i == 5
                Army6 = true
            elseif i == 6
                Army7 = true
            elseif i == 7
                Army8 = true
            elseif i == 8
                Army9 = true
            elseif i == 9
                Army10 = true
            endif
        else
            PatrolCommanders[i].ForceRefTo(NoneObject)
            if i == 0
                Army1 = false
            elseif i == 1
                Army2 = false
            elseif i == 2
                Army3 = false
            elseif i == 3
                Army4 = false
            elseif i == 4
                Army5 = false
            elseif i == 5
                Army6 = false
            elseif i == 6
                Army7 = false
            elseif i == 7
                Army8 = false
            elseif i == 8
                Army9 = false
            elseif i == 9
                Army10 = false
            endif
        endif
        if CommanderGarrison != None
            int armynum = CommanderScript.GetCommanderArmyNum(CommanderGarrison)
            GarrisonCommanders[i].ForceRefTo(CommanderGarrison)
            GarrisonCount.Mod(((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).TroopCount)
            if i == 0
                Army1 = true
            elseif i == 1
                Army2 = true
            elseif i == 2
                Army3 = true
            elseif i == 3
                Army4 = true
            elseif i == 4
                Army5 = true
            elseif i == 5
                Army6 = true
            elseif i == 6
                Army7 = true
            elseif i == 7
                Army8 = true
            elseif i == 8
                Army9 = true
            elseif i == 9
                Army10 = true
            endif
        else
            GarrisonCommanders[i].ForceRefTo(NoneObject)
            if i == 0
                Army1 = false
            elseif i == 1
                Army2 = false
            elseif i == 2
                Army3 = false
            elseif i == 3
                Army4 = false
            elseif i == 4
                Army5 = false
            elseif i == 5
                Army6 = false
            elseif i == 6
                Army7 = false
            elseif i == 7
                Army8 = false
            elseif i == 8
                Army9 = false
            elseif i == 9
                Army10 = false
            endif
        endif
        i += 1
    endwhile
    TotalArmies.SetValue(CommanderGarrisonHold.GetSize())
    MaxArmies.SetValue(CityLoc.GetLocation().GetKeywordData(BarracksLevel))
    UpdateCurrentInstanceGlobal(TotalArmies)
    UpdateCurrentInstanceGlobal(MaxArmies)
    UpdateCurrentInstanceGlobal(PatrolCount)
    UpdateCurrentInstanceGlobal(GarrisonCount)
EndFunction

bool Function IsInBattle(string type, int holdnum)

    bool BattleBool = false

    if type == "City"
        if AttackCityQuest.IsRunning() && (AttackCityQuest as CS_AttackCityScript).citynum == holdnum
            BattleBool = true
        endif

        if DefendCityQuestImp.IsRunning() && (DefendCityQuestImp as CS_DefendCityScript).holdnum == holdnum
            BattleBool = true
        endif

        if DefendCityQuestSons.IsRunning() && (DefendCityQuestSons as CS_DefendCityScript).holdnum == holdnum
            BattleBool = true
        endif

    elseif type == "Fort"
        if AttackFortQuest.IsRunning() && (AttackFortQuest as CS_AttackFortCampScript).holdnum == holdnum
            BattleBool = true
        endif

        if DefendFortQuestImp.IsRunning() && (DefendFortQuestImp as CS_DefendFortScript).fortnum == holdnum
            BattleBool = true
        endif

        if DefendFortQuestSons.IsRunning() && (DefendFortQuestSons as CS_DefendFortScript).fortnum == holdnum
            BattleBool = true
        endif

    elseif type == "Camp"
        if DefendCampQuestImp.IsRunning() && (DefendCampQuestImp as CS_DefendCampScript).holdnum == holdnum
            BattleBool = true
        endif

        if DefendCampQuestSons.IsRunning() && (DefendCampQuestSons as CS_DefendCampScript).holdnum == holdnum
            BattleBool = true
        endif
    endif

    return BattleBool
EndFunction