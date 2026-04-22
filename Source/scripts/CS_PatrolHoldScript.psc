Scriptname CS_PatrolHoldScript extends Quest  

ReferenceAlias[] Property Commanders  Auto  
ReferenceAlias[] Property PatrolMarkers  Auto  
ReferenceAlias[] Property CommanderDisablers Auto
ReferenceAlias Property CommanderMovingAlias Auto
ReferenceAlias Property CommanderMovingTarget Auto
ReferenceAlias Property FollowerCommander Auto

GlobalVariable[] Property FollowCommander Auto
GlobalVariable Property PlayerIsFollowed Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property CommanderMovingTime Auto

Keyword Property CS_StoryArmyFormUp Auto
Keyword Property LandSuperiority Auto

Faction Property CommanderFaction Auto
Faction Property PatrolFaction  Auto  
Faction Property FollowerFaction Auto
Faction Property HunterFaction Auto
Faction Property RefreshFaction Auto
Faction Property AttackFaction Auto
Faction Property DefendFortFaction Auto
Faction Property MovingFaction Auto
Faction Property HunterPreyFaction Auto

FormList Property MarkerObjects  Auto
FormList Property ArmyQuests Auto  
FormList Property GarrisonFactions Auto
FormList Property GroupFactions Auto
FormList Property CommandersGarrisonHolds Auto
FormList Property CommandersPatrollingHolds Auto
FormList Property CampMarkers Auto

FormList Property AllLocations Auto
FormList Property AllLocationsCS Auto
FormList Property AllHolds Auto
FormList Property AllCrimeFactions Auto
FormList Property HoldCenterMarkers Auto
FormList Property MovingCampMarkers Auto
FormList Property MovingCityMarkers Auto

FormList Property CommanderMovingTargetsCamp Auto
FormList Property CommanderMovingTargetsCity Auto
FormList Property CommanderMovingTargetsFort Auto

FormList Property TaskBarrelsAttackCity Auto
FormList Property TaskBarrelsAttackHold Auto
FormList Property TaskBarrelsAttackCamp Auto
FormList Property TaskBarrelsAttackFort Auto
FormList Property TaskBarrelsDefendCity Auto
FormList Property TaskBarrelsDefendHold Auto
FormList Property TaskBarrelsDefendFort Auto

ObjectReference Property TaskBarrelFollow  Auto  
ObjectReference Property TaskBarrelHunt  Auto  
ObjectReference Property TaskBarrelNoOrder  Auto  
ObjectReference Property TaskBarrelMission  Auto 
ObjectReference Property TaskBarrelMoving Auto 

Message Property CommanderMovingMessage Auto

Spell Property CommanderConfidenceSpell Auto

Quest Property TroopFormUp Auto

WorldSpace Property Tamriel Auto

CS_TMScript Property TMData Auto
CS_FortCommandersScript Property FortCommanders Auto
CS_CommanderMovingScript Property CommanderMoving Auto
CS_ArmyTroopDeath[] Property ArmyScripts Auto

Function ClearFactions(Actor Commander)

    if Commander.IsInFaction(FollowerFaction) == 1
        StopFollowPlayer(Commander)
    endif

    if Commander.IsInFaction(PatrolFaction) == 1
        StopPatrol(Commander)
        StopPatrolHold(Commander)
    elseif Commander.IsInFaction(AttackFaction) == 1
        StopPatrolHold(Commander)
    elseif Commander.IsInFaction(DefendFortFaction) == 1
        TakeFortFromCommander(Commander)
    endif

    Commander.RemoveFromFaction(PatrolFaction)
    Commander.RemoveFromFaction(AttackFaction)
    Commander.RemoveFromFaction(DefendFortFaction)
    Commander.RemoveFromFaction(FollowerFaction)
    Commander.RemoveFromFaction(HunterFaction)

    if Commander.IsInFaction(MovingFaction)
        CommanderMoving.StopCommanderMoving(Commander)
    endif

    int armynum = GetCommanderArmyNum(Commander)
    ArmyScripts[armynum].CurrentTask = TaskBarrelNoOrder
EndFunction

Function ClearFactionsTemp(Actor Commander, bool updatemap = true)
    if Commander.IsInFaction(FollowerFaction) == 1
        StopFollowPlayer(Commander, true)
    endif

    if Commander.IsInFaction(PatrolFaction) == 1
        StopPatrol(Commander, true)
        StopPatrolHold(Commander, updatemap)
    elseif Commander.IsInFaction(AttackFaction) == 1
        StopPatrolHold(Commander)
    elseif Commander.IsInFaction(DefendFortFaction) == 1
        FortCommanders.FortCommanderTempLeave(Commander)
    endif

    if Commander.IsInFaction(MovingFaction)
        debug.trace("Found moving")
        CommanderMoving.StopCommanderMoving(Commander)
    endif

    debug.trace("Factions cleared temporarily")
