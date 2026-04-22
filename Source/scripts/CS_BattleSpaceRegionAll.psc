Scriptname CS_BattleSpaceRegionAll extends ObjectReference  

import CS_CommonFunctions

ObjectReference Property RightfulOwner Auto ; Faction that rightfully controls battlespace. Only changes from peace negotiations/winning the war
ObjectReference Property BattleSpaceOwner Auto ; Faction that controls the roads and can perform operations in the battle space (hold)
ObjectReference[] Property BattleSpaceFactions Auto ; All factions currently in the battlespace, the index the faction receives in this array corresponds to the index of their assets in the other arrays in this script

string Property BattleSpaceName Auto

int Property holdnum Auto

int Property TotalRegiments Auto
int Property InitialAIRegiments Auto

ObjectReference Property City Auto
int Property MinimumCityRegiments Auto

ObjectReference Property Fort Auto
ObjectReference[] Property FortActivators Auto
int Property MinimumFortRegiments Auto
FormList Property CS_AllFortMarkersMonster Auto

ObjectReference[] Property Camps Auto
ObjectReference[] Property CampTriggerBoxes Auto
ObjectReference[] Property CampManagementActivators Auto
int[] Property MinimumCampRegiments Auto

ObjectReference[] Property Settlements Auto

ObjectReference[] Property PatrolRegiments Auto

ObjectReference Property Village1 Auto
ObjectReference Property Village2 Auto

ObjectReference[] Property BorderingBattlespaces Auto

ObjectReference[] Property FactionArmies Auto

Container Property CS_FactionWarAIRegiment Auto
Activator Property CS_CampManagementActivator Auto
Activator Property CS_FortManagementActivator Auto

ObjectReference Property MapToReset Auto
CS_CWMapActivatorHoldThreadAll Property HoldThreadToReset Auto

; IMP
ObjectReference Property CS_FactionMajorEmpireSkyrim Auto
FormList Property CS_AttackCampTriggerBoxesImp Auto
FormList Property CS_WarCampMarkersImp Auto
FormList Property CS_AllFortMarkersImp Auto

; SONS
ObjectReference Property CS_FactionMajorSons Auto
FormList Property CS_AttackCampTriggerBoxesSons Auto
FormList Property CS_WarCampMarkersSons Auto
FormList Property CS_AllFortMarkersSons Auto

;Player
ObjectReference Property CS_FactionPlayer Auto
FormList Property CS_WarCampMarkers Auto
FormList Property CS_AllFortMarkersPlayer Auto

Function SetUp()
    debug.trace("Setting up " + BattleSpaceName + " BattleSpace...")
    ObjectReference HoldFaction = (City as CS_CityManagementOwnership).FactionOwnerActivator
    ;ObjectReference MajorFaction = (HoldFaction as CS_FactionManagementOwnership).FactionOwnerActivator
    ObjectReference MajorFaction = (City as CS_CityManagementOwnership).FactionOwnerActivator
    (City as CS_FactionWarLocationScript).LocationName = (City as CS_CityManagementOwnership).CityNameString
    Camps = new ObjectReference[20]
    CampTriggerBoxes = new ObjectReference[20]
    CampManagementActivators = new ObjectReference[20]
    FortActivators = new ObjectReference[20]
    MinimumCampRegiments = new int[20]
    FactionArmies = new ObjectReference[20]
    Camps[1] = CS_WarCampMarkersImp.GetAt(holdnum) as ObjectReference
    CampTriggerBoxes[1] = CS_AttackCampTriggerBoxesImp.GetAt(holdnum) as ObjectReference
    Camps[2] = CS_WarCampMarkersSons.GetAt(holdnum) as ObjectReference
    CampTriggerBoxes[2] = CS_AttackCampTriggerBoxesSons.GetAt(holdnum) as ObjectReference
    Camps[0] = CS_WarCampMarkers.GetAt(holdnum) as ObjectReference
    FortActivators[0] = CS_AllFortMarkersPlayer.GetAt(holdnum) as ObjectReference
    FortActivators[1] = CS_AllFortMarkersImp.GetAt(holdnum) as ObjectReference
    FortActivators[2] = CS_AllFortMarkersSons.GetAt(holdnum) as ObjectReference
    FactionTakeBattleSpaceInitial(MajorFaction)
    SpawnNewAIRegiments()
    
    AssignPatrols()
    ResetWarMap()
    RegisterForUpdateGameTime(1)
    GoToState("SetUp")
    debug.trace("BattleSpace " + BattleSpaceName + " set up: " + (City as CS_FactionWarLocationScript).DefendingRegiments.Length + " Regiments defending city, " + (Fort as CS_FactionWarLocationScript).DefendingRegiments.Length + " Regiments defending fort, " + (GetDefendingCampRegiments(CS_FactionMajorEmpireSkyrim)).Length + " Regiments defending Imp Camp, " + (GetDefendingCampRegiments(CS_FactionMajorSons)).Length + " Regiments defending Sons Camp")
EndFunction

