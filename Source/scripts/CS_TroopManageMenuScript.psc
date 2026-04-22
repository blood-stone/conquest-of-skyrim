Scriptname CS_TroopManageMenuScript extends Quest  conditional

int Property GlobalsUpdated Auto
CS_TroopManageUpdater1 Property Updater1 Auto
CS_TroopManageUpdater2 Property Updater2 Auto
CS_TroopManageUpdater3 Property Updater3 Auto
CS_TroopManageUpdater4 Property Updater4 Auto
CS_TroopManageUpdater5 Property Updater5 Auto
CS_TroopManageUpdaterProperties Property UpdateProperties Auto

CS_TroopRecruiterScript Property TroopRecruiter Auto
CS_CommanderOutfitScript Property CommanderOutfitScript Auto
CS_BattleTrackerScript Property BattleTracker Auto
CS_FortCommandersScript Property FortCommanders Auto

bool Property AutoRecruitment Auto conditional
bool Property CommanderArmyEquipment Auto conditional
bool Property VampireCommander Auto conditional
bool Property VampireArmy Auto conditional
bool Property RecruitedTroop Auto

ObjectReference Property DistanceMarkerMarkarth Auto
ObjectReference Property DistanceMarkerRiften Auto
ObjectReference Property DistanceMarkerSolitude Auto
ObjectReference Property DistanceMarkerWhiterun Auto
ObjectReference Property DistanceMarkerWindhelm Auto
ObjectReference Property DistanceMarkerDawnstar Auto
ObjectReference Property DistanceMarkerFalkreath Auto
ObjectReference Property DistanceMarkerMorthal Auto
ObjectReference Property DistanceMarkerWinterhold Auto

GlobalVariable Property DistanceMarkarth Auto
GlobalVariable Property DistanceRiften Auto
GlobalVariable Property DistanceSolitude Auto
GlobalVariable Property DistanceWhiterun Auto
GlobalVariable Property DistanceWindhelm Auto
GlobalVariable Property DistanceDawnstar Auto
GlobalVariable Property DistanceFalkreath Auto
GlobalVariable Property DistanceMorthal Auto
GlobalVariable Property DistanceWinterhold Auto

ObjectReference Property TaskTarget Auto

int Property EquipmentArmyNum Auto
int Property ArmyTemplateNum Auto conditional

Function UpdateGlobals(int menunum, ObjectReference Target = None)
    bool AllGlobalsUpdated = false
    if menunum == 1
        Updater1.Updated = false
        Updater1.armynum = 1
        Updater1.Commander = Commanders[0].GetActorRef()
        Updater1.CommanderAlias = Commanders[0]

        Updater2.Updated = false
        Updater2.armynum = 2
        Updater2.Commander = Commanders[1].GetActorRef()
        Updater2.CommanderAlias = Commanders[1]

        Updater3.Updated = false
        Updater3.armynum = 3
        Updater3.Commander = Commanders[2].GetActorRef()
        Updater3.CommanderAlias = Commanders[2]

        Updater4.Updated = false
        Updater4.armynum = 4
        Updater4.Commander = Commanders[3].GetActorRef()
        Updater4.CommanderAlias = Commanders[3]

        Updater5.Updated = false
        Updater5.armynum = 5
        Updater5.Commander = Commanders[4].GetActorRef()
        Updater5.CommanderAlias = Commanders[4]

        Updater1.Target = Target
        Updater2.Target = Target
        Updater3.Target = Target
        Updater4.Target = Target
        Updater5.Target = Target

        RegisterForSingleUpdate(0.1)
        while AllGlobalsUpdated == false
            if Updater1.Updated == true && Updater2.Updated == true && Updater3.Updated == true && Updater4.Updated == true && Updater5.Updated == true
                AllGlobalsUpdated = true
            endif
        endwhile
    elseif menunum == 2
        Updater1.Updated = false
        Updater1.armynum = 6
        Updater1.Commander = Commanders[5].GetActorRef()
        Updater1.CommanderAlias = Commanders[5]

        Updater2.Updated = false
        Updater2.armynum = 7
        Updater2.Commander = Commanders[6].GetActorRef()
        Updater2.CommanderAlias = Commanders[6]

        Updater3.Updated = false
        Updater3.armynum = 8
        Updater3.Commander = Commanders[7].GetActorRef()
        Updater3.CommanderAlias = Commanders[7]

        Updater4.Updated = false
        Updater4.armynum = 9
        Updater4.Commander = Commanders[8].GetActorRef()
        Updater4.CommanderAlias = Commanders[8]

        Updater5.Updated = false
        Updater5.armynum = 10
        Updater5.Commander = Commanders[9].GetActorRef()
        Updater5.CommanderAlias = Commanders[9]

        Updater1.Target = Target
        Updater2.Target = Target
        Updater3.Target = Target
        Updater4.Target = Target
        Updater5.Target = Target

        RegisterForSingleUpdate(0.1)
        while AllGlobalsUpdated == false
            if Updater1.Updated == true && Updater2.Updated == true && Updater3.Updated == true && Updater4.Updated == true && Updater5.Updated == true
                AllGlobalsUpdated = true
            endif
        endwhile
    elseif menunum == 3
        Updater1.Updated = false
        Updater1.armynum = 11
        Updater1.Commander = Commanders[10].GetActorRef()
        Updater1.CommanderAlias = Commanders[10]

        Updater2.Updated = false
        Updater2.armynum = 12
        Updater2.Commander = Commanders[11].GetActorRef()
        Updater2.CommanderAlias = Commanders[11]

        Updater3.Updated = false
        Updater3.armynum = 13
        Updater3.Commander = Commanders[12].GetActorRef()
        Updater3.CommanderAlias = Commanders[12]

        Updater4.Updated = false
        Updater4.armynum = 14
        Updater4.Commander = Commanders[13].GetActorRef()
        Updater4.CommanderAlias = Commanders[13]

        Updater5.Updated = false
        Updater5.armynum = 15
        Updater5.Commander = Commanders[14].GetActorRef()
        Updater5.CommanderAlias = Commanders[14]

        Updater1.Target = Target
        Updater2.Target = Target
        Updater3.Target = Target
        Updater4.Target = Target
        Updater5.Target = Target

        RegisterForSingleUpdate(0.1)
        while AllGlobalsUpdated == false
            if Updater1.Updated == true && Updater2.Updated == true && Updater3.Updated == true && Updater4.Updated == true && Updater5.Updated == true
                AllGlobalsUpdated = true
            endif
        endwhile
    elseif menunum == 4
        Updater1.Updated = false
        Updater1.armynum = 16
        Updater1.Commander = Commanders[15].GetActorRef()
        Updater1.CommanderAlias = Commanders[15]

        Updater2.Updated = false
        Updater2.armynum = 17
        Updater2.Commander = Commanders[16].GetActorRef()
        Updater2.CommanderAlias = Commanders[16]

        Updater3.Updated = false
        Updater3.armynum = 18
        Updater3.Commander = Commanders[17].GetActorRef()
        Updater3.CommanderAlias = Commanders[17]

        Updater4.Updated = false
        Updater4.armynum = 19
        Updater4.Commander = Commanders[18].GetActorRef()
        Updater4.CommanderAlias = Commanders[18]

        Updater5.Updated = false
        Updater5.armynum = 20
        Updater5.Commander = Commanders[19].GetActorRef()
        Updater5.CommanderAlias = Commanders[19]

        Updater1.Target = Target
        Updater2.Target = Target
        Updater3.Target = Target
        Updater4.Target = Target
        Updater5.Target = Target

        RegisterForSingleUpdate(0.1)
        while AllGlobalsUpdated == false
            if Updater1.Updated == true && Updater2.Updated == true && Updater3.Updated == true && Updater4.Updated == true && Updater5.Updated == true
                AllGlobalsUpdated = true
            endif
        endwhile
    elseif menunum == 5
        Updater1.Updated = false
        Updater1.armynum = 21
        Updater1.Commander = Commanders[20].GetActorRef()
        Updater1.CommanderAlias = Commanders[20]

        Updater2.Updated = false
        Updater2.armynum = 22
        Updater2.Commander = Commanders[21].GetActorRef()
        Updater2.CommanderAlias = Commanders[21]

        Updater3.Updated = false
        Updater3.armynum = 23
        Updater3.Commander = Commanders[22].GetActorRef()
        Updater3.CommanderAlias = Commanders[22]

        Updater4.Updated = false
        Updater4.armynum = 24
        Updater4.Commander = Commanders[23].GetActorRef()
        Updater4.CommanderAlias = Commanders[23]

        Updater5.Updated = false
        Updater5.armynum = 25
        Updater5.Commander = Commanders[24].GetActorRef()
        Updater5.CommanderAlias = Commanders[24]

        Updater1.Target = Target
        Updater2.Target = Target
        Updater3.Target = Target
        Updater4.Target = Target
        Updater5.Target = Target

        RegisterForSingleUpdate(0.1)
        while AllGlobalsUpdated == false
            if Updater1.Updated == true && Updater2.Updated == true && Updater3.Updated == true && Updater4.Updated == true && Updater5.Updated == true
                AllGlobalsUpdated = true
            endif
        endwhile
    elseif menunum == 6
        Updater1.Updated = false
        Updater1.armynum = 26
        Updater1.Commander = Commanders[25].GetActorRef()
        Updater1.CommanderAlias = Commanders[25]

        Updater2.Updated = false
        Updater2.armynum = 27
        Updater2.Commander = Commanders[26].GetActorRef()
        Updater2.CommanderAlias = Commanders[26]

        Updater3.Updated = false
        Updater3.armynum = 28
        Updater3.Commander = Commanders[27].GetActorRef()
        Updater3.CommanderAlias = Commanders[27]

        Updater4.Updated = false
        Updater4.armynum = 29
        Updater4.Commander = Commanders[28].GetActorRef()
        Updater4.CommanderAlias = Commanders[28]

        Updater5.Updated = false
        Updater5.armynum = 30
        Updater5.Commander = Commanders[29].GetActorRef()
        Updater5.CommanderAlias = Commanders[29]

        Updater1.Target = Target
        Updater2.Target = Target
        Updater3.Target = Target
        Updater4.Target = Target
        Updater5.Target = Target

        RegisterForSingleUpdate(0.1)
        while AllGlobalsUpdated == false
            if Updater1.Updated == true && Updater2.Updated == true && Updater3.Updated == true && Updater4.Updated == true && Updater5.Updated == true
                AllGlobalsUpdated = true
            endif
        endwhile
    endif
endFunction

Function UpdateTroopCosts()
    int i = 0
    while i < TroopCosts.Length
        UpdateCurrentInstanceGlobal(TroopCosts[i])
        i += 1
    endwhile
EndFunction

Function UpdateSpecificGlobals(int armynum)
    UpdateCurrentInstanceGlobal(TroopCounts.GetAt(armynum) as GlobalVariable)
endFunction