EndFunction

Function RemoveFromAllCrimeFactions(Actor Commander)
    int i = 0
    while i < AllCrimeFactions.GetSize()
        Commander.RemoveFromFaction(AllCrimeFactions.GetAt(i) as Faction)
        i += 1
    endwhile
EndFunction

Function ReturnToJob(Actor Commander, bool instant = false)
    int armynum = GetCommanderArmyNum(Commander)
    
    if Commander.IsInFaction(FollowerFaction)
        FollowPlayer(Commander)

    elseif Commander.IsInFaction(PatrolFaction) || Commander.IsInFaction(AttackFaction)

        int i = 0
        bool foundjob = false
        while i < 9 && !foundjob
            if Commander.IsInFaction(GarrisonFactions.GetAt(i) as Faction)
                foundjob = true
                if ((MarkerObjects.GetAt(i) as ObjectReference).Is3DLoaded() && Commander.Is3DLoaded()) || instant == true
                    StartPatrol(Commander, i, forcestart = true)
                else
                    RegisterForMoving(Commander, "City", i)
                endif
            endif
            i += 1
        endwhile

        i = 0
        while i < CampMarkers.GetSize() && !foundjob
            if CampMarkers.GetAt(i) as ObjectReference == PatrolMarkers[armynum].GetRef()
                foundjob = true
                int holdnum = i
                if ((CampMarkers.GetAt(i) as ObjectReference).Is3DLoaded() && Commander.Is3DLoaded()) || instant == true
                    StartPatrolHold(Commander, holdnum, false)
                else
                    RegisterForMoving(Commander, "Camp", holdnum)
                endif
            endif
            i += 1
        endwhile
        
        FollowCommander[armynum].SetValue(1)

    elseif Commander.IsInFaction(DefendFortFaction)
        GiveFortToCommander(Commander, FortCommanders.GetFortCommanderNum(Commander))
        FollowCommander[armynum].SetValue(1)

    elseif Commander.IsInFaction(HunterFaction)
        StartHunt(Commander)
        FollowCommander[armynum].SetValue(1)
    endif
EndFunction

int Function FindPatrolHold(Actor Commander)

        int i = 0
        int holdnum = -1
        bool foundhold = false
        while i < 9 && holdnum == -1
            if Commander.IsInFaction(GarrisonFactions.GetAt(i) as Faction)
                holdnum = i
            endif
            i += 1
        endwhile

        i = 0
        while i < CampMarkers.GetSize() && holdnum == -1
            if CampMarkers.GetAt(i) as ObjectReference == PatrolMarkers[GetCommanderArmyNum(Commander)].GetRef()
                holdnum = i
            endif
            i += 1
        endwhile

        return holdnum

EndFunction
    
Function ConvertAllFromAttackToPatrol(int holdnum)
    ObjectReference CampMarker = CampMarkers.GetAt(holdnum) as ObjectReference
    
    int i = 0
    while i < Commanders.Length
        Actor Commander = Commanders[i].GetActorRef()
        if CampMarker == PatrolMarkers[GetCommanderArmyNum(Commander)].GetRef()
            ConvertFromAttackToPatrol(Commander, holdnum)
        endif
        i += 1
    endwhile
EndFunction

Function ConvertFromAttackToPatrol(Actor Commander, int holdnum)
    int armynum = GetCommanderArmyNum(Commander)
    if Commander.IsInFaction(AttackFaction)
        Commander.RemoveFromFaction(AttackFaction)
        Commander.AddToFaction(PatrolFaction)
        ArmyScripts[armynum].CurrentTask = TaskBarrelsDefendHold.GetAt(holdnum) as ObjectReference
    endif
EndFunction

Function ConvertAllFromPatrolToAttack(int holdnum)
    ObjectReference CampMarker = CampMarkers.GetAt(holdnum) as ObjectReference
    
    int i = 0
    while i < Commanders.Length
        Actor Commander = Commanders[i].GetActorRef()
        if CampMarker == PatrolMarkers[GetCommanderArmyNum(Commander)].GetRef()
            ConvertFromPatrolToAttack(Commander, holdnum)
        endif
        i += 1
    endwhile
EndFunction

Function ConvertFromPatrolToAttack(Actor Commander, int holdnum)
    int armynum = GetCommanderArmyNum(Commander)
    if Commander.IsInFaction(PatrolFaction)
        Commander.RemoveFromFaction(PatrolFaction)
        Commander.AddToFaction(AttackFaction)
        ArmyScripts[armynum].CurrentTask = TaskBarrelsAttackHold.GetAt(holdnum) as ObjectReference
    endif
EndFunction

