Scriptname CS_FactionWarTacticScript extends ObjectReference  

CS_FactionWarOperationPlan Property OpsPlan Auto
CS_BattleSpaceRegionAll BattleSpaceScript
ObjectReference OperationFaction
ObjectReference TargetFaction

ObjectReference[] AttackingRegiments
ObjectReference[] DefendingRegiments

string Property TargetType Auto
ObjectReference Property TacticalTarget Auto

import CS_CommonFunctions

Keyword Property PlayerAttackKeyword Auto
Keyword Property PlayerDefendKeyword Auto
Keyword Property AIBattleKeyword Auto

MiscObject Property CS_FactionWarBattleResults Auto

int Property DesiredTroopCount Auto

Function SetUp()
    ObjectReference BattleSpace = (OpsPlan as CS_FactionWarOperationPlan).BattleSpace
    BattleSpaceScript = BattleSpace as CS_BattleSpaceRegionAll
    OperationFaction = (OpsPlan as CS_FactionWarOperationPlan).OperationFaction
    TargetFaction = (OpsPlan as CS_FactionWarOperationPlan).TargetFaction
    SetTacticalTarget()
    
    if TacticalTarget
        DefendingRegiments = (TacticalTarget as CS_FactionWarLocationScript).DefendingRegiments
        DesiredTroopCount = 20*(OpsPlan as CS_FactionWarOperationPlan).Regiments.Length - 2*(OperationFaction as CS_FactionManagementMilitary).Aggression
    endif
    
    if CheckIfAlreadyCompleted()
        (OpsPlan as CS_FactionWarOperationPlan).FinishCurrentTactic()
    else
        GoToState("WaitingForLaunch")
        RegisterForSingleUpdate(0.1)
    endif
EndFunction

Function SetTacticalTarget()
    int TargetFactionNum = GetFactionNum(TargetFaction)
    if TargetType == "Camp"
        TacticalTarget = BattleSpaceScript.CampManagementActivators[TargetFactionNum]
    elseif TargetType == "Fort"
        TacticalTarget = BattleSpaceScript.Fort
    elseif TargetType == "City"
        TacticalTarget = BattleSpaceScript.City
    endif
EndFunction

bool Function CheckIfAlreadyCompleted()
    int OperationFactionNum = GetFactionNum(OperationFaction)
    if TargetType == "EstablishCamp"
        if BattleSpaceScript.Camps[OperationFactionNum].IsEnabled() && BattleSpaceScript.CampManagementActivators[OperationFactionNum]
            return true
        endif
    elseif TargetType == "Camp"
        if BattleSpaceScript.BattleSpaceOwner == OperationFaction && !TacticalTarget
            return true
        endif
    elseif (TacticalTarget as CS_FactionWarLocationScript).ControllingFaction == OperationFaction
        return true
    endif
    
    return false
EndFunction

bool Function CheckIfRequirementsMet()
    if !CheckRequirementRegiments()
        debug.trace("Did not attack because no regiments available")
        return false
    endif
    
    if !CheckRequirementTroopCount()
        return false
    endif
    
    if (OpsPlan as CS_FactionWarOperationPlan).GetState() == "UnderAttack"
        return false
    endif
    
    return true
EndFunction

bool Function CheckRequirementRegiments()
    
    if (OpsPlan as CS_FactionWarOperationPlan).Regiments.Length + 1 > 0
        return true
    else
        return false
    endif
    
EndFunction

bool Function CheckRequirementTroopCount()
    ObjectReference[] Regiments = (OpsPlan as CS_FactionWarOperationPlan).Regiments
    
    int TotalTroopCount = 0
    int i = 0
    while i < Regiments.Length
        TotalTroopCount += (Regiments[i] as CS_FactionWarAIRegimentScript).TroopCount
        i += 1
    endwhile
    
    if TotalTroopCount >= DesiredTroopCount
        return true
    else
        debug.trace("Did not attack because not enough troops in regiments available (" + TotalTroopCount + "/" + DesiredTroopCount + ")")
        return false
    endif
EndFunction