Function AddRegimentsToCamp(ObjectReference[] Regiments)
    ObjectReference FactionOwnerActivator = (Regiments[0] as CS_FactionWarAIRegimentScript).FactionOwnerActivator
    int FactionNum = (FactionOwnerActivator as CS_FactionManagementDiplomacy).FactionNum
    CS_FactionWarLocationScript CampScript = CampManagementActivators[FactionNum] as CS_FactionWarLocationScript
    
    int i = 0
    while i < Regiments.Length
        CampScript.DefendingRegiments = AddToArray(Regiments[i], CampScript.DefendingRegiments)
        (Regiments[i] as CS_FactionWarAIRegimentScript).CurrentBattleSpace = self as ObjectReference
        i += 1
    endwhile
    
    AssignPatrols()
EndFunction

Function RemoveRegimentsFromCamp(ObjectReference[] Regiments)
    ObjectReference FactionOwnerActivator = (Regiments[0] as CS_FactionWarAIRegimentScript).FactionOwnerActivator
    int FactionNum = (FactionOwnerActivator as CS_FactionManagementDiplomacy).FactionNum
    CS_FactionWarLocationScript CampScript = CampManagementActivators[FactionNum] as CS_FactionWarLocationScript
    
    int i = 0
    while i < Regiments.Length
        CampScript.DefendingRegiments = RemoveFromArray(Regiments[i], CampScript.DefendingRegiments)
        i += 1
    endwhile
    AssignPatrols()
EndFunction

Function AddRegimentToCamp(ObjectReference Regiment)
    ObjectReference FactionOwnerActivator = (Regiment as CS_FactionWarAIRegimentScript).FactionOwnerActivator
    int FactionNum = (FactionOwnerActivator as CS_FactionManagementDiplomacy).FactionNum
    CS_FactionWarLocationScript CampScript = CampManagementActivators[FactionNum] as CS_FactionWarLocationScript
    
    CampScript.DefendingRegiments = AddToArray(Regiment, CampScript.DefendingRegiments)
    (Regiment as CS_FactionWarAIRegimentScript).CurrentBattleSpace = self as ObjectReference
    AssignPatrols()
EndFunction

Function RemoveRegimentFromCamp(ObjectReference Regiment)
    ObjectReference FactionOwnerActivator = (Regiment as CS_FactionWarAIRegimentScript).FactionOwnerActivator
    int FactionNum = (FactionOwnerActivator as CS_FactionManagementDiplomacy).FactionNum
    CS_FactionWarLocationScript CampScript = CampManagementActivators[FactionNum] as CS_FactionWarLocationScript
    
    CampScript.DefendingRegiments = RemoveFromArray(Regiment, CampScript.DefendingRegiments)
    AssignPatrols()
EndFunction

Function AddRegimentToAttack(ObjectReference Regiment, ObjectReference AttackLocation)
    CS_FactionWarLocationScript AttackLocationScript = AttackLocation as CS_FactionWarLocationScript
    
    AttackLocationScript.AttackingRegiments = AddToArray(Regiment, AttackLocationScript.AttackingRegiments)
EndFunction

Function RemoveRegimentFromAttack(ObjectReference Regiment, ObjectReference AttackLocation)
    CS_FactionWarLocationScript AttackLocationScript = AttackLocation as CS_FactionWarLocationScript
    
    AttackLocationScript.AttackingRegiments = RemoveFromArray(Regiment, AttackLocationScript.AttackingRegiments)
EndFunction

Function AddRegimentsToAttack(ObjectReference[] Regiments, ObjectReference AttackLocation)
    int i = 0
    while i < Regiments.Length
        AddRegimentToAttack(Regiments[i], AttackLocation)
        i += 1
    endwhile
EndFunction

Function SetDefensiveRegimentWeight(int amount)
    int FactionNum = GetFactionNum(BattleSpaceOwner)
    ObjectReference FactionArmy = FactionArmies[FactionNum]
    int ArmyHomeRegiments = (FactionArmy as CS_FactionWarAIArmyScript).HomeRegiments.Length
    int MinimumArmyRegiments = math.ceiling(amount*ArmyHomeRegiments as float/5)
    
    (FactionArmy as CS_FactionWarAIArmyScript).MinimumRegiments = MinimumArmyRegiments
    MinimumCampRegiments[FactionNum] = amount
EndFunction

Function AddRegimentsToGarrison(ObjectReference[] Regiments, ObjectReference Garrison)
    int i = 0
    while i < Regiments.Length
        (Garrison as CS_FactionWarLocationScript).DefendingRegiments = AddToArray(Regiments[i], (Garrison as CS_FactionWarLocationScript).DefendingRegiments)
        i += 1
    endwhile
EndFunction

Function RemoveRegimentsFromGarrison(ObjectReference[] Regiments, ObjectReference Garrison)
    int i = 0
    while i < Regiments.Length
        (Garrison as CS_FactionWarLocationScript).DefendingRegiments = RemoveFromArray(Regiments[i], (Garrison as CS_FactionWarLocationScript).DefendingRegiments)
        i += 1
    endwhile
EndFunction

Function AddRegimentToGarrison(ObjectReference Regiment, ObjectReference Garrison)
    (Garrison as CS_FactionWarLocationScript).DefendingRegiments = AddToArray(Regiment, (Garrison as CS_FactionWarLocationScript).DefendingRegiments)
EndFunction

