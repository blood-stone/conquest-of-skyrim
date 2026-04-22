Scriptname CS_AttackPlanningNewScript extends Quest  conditional

LocationAlias Property InvasionTarget Auto
LocationAlias Property HoldLoc Auto

Actor[] Property InvasionCommanders Auto

ReferenceAlias[] Property Commanders Auto
ReferenceAlias[] Property SelectedCommanders Auto
ReferenceAlias Property BattlePlanDescription Auto
ReferenceAlias Property BattlePlanFinal Auto

Message Property StartMessage Auto
Message Property StartMessageCamp Auto
Message Property StartMessageNoSuperiority Auto
Message Property StartMessageNoSuperiorityCamp Auto
Message Property MessageNoHoldLink Auto
Message Property ArmySelectMessage1 Auto
Message Property ArmySelectMessage2 Auto
Message Property InvasionStartMessage Auto
Message Property InvasionStartCityMessage Auto
Message Property InvasionStartMinorCityMessage Auto
Message Property InvasionStartFortMessage Auto
Message Property InvasionStartCityEquipmentMessage Auto
Message Property InvasionStartMinorCityEquipmentMessage Auto
Message Property InvasionStartFortEquipmentMessage Auto
Message Property InvasionStartFortNoEquipmentMessage Auto
Message Property InvasionStartCityPlanMessage Auto
Message Property InvasionStartCampMessage Auto

ObjectReference Property NoneObject Auto
ObjectReference Property EntranceOneRef Auto
ObjectReference Property EntranceTwoRef Auto
ObjectReference Property PlanFinalEntranceNorth Auto
ObjectReference Property PlanFinalEntranceSouth Auto
ObjectReference Property PlanFinalEntranceEast Auto
ObjectReference Property PlanFinalEntranceWest Auto
ObjectReference Property PlanFinalEntranceNorthSouth Auto
ObjectReference Property PlanFinalEntranceEastWest Auto
ObjectReference Property TargetRef Auto

Quest Property AttackFort Auto
LocationAlias Property AttackFortStaging Auto
Quest Property AttackCamp Auto
LocationAlias Property AttackCampStaging Auto
Quest Property AttackCitySiege Auto
Quest Property AttackCity Auto

int Property holdnum Auto
int Property enemyfactionnum Auto

FormList Property AllLocations Auto
FormList Property AllLocationsCS Auto
FormList Property AllLocationsFort Auto
FormList Property AllHoldings Auto
FormList Property AllHoldingsFort Auto
FormList Property AllLocationsCampImp Auto
FormList Property CampMarkersImp Auto
FormList Property AllLocationsCampSons Auto
FormList Property CampMarkersSons Auto
FormList Property CampMarkersPlayer Auto
FormList Property AllHolds Auto
FormList Property PatrolCommandersHolds Auto
FormList Property GarrisonCommandersHolds Auto
FormList Property AttackCommanders Auto

int Property AvailableArmies Auto Conditional
int Property ChosenArmies Auto Conditional
int Property AttackEntrance Auto

GlobalVariable Property TotalTroops Auto
GlobalVariable Property LaunchTime Auto
GlobalVariable Property LaunchTimeFirst Auto
GlobalVariable Property Catapults Auto
GlobalVariable Property CatapultsAvailable Auto
GlobalVariable Property BatteringRams Auto
GlobalVariable Property BatteringRamsAvailable Auto
GlobalVariable Property Ladders Auto
GlobalVariable Property LaddersAvailable Auto
GlobalVariable Property CatapultsPurchased Auto
GlobalVariable Property BatteringRamsPurchased Auto
GlobalVariable Property LaddersPurchased Auto

bool Property AttackArmy1 Auto Conditional
bool Property AttackArmy2 Auto Conditional
bool Property AttackArmy3 Auto Conditional
bool Property AttackArmy4 Auto Conditional
bool Property AttackArmy5 Auto Conditional
bool Property AttackArmy6 Auto Conditional
bool Property AttackArmy7 Auto Conditional
bool Property AttackArmy8 Auto Conditional
bool Property AttackArmy9 Auto Conditional
bool Property AttackArmy10 Auto Conditional

bool[] Property AttackArmies Auto Conditional