bool Function IsBlockaded(int armynum)
    Actor Commander = CommanderQuest.Commanders[armynum].GetActorRef()
    if Commander.IsInFaction(CS_DefenderFaction)
        return true
    elseif Commander.IsInFaction(ArmyPatrolFaction)
        int holdnum = CommanderQuest.FindPatrolHold(Commander)
        if (CommanderQuest.AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(CommanderQuest.LandSuperiority) != 1
            return true
        else
            return false
        endif
    elseif FortCommanders.GetFortCommanderNum(Commander) != -1
        int holdnum = FortCommanders.GetFortCommanderNum(Commander)
        if (CommanderQuest.AllLocationsCS.GetAt(holdnum) as Location).GetKeywordData(CommanderQuest.LandSuperiority) != 1
            return true
        else
            return false
        endif
    else
        return false
    endif
EndFunction

bool Function IsAttacking(int armynum)
    Actor Commander = CommanderQuest.Commanders[armynum].GetActorRef()
    If (CS_AttackCityNew.IsRunning() || CS_AttackCitySiege.IsRunning()) && Commander.IsInFaction(CS_AttackingCityFaction)
        return true
    ElseIf CS_AttackFortNew.IsRunning() && Commander.IsInFaction(CS_AttackingFortFaction)
        return true
    ElseIf CS_AttackCampNew.IsRunning() && Commander.IsInFaction(CS_AttackingCampFaction)
        return true
    Else
        return false
    Endif
EndFunction

Function MenuStart(int Response = 0)
    UpdateTroopCosts()
    float TroopCount1 = CommanderQuest.ArmyScripts[0].TroopCount as float
    float TroopCount2 = CommanderQuest.ArmyScripts[1].TroopCount as float
    float TroopCount3 = CommanderQuest.ArmyScripts[2].TroopCount as float
    float TroopCount4 = CommanderQuest.ArmyScripts[3].TroopCount as float
    float TroopCount5 = CommanderQuest.ArmyScripts[4].TroopCount as float
    UpdateGlobals(1)
    Response = Armies1Menu.show(TroopCount1, TroopCount2, TroopCount3, TroopCount4, TroopCount5)
    if Response < 5
        If Commanders[Response].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not manage this army while it is on a court mission!")
            MenuStart()
        ElseIf IsAttacking(Response)
            debug.notification("Can not manage this army while it is attacking!")
            MenuStart()
        ElseIf IsBlockaded(Response) == true
            ArmyBlockaded.show()
            MenuStart()
        Else
            ArmyMenu(Response)
        EndIf
    elseif Response == 5
        Armies2Menu()   
    endif
EndFunction

Function Armies2Menu(int Response = 0)
    float TroopCount6 = CommanderQuest.ArmyScripts[5].TroopCount as float
    float TroopCount7 = CommanderQuest.ArmyScripts[6].TroopCount as float
    float TroopCount8 = CommanderQuest.ArmyScripts[7].TroopCount as float
    float TroopCount9 = CommanderQuest.ArmyScripts[8].TroopCount as float
    float TroopCount10 = CommanderQuest.ArmyScripts[9].TroopCount as float
    UpdateGlobals(2)
    Response = Armies2Menu.show(TroopCount6, TroopCount7, TroopCount8, TroopCount9, TroopCount10)
    if Response == 0
        MenuStart()
    elseif Response > 0 && Response < 6
        If Commanders[Response + 4].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not manage this army while it is on a court mission!")
            Armies2Menu()
        ElseIf IsAttacking(Response + 4)
            debug.notification("Can not manage this army while it is attacking!")
            MenuStart()
        ElseIf IsBlockaded(Response + 4) == true
            ArmyBlockaded.show()
            Armies2Menu()
        Else
            ArmyMenu(Response + 4)
        EndIf
    elseif Response == 6
        Armies3Menu()
    endif
EndFunction

Function Armies3Menu(int Response = 0)
    float TroopCount11 = CommanderQuest.ArmyScripts[10].TroopCount as float
    float TroopCount12 = CommanderQuest.ArmyScripts[11].TroopCount as float
    float TroopCount13 = CommanderQuest.ArmyScripts[12].TroopCount as float
    float TroopCount14 = CommanderQuest.ArmyScripts[13].TroopCount as float
    float TroopCount15 = CommanderQuest.ArmyScripts[14].TroopCount as float
    UpdateGlobals(3)
    Response = Armies3Menu.show(TroopCount11, TroopCount12, TroopCount13, TroopCount14, TroopCount15)
    if Response == 0
        Armies2Menu()
    elseif Response > 0 && Response < 6
        If Commanders[Response + 9].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not manage this army while it is on a court mission!")
            Armies3Menu()
        ElseIf IsAttacking(Response + 9)
            debug.notification("Can not manage this army while it is attacking!")
            MenuStart()
        ElseIf IsBlockaded(Response + 9) == true
            ArmyBlockaded.show()
            Armies3Menu()
        Else
            ArmyMenu(Response + 9)
        EndIf
    elseif Response == 6
        Armies4Menu()
    endif
EndFunction

Function Armies4Menu(int Response = 0)
    float TroopCount16 = CommanderQuest.ArmyScripts[15].TroopCount as float
    float TroopCount17 = CommanderQuest.ArmyScripts[16].TroopCount as float
    float TroopCount18 = CommanderQuest.ArmyScripts[17].TroopCount as float
    float TroopCount19 = CommanderQuest.ArmyScripts[18].TroopCount as float
    float TroopCount20 = CommanderQuest.ArmyScripts[19].TroopCount as float
    UpdateGlobals(4)
    Response = Armies4Menu.show(TroopCount16, TroopCount17, TroopCount18, TroopCount19, TroopCount20)
    if Response == 0
        Armies3Menu()
    elseif Response > 0 && Response < 6
        If Commanders[Response + 14].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not manage this army while it is on a court mission!")
            Armies4Menu()
        ElseIf IsAttacking(Response + 14)
            debug.notification("Can not manage this army while it is attacking!")
            MenuStart()
        ElseIf IsBlockaded(Response + 14) == true
            ArmyBlockaded.show()
            Armies4Menu()
        Else
            ArmyMenu(Response + 14)
        EndIf
    elseif Response == 6
        Armies5Menu()
    endif
EndFunction

Function Armies5Menu(int Response = 0)
    float TroopCount21 = CommanderQuest.ArmyScripts[20].TroopCount as float
    float TroopCount22 = CommanderQuest.ArmyScripts[21].TroopCount as float
    float TroopCount23 = CommanderQuest.ArmyScripts[22].TroopCount as float
    float TroopCount24 = CommanderQuest.ArmyScripts[23].TroopCount as float
    float TroopCount25 = CommanderQuest.ArmyScripts[24].TroopCount as float
    UpdateGlobals(5)
    Response = Armies5Menu.show(TroopCount21, TroopCount22, TroopCount23, TroopCount24, TroopCount25)
    if Response == 0
        Armies4Menu()
    elseif Response > 0 && Response < 6
        If Commanders[Response + 19].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not manage this army while it is on a court mission!")
            Armies5Menu()
        ElseIf IsAttacking(Response + 19)
            debug.notification("Can not manage this army while it is attacking!")
            MenuStart()
        ElseIf IsBlockaded(Response + 19) == true
            ArmyBlockaded.show()
            Armies5Menu()
        Else
            ArmyMenu(Response + 19)
        EndIf
    elseif Response == 6
        Armies6Menu()
    endif
EndFunction

Function Armies6Menu(int Response = 0)
    float TroopCount26 = CommanderQuest.ArmyScripts[25].TroopCount as float
    float TroopCount27 = CommanderQuest.ArmyScripts[26].TroopCount as float
    float TroopCount28 = CommanderQuest.ArmyScripts[27].TroopCount as float
    float TroopCount29 = CommanderQuest.ArmyScripts[28].TroopCount as float
    float TroopCount30 = CommanderQuest.ArmyScripts[29].TroopCount as float
    UpdateGlobals(6)
    Response = Armies6Menu.show(TroopCount26, TroopCount27, TroopCount28, TroopCount29, TroopCount30)
    if Response == 0
        Armies5Menu()
    elseif Response > 0 && Response < 6
        If Commanders[Response + 24].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not manage this army while it is on a court mission!")
            Armies6Menu()
        ElseIf IsAttacking(Response + 24)
            debug.notification("Can not manage this army while it is attacking!")
            MenuStart()
        ElseIf IsBlockaded(Response + 24) == true
            ArmyBlockaded.show()
            Armies6Menu()
        Else
            ArmyMenu(Response + 24)
        EndIf
    endif
EndFunction

Function OrdersMenu(int armynum, int Response = 0)
    Response = ArmyOrdersMenu.show()
    if Response == 0
        CommanderQuest.StartHunt(Commanders[armynum].GetActorRef())
        ArmyTaskSelected.ForceRefTo(TaskBarrelHunt)
        Economy.GetFoodPerDay()
        ArmyMenu(armynum)
    elseif Response == 1
        CommanderQuest.FollowPlayer(Commanders[armynum].GetActorRef())
        Economy.GetFoodPerDay()
        ArmyTaskSelected.ForceRefTo(TaskBarrelFollow)
        ArmyMenu(armynum)
    elseif Response == 2
        CommanderQuest.ClearFactions(Commanders[armynum].GetActorRef())
        Economy.GetFoodPerDay()
        ArmyTaskSelected.ForceRefTo(TaskBarrelNoOrder)
        ArmyMenu(armynum)
    elseif Response == 3
        ArmyMenu(armynum)
    endif
EndFunction

Function GarrisonCityMenu(int armynum, int Response = 0)
    UpdateCityTroopGarrisons()
    int CityUnderAttack = 0
    Response = ArmyGarrisonCityMenu.show()
    if Response < 5
        If (PlayerGarrisonArmyCounts.GetAt(Response) as GlobalVariable).GetValue() < (PlayerGarrisonArmyCapCounts.GetAt(Response) as GlobalVariable).GetValue()
            If !BattleTracker.Cities[Response]
                If GovQuest.GetStage() == 14
                    GovQuest.SetStage(15)
                EndIf
                CommanderQuest.StartPatrol(Commanders[armynum].GetActorRef(), Response)
                ;ArmyTaskSelected.ForceRefTo(TaskBarrelDefense.GetAt(Response) as ObjectReference)
            Else
                debug.notification("Can not add to this city's garrison while it is under attack!")
            EndIf
        Else
            debug.notification("This garrison is full!")
        EndIf
        GarrisonCityMenu(armynum)
    elseif Response == 5
        GarrisonMinorCityMenu(armynum)
    elseif Response == 6
        OrdersMenu(armynum)
    endif
EndFunction

Function GarrisonMinorCityMenu(int armynum, int Response = 0)
    UpdateMinorCityTroopGarrisons()
    int CityUnderAttack = 0
    Response = ArmyGarrisonMinorCityMenu.show()
    if Response < 4
        If (PlayerGarrisonArmyCounts.GetAt(Response + 5) as GlobalVariable).GetValue() < (PlayerGarrisonArmyCapCounts.GetAt(Response + 5) as GlobalVariable).GetValue()
            If !BattleTracker.Cities[Response + 5]
                If GovQuest.GetStage() == 14
                    GovQuest.SetStage(15)
                EndIf
                CommanderQuest.StartPatrol(Commanders[armynum].GetActorRef(), Response + 5)
                ArmyTaskSelected.ForceRefTo(TaskBarrelDefense.GetAt(Response + 5) as ObjectReference)
            Else
                debug.notification("Can not add to this city's garrison while it is under attack!")
            EndIf
        Else
            debug.notification("This garrison is full!")
        EndIf
        GarrisonMinorCityMenu(armynum)
    elseif Response == 4
        GarrisonCityMenu(armynum)
    elseif Response == 5
        OrdersMenu(armynum)
    endif
EndFunction

Function UpdateCityTroopGarrisons()
    int i = 0
    while i < 5
        GlobalVariable GarrisonCount = PlayerGarrisonCounts.GetAt(i) as GlobalVariable
        GlobalVariable GarrisonArmyCount = PlayerGarrisonArmyCounts.GetAt(i) as GlobalVariable
        GlobalVariable GarrisonArmyCapCount = PlayerGarrisonArmyCapCounts.GetAt(i) as GlobalVariable
        GarrisonCount.SetValue((TroopGarrisons.GetAt(i) as FormList).GetSize())
        GarrisonArmyCapCount.SetValue((AllUpgradeLocations.GetAt(i) as Location).GetKeywordData(BarracksLevel))
        UpdateCurrentInstanceGlobal(GarrisonCount)
        UpdateCurrentInstanceGlobal(GarrisonArmyCount)
        UpdateCurrentInstanceGlobal(GarrisonArmyCapCount)
        i += 1
    endwhile
EndFunction

Function UpdateMinorCityTroopGarrisons()
    int i = 5
    while i >= 5 && i < 9
        GlobalVariable GarrisonCount = PlayerGarrisonCounts.GetAt(i) as GlobalVariable
        GlobalVariable GarrisonArmyCount = PlayerGarrisonArmyCounts.GetAt(i) as GlobalVariable
        GlobalVariable GarrisonArmyCapCount = PlayerGarrisonArmyCapCounts.GetAt(i) as GlobalVariable
        GarrisonCount.SetValue((TroopGarrisons.GetAt(i) as FormList).GetSize())
        GarrisonArmyCapCount.SetValue((AllUpgradeLocations.GetAt(i) as Location).GetKeywordData(BarracksLevel))
        UpdateCurrentInstanceGlobal(GarrisonCount)
        UpdateCurrentInstanceGlobal(GarrisonArmyCount)
        UpdateCurrentInstanceGlobal(GarrisonArmyCapCount)
        i += 1
    endwhile
EndFunction

Function FindArmyTask(int armynum)
    If Commanders[armynum].GetActorRef() != None
        If Commanders[armynum].GetActorRef().IsInFaction(ArmyTaskFaction) == 1
            ArmyTask[armynum].ForceRefTo(TaskBarrelMission)
        ElseIf Commanders[armynum].GetActorRef().IsInFaction(ArmyFollowerFaction) == 1
            ArmyTask[armynum].ForceRefTo(TaskBarrelFollow)
        ElseIf Commanders[armynum].GetActorRef().IsInFaction(ArmyHunterFaction) == 1
            ArmyTask[armynum].ForceRefTo(TaskBarrelHunt)
        ElseIf Commanders[armynum].GetActorRef().IsInFaction(ArmyPatrolFaction) == 1
            int i = 0
            int GarrisonFound = 0
            while i < CommanderQuest.GarrisonFactions.GetSize() && GarrisonFound == 0
                if Commanders[armynum].GetActorRef().IsInFaction(CommanderQuest.GarrisonFactions.GetAt(i) as Faction) == 1
                    GarrisonFound = 1
                    ArmyTask[armynum].ForceRefTo(TaskBarrelDefense.GetAt(i) as ObjectReference)
                endif
                i += 1
            endwhile
        ElseIf Commanders[armynum].GetActorRef().IsInFaction(ArmyAttackFaction) == 1
            int citynum = AllLocations.Find(AttackedCity.GetLocation())
            ArmyTask[armynum].ForceRefTo(TaskBarrelAttack.GetAt(citynum) as ObjectReference)
        Else
            ArmyTask[armynum].ForceRefTo(TaskBarrelNoOrder) 
        EndIf
    EndIf
EndFunction

Function FindArmyTaskSelected(int armynum)
    If CommanderQuest.ArmyScripts[armynum].CurrentTask == CommanderQuest.TaskBarrelMoving
        ArmyTaskSelected.ForceRefTo(CommanderQuest.ArmyScripts[armynum].MovingArrivalText)
        MovingTimeRemaining.SetValue(CommanderQuest.ArmyScripts[armynum].MovingArrivalTimeRemaining)
        UpdateCurrentInstanceGlobal(MovingTimeRemaining)
    Else
        If CommanderQuest.ArmyScripts[armynum].CurrentTask
            ArmyTaskSelected.ForceRefTo(CommanderQuest.ArmyScripts[armynum].CurrentTask)
        Else
            ArmyTaskSelected.ForceRefTo(TaskBarrelNoOrder)
        EndIf
    EndIf
EndFunction

Function ArmyMenu(int armynum, int Response = 0)
    ArmySelected.SetValue(armynum + 1)
    CS_ArmyTroopDeath ArmyScript = ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath)
    TroopCountSelected.SetValue(ArmyScript.TroopCount)
    CommanderSelected.ForceRefTo(Commanders[armynum].GetActorRef())
    ArmyLocation.ForceLocationTo(CommanderSelected.GetActorRef().GetCurrentLocation())
    If ArmyLocation.GetLocation() == None
        ArmyLocation.ForceLocationTo(WildernessLocation)
    EndIf
    FindArmyTaskSelected(armynum)
    UpdateCurrentInstanceGlobal(ArmySelected)
    UpdateCurrentInstanceGlobal(TroopCountSelected)
    if CommanderSelected.GetActorRef().IsInFaction(PlayerVampireFaction)
        VampireCommander = true
        VampireArmy = ArmyScript.IsVampire
    else
        VampireCommander = false
    endif
    if CommanderSelected.GetActorRef().IsInFaction(ArmyMovingFaction)
        MovingTimeRemaining.SetValue(ArmyScript.MovingArrivalTimeRemaining)
        UpdateCurrentInstanceGlobal(MovingTimeRemaining)
        Response = ArmyMenuMoving.show()
    else
        Response = ArmyMenu.show()
    endif
    If Response == 0
        TroopsMenu(armynum)
    ElseIf Response == 1
        OrdersMenu(armynum)
    ElseIf Response == 2
        EquipmentMenu(armynum)
    Elseif Response == 3
        ;VampireMenu(armynum)
    Elseif Response == 4
        if armynum < 5
            MenuStart()
        elseif armynum >= 5 && armynum < 10
            Armies2Menu()
        elseif armynum >= 10 && armynum < 15
            Armies3Menu()
        elseif armynum >= 15 && armynum < 20
            Armies4Menu()
        elseif armynum >= 20 && armynum < 25
            Armies5Menu()
        elseif armynum >= 25 && armynum < 30
            Armies6Menu()
        endif
    EndIf