Function RemoveRegimentFromGarrison(ObjectReference Regiment, ObjectReference Garrison)
    (Garrison as CS_FactionWarLocationScript).DefendingRegiments = RemoveFromArray(Regiment, (Garrison as CS_FactionWarLocationScript).DefendingRegiments)
EndFunction

Function FactionTakeBattleSpaceInitial(ObjectReference InitialFactionOwner)
    BattleSpaceOwner = InitialFactionOwner
    RightfulOwner = InitialFactionOwner
    
    (City as CS_FactionWarLocationScript).ControllingFaction = InitialFactionOwner
    (City as CS_FactionWarLocationScript).VanillaLocation = (City as CS_CityManagementOwnership).VanillaCity
    (City as CS_FactionWarLocationScript).BattleSpace = self
    (City as CS_FactionWarLocationScript).GoToState("Reinforced")
    (CS_AllFortMarkersMonster.GetAt(holdnum) as ObjectReference).disable()
    (Fort as CS_FortManagementScript).FactionOwnerActivator = InitialFactionOwner
    (Fort as CS_FactionWarLocationScript).ControllingFaction = InitialFactionOwner
    (Fort as CS_FactionWarLocationScript).BattleSpace = self
    (Fort as CS_FactionWarLocationScript).LocationName = (Fort as CS_FortManagementScript).FortName
    (Fort as CS_FactionWarLocationScript).GoToState("Reinforced")
    if InitialFactionOwner == CS_FactionMajorEmpireSkyrim
        Camps[1].Enable()
        CampManagementActivators[1] = PlaceAtMe(CS_CampManagementActivator)
        (CampManagementActivators[1] as CS_CampManagementScript).FactionOwnerActivator = CS_FactionMajorEmpireSkyrim
        (CampManagementActivators[1] as CS_FactionWarLocationScript).ControllingFaction = CS_FactionMajorEmpireSkyrim
        (CampManagementActivators[1] as CS_FactionWarLocationScript).VanillaLocation = (CS_FactionMajorEmpireSkyrim as CS_FactionManagementMilitary).WarCampLocations.GetAt(holdnum) as Location
        (CampManagementActivators[1] as CS_FactionWarLocationScript).BattleSpace = self
        (CampManagementActivators[1] as CS_FactionWarLocationScript).GoToState("Reinforced")
        (CampManagementActivators[1] as CS_FactionWarLocationScript).LocationName = (GetFactionShortName(CS_FactionMajorEmpireSkyrim) + " " + BattleSpaceName + " Camp")
        ;CampImpTriggerBox.Enable()
        FortActivators[1].enable()
        Camps[2].Disable()
        CampTriggerBoxes[2].Disable()
    elseif InitialFactionOwner == CS_FactionMajorSons
        Camps[2].Enable()
        CampManagementActivators[2] = PlaceAtMe(CS_CampManagementActivator)
        (CampManagementActivators[2] as CS_CampManagementScript).FactionOwnerActivator = CS_FactionMajorSons
        (CampManagementActivators[2] as CS_FactionWarLocationScript).ControllingFaction = CS_FactionMajorSons
        (CampManagementActivators[2] as CS_FactionWarLocationScript).VanillaLocation = (CS_FactionMajorSons as CS_FactionManagementMilitary).WarCampLocations.GetAt(holdnum) as Location
        (CampManagementActivators[2] as CS_FactionWarLocationScript).BattleSpace = self
        (CampManagementActivators[2] as CS_FactionWarLocationScript).GoToState("Reinforced")
        (CampManagementActivators[2] as CS_FactionWarLocationScript).LocationName = (GetFactionShortName(CS_FactionMajorSons) + " " + BattleSpaceName + " Camp")
        ;CampSonsTriggerBox.Enable()
        FortActivators[2].enable()
        Camps[1].Disable()
        CampTriggerBoxes[1].Disable()
    endif
    ;utility.wait(0.5)
    
    (BattleSpaceOwner as CS_FactionManagementMilitary).AddToControlledBattleSpaces(self as ObjectReference)
    debug.trace(GetFactionShortName(BattleSpaceOwner) + " have taken control of the " + BattleSpaceName + " Battlespace!")
EndFunction

Function FactionTakeBattleSpace(ObjectReference NewFaction)
    (BattleSpaceOwner as CS_FactionManagementMilitary).RemoveFromControlledBattleSpaces(self as ObjectReference)
    RemoveFactionCamp(BattleSpaceOwner)
    (NewFaction as CS_FactionManagementMilitary).AddToControlledBattleSpaces(self as ObjectReference)
    
    BattleSpaceOwner = NewFaction
    AssignPatrols()
    ;PrintBattleSpace()
    ResetWarMap()
EndFunction

