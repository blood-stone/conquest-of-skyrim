Scriptname CS_AttackCitySiegeScript extends Quest conditional

LocationAlias Property City Auto

CS_AttackPlanningNewScript Property AttackPlanning Auto
CS_PatrolHoldScript Property CommanderScript Auto
CS_TroopManageMenuScript Property ManageArmy Auto
CS_WarPatrolAmbushScript Property PatrolQuest Auto
CS_BattleTrackerScript Property BattleTracker Auto

FormList Property AttackTroops Auto
FormList Property AttackTroopsMelee Auto
FormList Property AttackTroopsRanged Auto
FormList Property AttackTroopsBuffers Auto
FormList Property AttackTroopsHealers Auto
FormList Property AttackCommanders Auto
FormList Property CatapultsList Auto
FormList Property CatapultOpsList Auto
FormList Property MarkersImpLists Auto
FormList Property MarkersSonsLists Auto
FormList Property CampMarkers1 Auto
FormList Property CampMarkers2 Auto

Faction Property CS_ArmyMeleeFaction Auto
Faction Property CS_ArmyRangedFaction Auto
Faction Property CS_ArmyHealerFaction Auto
Faction Property CS_ArmyBufferFaction Auto

GlobalVariable Property DrummersEnabled Auto
GlobalVariable Property CS_BattleSize Auto
GlobalVariable Property CS_BattleSpeed Auto

Faction Property DrummerFaction Auto

Armor Property WarDrums Auto

Sound Property DrumsSound Auto

LocationAlias Property AttackCityStaging Auto
Quest Property AttackCityQuest Auto

bool Property DoubleAttack Auto
int Property BatteringRam Auto
int Property NumCatapults Auto
int Property NumLadders Auto

int Property holdnum Auto
int Property enemyfactionnum Auto
int Property AttackEntrance Auto

int Property CompositionMelee Auto
int Property CompositionRanged Auto
int Property CompositionHealer Auto
int Property CompositionBuffer Auto

int Property CancellingAttack Auto conditional

Keyword Property StoryAttackCity Auto

ReferenceAlias[] Property Attackers Auto
ReferenceAlias[] Property AttackerMarkers1 Auto
ReferenceAlias[] Property AttackerMarkers2 Auto
ReferenceAlias[] Property Commanders Auto
ReferenceAlias[] Property CommanderMarkers1 Auto
ReferenceAlias[] Property CommanderMarkers2 Auto
ReferenceAlias[] Property Catapults Auto
ReferenceAlias Property CWSiegeMarker Auto
ReferenceAlias Property CampMarker1 Auto
ReferenceAlias Property CampMarker2 Auto

Function SetUp()
    if PatrolQuest.IsRunning()
        PatrolQuest.DetachArmy()
    endif
    debug.notification("Providing plan to commanders...")
    DoubleAttack = AttackPlanning.DoubleAttack
    AttackEntrance = AttackPlanning.AttackEntrance
    AttackCommanders = AttackPlanning.AttackCommanders
    holdnum = AttackPlanning.holdnum
    BattleTracker.Cities[holdnum] = true
    enemyfactionnum = AttackPlanning.enemyfactionnum
    BatteringRam = AttackPlanning.BatteringRams.GetValueInt()
    NumCatapults = AttackPlanning.Catapults.GetValueInt()
    NumLadders = AttackPlanning.Ladders.GetValueInt()

    CampMarker1.ForceRefTo(CampMarkers1.GetAt(holdnum) as ObjectReference)
    CampMarker2.ForceRefTo(CampMarkers2.GetAt(holdnum) as ObjectReference)

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

    DisableGuards()
    debug.notification("Commanders assigning orders to troops...")
    AssignAllTroops()
    RemoveAllDeadFromList()
    DisableAllAttackers()
    
    debug.notification("Invasion Launched!")
    
EndFunction

Function DisableGuards()
    FormList ImpList = MarkersImpLists.GetAt(holdnum) as FormList
    FormList SonsList = MarkersSonsLists.GetAt(holdnum) as FormList
    int i = 0
    while i < ImpList.GetSize()
        (ImpList.GetAt(i) as ObjectReference).disable()
        (SonsList.GetAt(i) as ObjectReference).disable()
        i += 1
    endwhile
EndFunction

Function SpawnAttackers()
    GetTroopComposition()
    EnableCatapults()
    int i = 0
    int MeleeSpawned = 0
    int RangedSpawned = 0
    int HealerSpawned = 0
    int BufferSpawned = 0
    int NumCommanders = AttackCommanders.GetSize()
    if DoubleAttack == true
        int NumCommandersHalf = math.floor(0.5*(NumCommanders as float))
        while i < NumCommandersHalf
            Commanders[i].GetActorRef().MoveTo(CommanderMarkers1[i].GetRef())
            i += 1
        endwhile
        while i < NumCommanders
            Commanders[i].GetActorRef().MoveTo(CommanderMarkers2[i].GetRef())
            i += 1
        endwhile
        int SpawnAttackers
        if AttackTroops.GetSize() >= CS_BattleSize.GetValueInt()
            SpawnAttackers = CS_BattleSize.GetValueInt()
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
            Attackers[i].ForceRefTo(Troop)
            Troop.MoveTo(AttackerMarkers1[i].GetRef())
            if i == 5 || i == 10 || i == 15
                Utility.Wait(0.5)
            endif
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
            Attackers[i].ForceRefTo(Troop)
            Troop.MoveTo(AttackerMarkers2[i].GetRef())
            if i == 5 || i == 10 || i == 15
                Utility.Wait(0.5)
            endif
            i += 1
        endwhile
    else
        while i < NumCommanders
            if AttackEntrance == 1
                Commanders[i].GetActorRef().MoveTo(CommanderMarkers1[i].GetRef())
            else
                Commanders[i].GetActorRef().MoveTo(CommanderMarkers2[i].GetRef())
            endif
            i += 1
        endwhile
        i = 0
        int attackersspawned = 0
        while i < CS_BattleSize.GetValueInt()

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
                Attackers[i].ForceRefTo(Troop)
                Attackers[i].GetActorRef().MoveTo(AttackerMarkers1[i].GetRef())
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
                Attackers[i].ForceRefTo(Troop)
                Attackers[i].GetActorRef().MoveTo(AttackerMarkers2[i].GetRef())
            endif
            Attackers[i].TryToEvaluatePackage()
            if i == 5 || i == 10 || i == 15
                Utility.Wait(0.5)
            endif
            i += 1
        endwhile
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