EndFunction

Function TroopsMenu(int armynum, int Response = 0)
    ArmySelected.SetValue(armynum + 1)
    CS_ArmyTroopDeath ArmyScript = ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath)
    AutoRecruitment = ArmyScript.AutoRespawn
    if AutoRecruitment
        TroopAutoRecruit.ForceRefTo(AutoRecruitTrue)
    else
        TroopAutoRecruit.ForceRefTo(AutoRecruitFalse)
    endif
    TroopCountSelected.SetValue(ArmyScript.TroopCount)
    CommanderSelected.ForceRefTo(Commanders[armynum].GetActorRef())
    If CommanderSelected.GetActorRef().GetCurrentLocation() != None
        ArmyLocation.ForceLocationTo(CommanderSelected.GetActorRef().GetCurrentLocation())
    Else
        ArmyLocation.ForceLocationTo(WildernessLocation)
    EndIf
    FindArmyTaskSelected(armynum)
    UpdateCurrentInstanceGlobal(ArmySelected)
    UpdateCurrentInstanceGlobal(TroopCountSelected) 
    if CommanderSelected.GetActorRef().IsInFaction(ArmyMovingFaction)
        MovingTimeRemaining.SetValue(ArmyScript.MovingArrivalTimeRemaining)
        UpdateCurrentInstanceGlobal(MovingTimeRemaining)
        Response = TroopsMenuMoving.show()
    else
        Response = TroopsMenuStart.show()
    endif
    If Response == 0
        RecruitMenu(armynum)
    ElseIf Response == 1
        AutoRecruitMenu(armynum)
    ElseIf Response == 2
        ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).StopAutoRecruit()
        TroopsMenu(armynum)
    ElseIf Response == 3
        TemplateMenuStart(armynum)
    Elseif Response == 4
        ArmyMenu(armynum)
    EndIf
EndFunction

Function AutoRecruitMenu(int armynum, int Response = 0)
    Response = AutoRecruitMenuMessage.show()
    if Response == 0
        ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).StartAutoRecruit()
    endif
    ArmyMenu(armynum)
EndFunction

Function RecruitMenu(int armynum, int Response = 0)
    DailyTroopRemaining.SetValue(DailyTroopLimit.GetValue() - DailyTroopSpawned.GetValue())
    UpdateCurrentInstanceGlobal(DailyTroopRemaining)
    UpdateCurrentInstanceGlobal(Treasury)
    UpdateCurrentInstanceGlobal(Food)
    UpdateCurrentInstanceGlobal(FoodPerDay)
    UpdateSpecificGlobals(armynum)
    AdjustArchmageLevels()
        Response = RecruitMenuStart.show()
        if Response == 0
            RecruitMenuNormal(armynum)
        elseif Response == 1
            RecruitMenuMage(armynum)
        elseif Response == 2
            RecruitMenuDwarven(armynum)
        elseif Response == 3
            RecruitMenuCreature(armynum)
        elseif Response == 4
            TroopsMenu(armynum)
        endif
EndFunction

Function AdjustArchmageLevels()
    if MG08.GetStageDone(200)

        if DestructionMageLevel.GetValue() < 3
            DestructionMageLevel.SetValue(3)
        endif

        if RestorationMageLevel.GetValue() < 3
            RestorationMageLevel.SetValue(3)
        endif

        if AlterationMageLevel.GetValue() < 3
            AlterationMageLevel.SetValue(3)
        endif

    endif
EndFunction

Function RecruitMenuNormal(int armynum, int Response = 0)
    DailyTroopRemaining.SetValue(DailyTroopLimit.GetValue() - DailyTroopSpawned.GetValue())
    CS_ArmyTroopDeath ArmyScript = ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath)
    SoldierSelected.SetValue(ArmyScript.CountSoldier)
    WarriorSelected.SetValue(ArmyScript.CountWarrior)
    ArcherSelected.SetValue(ArmyScript.CountArcher)
    CrossbowmanSelected.SetValue(ArmyScript.CountCrossbow)
    UpdateCurrentInstanceGlobal(DailyTroopRemaining)
    UpdateCurrentInstanceGlobal(Treasury)
    UpdateCurrentInstanceGlobal(Food)
    UpdateCurrentInstanceGlobal(FoodPerDay)
    UpdateCurrentInstanceGlobal(SoldierSelected)
    UpdateCurrentInstanceGlobal(WarriorSelected)
    UpdateCurrentInstanceGlobal(ArcherSelected)
    UpdateCurrentInstanceGlobal(CrossbowmanSelected)
    UpdateSpecificGlobals(armynum)
    Response = RecruitMenu.show()
    if Response < 4
        if Treasury.GetValue() >= TroopCostsInt[Response]
            PayForTroop(Response)
            RecruitTroop(armynum, Response)
        else
            debug.notification("Not enough gold in the treasury!")
        endif
        RecruitMenuNormal(armynum)
    elseif Response == 4
        if ResearchedMagicTroop.GetValue() == 1 || ResearchedMagicTroop.GetValue() == 0 ; TESTING DELETE WHEN DONE!!!!!!!!!!!!!!!!!!!!!!!!!
            RecruitMenu(armynum)
        else
            ArmyMenu(armynum)
        endif
        if (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).AutoRespawn == true && RecruitedTroop
            (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).StartAutoRecruit()
        endif
    else
        if (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).AutoRespawn == true && RecruitedTroop
            (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).StartAutoRecruit()
        endif
    endif