Function FactionEstablishCamp(ObjectReference NewFaction)
    int NewFactionNum = GetFactionNum(NewFaction)
    
    if !CampManagementActivators[NewFactionNum]
        Camps[NewFactionNum].Enable()
        if BattleSpaceOwner == CS_FactionPlayer
            CampTriggerBoxes[NewFactionNum].Enable()
        endif
        CampManagementActivators[NewFactionNum] = PlaceAtMe(CS_CampManagementActivator)
        (CampManagementActivators[NewFactionNum] as CS_CampManagementScript).FactionOwnerActivator = NewFaction
        (CampManagementActivators[NewFactionNum] as CS_FactionWarLocationScript).ControllingFaction = NewFaction
        (CampManagementActivators[NewFactionNum] as CS_FactionWarLocationScript).VanillaLocation = (NewFaction as CS_FactionManagementMilitary).WarCampLocations.GetAt(holdnum) as Location
        (CampManagementActivators[NewFactionNum] as CS_FactionWarLocationScript).BattleSpace = self
        (CampManagementActivators[NewFactionNum] as CS_FactionWarLocationScript).GoToState("Reinforced")
        (CampManagementActivators[NewFactionNum] as CS_FactionWarLocationScript).LocationName = (GetFactionShortName(NewFaction) + " " + BattleSpaceName + " Camp")
    endif
EndFunction

Function FactionEstablishInvasionCamp(ObjectReference InvadingFaction, ObjectReference[] Regiments)
    int numregiments = Regiments.Length
    int InvadingFactionNum = GetFactionNum(InvadingFaction)
    
    if !CampManagementActivators[InvadingFactionNum]
        Camps[InvadingFactionNum].Enable()
        if BattleSpaceOwner == CS_FactionPlayer
            CampTriggerBoxes[InvadingFactionNum].Enable()
        endif
        CampManagementActivators[InvadingFactionNum] = PlaceAtMe(CS_CampManagementActivator)
        (CampManagementActivators[InvadingFactionNum] as CS_CampManagementScript).FactionOwnerActivator = InvadingFaction
        (CampManagementActivators[InvadingFactionNum] as CS_FactionWarLocationScript).ControllingFaction = InvadingFaction
        (CampManagementActivators[InvadingFactionNum] as CS_FactionWarLocationScript).VanillaLocation = (InvadingFaction as CS_FactionManagementMilitary).WarCampLocations.GetAt(holdnum) as Location
        (CampManagementActivators[InvadingFactionNum] as CS_FactionWarLocationScript).BattleSpace = self
        (CampManagementActivators[InvadingFactionNum] as CS_FactionWarLocationScript).GoToState("Reinforced")
        (CampManagementActivators[InvadingFactionNum] as CS_FactionWarLocationScript).LocationName = (GetFactionShortName(InvadingFaction) + " " + BattleSpaceName + " Camp")
    
        debug.notification(GetFactionShortName(InvadingFaction) + " have established a camp in the " + BattleSpaceName + " Battlespace with " + numregiments + " Regiments!")
        debug.trace(GetFactionShortName(InvadingFaction) + " have established a camp in the " + BattleSpaceName + " Battlespace with " + numregiments + " Regiments!")
    endif
    ;utility.wait(0.5)
    
    ObjectReference[] CampRegiments = GetDefendingCampRegiments(InvadingFaction)
    (CampManagementActivators[InvadingFactionNum] as CS_FactionWarLocationScript).DefendingRegiments = AddArrayToArray(Regiments, CampRegiments)
    
    ;/
    if !InvadingFactions || InvadingFactions.Find(InvadingFaction) < 0
        InvadingFactions = AddToArray(InvadingFaction, InvadingFactions)
    endif/;
    
    if GetNumRegimentsDefendingBattleSpace() == 0
        FactionTakeBattleSpace(InvadingFaction)
    else
        GoToState("Contested")
        ResetWarMap()
    endif
EndFunction

Function RemoveFactionCamp(ObjectReference FactionToRemove)
    int FactionNum = GetFactionNum(FactionToRemove)
    
    ObjectReference CampActivator = CampManagementActivators[FactionNum]
    ObjectReference[] Regiments = (CampActivator as CS_FactionWarLocationScript).DefendingRegiments
    RemoveRegimentsFromCamp(Regiments)
    CampManagementActivators[FactionNum] = None
    CampActivator.delete()
    Camps[FactionNum].disable()
    CampTriggerBoxes[FactionNum].disable()
    
    debug.notification(GetFactionShortName(FactionToRemove) + "'s camp in the " + BattleSpaceName + " Battlespace have been removed!")
    debug.trace(GetFactionShortName(FactionToRemove) + "'s camp in the " + BattleSpaceName + " Battlespace have been removed!")
    ResetWarMap()
EndFunction

Function FactionAttackCamp(ObjectReference AttackingFaction, ObjectReference DefendingCamp, ObjectReference WarTacticalPlan)
    if AttackingFaction == CS_FactionPlayer
        ;SendStoryEvent(AttackCampKeyword, akRef1 = DefendingCamp, akRef2 = WarTacticalPlan)
    elseif DefendingCamp == Camps[0]
        ;SendStoryEvent(DefendingCampKeyword, akRef1 = DefendingCamp, akRef2 = WarTacticalPlan)
    else
        ;SendStoryEvent(AIBattleCampKeyword, akRef1 = DefendingCamp, akRef2 = WarTacticalPlan)
    endif
EndFunction

Function AssignPatrols()
    int[] RandomPatrolNums = GetRandomPatrols()
    PatrolRegiments = new ObjectReference[4]
    
    ObjectReference[] CampRegiments = GetDefendingCampRegiments()
    int i = 0
    while i < CampRegiments.Length && i < 4
        PatrolRegiments[RandomPatrolNums[i]] = CampRegiments[i]
        i += 1
    endwhile