bool Property HasPlan Auto Conditional
bool Property NorthEntrance Auto Conditional
bool Property SouthEntrance Auto Conditional
bool Property EastEntrance Auto Conditional
bool Property WestEntrance Auto Conditional
bool Property NorthSouthEntrance Auto
bool Property EastWestEntrance Auto

int Property EntranceNum Auto Conditional

Keyword Property LandSuperiority Auto
Keyword Property Invading Auto
Keyword Property CWOwner Auto

Keyword Property StoryAttackCamp Auto
Keyword Property StoryAttackFort Auto
Keyword Property StoryAttackCity Auto

bool Property DoubleAttack Auto
bool Property RestrictInvasion Auto

string Property InvasionType Auto

CS_TMScript Property TMPlayer Auto
CS_TMScript Property TMImp Auto
CS_TMScript Property TMSons Auto
CS_BattleTrackerScript Property BattleTracker Auto
CS_TroopManageMenuScript Property ManageArmy Auto
CS_PatrolHoldScript Property CommanderScript Auto
CS_FortCommandersScript Property FortCommandersScript Auto

Function SetAvailableArmies()
    int i = 0
    while i < Commanders.Length
        Commanders[i].ForceRefTo(NoneObject)
        SelectedCommanders[i].ForceRefTo(NoneObject)
        i += 1
    endwhile
    ChosenArmies = 0
    AvailableArmies = 0
    HoldLoc.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
    FormList PatrolCommanders = PatrolCommandersHolds.GetAt(holdnum) as FormList
    FormList GarrisonCommanders = GarrisonCommandersHolds.GetAt(holdnum) as FormList
    i = 0
    while i < PatrolCommanders.GetSize()
        Commanders[AvailableArmies].ForceRefTo(PatrolCommanders.GetAt(i) as Actor)
        AvailableArmies += 1
        i += 1
    endwhile
    i = 0
    while i < GarrisonCommanders.GetSize()
        Commanders[AvailableArmies].ForceRefTo(GarrisonCommanders.GetAt(i) as Actor)
        AvailableArmies += 1
        i += 1
    endwhile
EndFunction

Function SetUpPlanDescription()
    EntranceNum = 0

    NorthEntrance = HasEntrance("North")
    SouthEntrance = HasEntrance("South")
    EastEntrance = HasEntrance("East")
    WestEntrance = HasEntrance("West")

    if EntranceNum == 1
        BattlePlanDescription.ForceRefTo(EntranceOneRef)
    elseif EntranceNum == 2
        BattlePlanDescription.ForceRefTo(EntranceTwoRef)
        if NorthEntrance == true
            NorthSouthEntrance = true
        elseif EastEntrance == true
            EastWestEntrance = true
        endif
    endif
EndFunction

Function SetUpMenu()
    int i = 0
    while i < Commanders.Length
        Commanders[i].ForceRefTo(NoneObject)
        SelectedCommanders[i].ForceRefTo(NoneObject)
        InvasionCommanders[i] = None
        i += 1
    endwhile
    ChosenArmies = 0
    AvailableArmies = 0
    LaunchTime.SetValue(0)
    LaunchTimeFirst.SetValue(0)
    TotalTroops.SetValue(0)
    Catapults.SetValue(0)
    BatteringRams.SetValue(0)
    Ladders.SetValue(0)
    CatapultsAvailable.SetValue(CatapultsPurchased.GetValue())
    BatteringRamsAvailable.SetValue(BatteringRamsPurchased.GetValue())
    LaddersAvailable.SetValue(LaddersPurchased.GetValue())
    UpdateCurrentInstanceGlobal(Catapults)
    UpdateCurrentInstanceGlobal(BatteringRams)
    UpdateCurrentInstanceGlobal(Ladders)
    UpdateCurrentInstanceGlobal(CatapultsAvailable)
    UpdateCurrentInstanceGlobal(BatteringRamsAvailable)
    UpdateCurrentInstanceGlobal(LaddersAvailable)
    UpdateCurrentInstanceGlobal(LaunchTime)
    UpdateCurrentInstanceGlobal(TotalTroops)
    HoldLoc.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
    BattlePlanFinal.ForceRefTo(NoneObject)
    SetUpPlanDescription()