EndFunction

Function RecruitMenuMage(int armynum, int Response = 0)
    DailyTroopRemaining.SetValue(DailyTroopLimit.GetValue() - DailyTroopSpawned.GetValue())
    CS_ArmyTroopDeath ArmyScript = ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath)
    UpdateCurrentInstanceGlobal(DailyTroopRemaining)
    UpdateCurrentInstanceGlobal(Treasury)
    UpdateCurrentInstanceGlobal(Food)
    UpdateCurrentInstanceGlobal(FoodPerDay)
    MageDestructionSelected.SetValue(ArmyScript.CountMageDestructionFire + ArmyScript.CountMageDestructionFrost + ArmyScript.CountMageDestructionShock)
    MageRestorationSelected.SetValue(ArmyScript.CountMageRestoration)
    MageConjurationSelected.SetValue(ArmyScript.CountMageConjuration)
    MageAlterationSelected.SetValue(ArmyScript.CountMageAlteration)
    UpdateCurrentInstanceGlobal(MageDestructionSelected)
    UpdateCurrentInstanceGlobal(MageRestorationSelected)
    UpdateCurrentInstanceGlobal(MageConjurationSelected)
    UpdateCurrentInstanceGlobal(MageAlterationSelected)
    UpdateSpecificGlobals(armynum)
    Response = RecruitMenuMage.show()
    if Response < 3
        if Treasury.GetValue() >= TroopCostsInt[5]
            PayForTroop(5)
            RecruitTroop(armynum, 5, destructionmage=Response + 1)
        else
            debug.notification("Not enough gold in the treasury!")
        endif
        RecruitMenuMage(armynum)
    elseif Response >= 3 && Response < 6
        if Treasury.GetValue() >= TroopCostsInt[Response+3]
            PayForTroop(Response + 3)
            RecruitTroop(armynum, Response + 3)
        else
            debug.notification("Not enough gold in the treasury!")
        endif
        RecruitMenuMage(armynum)
    elseif Response == 6
        RecruitMenu(armynum)
        if (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).AutoRespawn == true && RecruitedTroop
            (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).StartAutoRecruit()
        endif
    else
        if (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).AutoRespawn == true && RecruitedTroop
            (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).StartAutoRecruit()
        endif
    endif
EndFunction

Function RecruitMenuDwarven(int armynum, int Response = 0)
    DailyTroopRemaining.SetValue(DailyTroopLimit.GetValue() - DailyTroopSpawned.GetValue())
    CS_ArmyTroopDeath ArmyScript = ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath)
    UpdateCurrentInstanceGlobal(DailyTroopRemaining)
    UpdateCurrentInstanceGlobal(Treasury)
    UpdateCurrentInstanceGlobal(Metal)
    DwarvenSpiderSelected.SetValue(ArmyScript.CountDwarvenSpider)
    DwarvenSphereSelected.SetValue(ArmyScript.CountDwarvenSphere)
    DwarvenBallistaSelected.SetValue(ArmyScript.CountDwarvenBallista)
    UpdateCurrentInstanceGlobal(DwarvenSpiderSelected)
    UpdateCurrentInstanceGlobal(DwarvenSphereSelected)
    UpdateCurrentInstanceGlobal(DwarvenBallistaSelected)
    UpdateSpecificGlobals(armynum)
    Response = RecruitMenuDwarven.show()
    if Response < 3
        if Treasury.GetValue() >= TroopCostsInt[Response + 9]
            PayForTroop(Response + 9)
            RecruitTroop(armynum, Response + 9)
        else
            debug.notification("Not enough gold in the treasury!")
        endif
        RecruitMenuDwarven(armynum)
    elseif Response == 3
        RecruitMenu(armynum)
        if (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).AutoRespawn == true && RecruitedTroop
            (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).StartAutoRecruit()
        endif
    else
        if (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).AutoRespawn == true && RecruitedTroop
            (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).StartAutoRecruit()
        endif
    endif
EndFunction

Function RecruitMenuCreature(int armynum, int Response = 0)
    DailyTroopRemaining.SetValue(DailyTroopLimit.GetValue() - DailyTroopSpawned.GetValue())
    CS_ArmyTroopDeath ArmyScript = ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath)
    UpdateCurrentInstanceGlobal(DailyTroopRemaining)
    UpdateCurrentInstanceGlobal(Treasury)
    UpdateCurrentInstanceGlobal(Metal)
    CreatureSkeeverSelected.SetValue(ArmyScript.CountCreatureSkeever)
    CreatureWolfSelected.SetValue(ArmyScript.CountCreatureWolf)
    CreatureSabreCatSelected.SetValue(ArmyScript.CountCreatureSabreCat)
    CreatureFrostbiteSpiderSelected.SetValue(ArmyScript.CountCreatureFrostbiteSpider)
    CreatureBearSelected.SetValue(ArmyScript.CountCreatureBear)
    CreatureTrollSelected.SetValue(ArmyScript.CountCreatureTroll)
    CreatureGiantSelected.SetValue(ArmyScript.CountCreatureGiant)
    CreatureMammothSelected.SetValue(ArmyScript.CountCreatureMammoth)
    UpdateCurrentInstanceGlobal(CreatureSkeeverSelected)
    UpdateCurrentInstanceGlobal(CreatureWolfSelected)
    UpdateCurrentInstanceGlobal(CreatureSabreCatSelected)
    UpdateCurrentInstanceGlobal(CreatureFrostbiteSpiderSelected)
    UpdateCurrentInstanceGlobal(CreatureBearSelected)
    UpdateCurrentInstanceGlobal(CreatureTrollSelected)
    UpdateCurrentInstanceGlobal(CreatureGiantSelected)
    UpdateCurrentInstanceGlobal(CreatureMammothSelected)
    UpdateSpecificGlobals(armynum)
    Response = RecruitMenuCreature.show()
    if Response < 8
        if Treasury.GetValue() >= TroopCostsInt[Response + 13]
            PayForTroop(Response + 13)
            RecruitTroop(armynum, Response + 13)
        else
            debug.notification("Not enough gold in the treasury!")
        endif
        RecruitMenuCreature(armynum)
    elseif Response == 8
        RecruitMenu(armynum)
        if (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).AutoRespawn == true && RecruitedTroop
            (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).StartAutoRecruit()
        endif
    else
        if (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).AutoRespawn == true && RecruitedTroop
            (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).StartAutoRecruit()
        endif
    endif
EndFunction

Function ApplyTemplate(int armynum, int templatenum)
    CS_TroopTemplatesScript TroopTemplate = TroopTemplates[templatenum]
    CS_ArmyTroopDeath ArmyScript = ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath)
    ArmyScript.TemplateNum = templatenum

    ArmyScript.CountSoldierAuto = TroopTemplate.CountSoldier
    ArmyScript.CountWarriorAuto = TroopTemplate.CountWarrior
    ArmyScript.CountArcherAuto = TroopTemplate.CountArcher
    ArmyScript.CountCrossbowAuto = TroopTemplate.CountCrossbow
    ArmyScript.CountMageDestructionFireAuto = TroopTemplate.CountMageDestructionFire
    ArmyScript.CountMageDestructionFrostAuto = TroopTemplate.CountMageDestructionFrost
    ArmyScript.CountMageDestructionShockAuto = TroopTemplate.CountMageDestructionShock
    ArmyScript.CountMageRestorationAuto = TroopTemplate.CountMageRestoration
    ArmyScript.CountMageConjurationAuto = TroopTemplate.CountMageConjuration
    ArmyScript.CountMageAlterationAuto = TroopTemplate.CountMageAlteration
    ArmyScript.CountDwarvenSpiderAuto = TroopTemplate.CountDwarvenSpider
    ArmyScript.CountDwarvenSphereAuto = TroopTemplate.CountDwarvenSphere
    ArmyScript.CountDwarvenBallistaAuto = TroopTemplate.CountDwarvenBallista
    ArmyScript.CountDwarvenCenturionAuto = TroopTemplate.CountDwarvenCenturion
    ArmyScript.CountCreatureSkeeverAuto = TroopTemplate.CountCreatureSkeever
    ArmyScript.CountCreatureWolfAuto = TroopTemplate.CountCreatureWolf
    ArmyScript.CountCreatureSabreCatAuto = TroopTemplate.CountCreatureSabreCat
    ArmyScript.CountCreatureFrostbiteSpiderAuto = TroopTemplate.CountCreatureFrostbiteSpider
    ArmyScript.CountCreatureBearAuto = TroopTemplate.CountCreatureBear
    ArmyScript.CountCreatureTrollAuto = TroopTemplate.CountCreatureTroll
    ArmyScript.CountCreatureGiantAuto = TroopTemplate.CountCreatureGiant
    ArmyScript.CountCreatureMammothAuto = TroopTemplate.CountCreatureMammoth
EndFunction

Function TemplateMenuStart(int armynum, int Response = 0)
    ArmyTemplateNum  = (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).TemplateNum
    Response = TroopTemplatesStart.show()
    if Response < 5
        TemplateMenu(armynum, Response)
    elseif Response == 5
        (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).TemplateNum = -1
        TroopsMenu(armynum)
    else
        TroopsMenu(armynum)
    endif
EndFunction

Function TemplateMenu(int armynum, int templatenum, int Response = 0)
    TroopTemplateSelected.SetValue(templatenum + 1)
    UpdateCurrentInstanceGlobal(TroopTemplateSelected)
    TroopTemplateCount.SetValue(TroopTemplates[templatenum].TroopCount)
    UpdateCurrentInstanceGlobal(TroopTemplateCount)
    Response = TroopTemplateMenu.show()
    if Response == 0
        TemplateMenuNormal(armynum, templatenum)
    elseif Response == 1
        TemplateMenuMage(armynum, templatenum)
    elseif Response == 2
        TemplateMenuDwarven(armynum, templatenum)
    elseif Response == 3
        TemplateMenuCreature(armynum, templatenum)
    elseif Response == 4
        ApplyTemplate(armynum, templatenum)
        TroopsMenu(armynum)
    else
        TemplateMenuStart(armynum)
    endif
EndFunction

Function TemplateMenuNormal(int armynum, int templatenum, int Response = 0)
    CS_TroopTemplatesScript TroopTemplate = TroopTemplates[templatenum]
    SoldierSelected.SetValue(TroopTemplate.CountSoldier)
    WarriorSelected.SetValue(TroopTemplate.CountWarrior)
    ArcherSelected.SetValue(TroopTemplate.CountArcher)
    CrossbowmanSelected.SetValue(TroopTemplate.CountCrossbow)
    TroopTemplateCount.SetValue(TroopTemplate.TroopCount)
    UpdateCurrentInstanceGlobal(SoldierSelected)
    UpdateCurrentInstanceGlobal(WarriorSelected)
    UpdateCurrentInstanceGlobal(ArcherSelected)
    UpdateCurrentInstanceGlobal(CrossbowmanSelected)
    UpdateCurrentInstanceGlobal(TroopTemplateCount)
    Response = TroopTemplateNormal.show()
    if Response == 0
        TroopTemplate.CountSoldier += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuNormal(armynum, templatenum)
    elseif Response == 1
        TroopTemplate.CountSoldier -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuNormal(armynum, templatenum)
    elseif Response == 2
        TroopTemplate.CountWarrior += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuNormal(armynum, templatenum)
    elseif Response == 3
        TroopTemplate.CountWarrior -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuNormal(armynum, templatenum)
    elseif Response == 4
        TroopTemplate.CountArcher += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuNormal(armynum, templatenum)
    elseif Response == 5
        TroopTemplate.CountArcher -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuNormal(armynum, templatenum)
    elseif Response == 6
        TroopTemplate.CountCrossbow += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuNormal(armynum, templatenum)
    elseif Response == 7
        TroopTemplate.CountCrossbow -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuNormal(armynum, templatenum)
    else
        TemplateMenu(armynum, templatenum)
    endif