EndFunction

Function FactionTakeFort(ObjectReference NewFaction)
    ObjectReference[] EmptyList
    (Fort as CS_FactionWarLocationScript).DefendingRegiments = EmptyList
    ObjectReference PreviousFaction = (Fort as CS_FortManagementScript).FactionOwnerActivator
    int PreviousFactionNum = GetFactionNum(PreviousFaction)
    FortActivators[PreviousFactionNum].disable()
    
    (Fort as CS_FortManagementScript).FactionOwnerActivator = NewFaction
    (Fort as CS_FactionWarLocationScript).ControllingFaction = NewFaction
    int NewFactionNum = GetFactionNum(NewFaction)
    FortActivators[NewFactionNum].enable()
    AssignRegimentsToGarrisons()
    ;PrintBattleSpace()
    ResetWarMap()
EndFunction

Function FactionTakeCityDirect(ObjectReference NewFaction)
    (City as CS_FactionWarLocationScript).RemoveFactionHomeRegiments()
    ObjectReference[] EmptyList
    (City as CS_FactionWarLocationScript).DefendingRegiments = EmptyList
    (City as CS_CityManagementOwnership).FactionOwnerActivator = NewFaction
    (City as CS_FactionWarLocationScript).ControllingFaction = NewFaction
    SpawnGarrisonAIRegiments(City)
    AssignRegimentsToGarrisons()
    ;PrintBattleSpace()
    ResetWarMap()
EndFunction

Function FactionTakeCityVassal(ObjectReference NewFaction)
    (City as CS_FactionWarLocationScript).RemoveFactionHomeRegiments()
    ObjectReference[] EmptyList
    (City as CS_FactionWarLocationScript).DefendingRegiments = EmptyList
    ObjectReference PreviousFaction = (City as CS_CityManagementOwnership).FactionOwnerActivator
    if PreviousFaction != CS_FactionMajorEmpireSkyrim && PreviousFaction != CS_FactionMajorSons
        ObjectReference PreviousOverlord = (PreviousFaction as CS_FactionManagementOwnership).FactionOwnerActivator
        (PreviousOverlord as CS_FactionManagementDiplomacy).RemoveVassal(PreviousFaction)
        (NewFaction as CS_FactionManagementDiplomacy).AddVassal(PreviousFaction)
    endif
    (City as CS_FactionWarLocationScript).ControllingFaction = NewFaction
    SpawnGarrisonAIRegiments(City)
    AssignRegimentsToGarrisons()
    ;PrintBattleSpace()
    ResetWarMap()
EndFunction

Function AssignRegimentsToGarrisons()
    ObjectReference CityOwnerActivator = (City as CS_FactionWarLocationScript).ControllingFaction
    ObjectReference FortOwnerActivator = (Fort as CS_FactionWarLocationScript).ControllingFaction
    if CityOwnerActivator == BattleSpaceOwner
        int FactionNum = (BattleSpaceOwner as CS_FactionManagementDiplomacy).FactionNum
        int DefensiveGarrisons = (BattleSpaceOwner as CS_FactionManagementMilitary).DefensiveGarrisons
        debug.trace(GetFactionName(CityOwnerActivator) + " DefensiveGarrisons = " + DefensiveGarrisons)
        float GarrisonPercentage = 0.25*DefensiveGarrisons
        
        ObjectReference[] CampRegiments = GetDefendingCampRegiments()
        MinimumCityRegiments = math.ceiling(GarrisonPercentage*(City as CS_CityManagementMilitary).BarracksLevel)
        int i = CampRegiments.Length - 1
        while i >= 0 && (City as CS_FactionWarLocationScript).DefendingRegiments.Length < MinimumCityRegiments
            if FortOwnerActivator == BattleSpaceOwner && (Fort as CS_FactionWarLocationScript).DefendingRegiments.Length < 1 && (City as CS_FactionWarLocationScript).DefendingRegiments.Length >= 1
                AddRegimentToGarrison(CampRegiments[i], Fort)
                RemoveRegimentFromCamp(CampRegiments[i])
            else
                AddRegimentToGarrison(CampRegiments[i], City)
                RemoveRegimentFromCamp(CampRegiments[i])
            endif
            i -= 1
        endwhile
    endif
    
    if FortOwnerActivator == BattleSpaceOwner
        int FactionNum = (BattleSpaceOwner as CS_FactionManagementDiplomacy).FactionNum
        int DefensiveGarrisons = (BattleSpaceOwner as CS_FactionManagementMilitary).DefensiveGarrisons
        float GarrisonPercentage = 0.25*DefensiveGarrisons
        
        ObjectReference[] CampRegiments = GetDefendingCampRegiments()
        MinimumFortRegiments = math.ceiling(GarrisonPercentage)
        int i = CampRegiments.Length - 1
        while i >= 0 && (Fort as CS_FactionWarLocationScript).DefendingRegiments.Length < MinimumFortRegiments
            AddRegimentToGarrison(CampRegiments[i], Fort)
            RemoveRegimentFromCamp(CampRegiments[i])
            i -= 1
        endwhile
    endif