EndFunction

Function FindTargetRef()
    if AllLocations.HasForm(InvasionTarget.GetLocation())
        TargetRef = CommanderScript.MovingCityMarkers.GetAt(holdnum) as ObjectReference
        InvasionType = "City"
    elseif AllLocationsFort.HasForm(InvasionTarget.GetLocation())
        TargetRef = FortCommandersScript.Positions[holdnum]
        InvasionType = "Fort"
    elseif AllLocationsCampImp.HasForm(InvasionTarget.GetLocation())
        TargetRef = CampMarkersImp.GetAt(holdnum) as ObjectReference
        InvasionType = "Camp"
    elseif AllLocationsCampSons.HasForm(InvasionTarget.GetLocation())
        TargetRef = CampMarkersSons.GetAt(holdnum) as ObjectReference
        InvasionType = "Camp"
    elseif AllHolds.HasForm(InvasionTarget.GetLocation())
        (CommanderScript.MovingCampMarkers.GetAt(holdnum) as ObjectReference).MoveTo(CommanderScript.CampMarkers.GetAt(holdnum) as ObjectReference)
        TargetRef = CommanderScript.MovingCampMarkers.GetAt(holdnum) as ObjectReference
        InvasionType = "Hold"
    endif
EndFunction

bool Function IsInSelectedCommanders(Actor Commander)
    bool foundcommander = false
    int i = 0
    while i < SelectedCommanders.Length && foundcommander == false
        if SelectedCommanders[i].GetActorRef() == Commander
            foundcommander = true
        endif
        i += 1
    endwhile

    return foundcommander
EndFunction

Function ResetCommanderOrder()
    int i = 0
    ChosenArmies = 0
    while i < InvasionCommanders.Length
        if InvasionCommanders[i] != None
            SelectedCommanders[ChosenArmies].ForceRefTo(InvasionCommanders[i])
            InvasionCommanders[ChosenArmies] = InvasionCommanders[i]
            ChosenArmies += 1
        else
            SelectedCommanders[i].Clear()
        endif
        i += 1
    endwhile
EndFunction