EndFunction

Function TemplateMenuMage(int armynum, int templatenum, int Response = 0)
    CS_TroopTemplatesScript TroopTemplate = TroopTemplates[templatenum]
    MageDestructionFireSelected.SetValue(TroopTemplate.CountMageDestructionFire)
    MageDestructionFrostSelected.SetValue(TroopTemplate.CountMageDestructionFrost)
    MageDestructionShockSelected.SetValue(TroopTemplate.CountMageDestructionShock)
    MageRestorationSelected.SetValue(TroopTemplate.CountMageRestoration)
    MageConjurationSelected.SetValue(TroopTemplate.CountMageConjuration)
    MageAlterationSelected.SetValue(TroopTemplate.CountMageAlteration)
    UpdateCurrentInstanceGlobal(MageDestructionFireSelected)
    UpdateCurrentInstanceGlobal(MageDestructionFrostSelected)
    UpdateCurrentInstanceGlobal(MageDestructionShockSelected)
    UpdateCurrentInstanceGlobal(MageRestorationSelected)
    UpdateCurrentInstanceGlobal(MageConjurationSelected)
    UpdateCurrentInstanceGlobal(MageAlterationSelected)
    TroopTemplateCount.SetValue(TroopTemplate.TroopCount)
    UpdateCurrentInstanceGlobal(TroopTemplateCount)
    Response = TroopTemplateMage.show()
    if Response == 0
        TroopTemplate.CountMageDestructionFire += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuMage(armynum, templatenum)
    elseif Response == 1
        TroopTemplate.CountMageDestructionFire -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuMage(armynum, templatenum)
    elseif Response == 2
        TroopTemplate.CountMageDestructionFrost += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuMage(armynum, templatenum)
    elseif Response == 3
        TroopTemplate.CountMageDestructionFrost -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuMage(armynum, templatenum)
    elseif Response == 4
        TroopTemplate.CountMageDestructionShock += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuMage(armynum, templatenum)
    elseif Response == 5
        TroopTemplate.CountMageDestructionShock -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuMage(armynum, templatenum)
    elseif Response == 6
        TroopTemplate.CountMageRestoration += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuMage(armynum, templatenum)
    elseif Response == 7
        TroopTemplate.CountMageRestoration -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuMage(armynum, templatenum)
    elseif Response == 8
        TemplateMenuMage2(armynum, templatenum)
    else
        TemplateMenu(armynum, templatenum)
    endif
EndFunction

Function TemplateMenuMage2(int armynum, int templatenum, int Response = 0)
    CS_TroopTemplatesScript TroopTemplate = TroopTemplates[templatenum]
    MageDestructionFireSelected.SetValue(TroopTemplate.CountMageDestructionFire)
    MageDestructionFrostSelected.SetValue(TroopTemplate.CountMageDestructionFrost)
    MageDestructionShockSelected.SetValue(TroopTemplate.CountMageDestructionShock)
    MageRestorationSelected.SetValue(TroopTemplate.CountMageRestoration)
    MageConjurationSelected.SetValue(TroopTemplate.CountMageConjuration)
    MageAlterationSelected.SetValue(TroopTemplate.CountMageAlteration)
    UpdateCurrentInstanceGlobal(MageDestructionFireSelected)
    UpdateCurrentInstanceGlobal(MageDestructionFrostSelected)
    UpdateCurrentInstanceGlobal(MageDestructionShockSelected)
    UpdateCurrentInstanceGlobal(MageRestorationSelected)
    UpdateCurrentInstanceGlobal(MageConjurationSelected)
    UpdateCurrentInstanceGlobal(MageAlterationSelected)
    TroopTemplateCount.SetValue(TroopTemplate.TroopCount)
    UpdateCurrentInstanceGlobal(TroopTemplateCount)
    Response = TroopTemplateMage2.show()
    if Response == 0
        TemplateMenuMage(armynum, templatenum)
    elseif Response == 1
        TroopTemplate.CountMageConjuration += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuMage2(armynum, templatenum)
    elseif Response == 2
        TroopTemplate.CountMageConjuration -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuMage2(armynum, templatenum)
    elseif Response == 3
        TroopTemplate.CountMageAlteration += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuMage2(armynum, templatenum)
    elseif Response == 4
        TroopTemplate.CountMageAlteration -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuMage2(armynum, templatenum)
    else
        TemplateMenu(armynum, templatenum)
    endif
EndFunction

Function TemplateMenuDwarven(int armynum, int templatenum, int Response = 0)
    CS_TroopTemplatesScript TroopTemplate = TroopTemplates[templatenum]
    DwarvenSpiderSelected.SetValue(TroopTemplate.CountDwarvenSpider)
    DwarvenSphereSelected.SetValue(TroopTemplate.CountDwarvenSphere)
    DwarvenBallistaSelected.SetValue(TroopTemplate.CountDwarvenBallista)
    UpdateCurrentInstanceGlobal(DwarvenSpiderSelected)
    UpdateCurrentInstanceGlobal(DwarvenSphereSelected)
    UpdateCurrentInstanceGlobal(DwarvenBallistaSelected)
    TroopTemplateCount.SetValue(TroopTemplate.TroopCount)
    UpdateCurrentInstanceGlobal(TroopTemplateCount)
    Response = TroopTemplateDwarven.show()
    if Response == 0
        TroopTemplate.CountDwarvenSpider += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuDwarven(armynum, templatenum)
    elseif Response == 1
        TroopTemplate.CountDwarvenSpider -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuDwarven(armynum, templatenum)
    elseif Response == 2
        TroopTemplate.CountDwarvenSphere += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuDwarven(armynum, templatenum)
    elseif Response == 3
        TroopTemplate.CountDwarvenSphere -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuDwarven(armynum, templatenum)
    elseif Response == 4
        TroopTemplate.CountDwarvenBallista += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuDwarven(armynum, templatenum)
    elseif Response == 5
        TroopTemplate.CountDwarvenBallista -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuDwarven(armynum, templatenum)
    else
        TemplateMenu(armynum, templatenum)
    endif
EndFunction

Function TemplateMenuCreature(int armynum, int templatenum, int Response = 0)
    CS_TroopTemplatesScript TroopTemplate = TroopTemplates[templatenum]
    CreatureSkeeverSelected.SetValue(TroopTemplate.CountCreatureSkeever)
    CreatureWolfSelected.SetValue(TroopTemplate.CountCreatureWolf)
    CreatureSabreCatSelected.SetValue(TroopTemplate.CountCreatureSabreCat)
    CreatureFrostbiteSpiderSelected.SetValue(TroopTemplate.CountCreatureFrostbiteSpider)
    CreatureBearSelected.SetValue(TroopTemplate.CountCreatureBear)
    CreatureTrollSelected.SetValue(TroopTemplate.CountCreatureTroll)
    CreatureGiantSelected.SetValue(TroopTemplate.CountCreatureGiant)
    CreatureMammothSelected.SetValue(TroopTemplate.CountCreatureMammoth)
    UpdateCurrentInstanceGlobal(CreatureSkeeverSelected)
    UpdateCurrentInstanceGlobal(CreatureWolfSelected)
    UpdateCurrentInstanceGlobal(CreatureSabreCatSelected)
    UpdateCurrentInstanceGlobal(CreatureFrostbiteSpiderSelected)
    UpdateCurrentInstanceGlobal(CreatureBearSelected)
    UpdateCurrentInstanceGlobal(CreatureTrollSelected)
    UpdateCurrentInstanceGlobal(CreatureGiantSelected)
    UpdateCurrentInstanceGlobal(CreatureMammothSelected)
    TroopTemplateCount.SetValue(TroopTemplate.TroopCount)
    UpdateCurrentInstanceGlobal(TroopTemplateCount)
    Response = TroopTemplateCreature.show()
    if Response == 0
        TroopTemplate.CountCreatureSkeever += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuCreature(armynum, templatenum)
    elseif Response == 1
        TroopTemplate.CountCreatureSkeever -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuCreature(armynum, templatenum)
    elseif Response == 2
        TroopTemplate.CountCreatureWolf += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuCreature(armynum, templatenum)
    elseif Response == 3
        TroopTemplate.CountCreatureWolf-= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuCreature(armynum, templatenum)
    elseif Response == 4
        TroopTemplate.CountCreatureSabreCat += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuCreature(armynum, templatenum)
    elseif Response == 5
        TroopTemplate.CountCreatureSabreCat -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuCreature(armynum, templatenum)
    elseif Response == 6
        TroopTemplate.CountCreatureFrostbiteSpider += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuCreature(armynum, templatenum)
    elseif Response == 7
        TroopTemplate.CountCreatureFrostbiteSpider -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuCreature(armynum, templatenum)
    elseif Response == 8
        TemplateMenuCreature2(armynum, templatenum)
    else
        TemplateMenu(armynum, templatenum)
    endif
EndFunction

Function TemplateMenuCreature2(int armynum, int templatenum, int Response = 0)
    CS_TroopTemplatesScript TroopTemplate = TroopTemplates[templatenum]
    CreatureSkeeverSelected.SetValue(TroopTemplate.CountCreatureSkeever)
    CreatureWolfSelected.SetValue(TroopTemplate.CountCreatureWolf)
    CreatureSabreCatSelected.SetValue(TroopTemplate.CountCreatureSabreCat)
    CreatureFrostbiteSpiderSelected.SetValue(TroopTemplate.CountCreatureFrostbiteSpider)
    CreatureBearSelected.SetValue(TroopTemplate.CountCreatureBear)
    CreatureTrollSelected.SetValue(TroopTemplate.CountCreatureTroll)
    CreatureGiantSelected.SetValue(TroopTemplate.CountCreatureGiant)
    CreatureMammothSelected.SetValue(TroopTemplate.CountCreatureMammoth)
    UpdateCurrentInstanceGlobal(CreatureSkeeverSelected)
    UpdateCurrentInstanceGlobal(CreatureWolfSelected)
    UpdateCurrentInstanceGlobal(CreatureSabreCatSelected)
    UpdateCurrentInstanceGlobal(CreatureFrostbiteSpiderSelected)
    UpdateCurrentInstanceGlobal(CreatureBearSelected)
    UpdateCurrentInstanceGlobal(CreatureTrollSelected)
    UpdateCurrentInstanceGlobal(CreatureGiantSelected)
    UpdateCurrentInstanceGlobal(CreatureMammothSelected)
    TroopTemplateCount.SetValue(TroopTemplate.TroopCount)
    UpdateCurrentInstanceGlobal(TroopTemplateCount)
    Response = TroopTemplateCreature2.show()
    if Response == 0
        TemplateMenuCreature(armynum, templatenum)
    elseif Response == 1
        TroopTemplate.CountCreatureBear += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuCreature2(armynum, templatenum)
    elseif Response == 2
        TroopTemplate.CountCreatureBear -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuCreature2(armynum, templatenum)
    elseif Response == 3
        TroopTemplate.CountCreatureTroll += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuCreature2(armynum, templatenum)
    elseif Response == 4
        TroopTemplate.CountCreatureTroll -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuCreature2(armynum, templatenum)
    elseif Response == 5
        TroopTemplate.CountCreatureGiant += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuCreature2(armynum, templatenum)
    elseif Response == 6
        TroopTemplate.CountCreatureGiant -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuCreature2(armynum, templatenum)
    elseif Response == 7
        TroopTemplate.CountCreatureMammoth += 1
        TroopTemplate.TroopCount += 1
        TemplateMenuCreature2(armynum, templatenum)
    elseif Response == 8
        TroopTemplate.CountCreatureMammoth -= 1
        TroopTemplate.TroopCount -= 1
        TemplateMenuCreature2(armynum, templatenum)
    else
        TemplateMenu(armynum, templatenum)
    endif