EndFunction

Function TryToRetreat(ObjectReference BattleTarget, string BattleType, ObjectReference RetreatingFaction, ObjectReference CapturingFaction, ObjectReference[] RetreatingFactionRegiments)
    if BattleType == "City" || BattleType == "Fort"
        if BattleSpaceOwner == RetreatingFaction
            AddRegimentsToCamp(RetreatingFactionRegiments)
        else
            int i = 0
            while i < RetreatingFactionRegiments.Length
                (CapturingFaction as CS_FactionManagementMilitary).FactionCaptureRegiment(RetreatingFactionRegiments[i])
                i += 1
            endwhile
            debug.trace(GetFactionShortName(CapturingFaction) + " have captured " + RetreatingFactionRegiments.Length + " regiments of " + GetFactionShortName(RetreatingFaction) + " troops!")
        endif
    elseif BattleType == "Camp"
        if CampManagementActivators[GetFactionNum(RetreatingFaction)]
            AddRegimentsToCamp(RetreatingFactionRegiments)
        else
            int i = 0
            while i < RetreatingFactionRegiments.Length
                (CapturingFaction as CS_FactionManagementMilitary).FactionCaptureRegiment(RetreatingFactionRegiments[i])
                i += 1
            endwhile
            debug.trace(GetFactionShortName(CapturingFaction) + " have captured " + RetreatingFactionRegiments.Length + " regiments of " + GetFactionShortName(RetreatingFaction) + " troops!")
        endif
    endif
EndFunction
;/
Function CalculateRegimentCasualties(string BattleType, ObjectReference BattleResults)
    CS_FactionWarBattleResultsScript BattleResultsScript = BattleResults as CS_FactionWarBattleResultsScript
    ObjectReference[] DeadDefendingRegiments = BattleResultsScript.DeadDefendingRegiments
    ObjectReference[] DeadAttackingRegiments = BattleResultsScript.DeadAttackingRegiments
    
    if BattleType == "Camp"
        int i = 0
        while i < DeadDefendingRegiments.Length
            if DeadDefendingRegiments[i] as CS_ArmyRegimentTroops ;PlayerRegiment
            else
                if DefendingCampImpRegiments.Find(DeadDefendingRegiments[i]) >= 0
                    DefendingCampImpRegiments = RemoveFromArray(DeadDefendingRegiments[i], DefendingCampImpRegiments)
                elseif DefendingCampSonsRegiments.Find(DeadDefendingRegiments[i]) >= 0
                    DefendingCampSonsRegiments = RemoveFromArray(DeadDefendingRegiments[i], DefendingCampSonsRegiments)
                endif
                DeadDefendingRegiments[i].delete()
            endif
            i += 1
        endwhile
        
        i = 0
        while i < DeadAttackingRegiments.Length
            if DeadAttackingRegiments[i] as CS_ArmyRegimentTroops ;PlayerRegiment
            else
                if AttackingCampImpRegiments.Find(DeadAttackingRegiments[i]) >= 0
                    AttackingCampImpRegiments = RemoveFromArray(DeadAttackingRegiments[i], AttackingCampImpRegiments)
                elseif AttackingCampSonsRegiments.Find(DeadAttackingRegiments[i]) >= 0
                    AttackingCampSonsRegiments = RemoveFromArray(DeadAttackingRegiments[i], AttackingCampSonsRegiments)
                endif
                DeadAttackingRegiments[i].delete()
            endif
            i += 1
        endwhile
    endif
EndFunction/;

ObjectReference[] Function GetDeployableRegiments()
    ObjectReference[] RegimentsToDeploy

    ObjectReference[] CampRegiments = GetDefendingCampRegiments()
    int MinimumRegiments = GetDefensiveRegimentWeight()
    
    int initialcampregiments = CampRegiments.Length
    int i = CampRegiments.Length - 1
    while i >= 0; && (initialcampregiments - RegimentsToDeploy.Length) > MinimumRegiments
        RegimentsToDeploy = AddToArray(CampRegiments[i], RegimentsToDeploy)
        RemoveRegimentFromCamp(CampRegiments[i])
        i -= 1
    endwhile
    
    return RegimentsToDeploy
EndFunction

ObjectReference[] Function GetDefendingCampRegiments(ObjectReference CampFaction=None)
    ObjectReference[] CampRegiments

    if !CampFaction
        CampFaction = BattleSpaceOwner
    endif
    
    int FactionNum = GetFactionNum(CampFaction)
    CS_FactionWarLocationScript CampScript = (CampManagementActivators[FactionNum] as CS_FactionWarLocationScript)
    if CampScript
        CampRegiments = CampScript.DefendingRegiments
    endif
    
    return CampRegiments
EndFunction