Function RegisterForMoving(Actor Commander, string type, int holdnum = -1, bool map = false)
    int armynum = GetCommanderArmyNum(Commander)
    ObjectReference Target
    ObjectReference StartPoint
    CS_ArmyTroopDeath ArmyScript = (ArmyScripts[armynum])
    ClearFactions(Commander)
    float ETA
    if type == "Follow"
        Target = Game.GetPlayer()
        CommanderMovingTarget.ForceRefTo(Target)
    elseif type == "Fort"
        if CommanderMoving.CommandersIncomingFort[holdnum] != None
            ClearFactions(CommanderMoving.CommandersIncomingFort[holdnum])
        endif
        CommanderMoving.CommandersIncomingFort[holdnum] = Commander
        Target = FortCommanders.Positions[holdnum]
        CommanderMovingTarget.ForceRefTo(CommanderMovingTargetsFort.GetAt(holdnum) as ObjectReference)
    elseif type == "City"
        CommanderMoving.CommandersIncomingCity[holdnum].AddForm(Commander)
        Target = MovingCityMarkers.GetAt(holdnum) as ObjectReference
        CommanderMovingTarget.ForceRefTo(CommanderMovingTargetsCity.GetAt(holdnum) as ObjectReference)
    elseif type == "Camp"
        CommanderMoving.CommandersIncomingCamp[holdnum].AddForm(Commander)
        (MovingCityMarkers.GetAt(holdnum) as ObjectReference).MoveTo(CampMarkers.GetAt(holdnum) as ObjectReference)
        Target = MovingCampMarkers.GetAt(holdnum) as ObjectReference
        CommanderMovingTarget.ForceRefTo(CommanderMovingTargetsCamp.GetAt(holdnum) as ObjectReference)
    endif
    ETA = GetCommanderDistance(Commander, Target) as float
    ArmyScript.MovingArrivalRef = Target
    ArmyScript.MovingArrivalHoldNum = holdnum
    ArmyScript.MovingArrivalText = CommanderMovingTarget.GetRef()
    ArmyScript.CurrentTask = TaskBarrelMoving
    ArmyScript.MovingType = type
    if map == true
        ArmyScript.MovingArrivalTime = GameDaysPassed.GetValue() + (ArmyScript.MovingArrivalTimePotential as float/24)
        ArmyScript.MovingArrivalTimeRemaining = ArmyScript.MovingArrivalTimePotential
    else
        ArmyScript.MovingArrivalTime = GameDaysPassed.GetValue() + (ETA as float/24)
        ArmyScript.MovingArrivalTimeRemaining = ETA as int
    endif
    CommanderMoving.StartCommanderMoving(Commander)
    CommanderMovingAlias.ForceRefTo(Commander)
    CommanderMovingTime.SetValue(ArmyScript.MovingArrivalTimeRemaining)
    UpdateCurrentInstanceGlobal(CommanderMovingTime)
    CommanderMovingMessage.show()
    debug.trace("Registered for moving to target, will arrive in " + ArmyScript.MovingArrivalTimeRemaining + " hours, at " + ArmyScript.MovingArrivalTime)
    debug.trace("Current Time = " + GameDaysPassed.GetValue())
EndFunction

int Function GetCommanderDistance(Actor Commander, ObjectReference Target)
    int armynum = GetCommanderArmyNum(Commander)
    ObjectReference StartPoint
    CS_ArmyTroopDeath ArmyScript = (ArmyScripts[armynum])
    if Commander.GetWorldSpace() != Tamriel
        int i = 0
        bool foundhold = false
        while i < AllHolds.GetSize() && foundhold == false
            if Commander.IsInLocation(AllHolds.GetAt(i) as Location)
                StartPoint = HoldCenterMarkers.GetAt(i) as ObjectReference
                foundhold = true
            endif
            i += 1
        endwhile
    else
        StartPoint = Commander as ObjectReference
    endif

    if Target.GetWorldSpace() != Tamriel
        int i = 0
        bool foundhold = false
        while i < AllHolds.GetSize() && foundhold == false
            if Target.IsInLocation(AllHolds.GetAt(i) as Location)
                Target = HoldCenterMarkers.GetAt(i) as ObjectReference
                foundhold = true
            endif
            i += 1
        endwhile
    endif

    float time = StartPoint.GetDistance(Target)/20000 as float
    if time < 0.5
        ArmyScript.MovingArrivalTimePotential = 0
        return 0
    else
        ArmyScript.MovingArrivalTimePotential = math.ceiling(time)
        return math.ceiling(time) as int
    endif
EndFunction

Function FireCommander(Actor Citizen)
    ClearFactions(Citizen)
    int armynum = GetCommanderArmyNum(Citizen)
    ArmyScripts[armynum].CommanderAvailable = 1
    Citizen.RemoveFromFaction(CommanderFaction)
    Commanders[armynum].Clear()
EndFunction