Function EstablishCamp()
    BattleSpaceScript.FactionEstablishInvasionCamp(OperationFaction, (OpsPlan as CS_FactionWarOperationPlan).Regiments)
    (OpsPlan as CS_FactionWarOperationPlan).FinishCurrentTactic()
EndFunction

Function AttackTarget()
    int TargetFactionNum = GetFactionNum(TargetFaction)
    ;(BattleSpaceScript.FactionOperations[TargetFactionNum] as CS_FactionWarOperationPlan).GoToState("UnderAttack")
    if OperationFaction == BattleSpaceScript.CS_FactionPlayer
        if TargetFaction == BattleSpaceScript.CS_FactionMajorEmpireSkyrim
            PlayerAttackKeyword.SendStoryEvent(akRef1 = TacticalTarget, akRef2 = self as ObjectReference)
        elseif TargetFaction == BattleSpaceScript.CS_FactionMajorSons
            PlayerAttackKeyword.SendStoryEvent(akRef1 = TacticalTarget, akRef2 = self as ObjectReference)
        endif
    elseif TargetFaction == BattleSpaceScript.CS_FactionPlayer
        if OperationFaction == BattleSpaceScript.CS_FactionMajorEmpireSkyrim
            PlayerDefendKeyword.SendStoryEvent(akRef1 = TacticalTarget, akRef2 = self as ObjectReference)
        elseif OperationFaction == BattleSpaceScript.CS_FactionMajorSons
            PlayerDefendKeyword.SendStoryEvent(akRef1 = TacticalTarget, akRef2 = self as ObjectReference)
        endif
    else
        if TargetFaction == BattleSpaceScript.CS_FactionMajorEmpireSkyrim
            ;AIBattleKeyword.SendStoryEvent(akRef1 = BattleSpaceScript.CampImp, akRef2 = self as ObjectReference)
        elseif TargetFaction == BattleSpaceScript.CS_FactionMajorSons
            ;AIBattleKeyword.SendStoryEvent(akRef1 = BattleSpaceScript.CampSons, akRef2 = self as ObjectReference)
        endif
        GoToState("Launched")
        (TacticalTarget as CS_FactionWarLocationScript).GoToState("InBattle")
        debug.trace(GetFactionShortName(OperationFaction) + " have attacked " + (TacticalTarget as CS_FactionWarLocationScript).LocationName + " in the " + BattleSpaceScript.BattleSpaceName + " Battle Space")
        debug.notification(GetFactionShortName(OperationFaction) + " have attacked " + (TacticalTarget as CS_FactionWarLocationScript).LocationName + " in the " + BattleSpaceScript.BattleSpaceName + " Battle Space")
    endif
EndFunction

Function AttackCompletion(ObjectReference BattleResults)
    CS_FactionWarBattleResultsScript BattleResultsScript = BattleResults as CS_FactionWarBattleResultsScript
    
    if BattleResultsScript.BattleResult == 1
        ObjectReference[] DefeatedRegiments = DefendingRegiments
        AttackersReturnToCamp()
        if TacticalTarget as CS_CampManagementScript
            BattleSpaceScript.FactionTakeBattleSpace(OperationFaction)
        elseif TacticalTarget as CS_FortManagementScript
            BattleSpaceScript.FactionTakeFort(OperationFaction)
        elseif TacticalTarget as CS_CityManagementOwnership
            BattleSpaceScript.FactionTakeCityVassal(OperationFaction)
        endif
        BattleSpaceScript.TryToRetreat(TacticalTarget, TargetType, TargetFaction, OperationFaction, DefeatedRegiments)
        (OpsPlan as CS_FactionWarOperationPlan).FinishCurrentTactic()
    else
        ObjectReference[] DefeatedRegiments = AttackingRegiments
        BattleSpaceScript.TryToRetreat(TacticalTarget, TargetType, OperationFaction, TargetFaction, DefeatedRegiments)
        GoToState("Empty")
    endif
    
    (TacticalTarget as CS_FactionWarLocationScript).GoToState("Reinforced")
    BattleResults.delete()
EndFunction