ObjectReference[] Function GetRegimentsForOffensive()
    ObjectReference[] RegimentsToDeploy

    int FactionNum = GetFactionNum(BattleSpaceOwner)
    ObjectReference[] CampRegiments = GetDefendingCampRegiments()
    int MinimumRegiments = MinimumCampRegiments[FactionNum]
    int Aggression = (BattleSpaceOwner as CS_FactionManagementMilitary).Aggression
    float AggressionMultiplier = Aggression as float/5
    
    int MaxRegiments = math.floor(AggressionMultiplier*(CampRegiments.Length  - MinimumRegiments))
    int i = CampRegiments.Length - 1
    while i >= 0 && RegimentsToDeploy.Length < MaxRegiments
        RegimentsToDeploy = AddToArray(CampRegiments[i], RegimentsToDeploy)
        RemoveRegimentFromCamp(CampRegiments[i])
        i -= 1
    endwhile
    
    debug.trace(GetFactionShortName(BattleSpaceOwner) + " deploying " + RegimentsToDeploy.Length + " regiments from " + BattleSpaceName + " for Operation")
    
    return RegimentsToDeploy
EndFunction

int Function GetEnemyBorders()
    int enemyborders = 0

    ObjectReference[] FactionEnemies = (BattleSpaceOwner as CS_FactionManagementDiplomacy).Enemies
    int i = 0
    while i < BorderingBattlespaces.Length
        if FactionEnemies.Find((BorderingBattlespaces[i] as CS_BattleSpaceRegionAll).BattleSpaceOwner) >= 0
            enemyborders += 1
        endif
        i += 1
    endwhile
    
    return enemyborders
EndFunction

int Function GetDefensiveRegimentWeight()
    int FactionNum = GetFactionNum(BattleSpaceOwner)
    int DefensiveWeight = MinimumCampRegiments[FactionNum]
    
    return DefensiveWeight
EndFunction

int Function GetFactionCampRegiments(ObjectReference CampFaction)
    int FactionNum = GetFactionNum(BattleSpaceOwner)
    ObjectReference[] CampRegiments = GetDefendingCampRegiments(CampFaction)
    int NumRegiments = CampRegiments.Length
    
    return NumRegiments
EndFunction

int Function GetNumRegimentsDefendingBattleSpace()
    ObjectReference[] CampRegiments = GetDefendingCampRegiments()
    
    return CampRegiments.Length
EndFunction

int Function GetGarrisonRegimentPowerLevel(ObjectReference Garrison, ObjectReference SelectedFaction)
    int PowerLevel

    if (Garrison as CS_FactionWarLocationScript).ControllingFaction == SelectedFaction
        PowerLevel = (Garrison as CS_FactionWarLocationScript).DefendingRegiments.Length
    elseif (Garrison as CS_FactionWarLocationScript).AttackingRegiments
        ObjectReference Regiment = (Garrison as CS_FactionWarLocationScript).AttackingRegiments[0]
        if (Regiment as CS_FactionWarAIRegimentScript).FactionOwnerActivator == SelectedFaction
            PowerLevel = (Garrison as CS_FactionWarLocationScript).AttackingRegiments.Length
        endif
    endif
    
    return PowerLevel
EndFunction

int Function GetGarrisonFortificationPowerLevel(ObjectReference Garrison, ObjectReference SelectedFaction)
    int PowerLevel
    
    if (Garrison as CS_FactionWarLocationScript).ControllingFaction == SelectedFaction
        PowerLevel = (Garrison as CS_FactionWarLocationScript).FortificationLevel
    endif
    
    return PowerLevel
EndFunction

int Function GetFactionRegimentPowerLevel(ObjectReference SelectedFaction)
    int PowerLevel
    
    int SelectedFactionNum = GetFactionNum(SelectedFaction)

    PowerLevel += GetGarrisonRegimentPowerLevel(City, SelectedFaction)
    PowerLevel += GetGarrisonRegimentPowerLevel(Fort, SelectedFaction)
    if CampManagementActivators[SelectedFactionNum]
        PowerLevel += GetGarrisonRegimentPowerLevel(CampManagementActivators[SelectedFactionNum], SelectedFaction)
    endif
    
    int i = 0
    while i < Settlements.Length
        PowerLevel += GetGarrisonRegimentPowerLevel(Settlements[i], SelectedFaction)
        i += 1
    endwhile
    
    return PowerLevel
EndFunction

int Function GetFactionFortificationPowerLevel(ObjectReference SelectedFaction)
    int PowerLevel
    
    int SelectedFactionNum = GetFactionNum(SelectedFaction)

    PowerLevel += GetGarrisonFortificationPowerLevel(City, SelectedFaction)
    PowerLevel += GetGarrisonFortificationPowerLevel(Fort, SelectedFaction)
    int i = 0
    while i < Settlements.Length
        PowerLevel += GetGarrisonFortificationPowerLevel(Settlements[i], SelectedFaction)
        i += 1
    endwhile
    
    return PowerLevel
EndFunction

Function ResetWarMap()
    GoToState("ResettingWarMap")
    ;utility.wait(5)
    if MapToReset && MapToReset.Is3DLoaded()
        (MapToReset as CS_CWMapActivatorHoldScript).ResetFlags()
    endif
    
    if HoldThreadToReset && HoldThreadToReset.GetState() != "Busy" && HoldThreadToReset.Is3DLoaded()
        HoldThreadToReset.GoToState("ResetFlags")
        HoldThreadToReset.RegisterForSingleUpdate(0.1)
    endif
    GoToState("SetUp")
EndFunction