Function SelectTarget(int Response = 0)
    if TMImp.TrucePlayer && enemyfactionnum == 11
        debug.notification("Can not attack a faction we have a truce with!")
    elseif !TMImp.AtWarPlayer && enemyfactionnum == 11
        debug.notification("Can not attack a faction we are not at war with!")
    elseif TMSons.TrucePlayer && enemyfactionnum == 12
        debug.notification("Can not attack a faction we have a truce with!")
    elseif !TMSons.AtWarPlayer && enemyfactionnum == 12
        debug.notification("Can not attack a faction we are not at war with!")
    elseif AttackCitySiege.IsRunning() || AttackFort.IsRunning() || AttackCamp.IsRunning() || AttackCity.IsRunning() || RestrictInvasion == true
        debug.notification("Can not plan an invasion while we are attacking!")
    elseif BattleTracker.PlayerCamps[holdnum] == true
        debug.notification("Can not plan an invasion in this hold while our camp is under attack!")
    else
        FindTargetRef()
        if (AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(LandSuperiority) == 1 && InvasionType != "Camp" && InvasionType != "Hold"
            if InvasionType == "Fort"
                enemyfactionnum = 10 + (AllLocationsFort.GetAt(holdnum) as Location).GetKeywordData(CWOwner) as int 
            elseif InvasionType == "City"           
                enemyfactionnum = 10 + (AllLocations.GetAt(holdnum) as Location).GetKeywordData(CWOwner) as int
            endif
            if TMImp.TrucePlayer && enemyfactionnum == 11
                debug.notification("Can not attack a faction we have a truce with!")
            elseif TMSons.TrucePlayer && enemyfactionnum == 12
                debug.notification("Can not attack a faction we have a truce with!")
            else
                Response = StartMessage.show()
                if Response == 0
                    SetUpMenu()
                    SetAvailableArmies()
                    SelectArmies1()
                endif
            endif
        elseif InvasionType == "Camp" || InvasionType == "Hold"
            if (CampMarkersPlayer.GetAt(holdnum) as ObjectReference).IsDisabled()
                HoldLoc.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
                if TMPlayer.GetOwnSuperiorHoldsBordering(holdnum) > 0 || (TMPlayer.GetLandSuperiorityNum() == 0 && (TMPlayer.CityCount.GetValue() + TMPlayer.MinorCityCount.GetValue()) == 0) || (AllLocations.GetAt(holdnum) as Location).GetKeywordData(CWOwner) == 69
                    if InvasionType == "Camp"
                        Response = StartMessageNoSuperiorityCamp.show()
                        if Response == 0
                            InvasionTarget.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
                            SetUpMenu()
                            FindTargetRef()
                            InvasionStartMenu()
                        endif
                    elseif InvasionType == "Hold"
                        SelectArmyHold()
                        ;InvasionStartMenu()                    
                    endif
                else
                    MessageNoHoldLink.show()
                endif
            else
                HoldLoc.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
                Response = StartMessageCamp.show()
                if Response == 0
                    SetUpMenu()
                    SetAvailableArmies()
                    SelectArmies1()
                endif
            endif
        else
            if InvasionType == "Fort"
                enemyfactionnum = 10 + (AllLocationsFort.GetAt(holdnum) as Location).GetKeywordData(CWOwner) as int 
            elseif InvasionType == "City"           
                enemyfactionnum = 10 + (AllLocations.GetAt(holdnum) as Location).GetKeywordData(CWOwner) as int
            endif

            if TMImp.TrucePlayer && enemyfactionnum == 11
                debug.notification("Can not attack a faction we have a truce with!")
            elseif TMSons.TrucePlayer && enemyfactionnum == 12
                debug.notification("Can not attack a faction we have a truce with!")
            else
                HoldLoc.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
                StartMessageNoSuperiority.show()
            endif
        endif
    endif
EndFunction

Function SelectArmies1(int Response = 0)
    Response = ArmySelectMessage1.show()
    if Response < 5
        if !IsInSelectedCommanders(Commanders[Response].GetActorRef())
            SelectedCommanders[ChosenArmies].ForceRefTo(Commanders[Response].GetActorRef())
            InvasionCommanders[ChosenArmies] = Commanders[Response].GetActorRef()
            CS_ArmyTroopDeath ArmyScript = (CommanderScript.ArmyQuests.GetAt(CommanderScript.GetCommanderArmyNum(Commanders[Response].GetActorRef())) as Quest) as CS_ArmyTroopDeath
            TotalTroops.Mod(ArmyScript.TroopCount)
            UpdateCurrentInstanceGlobal(TotalTroops)
            ChosenArmies += 1
            if Response == 0
                AttackArmy1 = 1
            elseif Response == 1
                AttackArmy2 = 1
            elseif Response == 2
                AttackArmy3 = 1
            elseif Response == 3
                AttackArmy4 = 1
            elseif Response == 4
                AttackArmy5 = 1
            endif
        else
            debug.notification("This commander has already been selected!")
        endif
        SelectArmies1()
    elseif Response == 5
        SelectArmies2()
    elseif Response == 6
        SelectTarget()
    elseif Response == 7
        InvasionStartMenu()
    endif
EndFunction

Function SelectArmies2(int Response = 0)
    Response = ArmySelectMessage2.show()
    if Response == 0
        SelectArmies1()
    elseif Response > 0 && Response < 6
        if !IsInSelectedCommanders(Commanders[Response + 4].GetActorRef())
            SelectedCommanders[ChosenArmies].ForceRefTo(Commanders[Response + 4].GetActorRef())
            InvasionCommanders[ChosenArmies] = Commanders[Response + 4].GetActorRef()
            CS_ArmyTroopDeath ArmyScript = (CommanderScript.ArmyQuests.GetAt(CommanderScript.GetCommanderArmyNum(Commanders[Response].GetActorRef())) as Quest) as CS_ArmyTroopDeath
            TotalTroops.Mod(ArmyScript.TroopCount)
            UpdateCurrentInstanceGlobal(TotalTroops)
            ChosenArmies += 1
            if Response == 1
                AttackArmy6 = 1
            elseif Response == 2
                AttackArmy7 = 1
            elseif Response == 3
                AttackArmy8 = 1
            elseif Response == 4
                AttackArmy9 = 1
            elseif Response == 5
                AttackArmy10 = 1
            endif
        else
            debug.notification("This commander has already been selected!")
        endif
        SelectArmies2()
    elseif Response == 6
        SelectTarget()
    elseif Response == 7
        InvasionStartMenu()
    endif
EndFunction

Function InvasionStartMenu(int Response = 0)
    if InvasionType == "City" || InvasionType == "Fort"
        if InvasionType == "City"
            if holdnum < 5
                Response = InvasionStartCityMessage.show()
            else
                Response = InvasionStartMinorCityMessage.show()
            endif
        elseif InvasionType == "Fort"
            Response = InvasionStartFortMessage.show()
        endif
        if Response == 0
            SelectArmies1()
        elseif Response == 1
            InvasionSiegeMenu()
        elseif Response == 2
            InvasionPlanMenu()
        elseif Response == 3
            InvasionStart()
        endif
    elseif InvasionType == "Camp"
        Response = InvasionStartCampMessage.show()
        if Response == 0
            SelectArmies1()
        elseif Response == 1
            InvasionStart()
        endif
    else
        Response = InvasionStartMessage.show()
        if Response == 0
            SelectArmyHold()
            ;InvasionStartMenu()
        elseif Response == 1
            InvasionStart()
        endif
    endif
EndFunction

Function SelectArmyHold()
    ManageArmy.Start()
    Actor NewCommander = ManageArmy.ArmiesSelect1Menu(TargetRef)
    ManageArmy.Stop()
    if NewCommander != None
        if InvasionCommanders.Find(NewCommander) >= 0
            debug.notification("This commander is already in the invasion!")
        else
            int i = 0
            bool foundcommander = false
            while i < SelectedCommanders.Length && foundcommander == false
                if SelectedCommanders[i].GetActorRef() == None
                    SelectedCommanders[i].ForceRefTo(NewCommander)
                    InvasionCommanders[i] = NewCommander
                    ChosenArmies += 1
                    CS_ArmyTroopDeath ArmyScript = (CommanderScript.ArmyQuests.GetAt(CommanderScript.GetCommanderArmyNum(NewCommander)) as Quest) as CS_ArmyTroopDeath
                    if ArmyScript.MovingArrivalTimePotential > LaunchTime.GetValue()
                        LaunchTime.SetValue(ArmyScript.MovingArrivalTimePotential)
                        UpdateCurrentInstanceGlobal(LaunchTime)
                    endif
                    if ArmyScript.MovingArrivalTimePotential < LaunchTimeFirst.GetValue() || LaunchTimeFirst.GetValue() == 0
                        LaunchTimeFirst.SetValue(ArmyScript.MovingArrivalTimePotential)
                        UpdateCurrentInstanceGlobal(LaunchTimeFirst)
                    endif
                    TotalTroops.Mod(ArmyScript.TroopCount)
                    UpdateCurrentInstanceGlobal(TotalTroops)
                    foundcommander = true
                endif
                i += 1
            endwhile
        endif
        if ChosenArmies < 10
            SelectArmyHold()
        else
            InvasionStartMenu()
        endif
    else
        InvasionStartMenu()
    endif
EndFunction

Function InvasionSiegeMenu(int Response = 0)
    if InvasionType == "City"
        if holdnum < 5
            Response = InvasionStartCityEquipmentMessage.show()
            if Response == 0
                Catapults.Mod(1)
                CatapultsAvailable.Mod(-1)
                UpdateCurrentInstanceGlobal(Catapults)
                UpdateCurrentInstanceGlobal(CatapultsAvailable)
                InvasionSiegeMenu()
            elseif Response == 1
                Catapults.Mod(-1)
                CatapultsAvailable.Mod(1)
                UpdateCurrentInstanceGlobal(Catapults)
                UpdateCurrentInstanceGlobal(CatapultsAvailable)
                InvasionSiegeMenu()
            elseif Response == 2
                BatteringRams.Mod(1)
                BatteringRamsAvailable.Mod(-1)
                UpdateCurrentInstanceGlobal(BatteringRams)
                UpdateCurrentInstanceGlobal(BatteringRamsAvailable)
                InvasionSiegeMenu()
            elseif Response == 3
                BatteringRams.Mod(-1)
                BatteringRamsAvailable.Mod(1)
                UpdateCurrentInstanceGlobal(BatteringRams)
                UpdateCurrentInstanceGlobal(BatteringRamsAvailable)
                InvasionSiegeMenu()
            elseif Response == 4
                Ladders.Mod(1)
                LaddersAvailable.Mod(-1)
                UpdateCurrentInstanceGlobal(Ladders)
                UpdateCurrentInstanceGlobal(LaddersAvailable)
                InvasionSiegeMenu()
            elseif Response == 5
                Ladders.Mod(-1)
                LaddersAvailable.Mod(1)
                UpdateCurrentInstanceGlobal(Ladders)
                UpdateCurrentInstanceGlobal(LaddersAvailable)
                InvasionSiegeMenu()
            elseif Response == 6
                InvasionStartMenu()
            endif
        else
            Response = InvasionStartMinorCityEquipmentMessage.show()
            if Response == 0
                Catapults.Mod(1)
                CatapultsAvailable.Mod(-1)
                UpdateCurrentInstanceGlobal(Catapults)
                UpdateCurrentInstanceGlobal(CatapultsAvailable)
                InvasionSiegeMenu()
            elseif Response == 1
                Catapults.Mod(-1)
                CatapultsAvailable.Mod(1)
                UpdateCurrentInstanceGlobal(Catapults)
                UpdateCurrentInstanceGlobal(CatapultsAvailable)
            elseif Response == 2
                InvasionStartMenu()
            endif
        endif
    elseif InvasionType == "Fort"
        if holdnum != 5 && holdnum != 8
            Response = InvasionStartFortEquipmentMessage.show()
            if Response == 0
                BatteringRams.Mod(1)
                BatteringRamsAvailable.Mod(-1)
                UpdateCurrentInstanceGlobal(BatteringRams)
                UpdateCurrentInstanceGlobal(BatteringRamsAvailable)
                InvasionSiegeMenu()
            elseif Response == 1
                BatteringRams.Mod(-1)
                BatteringRamsAvailable.Mod(1)
                UpdateCurrentInstanceGlobal(BatteringRams)
                UpdateCurrentInstanceGlobal(BatteringRamsAvailable)
                InvasionSiegeMenu()
            elseif Response == 2
                Ladders.Mod(1)
                LaddersAvailable.Mod(-1)
                UpdateCurrentInstanceGlobal(Ladders)
                UpdateCurrentInstanceGlobal(LaddersAvailable)
                InvasionSiegeMenu()
            elseif Response == 3
                Ladders.Mod(-1)
                LaddersAvailable.Mod(1)
                UpdateCurrentInstanceGlobal(Ladders)
                UpdateCurrentInstanceGlobal(LaddersAvailable)
                InvasionSiegeMenu()
            elseif Response == 4
                InvasionStartMenu()
            endif
        else
            InvasionStartFortNoEquipmentMessage.show()
            InvasionStartMenu()
        endif
    endif
EndFunction

Function InvasionPlanMenu(int Response = 0)
    Response = InvasionStartCityPlanMessage.show()
    if Response == 0 || Response == 2
        if EntranceNum == 2
            AttackEntrance = 2
        else
            AttackEntrance = 1
        endif
        if Response == 0
            BattlePlanFinal.ForceRefTo(PlanFinalEntranceNorth)
        elseif Response == 2
            BattlePlanFinal.ForceRefTo(PlanFinalEntranceEast)
        endif
        HasPlan = true
        InvasionStartMenu()
    elseif Response == 1 || Response == 3
        AttackEntrance = 1
        if Response == 1
            BattlePlanFinal.ForceRefTo(PlanFinalEntranceSouth)
        elseif Response == 3
            BattlePlanFinal.ForceRefTo(PlanFinalEntranceWest)
        endif
        HasPlan = true
        InvasionStartMenu()
    elseif Response == 4
        DoubleAttack = true
        if NorthSouthEntrance == true
            BattlePlanFinal.ForceRefTo(PlanFinalEntranceNorthSouth)
        elseif EastWestEntrance == true
            BattlePlanFinal.ForceRefTo(PlanFinalEntranceEastWest)
        endif
        HasPlan = true
        InvasionStartMenu()
    elseif Response == 5
        InvasionStartMenu()
    endif
EndFunction

Function InvasionStart()
    RestrictInvasion = true
    debug.notification("Launching Invasion, please wait...")
    AttackCommanders.Revert()
    int i = 0
    while i < SelectedCommanders.Length
        if SelectedCommanders[i].GetActorRef() != None
            SelectedCommanders[i].GetActorRef().SetActorValue("Confidence", 4)
            SelectedCommanders[i].GetActorRef().SetActorValue("Assistance", 1)
            SelectedCommanders[i].GetActorRef().SetActorValue("Aggression", 1)
            if i == 0
                debug.notification("Rallying armies...")
            endif
            AttackCommanders.AddForm(SelectedCommanders[i].GetActorRef())
            CommanderScript.ClearFactionsTemp(SelectedCommanders[i].GetActorRef(), updatemap=false)
            If InvasionType == "Fort"
                CommanderScript.ArmyScripts[CommanderScript.GetCommanderArmyNum(SelectedCommanders[i].GetActorRef())].CurrentTask = CommanderScript.TaskBarrelsAttackFort.GetAt(holdnum) as ObjectReference
            ElseIf InvasionType == "City"
                CommanderScript.ArmyScripts[CommanderScript.GetCommanderArmyNum(SelectedCommanders[i].GetActorRef())].CurrentTask = CommanderScript.TaskBarrelsAttackCity.GetAt(holdnum) as ObjectReference
            endif
        endif
        i += 1
    endwhile
    if AllLocations.HasForm(InvasionTarget.GetLocation())
        StoryAttackCity.SendStoryEventAndWait(InvasionTarget.GetLocation(), aiValue1 = 0)
    elseif AllLocationsFort.HasForm(InvasionTarget.GetLocation())
        StoryAttackFort.SendStoryEventAndWait(InvasionTarget.GetLocation(), aiValue1 = enemyfactionnum, aiValue2 = holdnum)
    elseif AllLocationsCampImp.HasForm(InvasionTarget.GetLocation()) || AllLocationsCampSons.HasForm(InvasionTarget.GetLocation())
        StoryAttackCamp.SendStoryEvent(InvasionTarget.GetLocation(), aiValue1 = enemyfactionnum, aiValue2 = holdnum)
    elseif AllHolds.HasForm(InvasionTarget.GetLocation())
        (AllLocationsCS.GetAt(holdnum) as Location).SetKeywordData(Invading, 1)
        i = 0
        while i < AttackCommanders.GetSize()
            CommanderScript.RegisterForMoving((AttackCommanders.GetAt(i) as Actor), "Camp", holdnum, map = true)
            i += 1
        endwhile
    endif
    RestrictInvasion = false
    TMPlayer.ResetWarMap(holdnum)
EndFunction

bool Function HasEntrance(string Direction)

    bool HasEntrance = false    

    if Direction == "North"
        if InvasionType == "City"
            if holdnum == 1 || holdnum == 7
                HasEntrance = true
            endif
        elseif InvasionType == "Fort"
            if holdnum == 0 || holdnum == 1 || holdnum == 4 || holdnum == 5 || holdnum == 6 || holdnum == 8
                HasEntrance = true
            endif
        endif
    elseif Direction == "South"
        if InvasionType == "City"
            if holdnum == 3 || holdnum == 4 || holdnum == 5 || holdnum == 7 || holdnum == 8
                HasEntrance = true
            endif
        elseif InvasionType == "Fort"
            if holdnum == 1 || holdnum == 2 || holdnum == 3 || holdnum == 5 || holdnum == 7 || holdnum == 8
                HasEntrance = true
            endif
        endif       
    elseif Direction == "East"
        if InvasionType == "City"
            if holdnum == 0 || holdnum == 6
                HasEntrance = true
            endif
        elseif InvasionType == "Fort"
            HasEntrance = false
        endif   
    elseif Direction == "West"
        if InvasionType == "City"
            if holdnum == 2 || holdnum == 6
                HasEntrance = true
            endif
        elseif InvasionType == "Fort"
            HasEntrance = false
        endif   
    endif

    if HasEntrance == true
        EntranceNum += 1
    endif

    return HasEntrance
EndFunction