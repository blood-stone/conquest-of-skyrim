Scriptname CS_FactionWarTactic03AttackFortScript extends ObjectReference  

import CS_CommonFunctions

CS_FactionWarLocationScript FortActivatorScript

Keyword Property PlayerAttackFortKeyword Auto
Keyword Property PlayerDefendFortKeyword Auto
Keyword Property AIFortBattleKeyword Auto

MiscObject Property CS_FactionWarBattleResults Auto

int Property DesiredTroopCount Auto

Function SetUp()
    ObjectReference OpsPlan = ((self as ObjectReference) as CS_FactionWarTacticScript).OpsPlan
    ObjectReference BattleSpace = (OpsPlan as CS_FactionWarOperationPlan).BattleSpace
    CS_BattleSpaceRegionAll BattleSpaceScript = BattleSpace as CS_BattleSpaceRegionAll
    ObjectReference OperationFaction = (OpsPlan as CS_FactionWarOperationPlan).OperationFaction
    ObjectReference TargetFaction = (OpsPlan as CS_FactionWarOperationPlan).TargetFaction
    int TargetFactionNum = GetFactionNum(TargetFaction)
    FortActivatorScript = BattleSpaceScript.Fort as CS_FactionWarLocationScript
    
    DesiredTroopCount = 20*FortActivatorScript.DefendingRegiments.Length - 2*(OperationFaction as CS_FactionManagementMilitary).Aggression
EndFunction

bool Function CheckIfRequirementsMet()
    if !CheckRequirementRegiments()
        debug.trace("Did not attack because no regiments available")
        return false
    endif
    
    if !CheckRequirementTroopCount()
        debug.trace("Did not attack because not enough troops in regiments available")
        return false
    endif
    
    return true
EndFunction

bool Function CheckRequirementRegiments()
    
    if FortActivatorScript.DefendingRegiments.Length > 0
        return true
    else
        return false
    endif
    
EndFunction

bool Function CheckRequirementTroopCount()
    ObjectReference OpsPlan = ((self as ObjectReference) as CS_FactionWarTacticScript).OpsPlan
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
        return false
    endif
EndFunction

Function AttackFort()
    ObjectReference OpsPlan = ((self as ObjectReference) as CS_FactionWarTacticScript).OpsPlan
    ObjectReference BattleSpace = (OpsPlan as CS_FactionWarOperationPlan).BattleSpace
    CS_BattleSpaceRegionAll BattleSpaceScript = BattleSpace as CS_BattleSpaceRegionAll
    ObjectReference OperationFaction = (OpsPlan as CS_FactionWarOperationPlan).OperationFaction
    ObjectReference TargetFaction = (OpsPlan as CS_FactionWarOperationPlan).TargetFaction
    
    if OperationFaction == BattleSpaceScript.CS_FactionPlayer
        if TargetFaction == BattleSpaceScript.CS_FactionMajorEmpireSkyrim
            PlayerAttackFortKeyword.SendStoryEvent(akRef1 = BattleSpaceScript.Fort, akRef2 = self as ObjectReference)
        elseif TargetFaction == BattleSpaceScript.CS_FactionMajorSons
            PlayerAttackFortKeyword.SendStoryEvent(akRef1 = BattleSpaceScript.Fort, akRef2 = self as ObjectReference)
        endif
    elseif TargetFaction == BattleSpaceScript.CS_FactionPlayer
        if OperationFaction == BattleSpaceScript.CS_FactionMajorEmpireSkyrim
            PlayerDefendFortKeyword.SendStoryEvent(akRef1 = BattleSpaceScript.Fort, akRef2 = self as ObjectReference)
        elseif OperationFaction == BattleSpaceScript.CS_FactionMajorSons
            PlayerDefendFortKeyword.SendStoryEvent(akRef1 = BattleSpaceScript.Fort, akRef2 = self as ObjectReference)
        endif
    else
        if TargetFaction == BattleSpaceScript.CS_FactionMajorEmpireSkyrim
            ;AIFortBattleKeyword.SendStoryEvent(akRef1 = BattleSpaceScript.FortImp, akRef2 = self as ObjectReference)
        elseif TargetFaction == BattleSpaceScript.CS_FactionMajorSons
            ;AIFortBattleKeyword.SendStoryEvent(akRef1 = BattleSpaceScript.FortSons, akRef2 = self as ObjectReference)
        endif
        debug.trace((OperationFaction as CS_FactionManagementDiplomacy).FactionNameString + " has attacked " + (BattleSpaceScript.Fort as CS_FortManagementScript).FortName + " in " + (BattleSpaceScript.City as CS_CityManagementOwnership).VanillaCity.GetName())
        debug.notification((OperationFaction as CS_FactionManagementDiplomacy).FactionNameString + " has attacked " + (BattleSpaceScript.Fort as CS_FortManagementScript).FortName + " in " + (BattleSpaceScript.City as CS_CityManagementOwnership).VanillaCity.GetName())
    endif
EndFunction

Function AttackCompletion(ObjectReference BattleResults)
    CS_FactionWarBattleResultsScript BattleResultsScript = BattleResults as CS_FactionWarBattleResultsScript
    ObjectReference OpsPlan = ((self as ObjectReference) as CS_FactionWarTacticScript).OpsPlan
    ObjectReference BattleSpace = (OpsPlan as CS_FactionWarOperationPlan).BattleSpace
    CS_BattleSpaceRegionAll BattleSpaceScript = BattleSpace as CS_BattleSpaceRegionAll
    ObjectReference OperationFaction = (OpsPlan as CS_FactionWarOperationPlan).OperationFaction
    ObjectReference TargetFaction = (OpsPlan as CS_FactionWarOperationPlan).TargetFaction
    
    if BattleResultsScript.BattleResult == 1
        BattleSpaceScript.FactionTakeFort(OperationFaction)
        (OpsPlan as CS_FactionWarOperationPlan).FinishCurrentTactic()
    else
        GoToState("Empty")
    endif
EndFunction

Event OnUpdate()
    
    SetUp()
    GoToState("WaitingForLaunch")
    RegisterForSingleUpdate(0.1)
    
EndEvent

State WaitingForLaunch

    Event OnUpdate()
        
        if CheckIfRequirementsMet()
            AttackFort()
            GoToState("Launched")
        else
            ObjectReference OpsPlan = ((self as ObjectReference) as CS_FactionWarTacticScript).OpsPlan
            (OpsPlan as CS_FactionWarOperationPlan).ResetTactics()
        endif
        
    EndEvent
    
EndState

State Launched
    
    Event OnUpdate()
        
        ObjectReference SimulatedBattleResults = PlaceAtMe(CS_FactionWarBattleResults)
        (SimulatedBattleResults as CS_FactionWarBattleResultsScript).BattleResult = 1
        AttackCompletion(SimulatedBattleResults)
        debug.trace("Fort Attack completed")
        
    EndEvent
    
EndState