int Function GetTotalPossibleRegiments()
    int TotalPossibleRegiments = 2*(City as CS_CityManagementMilitary).BarracksLevel + 1
    if Village1
        TotalPossibleRegiments += 1
    endif
    if Village2
        TotalPossibleRegiments += 1
    endif
    if Settlements
        TotalPossibleRegiments += Settlements.Length
    endif
    
    return TotalPossibleRegiments
EndFunction

Function SpawnGarrisonAIRegiments(ObjectReference Garrison)
    ObjectReference ControllingFaction = (Garrison as CS_FactionWarLocationScript).ControllingFaction
    if GetFactionsAtWar(ControllingFaction, BattleSpaceOwner) == false
        int TotalPossibleRegiments
        if Garrison == City
            TotalPossibleRegiments = 2*(City as CS_CityManagementMilitary).BarracksLevel + 1
        else
            TotalPossibleRegiments = 1
        endif
        
        int FactionNum = GetFactionNum(ControllingFaction)
        ObjectReference FactionArmy = FactionArmies[FactionNum]
        if !FactionArmy
            if !CampManagementActivators[FactionNum]
                FactionEstablishCamp(ControllingFaction)
            endif
            FactionArmy = (ControllingFaction as CS_FactionManagementMilitary).FormHomeArmy(self as ObjectReference, CampManagementActivators[FactionNum])
        endif
        
        while (Garrison as CS_FactionWarLocationScript).HomeRegiments.Length < TotalPossibleRegiments
            ObjectReference NewRegiment = Garrison.PlaceAtMe(CS_FactionWarAIRegiment)
            (NewRegiment as CS_FactionWarAIRegimentScript).FactionOwnerActivator = BattleSpaceOwner
            (NewRegiment as CS_FactionWarAIRegimentScript).TroopCount = 20
            (NewRegiment as CS_FactionWarAIRegimentScript).AverageTrainingLevel = (BattleSpaceOwner as CS_FactionManagementMilitary).InitialTrainingLevel
            (NewRegiment as CS_FactionWarAIRegimentScript).AverageEquipmentLevel = (BattleSpaceOwner as CS_FactionManagementMilitary).InitialEquipmentLevel
            (Garrison as CS_FactionWarLocationScript).AddRegimentToHomeRegiments(NewRegiment)
            (FactionArmy as CS_FactionWarAIArmyScript).AddRegimentToHomeArmy(NewRegiment)
            AddRegimentToCamp(NewRegiment)
        endwhile
    endif
EndFunction

Function SpawnNewAIRegiments()
    
    SpawnGarrisonAIRegiments(City)
    
    if Village1
        SpawnGarrisonAIRegiments(Village1)
    endif
    
    if Village2
        SpawnGarrisonAIRegiments(Village2)
    endif
    
    if Settlements
        int i = 0
        while i < Settlements.Length
            SpawnGarrisonAIRegiments(Settlements[i])
            i += 1
        endwhile
    endif
EndFunction

ObjectReference[] Function GetAllDefensiveCampRegiments()
    int FactionNum = GetFactionNum(BattleSpaceOwner)
    ObjectReference[] Regiments
    
    Regiments = AddArrayToArray((CampManagementActivators[FactionNum] as CS_FactionWarLocationScript).DefendingRegiments, Regiments)
    return Regiments
EndFunction

Function ReinforceRegiments()
    if (City as CS_FactionWarLocationScript).GetState() == "Reinforced"
        (City as CS_FactionWarLocationScript).GoToState("Reinforcements")
        (City as CS_FactionWarLocationScript).RegisterForSingleUpdate(0.1)
    endif
    
    if (Fort as CS_FactionWarLocationScript).GetState() == "Reinforced"
        (Fort as CS_FactionWarLocationScript).GoToState("Reinforcements")
        (Fort as CS_FactionWarLocationScript).RegisterForSingleUpdate(0.1)
    endif
    
    int i = 0
    while i < CampManagementActivators.Length
        if CampManagementActivators[i] && (CampManagementActivators[i] as CS_FactionWarLocationScript).GetState() == "Reinforced"
            (CampManagementActivators[i] as CS_FactionWarLocationScript).GoToState("Reinforcements")
            (CampManagementActivators[i] as CS_FactionWarLocationScript).RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
EndFunction

Function PrintBattleSpace()
    debug.trace("BattleSpace " + BattleSpaceName + ": " + (City as CS_FactionWarLocationScript).DefendingRegiments.Length + " Regiments defending city, " + (Fort as CS_FactionWarLocationScript).DefendingRegiments.Length + " Regiments defending fort, " + (GetDefendingCampRegiments(CS_FactionMajorEmpireSkyrim)).Length + " Regiments defending Imp Camp (Weight=" + MinimumCampRegiments[1] + ") " + (GetDefendingCampRegiments(CS_FactionMajorSons)).Length + " Regiments defending Sons Camp(Weight=" + MinimumCampRegiments[2] + ")")
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

Event OnUpdateGameTime()
    
    ReinforceRegiments()
    
EndEvent

State ResettingWarMap
    
    Function ResetWarMap()
        ;Do nothing
    EndFunction
    
EndState

State NotSetUp
    
    Event OnUpdate()
        
        SetUp()
        
    EndEvent
    
EndState