Function AttackersMoveToTarget()
    ObjectReference[] Regiments = (OpsPlan as CS_FactionWarOperationPlan).Regiments
    
    int i = 1
    while i < Regiments.Length
        BattleSpaceScript.RemoveRegimentFromCamp(Regiments[i])
        BattleSpaceScript.AddRegimentToAttack(Regiments[i], TacticalTarget)
        i += 1
    endwhile
    
    AttackingRegiments = (TacticalTarget as CS_FactionWarLocationScript).AttackingRegiments
    DefendingRegiments = (TacticalTarget as CS_FactionWarLocationScript).DefendingRegiments
EndFunction

Function AttackersReturnToCamp()
    int OperationFactionNum = GetFactionNum(OperationFaction)
    
    if BattleSpaceScript.Camps[OperationFactionNum].IsEnabled() && BattleSpaceScript.CampManagementActivators[OperationFactionNum]
        int i = 0
        while i < AttackingRegiments.Length
            BattleSpaceScript.RemoveRegimentFromAttack(AttackingRegiments[i], TacticalTarget)
            BattleSpaceScript.AddRegimentToCamp(AttackingRegiments[i])
            i += 1
        endwhile
    else
        BattleSpaceScript.FactionEstablishInvasionCamp(OperationFaction, (OpsPlan as CS_FactionWarOperationPlan).Regiments)
    endif
EndFunction

Function StartTactic()
    if TargetType == "EstablishCamp"
        EstablishCamp()
    elseif TargetType == "Patrol"
        int OperationFactionNum = GetFactionNum(OperationFaction)
        
        int i = 0
        while i < BattleSpaceScript.CampManagementActivators.Length
            if i != OperationFactionNum && BattleSpaceScript.CampManagementActivators[i]
                ObjectReference CampFaction = (BattleSpaceScript.CampManagementActivators[i] as CS_FactionWarLocationScript).ControllingFaction
                if GetFactionsAtWar(OperationFaction, CampFaction)
                    (OpsPlan as CS_FactionWarOperationPlan).TargetFaction = CampFaction
                    (OpsPlan as CS_FactionWarOperationPlan).FinishCurrentTactic()
                    return
                endif
            endif
            i += 1
        endwhile
    elseif CheckIfRequirementsMet()
        AttackersMoveToTarget()
        AttackTarget()
    else
        (OpsPlan as CS_FactionWarOperationPlan).ResetTactics()
    endif
EndFunction

; Battle Simulation

int Function GetPowerLevel(string DefendersOrAttackers)
    int TotalPowerLevel
    ObjectReference[] RegimentsToCheck
    if DefendersOrAttackers == "Defenders"
        RegimentsToCheck = DefendingRegiments
    elseif DefendersOrAttackers == "Attackers"
        RegimentsToCheck = AttackingRegiments
    endif
    
    int i = 0
    while i < RegimentsToCheck.Length
        CS_FactionWarAIRegimentScript RegimentScript = RegimentsToCheck[i] as CS_FactionWarAIRegimentScript
        TotalPowerLevel += RegimentScript.TroopCount*RegimentScript.AverageEquipmentLevel*RegimentScript.AverageTrainingLevel
        i += 1
    endwhile
    
    return TotalPowerLevel
EndFunction