Function RecruitCommander(Actor Citizen, int armynum)
    armynum -= 1
    Citizen.IgnoreFriendlyHits(true)
    Citizen.SetCrimeFaction(None)
    RemoveFromAllCrimeFactions(Citizen)
    Commanders[armynum].ForceRefTo(Citizen)
    Commanders[armynum].GetActorRef().AddToFaction(CommanderFaction)
    ArmyScripts[armynum].CurrentTask = TaskBarrelNoOrder
    ArmyScripts[armynum].CommanderAvailable = 0
    int scriptarmynum = armynum + 1
    debug.notification("Army " + scriptarmynum + " Commander Appointed!")
    FindBorders(armynum)
EndFunction

Function GiveFortToCommander(Actor Commander, int fortnum)
    if FortCommanders.Positions[fortnum].Is3DLoaded() == true && Commander.Is3DLoaded() == true
        ClearFactions(Commander)
        FortCommanders.AssignCommander(Commander, fortnum)
    else
        RegisterForMoving(Commander, "Fort", fortnum)
    endif
EndFunction

Function TakeFortFromCommander(Actor Commander)
    FortCommanders.FireFortCommander(Commander)
EndFunction

Function DisableAllTroops(Actor Commander)
    int armynum = GetCommanderArmyNum(Commander)
    debug.trace("Disabling army " + armynum)
    DisableArmyTroops(armynum)
EndFunction

Function StartPatrolHold(Actor Commander, int holdnum, bool updatemap = true)
    ClearFactions(Commander)
    FormList CommandersPatrollingHold = CommandersPatrollingHolds.GetAt(holdnum) as FormList
    CommandersPatrollingHold.AddForm(Commander)
    
    int i = GetCommanderArmyNum(Commander)
    PatrolMarkers[i].ForceRefTo(CampMarkers.GetAt(holdnum) as ObjectReference)

    if !Commander.IsInCombat()
        debug.trace("Disabling Commander troops")
        DisableAllTroops(Commander)
    endif

    Commander.EvaluatePackage()
    Location HoldLoc = TMData.AllLocationsCS.GetAt(holdnum) as Location
    if HoldLoc.GetKeywordData(TMData.LandSuperiority) == 1
        Commander.AddToFaction(PatrolFaction)
        ArmyScripts[i].CurrentTask = TaskBarrelsDefendHold.GetAt(holdnum) as ObjectReference
        HoldLoc.SetKeywordData(TMData.ArmiesPatrolling, HoldLoc.GetKeywordData(TMData.ArmiesPatrolling) + 1)
        debug.trace("Starting to assign patrols...")
        TMData.AssignPatrols(holdnum, updatemap)
    else
        TMData.SetUpCamp(holdnum)
        debug.trace("Adding Commander to AttackFaction")
        Commander.AddToFaction(AttackFaction)
        ArmyScripts[i].CurrentTask = TaskBarrelsAttackHold.GetAt(holdnum) as ObjectReference
    endif

EndFunction

Function ClearDisabler(Actor Commander)
        int index = 0
        bool foundalias = false
        while index < CommanderDisablers.Length && foundalias == false
            if CommanderDisablers[index].GetActorRef() == Commander
                CommanderDisablers[index].Clear()
                foundalias = true
            endif
            index += 1
        endwhile
EndFunction

Function StopPatrolHold(Actor Commander, bool updatemap = true)
    int armynum = GetCommanderArmyNum(Commander)
    int holdnum = -1
    int i = 0
    bool foundlist = false
    while i < CommandersPatrollingHolds.GetSize() && foundlist == false
        if (CommandersPatrollingHolds.GetAt(i) as FormList).HasForm(Commander) == true
            (CommandersPatrollingHolds.GetAt(i) as FormList).RemoveAddedForm(Commander)
            foundlist = true
            holdnum = i
            debug.trace("Found commander " + holdnum + ", removing from patrolhold")
            ;RespawnTroops(Commander)
            Commander.EvaluatePackage()
            Location HoldLoc = TMData.AllLocationsCS.GetAt(holdnum) as Location
            if HoldLoc.GetKeywordData(TMData.LandSuperiority) == 1
                HoldLoc.SetKeywordData(TMData.ArmiesPatrolling, HoldLoc.GetKeywordData(TMData.ArmiesPatrolling) - 1)
                TMData.AssignPatrols(holdnum, updatemap)
            endif
        endif
        i += 1
    endwhile
    debug.trace("Patrol hold stopped")
    ArmyScripts[armynum].CurrentTask = TaskBarrelNoOrder
EndFunction