Function EnableCatapults()
    int i = 0
    while i < NumCatapults
        ((CatapultsList.GetAt(holdnum) as FormList).GetAt(i) as ObjectReference).enable()
        ((CatapultOpsList.GetAt(holdnum) as FormList).GetAt(i) as ObjectReference).enable()
        ((CatapultOpsList.GetAt(holdnum) as FormList).GetAt(i) as ObjectReference).reset()
        Utility.Wait(0.1)
        ((CatapultOpsList.GetAt(holdnum) as FormList).GetAt(i) as ObjectReference).reset()
        Utility.Wait(0.1)
        ((CatapultOpsList.GetAt(holdnum) as FormList).GetAt(i) as ObjectReference).reset()
        i += 1
    endwhile
EndFunction

Function EnableAllAttackers()
    int i = 0
    while i < Attackers.Length
        if Attackers[i].GetActorRef() != None
            Attackers[i].GetActorRef().enable()
        endif
        i += 1
    endwhile
EndFunction

Function DisableAllAttackers()
    int i = 0
    while i < AttackTroops.GetSize()
        Actor Troop = AttackTroops.GetAt(i) as Actor
        Troop.disable()
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
    AttackTroops.Revert()
    AttackTroopsMelee.Revert()
    AttackTroopsRanged.Revert()
    AttackTroopsHealers.Revert()
    AttackTroopsBuffers.Revert()
    int i = 0
    while i < AttackCommanders.GetSize()
        CommanderScript.ClearDisabler(AttackCommanders.GetAt(i) as Actor)
        int armynum = CommanderScript.GetCommanderArmyNum(AttackCommanders.GetAt(i) as Actor)
        CommanderScript.ArmyScripts[armynum].SpawnCommander = CommanderScript.Commanders[armynum].GetActorRef()
        CommanderScript.ArmyScripts[armynum].RegisterForSingleUpdate(0.2)
        CommanderScript.FollowCommander[armynum].SetValue(0)
        Commanders[i].ForceRefTo(AttackCommanders.GetAt(i) as Actor)
        i += 1
    endwhile
    i = 0
    while i < AttackCommanders.GetSize()
        int armynum = CommanderScript.GetCommanderArmyNum(AttackCommanders.GetAt(i) as Actor)
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

Function TransferAttackersToQuest()
        CS_AttackCityScript AttackCityScript = AttackCityQuest as CS_AttackCityScript
    
        int index = 0
        while index < Attackers.Length
            if Attackers[index].GetActorRef() != None
                AttackCityScript.Attackers[index].ForceRefTo(Attackers[index].GetActorRef())
                AttackCityScript.AttackTroops.RemoveAddedForm(AttackCityScript.Attackers[index].GetActorRef())
                if AttackCityScript.Attackers[index].GetActorRef().GetActorBase() == AttackCityScript.RestorationMage && AttackCityScript.HealersDeployed < 2
                    AttackCityScript.HealersDeployed +=1
                elseif AttackCityScript.Attackers[index].GetActorRef().GetActorBase() == AttackCityScript.AlterationMage && AttackCityScript.BuffersDeployed < 1
                    AttackCityScript.BuffersDeployed +=1
                endif
            endif
            index += 1
        endwhile

        ;debug.notification(HealersDeployed + " Healers Deployed")
        ;debug.notification(BuffersDeployed + " Buffers Deployed")

        index = 0
        while index < Commanders.Length
            if Commanders[index].GetActorRef() != None
                AttackCityScript.Commanders[index].ForceRefTo(Commanders[index].GetActorRef())
            endif
            index += 1
        endwhile
EndFunction
    
Function CancelAttack()
    CancellingAttack = 1
    int i = 0
    while i < Commanders.Length
        CommanderScript.ReturnToJob(Commanders[i].GetActorRef())
        i += 1
    endwhile
    
    Stop()
EndFunction

Function LaunchAttack()
    StoryAttackCity.SendStoryEventAndWait(City.GetLocation(), aiValue1 = 1)
    TransferAttackersToQuest()
    (AttackCityQuest as CS_AttackCityScript).BatteringRamEnabled = BatteringRam as bool
    (AttackCityQuest as CS_AttackCityScript).NumCatapults = NumCatapults
    (AttackCityQuest as CS_AttackCityScript).NumLadders = NumLadders
    ;Stop()
EndFunction