Function CalculateBattle()
    ; Get power levels using the existing function
    float AttackerPower = GetPowerLevel("Attackers")
    float DefenderPower = GetPowerLevel("Defenders")
    debug.trace("AttackerPowerLevel = " + AttackerPower)
    debug.trace("Defender Initial PowerLevel = " + DefenderPower)

    ; Retrieve fortification level of the location, assuming a property or a method to get it
    int FortificationLevel = (TacticalTarget as CS_FactionWarLocationScript).FortificationLevel

    ; Apply fortification advantage to defender's power
    DefenderPower = DefenderPower * (1 + 0.2 * FortificationLevel) ; 50% increase per fortification level

    ; Incorporate random elements
    float RandomFactor = Utility.RandomFloat(0.9, 1.1) ; Random factor between 90% and 110%

    ; Calculate final power comparison
    float FinalAttackerPower = AttackerPower * RandomFactor
    float FinalDefenderPower = DefenderPower; * RandomFactor
    debug.trace("Defender Final PowerLevel = " + DefenderPower)
    int AttackerCasualties = CalculateCasualties("Attackers", AttackerPower, DefenderPower)
    int DefenderCasualties = CalculateCasualties("Defenders", DefenderPower, AttackerPower)
    debug.trace("Attacker Casualties = " + AttackerCasualties)
    debug.trace("Defender Casualties = " + DefenderCasualties)
    debug.trace("Inflicting Defender Casualties...")
    InflictCasualties(AttackingRegiments, AttackerCasualties)
    debug.trace("Inflicting Attacker Casualties...")
    InflictCasualties(DefendingRegiments, DefenderCasualties)

    ; Determine outcome based on comparative power levels
    ObjectReference BattleResults = PlaceAtMe(CS_FactionWarBattleResults)
    if FinalAttackerPower > FinalDefenderPower
        (BattleResults as CS_FactionWarBattleResultsScript).BattleResult = 1
        debug.notification(GetFactionShortName(OperationFaction) + " have claimed victory over " + GetFactionShortName(TargetFaction) + " at " + (TacticalTarget as CS_FactionWarLocationScript).LocationName + "!")
        debug.trace(GetFactionShortName(OperationFaction) + " have claimed victory over " + GetFactionShortName(TargetFaction) + " at " + (TacticalTarget as CS_FactionWarLocationScript).LocationName + "!")
    else
        (BattleResults as CS_FactionWarBattleResultsScript).BattleResult = 0
        debug.notification(GetFactionShortName(OperationFaction) + " have been defeated by " + GetFactionShortName(TargetFaction) + " at " + (TacticalTarget as CS_FactionWarLocationScript).LocationName + "!")
        debug.trace(GetFactionShortName(OperationFaction) + " have been defeated by " + GetFactionShortName(TargetFaction) + " at " + (TacticalTarget as CS_FactionWarLocationScript).LocationName + "!")
    endif
    AttackCompletion(BattleResults)
EndFunction

int Function CalculateCasualties(string Side, float SidePower, float OpponentPower)
    float CasualtyRateBase = 0.1 ; Base casualty rate is 10%
    float PowerRatio = OpponentPower / (SidePower)
    
    ; Calculate casualties based on the power ratio and a random factor
    float RandomFactor = Utility.RandomFloat(0.8, 1.2) ; Random factor between 80% and 120%
    float CasualtyRate =  CasualtyRateBase * PowerRatio * RandomFactor
    debug.trace(Side + " CasualtyRate = " + CasualtyRate)

    ; Ensure that the calculated casualties do not exceed the total number of troops
    ObjectReference[] RegimentsToCheck
    if Side == "Defenders"
        RegimentsToCheck = DefendingRegiments
    elseif Side == "Attackers"
        RegimentsToCheck = AttackingRegiments
    endif
    
    int TotalTroops = 0
    int i = 0
    while i < RegimentsToCheck.Length
        TotalTroops += (RegimentsToCheck[i] as CS_FactionWarAIRegimentScript).TroopCount
        i += 1
    endwhile

    return math.floor(CasualtyRate*TotalTroops)
EndFunction

Function InflictCasualties(ObjectReference[] Regiments, int Casualties)
    int CasualtiesRemaining = Casualties
    
    int i = 0
    while i < Regiments.Length && CasualtiesRemaining > 0
        if (Regiments[i] as CS_FactionWarAIRegimentScript).TroopCount >= CasualtiesRemaining
            (Regiments[i] as CS_FactionWarAIRegimentScript).TroopCount -= CasualtiesRemaining
            CasualtiesRemaining = 0
        else
            CasualtiesRemaining -= (Regiments[i] as CS_FactionWarAIRegimentScript).TroopCount
            (Regiments[i] as CS_FactionWarAIRegimentScript).TroopCount = 0
        endif
        debug.trace("Regiment " + i + " remaining troops = " + (Regiments[i] as CS_FactionWarAIRegimentScript).TroopCount)
        i += 1
    endwhile
EndFunction
        

Event OnUpdate()
    
    SetUp()
    
EndEvent

State WaitingForLaunch

    Event OnUpdate()
        
        StartTactic()
        
    EndEvent
    
EndState

State Launched
    
    Event OnUpdate()
        
        CalculateBattle()
        
    EndEvent
    
EndState