EndFunction

Function EquipmentMenu(int armynum, int Response = 0)
    CommanderArmyEquipment = (CommanderQuest.Commanders[armynum] as CS_CommanderAliasScript).ArmyEquipment
    Response = EquipmentMenuStart.show()
    if Response == 0
        SetCommanderEquipment(armynum)
        while Utility.IsInMenuMode()
            Utility.WaitMenuMode(1)
        endwhile
        EquipmentMenu(armynum)
    elseif Response == 1
        SetArmyEquipment(armynum)
        while Utility.IsInMenuMode()
            Utility.WaitMenuMode(1)
        endwhile
        EquipmentMenu(armynum)
    elseif Response == 2
        (CommanderQuest.Commanders[armynum] as CS_CommanderAliasScript).ArmyEquipment = true
        if Commanders[armynum].GetActorRef().Is3DLoaded()
            (CommanderQuest.Commanders[armynum] as CS_CommanderAliasScript).UpgradeCommander(Commanders[armynum].GetActorRef())
        endif
        EquipmentMenu(armynum)
    elseif Response == 3
        (CommanderQuest.Commanders[armynum] as CS_CommanderAliasScript).ArmyEquipment = false
        if Commanders[armynum].GetActorRef().Is3DLoaded()
            (CommanderQuest.Commanders[armynum] as CS_CommanderAliasScript).UpgradeCommander(Commanders[armynum].GetActorRef())
        endif
        EquipmentMenu(armynum)
    elseif Response == 4
        ArmyMenu(armynum)
    endif
EndFunction

Function SetArmyEquipment(int armynum)
    EquipmentArmyNum = armynum
    ((ArmyEquipmentActors.GetAt(armynum) as ObjectReference) as CS_CustomOutfitArmyAddItem).armynum = armynum
    (ArmyEquipmentActors.GetAt(armynum) as Actor).OpenInventory(true)
EndFunction

Function SetCommanderEquipment(int armynum)
    CommanderOutfitScript.CommanderOutfitMenu(Commanders[armynum].GetActorRef(), menu=true, armynum=armynum)
EndFunction

Function RecruitTroop(int armynum, int TroopType, int destructionmage=-1)
    if Commanders[armynum].GetActorRef().Is3DLoaded() == true

        TroopRecruiter.SpawnTroop(armynum, TroopType, destructionmage)

    else

        debug.trace("Storing troop")

        ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).AddTroopCountUnspawned(TroopType, destructionmage)

    endif

    RecruitedTroop = true
    DailyTroopSpawned.Mod(1)
    ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).AddTroopCount(TroopType, destructionmage)
    TroopCountSelected.Mod(1)
    (TroopCounts.GetAt(armynum) as GlobalVariable).Mod(1)
    UpdateCurrentInstanceGlobal(TroopCountSelected)
    If GovQuest.GetStage() == 6
        FactionStartRecruitTroop.SetValue(1)
        GovQuest.SetStage(7)
    endIf
EndFunction

Function StopQuest()
    Stop()
EndFunction


Function PayForTroop(int TroopType)
    Treasury.SetValue(Treasury.GetValue() - TroopCostsInt[TroopType])
    CoinSound.Play(Game.GetPlayer())
    debug.notification(TroopCostsInt[TroopType] + " Gold deducted from the Treasury!")
    FoodPerDay.SetValue(FoodPerDay.GetValue() - 1)
endFunction

Actor Function ArmiesSelect1Menu(ObjectReference Target=None, int Response = 0)
    TaskTarget = Target
    UpdateGlobals(1, TaskTarget)
    Response = ArmiesSelect1Menu.show()
    if Response < 5
        If Commanders[Response].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not send this army while it is on a court mission!")
            ArmiesSelect1Menu(TaskTarget)
        ElseIf CommanderQuest.ArmyScripts[Response].Blockaded == true
            ArmyBlockadedTask.show()
            ArmiesSelect1Menu(TaskTarget)
        Else
            AssignCommanderToTask(Commanders[Response].GetActorRef())
        EndIf
    elseif Response == 5
        ArmiesSelect2Menu() 
    endif
    return AssignedCommander
EndFunction

Function ArmiesSelect2Menu(int Response = 0)
    UpdateGlobals(2, TaskTarget)
    Response = ArmiesSelect2Menu.show()
    if Response == 0
        ArmiesSelect1Menu(TaskTarget)
    elseif Response > 0 && Response < 6
        If Commanders[Response + 4].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not send this army while it is on a court mission!")
            ArmiesSelect2Menu()
        ElseIf CommanderQuest.ArmyScripts[Response + 4].Blockaded == true
            ArmyBlockadedTask.show()
            ArmiesSelect2Menu()
        Else
            AssignCommanderToTask(Commanders[Response + 4].GetActorRef())
        EndIf
    elseif Response == 6
        ArmiesSelect3Menu()
    endif
EndFunction

Function ArmiesSelect3Menu(int Response = 0)
    UpdateGlobals(3, TaskTarget)
    Response = ArmiesSelect3Menu.show()
    if Response == 0
        ArmiesSelect2Menu()
    elseif Response > 0 && Response < 6
        If Commanders[Response + 9].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not send this army while it is on a court mission!")
            ArmiesSelect3Menu()
        ElseIf CommanderQuest.ArmyScripts[Response + 9].Blockaded == true
            ArmyBlockadedTask.show()
            ArmiesSelect3Menu()
        Else
            AssignCommanderToTask(Commanders[Response + 9].GetActorRef())
        EndIf
    elseif Response == 6
        ArmiesSelect4Menu()
    endif
EndFunction

Function ArmiesSelect4Menu(int Response = 0)
    UpdateGlobals(4, TaskTarget)
    Response = ArmiesSelect4Menu.show()
    if Response == 0
        ArmiesSelect3Menu()
    elseif Response > 0 && Response < 6
        If Commanders[Response + 14].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not send this army while it is on a court mission!")
            ArmiesSelect4Menu()
        ElseIf CommanderQuest.ArmyScripts[Response + 14].Blockaded == true
            ArmyBlockadedTask.show()
            ArmiesSelect4Menu()
        Else
            AssignCommanderToTask(Commanders[Response + 14].GetActorRef())
        EndIf
    elseif Response == 6
        ArmiesSelect5Menu()
    endif
EndFunction

Function ArmiesSelect5Menu(int Response = 0)
    UpdateGlobals(5, TaskTarget)
    Response = ArmiesSelect5Menu.show()
    if Response == 0
        ArmiesSelect4Menu()
    elseif Response > 0 && Response < 6
        If Commanders[Response + 19].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not send this army while it is on a court mission!")
            ArmiesSelect5Menu()
        ElseIf CommanderQuest.ArmyScripts[Response + 19].Blockaded == true
            ArmyBlockadedTask.show()
            ArmiesSelect5Menu()
        Else
            AssignCommanderToTask(Commanders[Response + 19].GetActorRef())
        EndIf
    elseif Response == 6
        ArmiesSelect6Menu()
    endif
EndFunction

Function ArmiesSelect6Menu(int Response = 0)
    UpdateGlobals(6, TaskTarget)
    Response = ArmiesSelect6Menu.show()
    if Response == 0
        ArmiesSelect5Menu()
    elseif Response > 0 && Response < 6
        If Commanders[Response + 24].GetActorRef().IsInFaction(ArmyTaskFaction) ==1
            debug.notification("Can not send this army while it is on a court mission!")
            ArmiesSelect6Menu()
        ElseIf CommanderQuest.ArmyScripts[Response + 24].Blockaded == true
            ArmyBlockadedTask.show()
            ArmiesSelect6Menu()
        Else
            AssignCommanderToTask(Commanders[Response + 24].GetActorRef())
        EndIf
    endif
EndFunction