Function StartPatrol(Actor Commander, int holdnum, bool map = false, bool forcestart = false)
    int arrivaltime
    if map == true
        int armynum = GetCommanderArmyNum(Commander)
        arrivaltime = (ArmyScripts[armynum]).MovingArrivalTimePotential
    else
        arrivaltime = GetCommanderDistance(Commander, MovingCityMarkers.GetAt(holdnum) as ObjectReference)
    endif
    debug.trace("Initial Distance = " + arrivaltime)
    if arrivaltime == 0 || forcestart == true

        if !Commander.IsInFaction(GarrisonFactions.GetAt(holdnum) as Faction)
            ClearFactions(Commander)
        endif
        FormList TroopGarrison = GarrisonTroops.GetAt(holdnum) as FormList
        TroopGarrison.AddForm(Commander)
        (CommandersGarrisonHolds.GetAt(holdnum) as FormList).AddForm(Commander)
        Location CityLoc = AllLocationsCS.GetAt(holdnum) as Location
        CityLoc.SetKeywordData(TMData.ArmiesDefending, CityLoc.GetKeywordData(TMData.ArmiesDefending) + 1)
        Commander.AddToFaction(GarrisonFactions.GetAt(holdnum) as Faction)
        (GarrisonArmyCounts.GetAt(holdnum) as GlobalVariable).Mod(1)

        int i = GetCommanderArmyNum(Commander)
        Commander.AddToFaction(PatrolFaction)
        Commander.RemoveFromFaction(AttackFaction)
        PatrolMarkers[i].ForceRefTo(MarkerObjects.GetAt(holdnum) as ObjectReference)

                If i == 0
                    int index = 0
                    while index < TroopManage.ArmyTroops1.Length
                        If TroopManage.ArmyTroops1[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops1[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 1
                    int index = 0
                    while index < TroopManage.ArmyTroops2.Length
                        If TroopManage.ArmyTroops2[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops2[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 2
                    int index = 0
                    while index < TroopManage.ArmyTroops3.Length
                        If TroopManage.ArmyTroops3[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops3[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 3
                    int index = 0
                    while index < TroopManage.ArmyTroops4.Length
                        If TroopManage.ArmyTroops4[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops4[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 4
                    int index = 0
                    while index < TroopManage.ArmyTroops5.Length
                        If TroopManage.ArmyTroops5[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops5[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 5
                    int index = 0
                    while index < TroopManage.ArmyTroops6.Length
                        If TroopManage.ArmyTroops6[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops6[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 6
                    int index = 0
                    while index < TroopManage.ArmyTroops7.Length
                        If TroopManage.ArmyTroops7[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops7[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 7
                    int index = 0
                    while index < TroopManage.ArmyTroops8.Length
                        If TroopManage.ArmyTroops8[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops8[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 8
                    int index = 0
                    while index < TroopManage.ArmyTroops9.Length
                        If TroopManage.ArmyTroops9[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops9[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 9
                    int index = 0
                    while index < TroopManage.ArmyTroops10.Length
                        If TroopManage.ArmyTroops10[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops10[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 10
                    int index = 0
                    while index < TroopManage.ArmyTroops11.Length
                        If TroopManage.ArmyTroops11[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops11[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 11
                    int index = 0
                    while index < TroopManage.ArmyTroops12.Length
                        If TroopManage.ArmyTroops12[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops12[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 12
                    int index = 0
                    while index < TroopManage.ArmyTroops13.Length
                        If TroopManage.ArmyTroops13[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops13[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 13
                    int index = 0
                    while index < TroopManage.ArmyTroops14.Length
                        If TroopManage.ArmyTroops14[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops14[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 14
                    int index = 0
                    while index < TroopManage.ArmyTroops15.Length
                        If TroopManage.ArmyTroops15[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops15[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 15
                    int index = 0
                    while index < TroopManage.ArmyTroops16.Length
                        If TroopManage.ArmyTroops16[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops16[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 16
                    int index = 0
                    while index < TroopManage.ArmyTroops17.Length
                        If TroopManage.ArmyTroops17[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops17[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 17
                    int index = 0
                    while index < TroopManage.ArmyTroops18.Length
                        If TroopManage.ArmyTroops18[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops18[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 18
                    int index = 0
                    while index < TroopManage.ArmyTroops19.Length
                        If TroopManage.ArmyTroops19[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops19[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 19
                    int index = 0
                    while index < TroopManage.ArmyTroops20.Length
                        If TroopManage.ArmyTroops20[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops20[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 20
                    int index = 0
                    while index < TroopManage.ArmyTroops21.Length
                        If TroopManage.ArmyTroops21[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops21[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 21
                    int index = 0
                    while index < TroopManage.ArmyTroops22.Length
                        If TroopManage.ArmyTroops22[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops22[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 22
                    int index = 0
                    while index < TroopManage.ArmyTroops23.Length
                        If TroopManage.ArmyTroops23[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops23[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 23
                    int index = 0
                    while index < TroopManage.ArmyTroops24.Length
                        If TroopManage.ArmyTroops24[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops24[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 24
                    int index = 0
                    while index < TroopManage.ArmyTroops25.Length
                        If TroopManage.ArmyTroops25[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops25[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 25
                    int index = 0
                    while index < TroopManage.ArmyTroops26.Length
                        If TroopManage.ArmyTroops26[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops26[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 26
                    int index = 0
                    while index < TroopManage.ArmyTroops27.Length
                        If TroopManage.ArmyTroops27[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops27[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 27
                    int index = 0
                    while index < TroopManage.ArmyTroops28.Length
                        If TroopManage.ArmyTroops28[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops28[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 28
                    int index = 0
                    while index < TroopManage.ArmyTroops29.Length
                        If TroopManage.ArmyTroops29[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops29[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                ElseIf i == 29
                    int index = 0
                    while index < TroopManage.ArmyTroops30.Length
                        If TroopManage.ArmyTroops30[index].GetActorRef() != None
                            TroopGarrison.AddForm(TroopManage.ArmyTroops30[index].GetActorRef())
                        EndIf
                        index += 1
                    endwhile
                EndIf
                Commander.EvaluatePackage()
                FollowCommander[i].SetValue(1)
                EvaluateArmyPackage(i)

        ArmyScripts[i].CurrentTask = TaskBarrelsDefendCity.GetAt(holdnum) as ObjectReference

        if Commander.Is3DLoaded() == false
            Commander.MoveTo(MovingCityMarkers.GetAt(holdnum) as ObjectReference)
        endif

    else

        RegisterForMoving(Commander, "City", holdnum, map)

    endif
EndFunction

Function MoveCommandersFromCity(LocationAlias City)
    int i = 0
    while i < Commanders.Length
        if Commanders[i].GetActorRef().IsInLocation(City.GetLocation()) && Commanders[i].GetActorRef().IsInFaction(HunterFaction)
            Commanders[i].GetActorRef().MoveTo(HuntingLocation)
        endif
        i += 1
    endwhile
EndFunction

Function RemoveAllCommandersFromGarrison(LocationAlias City)
    int citynum = AllLocations.Find(City.GetLocation())
    int i = 0
    while i < Commanders.Length
        if Commanders[i].GetActorRef().IsInFaction(GarrisonFactions.GetAt(citynum) as Faction)
            ClearFactions(Commanders[i].GetActorRef())
        endif
        i += 1
    endwhile
EndFunction

Function StopPatrol(Actor Commander, bool temp = false)
    debug.trace("Stop patrol started")
    FormList TroopGarrison
    int citynum = 0
    int CityFound = 0
    while citynum < GarrisonFactions.GetSize() && CityFound == 0
        if Commander.IsInFaction(GarrisonFactions.GetAt(citynum) as Faction) == 1
            CityFound = 1
            (GarrisonArmyCounts.GetAt(citynum) as GlobalVariable).Mod(-1)
            TroopGarrison = GarrisonTroops.GetAt(citynum) as FormList
            TroopGarrison.RemoveAddedForm(Commander)
            (CommandersGarrisonHolds.GetAt(citynum) as FormList).RemoveAddedForm(Commander)
            Location CityLoc = AllLocationsCS.GetAt(citynum) as Location
            CityLoc.SetKeywordData(TMData.ArmiesDefending, CityLoc.GetKeywordData(TMData.ArmiesDefending) - 1)
            if !temp
                Commander.RemoveFromFaction(GarrisonFactions.GetAt(citynum) as Faction)
            endif


            int i = GetCommanderArmyNum(Commander)
            PatrolMarkers[i].Clear()

            ArmyScripts[i].CurrentTask = TaskBarrelNoOrder
            ;RespawnTroops(Commander)
        endif
        citynum += 1
    endwhile
    debug.trace("Stop Patrol ended")
EndFunction

Function StartHunt(Actor Commander)
    If GovQuest.GetStage() == 7
        GovQuest.SetStage(8)
    EndIf
    ClearFactions(Commander)
    HunterFaction.SetReaction(HunterPreyFaction, 1)
    Commander.AddToFaction(HunterFaction)
    int armynum = GetCommanderArmyNum(Commander)
    ArmyScripts[armynum].CurrentTask = TaskBarrelHunt
    Commander.EvaluatePackage()
EndFunction

Function FollowPlayer(Actor akSpeaker, bool forcefollow = false)
    if FollowerCommander.GetActorRef()
        if FollowerCommander.GetActorRef().IsInFaction(MovingFaction)
            CommanderMoving.StopCommanderMoving(FollowerCommander.GetActorRef())
            ReturnToJob(FollowerCommander.GetActorRef())
        else
            StopFollowPlayer(FollowerCommander.GetActorRef())
        endif
    endif
    Utility.Wait(0.5)
    FollowerCommander.ForceRefTo(akSpeaker)
    if akSpeaker.Is3DLoaded() == true || forcefollow == true
        ClearFactionsTemp(akSpeaker)
        int armynum = GetCommanderArmyNum(akSpeaker)
        akSpeaker.AddToFaction(FollowerFaction)
        akSpeaker.SetPlayerTeammate(true, true)
        ;CommanderConfidenceSpell.Cast(akSpeaker, akSpeaker)
        akSpeaker.SetAV("Confidence", 4 as Float)
        akSpeaker.SetAV("Aggression", 1 as Float)
        akSpeaker.SetAV("Morality", 0 as Float)
        akSpeaker.SetAV("Assistance", 1 as Float)
        FollowCommander[armynum].SetValue(0)
        ;MoveTroopsToCommander(akSpeaker)
        ArmyScripts[armynum].CurrentTask = TaskBarrelFollow
        ;EvaluateArmyPackage(armynum)
        CS_StoryArmyFormUp.SendStoryEvent(akRef1 = akSpeaker, aiValue1 = armynum)
    else
        RegisterForMoving(akSpeaker, "Follow")
    endif
EndFunction

Function FollowPlayerInvasion(Actor akSpeaker, bool forcefollow = false)
    if FollowerCommander.GetActorRef()
        StopFollowPlayer(FollowerCommander.GetActorRef())
    endif
    Utility.Wait(0.5)
    FollowerCommander.ForceRefTo(akSpeaker)
    if akSpeaker.Is3DLoaded() == true || forcefollow == true
        ClearFactions(akSpeaker)
        int armynum = GetCommanderArmyNum(akSpeaker)
        akSpeaker.AddToFaction(FollowerFaction)
        akSpeaker.SetPlayerTeammate(true, true)
        akSpeaker.SetAV("Confidence", 4 as Float)
        akSpeaker.SetAV("Aggression", 1 as Float)
        akSpeaker.SetAV("Morality", 0 as Float)
        FollowCommander[armynum].SetValue(0)
        if forcefollow == true
            MoveTroopsToCommander(akSpeaker)
        endif
        EvaluateArmyPackage(armynum)
    else
        RegisterForMoving(akSpeaker, "Follow")
    endif
EndFunction

Function StopFollowPlayer(Actor akSpeaker, bool temp = false)
    int armynum = GetCommanderArmyNum(akSpeaker)
    if !temp
        akSpeaker.RemoveFromFaction(FollowerFaction)
    endif
    akSpeaker.SetPlayerTeammate(false, false)
    akSpeaker.SetAV("Confidence", 4 as Float)
    akSpeaker.SetAV("Aggression", 1 as Float)
    akSpeaker.SetAV("Morality", 0 as Float)
    (TroopFormUp as CS_TroopFormUpScript).DisbandArmy()
    Utility.Wait(0.5)
    TroopFormUp.Stop()
    FollowCommander[armynum].SetValue(1)
    EvaluateArmyPackage(armynum)
    FollowerCommander.Clear()
    if !temp
        ReturnToJob(akSpeaker)
    endif
EndFunction

Function ReturnToBase(Actor Commander)
    ClearFactions(Commander)
    (HoldingsQuest as CS_ClaimAreaFunctions).ShowArmyMessage(GetCommanderArmyNum(Commander))
EndFunction

Function FindBorders(int ArmyNum)
    (HoldingsQuest as CS_ClaimAreaFunctions).CommanderFindNewMarkers(ArmyNum)
EndFunction

Function RespawnTroops(Actor Commander)
    int ArmyNum = GetCommanderArmyNum(Commander)
    Actor[] ArmyTroops = ArmyScripts[ArmyNum].GetAllTroops()
    int i = 0
    while i < ArmyTroops.Length
        if ArmyTroops[i]
            ArmyTroops[i].enable()
        endif
        i += 1
    endwhile
EndFunction

Function MoveFormationToCommander(Actor Commander)
    CS_TroopFormUpScript TroopFormUpScript = TroopFormUp as CS_TroopFormUpScript
    
    ;TroopFormUpScript.MoveArmyToCommander()
EndFunction

Function MoveTroopsToCommander(Actor Commander)
    int ArmyNum = GetCommanderArmyNum(Commander)
    Actor[] ArmyTroops = ArmyScripts[ArmyNum].GetAllTroops()
    
    TryToMoveTroopToActor(ArmyTroops[0], Commander, 0, -60)
    TryToMoveTroopToActor(ArmyTroops[1], Commander, 60, -60)
    TryToMoveTroopToActor(ArmyTroops[2], Commander, -60, -60)
    TryToMoveTroopToActor(ArmyTroops[3], Commander, 120, -60)
    TryToMoveTroopToActor(ArmyTroops[4], Commander, -120, -60)
    Utility.Wait(0.5)
    
    TryToMoveTroopToActor(ArmyTroops[5], Commander, 0, -120)
    TryToMoveTroopToActor(ArmyTroops[6], Commander, 60, -120)
    TryToMoveTroopToActor(ArmyTroops[7], Commander, -60, -120)
    TryToMoveTroopToActor(ArmyTroops[8], Commander, 120, -120)
    TryToMoveTroopToActor(ArmyTroops[9], Commander, -120, -120)
    Utility.Wait(0.5)
    
    TryToMoveTroopToActor(ArmyTroops[10], Commander, 0, -180)
    TryToMoveTroopToActor(ArmyTroops[11], Commander, 60, -180)
    TryToMoveTroopToActor(ArmyTroops[12], Commander, -60, -180)
    TryToMoveTroopToActor(ArmyTroops[13], Commander, 120, -180)
    TryToMoveTroopToActor(ArmyTroops[14], Commander, -120, -180)
    Utility.Wait(0.5)
    
    TryToMoveTroopToActor(ArmyTroops[15], Commander, 0, -240)
    TryToMoveTroopToActor(ArmyTroops[16], Commander, 60, -240)
    TryToMoveTroopToActor(ArmyTroops[17], Commander, -60, -240)
    TryToMoveTroopToActor(ArmyTroops[18], Commander, 120, -240)
    TryToMoveTroopToActor(ArmyTroops[19], Commander, -120, -240)
EndFunction

Function TryToMoveTroopToActor(Actor FormationTroop, Actor Leader, float XOffset, float YOffset)
    if FormationTroop
        FormationTroop.enable()
        FormationTroop.MoveTo(Leader, XOffset, YOffset, 0 as float)
    endif
EndFunction

Function EvaluateArmyPackage(int ArmyNum)
    Actor[] ArmyTroops = ArmyScripts[ArmyNum].GetAllTroops()
    int i = 0
    while i < ArmyTroops.Length
        if ArmyTroops[i]
            ArmyTroops[i].EvaluatePackage()
        endif
        i += 1
    endwhile
EndFunction

Function DisableArmyTroops(int ArmyNum)
    Actor[] ArmyTroops = ArmyScripts[ArmyNum].GetAllTroops()
    int i = 0
    while i < ArmyTroops.Length
        if ArmyTroops[i]
            ArmyTroops[i].disable()
        endif
        i += 1
    endwhile
EndFunction

Actor[] Function GetArmyTroops(Actor Commander)
    int armynum = GetCommanderArmyNum(Commander)
    return ArmyScripts[armynum].GetAllTroops()
EndFunction

Function MoveCommanderToTroop(Actor Troop)
    int i = 0
    bool foundgroupnum = false
    while i < GroupFactions.GetSize() && foundgroupnum == false
        if Troop.IsInFaction(GroupFactions.GetAt(i) as Faction) == 1
            Commanders[i].GetActorRef().MoveTo(Troop)
            foundgroupnum = true
        endif
        i += 1
    endwhile
EndFunction

Function TurnArmyToVampire(Actor Commander)
    int armynum = GetCommanderArmyNum(Commander)
    (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).IsVampire = true
EndFunction

int Function GetCommanderArmyNum(Actor Commander)
    int armynum = -1
    int i = 0
    int FoundCommander = 0
    while i < Commanders.Length && FoundCommander == 0
        if Commander== Commanders[i].GetActorRef()
            FoundCommander = 1
            armynum = i
        endif
        i += 1
    endwhile
    return armynum
EndFunction

Function RefreshPackage(Actor Troop)
    Troop.AddToFaction(RefreshFaction)
    Troop.EvaluatePackage()
    Troop.RemoveFromFaction(RefreshFaction)
    Troop.EvaluatePackage()
EndFunction

Function SetUpForTroopRespawn(Actor Commander)
    int ArmyNum = GetCommanderArmyNum(Commander)
    RespawnCommanders[ArmyNum].ForceRefTo(Commander)
EndFunction

Function MoveToAttack2()
    int armynum = 0
    while armynum < Commanders.Length
        If Commanders[armynum].GetActorRef().IsInFaction(AttackFaction) == 1
            ObjectReference StartMarker = AttackMarkerAliases[armynum].GetReference()
            Commanders[armynum].GetActorRef().RemoveFromFaction(AttackFaction)
            Commanders[armynum].GetActorRef().EvaluatePackage()
            int index = VillageAttackMarkers.Find(StartMarker)
            AttackMarkerAliases[armynum].ForceRefTo(VillageAttack2Markers.GetAt(index) as ObjectReference)
            Commanders[armynum].GetActorRef().AddToFaction(AttackFaction)
            Commanders[armynum].GetActorRef().EvaluatePackage()
        endIf
        armynum += 1
    endwhile
EndFunction

Quest Property BordersQuest  Auto  

Quest Property HoldingsQuest  Auto  

Quest Property GovQuest Auto

CS_TroopManageMenuScript Property TroopManage Auto

FormList Property GarrisonTroops  Auto  
FormList Property GarrisonArmyCounts Auto
FormList Property RecruitCommanders Auto
FormList Property VillageAttack2Markers Auto
FormList Property VillageAttackMarkers Auto

ObjectReference Property HuntingLocation Auto

ReferenceAlias[] Property RespawnCommanders  Auto  

ReferenceAlias[] Property AttackMarkerAliases  Auto  