Function KillTroops(int armynum, int deadtroops)
        If armynum == 0
            int i = 0
            while i < ArmyTroops1.Length && deadtroops > 0
                if ArmyTroops1[i].GetActorRef() != None
                    ArmyTroops1[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 1
            int i = 0
            while i < ArmyTroops2.Length && deadtroops > 0
                if ArmyTroops2[i].GetActorRef() != None
                    ArmyTroops2[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 2
            int i = 0
            while i < ArmyTroops3.Length && deadtroops > 0
                if ArmyTroops3[i].GetActorRef() != None
                    ArmyTroops3[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 3
            int i = 0
            while i < ArmyTroops4.Length && deadtroops > 0
                if ArmyTroops4[i].GetActorRef() != None
                    ArmyTroops4[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 4
            int i = 0
            while i < ArmyTroops5.Length && deadtroops > 0
                if ArmyTroops5[i].GetActorRef() != None
                    ArmyTroops5[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 5
            int i = 0
            while i < ArmyTroops6.Length && deadtroops > 0
                if ArmyTroops6[i].GetActorRef() != None
                    ArmyTroops6[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 6
            int i = 0
            while i < ArmyTroops7.Length && deadtroops > 0
                if ArmyTroops7[i].GetActorRef() != None
                    ArmyTroops7[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 7
            int i = 0
            while i < ArmyTroops8.Length && deadtroops > 0
                if ArmyTroops8[i].GetActorRef() != None
                    ArmyTroops8[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 8
            int i = 0
            while i < ArmyTroops9.Length && deadtroops > 0
                if ArmyTroops9[i].GetActorRef() != None
                    ArmyTroops9[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 9
            int i = 0
            while i < ArmyTroops10.Length && deadtroops > 0
                if ArmyTroops10[i].GetActorRef() != None
                    ArmyTroops10[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 10
            int i = 0
            while i < ArmyTroops11.Length && deadtroops > 0
                if ArmyTroops11[i].GetActorRef() != None
                    ArmyTroops11[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 11
            int i = 0
            while i < ArmyTroops12.Length && deadtroops > 0
                if ArmyTroops12[i].GetActorRef() != None
                    ArmyTroops12[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 12
            int i = 0
            while i < ArmyTroops13.Length && deadtroops > 0
                if ArmyTroops13[i].GetActorRef() != None
                    ArmyTroops13[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 13
            int i = 0
            while i < ArmyTroops14.Length && deadtroops > 0
                if ArmyTroops14[i].GetActorRef() != None
                    ArmyTroops14[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 14
            int i = 0
            while i < ArmyTroops15.Length && deadtroops > 0
                if ArmyTroops15[i].GetActorRef() != None
                    ArmyTroops15[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 15
            int i = 0
            while i < ArmyTroops16.Length && deadtroops > 0
                if ArmyTroops16[i].GetActorRef() != None
                    ArmyTroops16[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 16
            int i = 0
            while i < ArmyTroops17.Length && deadtroops > 0
                if ArmyTroops17[i].GetActorRef() != None
                    ArmyTroops17[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 17
            int i = 0
            while i < ArmyTroops18.Length && deadtroops > 0
                if ArmyTroops18[i].GetActorRef() != None
                    ArmyTroops18[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 18
            int i = 0
            while i < ArmyTroops19.Length && deadtroops > 0
                if ArmyTroops19[i].GetActorRef() != None
                    ArmyTroops19[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 19
            int i = 0
            while i < ArmyTroops20.Length && deadtroops > 0
                if ArmyTroops20[i].GetActorRef() != None
                    ArmyTroops20[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 20
            int i = 0
            while i < ArmyTroops21.Length && deadtroops > 0
                if ArmyTroops21[i].GetActorRef() != None
                    ArmyTroops21[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 21
            int i = 0
            while i < ArmyTroops22.Length && deadtroops > 0
                if ArmyTroops22[i].GetActorRef() != None
                    ArmyTroops22[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 22
            int i = 0
            while i < ArmyTroops23.Length && deadtroops > 0
                if ArmyTroops23[i].GetActorRef() != None
                    ArmyTroops23[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 23
            int i = 0
            while i < ArmyTroops24.Length && deadtroops > 0
                if ArmyTroops24[i].GetActorRef() != None
                    ArmyTroops24[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1
            endwhile
        ElseIf armynum == 24
            int i = 0
            while i < ArmyTroops25.Length && deadtroops > 0
                if ArmyTroops25[i].GetActorRef() != None
                    ArmyTroops25[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1
            endwhile
        ElseIf armynum == 25
            int i = 0
            while i < ArmyTroops26.Length && deadtroops > 0
                if ArmyTroops26[i].GetActorRef() != None
                    ArmyTroops26[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 26
            int i = 0
            while i < ArmyTroops27.Length && deadtroops > 0
                if ArmyTroops27[i].GetActorRef() != None
                    ArmyTroops27[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 27
            int i = 0
            while i < ArmyTroops28.Length && deadtroops > 0
                if ArmyTroops28[i].GetActorRef() != None
                    ArmyTroops28[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1
            endwhile
        ElseIf armynum == 28
            int i = 0
            while i < ArmyTroops29.Length && deadtroops > 0
                if ArmyTroops29[i].GetActorRef() != None
                    ArmyTroops29[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1
            endwhile
        ElseIf armynum == 29
            int i = 0
            while i < ArmyTroops30.Length && deadtroops > 0
                if ArmyTroops30[i].GetActorRef() != None
                    ArmyTroops30[i].GetActorRef().kill()
                    deadtroops -= 1
                endif   
                i += 1
            endwhile
        EndIf
EndFunction

Function ResetTroops(int armynum)
        If armynum == 0
            int i = 0
            while i < ArmyTroops1.Length
                if ArmyTroops1[i].GetActorRef() != None
                    ArmyTroops1[i].GetActorRef().disable()              
                    ArmyTroops1[i].GetActorRef().reset()
                    ArmyTroops1[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops1[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 1
            int i = 0
            while i < ArmyTroops2.Length
                if ArmyTroops2[i].GetActorRef() != None
                    ArmyTroops2[i].GetActorRef().disable()              
                    ArmyTroops2[i].GetActorRef().reset()
                    ArmyTroops2[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops2[i].GetActorRef().enable()   
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 2
            int i = 0
            while i < ArmyTroops3.Length
                if ArmyTroops3[i].GetActorRef() != None
                    ArmyTroops3[i].GetActorRef().disable()              
                    ArmyTroops3[i].GetActorRef().reset()
                    ArmyTroops3[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops3[i].GetActorRef().enable()
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 3
            int i = 0
            while i < ArmyTroops4.Length
                if ArmyTroops4[i].GetActorRef() != None
                    ArmyTroops4[i].GetActorRef().disable()              
                    ArmyTroops4[i].GetActorRef().reset()
                    ArmyTroops4[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops4[i].GetActorRef().enable()
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 4
            int i = 0
            while i < ArmyTroops5.Length
                if ArmyTroops5[i].GetActorRef() != None
                    ArmyTroops5[i].GetActorRef().disable()              
                    ArmyTroops5[i].GetActorRef().reset()
                    ArmyTroops5[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops5[i].GetActorRef().enable()
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 5
            int i = 0
            while i < ArmyTroops6.Length
                if ArmyTroops6[i].GetActorRef() != None
                    ArmyTroops6[i].GetActorRef().disable()              
                    ArmyTroops6[i].GetActorRef().reset()
                    ArmyTroops6[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops6[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 6
            int i = 0
            while i < ArmyTroops7.Length
                if ArmyTroops7[i].GetActorRef() != None
                    ArmyTroops7[i].GetActorRef().disable()              
                    ArmyTroops7[i].GetActorRef().reset()
                    ArmyTroops7[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops7[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 7
            int i = 0
            while i < ArmyTroops8.Length
                if ArmyTroops8[i].GetActorRef() != None
                    ArmyTroops8[i].GetActorRef().disable()              
                    ArmyTroops8[i].GetActorRef().reset()
                    ArmyTroops8[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops8[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 8
            int i = 0
            while i < ArmyTroops9.Length
                if ArmyTroops9[i].GetActorRef() != None
                    ArmyTroops9[i].GetActorRef().disable()              
                    ArmyTroops9[i].GetActorRef().reset()
                    ArmyTroops9[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops9[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 9
            int i = 0
            while i < ArmyTroops10.Length
                if ArmyTroops10[i].GetActorRef() != None
                    ArmyTroops10[i].GetActorRef().disable()             
                    ArmyTroops10[i].GetActorRef().reset()
                    ArmyTroops10[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops10[i].GetActorRef().enable()
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 10
            int i = 0
            while i < ArmyTroops11.Length
                if ArmyTroops11[i].GetActorRef() != None
                    ArmyTroops11[i].GetActorRef().disable()             
                    ArmyTroops11[i].GetActorRef().reset()
                    ArmyTroops11[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops11[i].GetActorRef().enable()
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 11
            int i = 0
            while i < ArmyTroops12.Length
                if ArmyTroops12[i].GetActorRef() != None
                    ArmyTroops12[i].GetActorRef().disable()             
                    ArmyTroops12[i].GetActorRef().reset()
                    ArmyTroops12[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops12[i].GetActorRef().enable()
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 12
            int i = 0
            while i < ArmyTroops13.Length
                if ArmyTroops13[i].GetActorRef() != None
                    ArmyTroops13[i].GetActorRef().disable()             
                    ArmyTroops13[i].GetActorRef().reset()
                    ArmyTroops13[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops13[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 13
            int i = 0
            while i < ArmyTroops14.Length
                if ArmyTroops14[i].GetActorRef() != None
                    ArmyTroops14[i].GetActorRef().disable()             
                    ArmyTroops14[i].GetActorRef().reset()
                    ArmyTroops14[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops14[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 14
            int i = 0
            while i < ArmyTroops15.Length
                if ArmyTroops15[i].GetActorRef() != None
                    ArmyTroops15[i].GetActorRef().disable()             
                    ArmyTroops15[i].GetActorRef().reset()
                    ArmyTroops15[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops15[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 15
            int i = 0
            while i < ArmyTroops16.Length
                if ArmyTroops16[i].GetActorRef() != None
                    ArmyTroops16[i].GetActorRef().disable()             
                    ArmyTroops16[i].GetActorRef().reset()
                    ArmyTroops16[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops16[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 16
            int i = 0
            while i < ArmyTroops17.Length
                if ArmyTroops17[i].GetActorRef() != None
                    ArmyTroops17[i].GetActorRef().disable()             
                    ArmyTroops17[i].GetActorRef().reset()
                    ArmyTroops17[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops17[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 17
            int i = 0
            while i < ArmyTroops18.Length
                if ArmyTroops18[i].GetActorRef() != None
                    ArmyTroops18[i].GetActorRef().disable()             
                    ArmyTroops18[i].GetActorRef().reset()
                    ArmyTroops18[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops18[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 18
            int i = 0
            while i < ArmyTroops19.Length
                if ArmyTroops19[i].GetActorRef() != None
                    ArmyTroops19[i].GetActorRef().disable()             
                    ArmyTroops19[i].GetActorRef().reset()
                    ArmyTroops19[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops19[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 19
            int i = 0
            while i < ArmyTroops20.Length
                if ArmyTroops20[i].GetActorRef() != None
                    ArmyTroops20[i].GetActorRef().disable()             
                    ArmyTroops20[i].GetActorRef().reset()
                    ArmyTroops20[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops20[i].GetActorRef().enable()
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 20
            int i = 0
            while i < ArmyTroops21.Length
                if ArmyTroops21[i].GetActorRef() != None
                    ArmyTroops21[i].GetActorRef().disable()             
                    ArmyTroops21[i].GetActorRef().reset()
                    ArmyTroops21[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops21[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 21
            int i = 0
            while i < ArmyTroops22.Length
                if ArmyTroops22[i].GetActorRef() != None
                    ArmyTroops22[i].GetActorRef().disable()             
                    ArmyTroops22[i].GetActorRef().reset()
                    ArmyTroops22[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops22[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 22
            int i = 0
            while i < ArmyTroops23.Length
                if ArmyTroops23[i].GetActorRef() != None
                    ArmyTroops23[i].GetActorRef().disable()             
                    ArmyTroops23[i].GetActorRef().reset()
                    ArmyTroops23[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops23[i].GetActorRef().enable()
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 23
            int i = 0
            while i < ArmyTroops24.Length
                if ArmyTroops24[i].GetActorRef() != None
                    ArmyTroops24[i].GetActorRef().disable()             
                    ArmyTroops24[i].GetActorRef().reset()
                    ArmyTroops24[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops24[i].GetActorRef().enable()
                endif   
                i += 1
            endwhile
        ElseIf armynum == 24
            int i = 0
            while i < ArmyTroops25.Length
                if ArmyTroops25[i].GetActorRef() != None
                    ArmyTroops25[i].GetActorRef().disable()             
                    ArmyTroops25[i].GetActorRef().reset()
                    ArmyTroops25[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops25[i].GetActorRef().enable()
                endif   
                i += 1
            endwhile
        ElseIf armynum == 25
            int i = 0
            while i < ArmyTroops26.Length
                if ArmyTroops26[i].GetActorRef() != None
                    ArmyTroops26[i].GetActorRef().disable()             
                    ArmyTroops26[i].GetActorRef().reset()
                    ArmyTroops26[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops26[i].GetActorRef().enable()
                endif   
                i += 1          
            endwhile
        ElseIf armynum == 26
            int i = 0
            while i < ArmyTroops27.Length
                if ArmyTroops27[i].GetActorRef() != None
                    ArmyTroops27[i].GetActorRef().disable()             
                    ArmyTroops27[i].GetActorRef().reset()
                    ArmyTroops27[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops27[i].GetActorRef().enable()
                endif   
                i += 1              
            endwhile
        ElseIf armynum == 27
            int i = 0
            while i < ArmyTroops28.Length
                if ArmyTroops28[i].GetActorRef() != None
                    ArmyTroops28[i].GetActorRef().disable()             
                    ArmyTroops28[i].GetActorRef().reset()
                    ArmyTroops28[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops28[i].GetActorRef().enable()
                endif   
                i += 1
            endwhile
        ElseIf armynum == 28
            int i = 0
            while i < ArmyTroops29.Length
                if ArmyTroops29[i].GetActorRef() != None
                    ArmyTroops29[i].GetActorRef().disable()             
                    ArmyTroops29[i].GetActorRef().reset()
                    ArmyTroops29[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops29[i].GetActorRef().enable()
                endif   
                i += 1
            endwhile
        ElseIf armynum == 29
            int i = 0
            while i < ArmyTroops30.Length
                if ArmyTroops30[i].GetActorRef() != None
                    ArmyTroops30[i].GetActorRef().disable()             
                    ArmyTroops30[i].GetActorRef().reset()
                    ArmyTroops30[i].GetActorRef().AllowPCDialogue(true)
                    ArmyTroops30[i].GetActorRef().enable()
                endif   
                i += 1
            endwhile
        EndIf
EndFunction

Function AssignCommanderToTask(Actor Commander)
    ;CommanderQuest.ClearFactionsTemp(Commander)
    AssignedCommander = Commander
EndFunction

Actor Property AssignedCommander Auto

ReferenceAlias Property OutfitChanger Auto
FormList[] Property OutfitsTroop Auto
FormList[] Property Swords Auto
FormList[] Property Shields Auto
FormList[] Property Bows Auto
FormList[] Property Ammos Auto
GlobalVariable[] Property OutfitNum Auto

Message Property Armies1Menu  Auto  
Message Property Armies2Menu  Auto  
Message Property Armies3Menu  Auto  
Message Property Armies4Menu  Auto  
Message Property Armies5Menu  Auto  
Message Property Armies6Menu  Auto  
Message Property RecruitMenu  Auto  
Message Property ArmyMenu  Auto  

Message Property ArmiesSelect1Menu  Auto  
Message Property ArmiesSelect2Menu  Auto  
Message Property ArmiesSelect3Menu  Auto  
Message Property ArmiesSelect4Menu  Auto  
Message Property ArmiesSelect5Menu  Auto  
Message Property ArmiesSelect6Menu  Auto  

GlobalVariable Property TroopCountSelected  Auto  

ReferenceAlias[] Property Commanders  Auto  

ReferenceAlias Property CommanderSelected  Auto  
ReferenceAlias Property TaskCommander Auto
ReferenceAlias Property PlayerAlias Auto

FormList Property TroopCounts  Auto  
FormList Property TroopCountsSoldier  Auto  
FormList Property TroopCountsWarrior  Auto  
FormList Property TroopCountsArcher  Auto  
FormList Property TroopCountsCrossbowman  Auto  

FormList[] Property TroopCountsType  Auto  

GlobalVariable Property ArmySelected  Auto
GlobalVariable Property SoldierSelected  Auto
GlobalVariable Property WarriorSelected  Auto
GlobalVariable Property ArcherSelected  Auto
GlobalVariable Property CrossbowmanSelected  Auto  
GlobalVariable Property MageDestructionSelected  Auto
GlobalVariable Property MageDestructionFireSelected  Auto
GlobalVariable Property MageDestructionFrostSelected  Auto
GlobalVariable Property MageDestructionShockSelected  Auto
GlobalVariable Property MageRestorationSelected  Auto
GlobalVariable Property MageConjurationSelected  Auto
GlobalVariable Property MageAlterationSelected  Auto  
GlobalVariable Property DwarvenSpiderSelected  Auto
GlobalVariable Property DwarvenSphereSelected Auto
GlobalVariable Property DwarvenBallistaSelected Auto
GlobalVariable Property DwarvenCenturionSelected Auto  
GlobalVariable Property CreatureSkeeverSelected Auto  
GlobalVariable Property CreatureWolfSelected Auto  
GlobalVariable Property CreatureFrostbiteSpiderSelected Auto  
GlobalVariable Property CreatureSabreCatSelected Auto  
GlobalVariable Property CreatureTrollSelected Auto  
GlobalVariable Property CreatureBearSelected Auto  
GlobalVariable Property CreatureGiantSelected Auto  
GlobalVariable Property CreatureMammothSelected Auto  
GlobalVariable Property DailyTroopSpawned Auto
GlobalVariable Property Treasury Auto
GlobalVariable Property Food Auto
GlobalVariable Property FoodPerDay Auto
GlobalVariable Property MovingTimeRemaining Auto

LocationAlias Property ArmyLocation  Auto  

FormList Property ArmyQuests  Auto  

ActorBase[] Property Troops  Auto
ActorBase[] Property TroopsFemale Auto
int[] Property TroopPowerLevels Auto

ReferenceAlias[] Property ArmyTroops1  Auto  
ReferenceAlias[] Property ArmyTroops2  Auto  
ReferenceAlias[] Property ArmyTroops3  Auto  
ReferenceAlias[] Property ArmyTroops4  Auto  
ReferenceAlias[] Property ArmyTroops5  Auto  
ReferenceAlias[] Property ArmyTroops6  Auto  
ReferenceAlias[] Property ArmyTroops7  Auto  
ReferenceAlias[] Property ArmyTroops8  Auto  
ReferenceAlias[] Property ArmyTroops9  Auto  
ReferenceAlias[] Property ArmyTroops10  Auto
ReferenceAlias[] Property ArmyTroops11  Auto  
ReferenceAlias[] Property ArmyTroops12  Auto  
ReferenceAlias[] Property ArmyTroops13  Auto  
ReferenceAlias[] Property ArmyTroops14  Auto  
ReferenceAlias[] Property ArmyTroops15  Auto  
ReferenceAlias[] Property ArmyTroops16  Auto  
ReferenceAlias[] Property ArmyTroops17  Auto  
ReferenceAlias[] Property ArmyTroops18  Auto  
ReferenceAlias[] Property ArmyTroops19  Auto  
ReferenceAlias[] Property ArmyTroops20  Auto  
ReferenceAlias[] Property ArmyTroops21  Auto  
ReferenceAlias[] Property ArmyTroops22  Auto  
ReferenceAlias[] Property ArmyTroops23  Auto  
ReferenceAlias[] Property ArmyTroops24  Auto  
ReferenceAlias[] Property ArmyTroops25  Auto  
ReferenceAlias[] Property ArmyTroops26  Auto  
ReferenceAlias[] Property ArmyTroops27  Auto  
ReferenceAlias[] Property ArmyTroops28  Auto  
ReferenceAlias[] Property ArmyTroops29  Auto  
ReferenceAlias[] Property ArmyTroops30  Auto    

Location Property WildernessLocation Auto

GlobalVariable[] Property TroopCosts  Auto  

Sound Property CoinSound  Auto  

Quest Property GovQuest  Auto  

GlobalVariable Property FactionStartRecruitTroop  Auto  

GlobalVariable Property PlayerIsFollowed Auto

ObjectReference Property ArmyTaskBarrel  Auto  

ReferenceAlias[] Property ArmyTask  Auto  

Faction Property ArmyPatrolFaction  Auto  

Faction Property ArmyHunterFaction  Auto  

Faction Property ArmyFollowerFaction  Auto  

Faction Property ArmyAttackFaction Auto

FormList Property HoldsVanilla  Auto  

FormList Property HoldsWilderness  Auto  

FormList Property TroopGarrisons Auto

FormList Property AllLocations Auto

Quest Property UpgradeQuest  Auto  

CS_PatrolHoldScript Property CommanderQuest Auto

Message Property ArmyOrdersMenu  Auto  

Message Property ArmyGarrisonCityMenu  Auto  

Message Property ArmyGarrisonMinorCityMenu  Auto  

Message Property RecruitMenuMage Auto

FormList Property PlayerGarrisonCounts  Auto  
FormList Property PlayerGarrisonArmyCounts  Auto  
FormList Property PlayerGarrisonArmyCapCounts  Auto  
FormList Property AllUpgradeLocations Auto

Keyword Property BarracksLevel Auto
FormList Property TaskBarrelDefense  Auto  

FormList Property TaskBarrelAttack  Auto  

ObjectReference Property TaskBarrelFollow  Auto  

ObjectReference Property TaskBarrelHunt  Auto  

ObjectReference Property TaskBarrelNoOrder  Auto  

CS_EconomyVariableFunctions Property Economy Auto

Quest Property DefendQuestImp Auto
Quest Property DefendQuestSons Auto

LocationAlias Property AttackedCity Auto

FormList Property AttackTroops Auto
ReferenceAlias Property ArmyTaskSelected  Auto  

ObjectReference Property TaskBarrelMission  Auto  

Faction Property ArmyTaskFaction  Auto  

GlobalVariable Property DailyTroopRemaining Auto
GlobalVariable Property DailyTroopLimit Auto

FormList Property GroupFactions  Auto  

ReferenceAlias[] Property Healers  Auto  

Faction Property ArmyMovingFaction Auto

Message Property ArmyMenuMoving Auto

ActorBase Property RestorationMage Auto
ActorBase[] Property DestructionMages Auto

GlobalVariable Property DestructionMageLevel Auto
GlobalVariable Property RestorationMageLevel Auto
GlobalVariable Property AlterationMageLevel Auto
GlobalVariable Property ResearchedMagicTroop Auto
GlobalVariable Property Metal Auto

FormList Property DestructionMageSpellsFire Auto
FormList Property DestructionMageSpellsFrost Auto
FormList Property DestructionMageSpellsShock Auto
FormList Property ArmyEquipmentActors Auto

Faction Property DestructionMageFireFaction Auto
Faction Property DestructionMageFrostFaction Auto
Faction Property DestructionMageShockFaction Auto
Faction Property PlayerVampireFaction Auto
Faction Property CS_DefenderFaction Auto
Faction Property CS_AttackingCityFaction Auto
Faction Property CS_AttackingFortFaction Auto
Faction Property CS_AttackingCampFaction Auto

Message Property TroopsMenuStart Auto
Message Property TroopsMenuMoving Auto
Message Property RecruitMenuStart Auto
Message Property RecruitMenuDwarven Auto
Message Property RecruitMenuCreature Auto
Message Property EquipmentMenuStart Auto
Message Property AutoRecruitMenuMessage Auto
Message Property ArmyBlockadedTask Auto
Message Property ArmyBlockaded Auto

Message Property TroopTemplatesStart Auto
Message Property TroopTemplateMenu Auto
Message Property TroopTemplateNormal Auto
Message Property TroopTemplateMage Auto
Message Property TroopTemplateMage2 Auto
Message Property TroopTemplateDwarven Auto
Message Property TroopTemplateCreature Auto
Message Property TroopTemplateCreature2 Auto

GlobalVariable Property TroopTemplateSelected Auto
GlobalVariable Property TroopTemplateCount Auto

CS_TroopTemplatesScript[] Property TroopTemplates Auto

Int[] Property TroopCostsInt  Auto  

ReferenceAlias Property TroopAutoRecruit  Auto  

ObjectReference Property AutoRecruitTrue  Auto  

ObjectReference Property AutoRecruitFalse  Auto  

Quest Property MG08 Auto
Quest Property CS_AttackCampNew Auto
Quest Property CS_AttackFortNew Auto
Quest Property CS_AttackCityNew Auto
Quest Property CS_AttackCitySiege Auto

FormList Property TroopUpgradeLevels  Auto  