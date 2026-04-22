Scriptname CS_FactionWarFactionScript extends ObjectReference  

import CS_CommonFunctions
import CS_CommonWarFunctions

int Property AggressorMultiplier Auto ; 1 for aggressor, -1 for defender, used in relative power calculations
int Property IsPlayer Auto

ObjectReference Property Leader Auto

ObjectReference[] Property Allies Auto
ObjectReference[] Property Vassals Auto

ObjectReference[] Property Cities Auto
ObjectReference[] Property Villages Auto
ObjectReference[] Property Settlements Auto

;Strategic Planning Variables(main goals of the war and how to achieve them i.e. by being as aggressive as possible or cautious)

MiscObject Property CS_FactionWarStrategicObjective Auto
ObjectReference[] Property StrategicObjectives Auto

FormList Property CS_FactionWarStrategyTemplates Auto

int Property Aggression Auto ;0 = completely defensive (all troops stay defending), 5 = completely aggressive (all troops attacking)
int Property Risk Auto ;0 = not willing to act without 100% intel, 5 = willing to act with 0% intel
int Property Patience Auto ;0 = wants to conclude war as quickly as possible, 5 = willing to draw war out as long as possible
int Property Brutality Auto ;0 = not willing to commit any brutal acts (village raiding, torturing, caravan raiding) against enemy, 5 = willing to commit all brutal acts (brutal acts can lower enemy war support)
int[] Property WarSupport Auto ;0 = faction citizens do not support the war at all, 5 = faction citizens completely support war

int Property TotalRegiments Auto

ObjectReference[] Property OffensiveRegiments Auto
ObjectReference[] Property DefensiveRegiments Auto

;Operational Planning Variables(current priority of the war i.e take hold, reinforce hold)

ObjectReference[] Property OpsPlans Auto

Activator Property CS_FactionWarAIArmy Auto

MiscObject Property CS_FactionWarOperationTemplate00 Auto

;Tactical Planning Variables(sending specific units to accomplish specific tasks)


Function SetUp()
    debug.trace("War Side Setting Up...")
    UpdateAlliances()
    UpdateHoldings()
    CheckIfPlayerInWar()
    if IsPlayer == 0;/
        (Leader as CS_FactionManagementMilitary).Aggression = 5
        (Leader as CS_FactionManagementMilitary).DefensiveSpread = 1
        (Leader as CS_FactionManagementMilitary).DefensiveGarrisons = 2/;
        (Leader as CS_FactionManagementMilitary).SetDefensivePosture()
        ;DevelopOpsPlans()
    endif
    debug.trace("War Side Set Up!")
EndFunction

Function UpdateAlliances()
    debug.trace("War Side Calling Alliances...")
    Vassals = CallVassalsToWar(Leader)
    Allies = CallAlliesToWar(Leader)
    debug.trace("War Side Called Alliances!")
EndFunction

Function UpdateHoldings()
    debug.trace("War Side Updating Holdings...")
    Cities = GetAlliedHoldings("Cities", Leader, Vassals, Allies)
    Villages = GetAlliedHoldings("Villages", Leader, Vassals, Allies)
    Settlements = GetAlliedHoldings("Settlements", Leader, Vassals, Allies)
    debug.trace("War Side Updated Holdings!")
EndFunction

Function CheckIfPlayerInWar()
    if IsPlayerInWar(((self as ObjectReference) as CS_FactionWarMasterScript).CS_FactionPlayer, Leader, Allies, Vassals)
        if AggressorMultiplier == 1
            while ((self as ObjectReference) as CS_FactionWarDefenderScript).GetState() != "Ready"
                utility.wait(0.1)
            endwhile
            IsPlayer = 1
            ((self as ObjectReference) as CS_FactionWarDefenderScript).BanPlayerFromCities()
        elseif AggressorMultiplier == -1
            while ((self as ObjectReference) as CS_FactionWarAggressorScript).GetState() != "Ready"
                utility.wait(0.1)
            endwhile
            IsPlayer = 1
            ((self as ObjectReference) as CS_FactionWarAggressorScript).BanPlayerFromCities()
        endif
    endif
EndFunction

Function BanPlayerFromCities()
    int i = 0
    while i < Cities.Length
        (Cities[i] as CS_CityManagementOwnership).CityClosedToPlayer = 1
        (Cities[i] as CS_CityManagementOwnership).WarsWithPlayer = AddToArray(self as ObjectReference, (Cities[i] as CS_CityManagementOwnership).WarsWithPlayer)
        i += 1
    endwhile
EndFunction

;Strategic Planning

bool Function CalculateStrategicPlanFeasibility(CS_FactionWarStrategicPlan StratPlan)
    CS_FactionWarMasterScript MasterScript = (self as ObjectReference) as CS_FactionWarMasterScript

    int DiplomaticFeasibility = AggressorMultiplier*MasterScript.RelativeDiplomaticPower - StratPlan.RequiredDiplomaticPower
    int IntelligenceFeasibility = AggressorMultiplier*MasterScript.RelativeIntelligencePower - StratPlan.RequiredIntelligencePower
    int MilitaryFeasibility = AggressorMultiplier*MasterScript.RelativeMilitaryPower - StratPlan.RequiredMilitaryPower
    int EconomicFeasibility = AggressorMultiplier*MasterScript.RelativeEconomicPower - StratPlan.RequiredEconomicPower
    
    if DiplomaticFeasibility < 0 || IntelligenceFeasibility < 0 || MilitaryFeasibility < 0 || EconomicFeasibility < 0
        return false
    else
        return true
    endif
EndFunction

MiscObject[] Function CalculateStrategicPlanFeasibilities()
    MiscObject[] FeasiblePlans
    int i = 0
    while i < CS_FactionWarStrategyTemplates.GetSize()
        if CalculateStrategicPlanFeasibility(CS_FactionWarStrategyTemplates.GetAt(i) as CS_FactionWarStrategicPlan)
            FeasiblePlans = AddToMiscObjectArray(CS_FactionWarStrategyTemplates.GetAt(i) as MiscObject, FeasiblePlans)
        endif
        i += 1
    endwhile
    
    return FeasiblePlans
EndFunction

int Function CalculateStrategicPlanViability(CS_FactionWarStrategicPlan StratPlan)
    CS_FactionWarMasterScript MasterScript = (self as ObjectReference) as CS_FactionWarMasterScript

    int DiplomaticViability = AggressorMultiplier*MasterScript.RelativeDiplomaticPower - StratPlan.RequiredDiplomaticPower
    int IntelligenceViability = AggressorMultiplier*MasterScript.RelativeIntelligencePower - StratPlan.RequiredIntelligencePower
    int MilitaryViability = AggressorMultiplier*MasterScript.RelativeMilitaryPower - StratPlan.RequiredMilitaryPower
    int EconomicViability = AggressorMultiplier*MasterScript.RelativeEconomicPower - StratPlan.RequiredEconomicPower
    
    int OverallViability = math.floor((DiplomaticViability + IntelligenceViability + MilitaryViability + EconomicViability) as float/4)
    
    return OverallViability
EndFunction

int[] Function CalculateStrategicPlanViabilities(MiscObject[] FeasiblePlans)
    int[] PlanViabilities = new int[10]
    int i = 0
    while i < CS_FactionWarStrategyTemplates.GetSize()
        if FeasiblePlans[i]
            PlanViabilities[i] = CalculateStrategicPlanViability(CS_FactionWarStrategyTemplates.GetAt(i) as CS_FactionWarStrategicPlan)
        else
            return PlanViabilities
        endif
        i += 1
    endwhile
    
    return PlanViabilities
EndFunction

int Function DetermineBestPlan(int[] PlanViabilities)
    int bestplan = -1
    int i = 0
    while i < PlanViabilities.Length
        if bestplan == -1
            if PlanViabilities[i] > 0
                bestplan = i
            endif
        elseif PlanViabilities[i] > PlanViabilities[bestplan]
            bestplan = i
        endif
        i += 1
    endwhile
    
    return bestplan
EndFunction    

Function DevelopStrategicPlan()
    MiscObject[] FeasiblePlans = CalculateStrategicPlanFeasibilities()
    int[] PlanViabilities = CalculateStrategicPlanViabilities(FeasiblePlans)
    
    int BestPlan = DetermineBestPlan(PlanViabilities)
    CS_FactionWarStrategicPlan StrategicPlan = FeasiblePlans[BestPlan] as CS_FactionWarStrategicPlan
    
    Aggression = StrategicPlan.Aggression
    Risk = StrategicPlan.Risk
    Patience = StrategicPlan.Patience
    Brutality = StrategicPlan.Brutality
EndFunction

ObjectReference Function ChooseOpsTarget()
    ObjectReference[] PossibleTargets
    ObjectReference OpsTarget
    CS_FactionWarHoldsScript CS_FactionWarHolds = ((self as ObjectReference) as CS_FactionWarMasterScript).CS_FactionWarHolds
    if AggressorMultiplier == 1
        CS_FactionWarDefenderScript DefenderScript = ((self as ObjectReference) as CS_FactionWarDefenderScript)
        DefenderScript.UpdateAlliances()
        DefenderScript.UpdateHoldings()
        if DefenderScript.Cities.Length >= 1
            PossibleTargets = DefenderScript.Cities
        elseif DefenderScript.Villages.Length >= 1
            PossibleTargets = DefenderScript.Villages
        elseif DefenderScript.Settlements.Length >= 1
            PossibleTargets = DefenderScript.Settlements
        endif
    elseif AggressorMultiplier == -1
        CS_FactionWarAggressorScript AggressorScript = ((self as ObjectReference) as CS_FactionWarAggressorScript)
        AggressorScript.UpdateAlliances()
        AggressorScript.UpdateHoldings()
        if AggressorScript.Cities.Length >= 1
            PossibleTargets = AggressorScript.Cities
        elseif AggressorScript.Villages.Length >= 1
            PossibleTargets = AggressorScript.Villages
        elseif AggressorScript.Settlements.Length >= 1
            PossibleTargets = AggressorScript.Settlements
        endif
    endif
    
    int[] TargetViabilities = GetNewIntArray(PossibleTargets.Length)
    int i = 0
    while i < PossibleTargets.Length
        int targetholdnum = (PossibleTargets[i] as CS_CityManagementOwnership).holdnum
        ObjectReference PossibleTargetBattleSpace = (PossibleTargets[i] as CS_CityManagementMilitary).BattleSpace
        if (Leader as CS_FactionManagementMilitary).ControlledBattleSpaces.Find(PossibleTargetBattleSpace) >= 0
            TargetViabilities[i] = 10
        elseif GetBordersBattleSpace(PossibleTargetBattleSpace)
            ;if (Leader as CS_FactionManagementDiplomacy).GetIsAllied(CS_FactionWarHolds.HoldOwners[targetholdnum])
            TargetViabilities[i] = 5 + utility.randomint(-2, 2)
        else
            TargetViabilities[i] = 0
        endif
        i += 1
    endwhile
    
    int BestPlan = DetermineBestPlan(TargetViabilities)
    if BestPlan >= 0
        OpsTarget = PossibleTargets[BestPlan]
    endif
    
    return OpsTarget
EndFunction

bool Function GetBordersBattleSpace(ObjectReference HoldingBattleSpace)
    ObjectReference[] LeaderBattleSpaces = (Leader as CS_FactionManagementMilitary).ControlledBattleSpaces

    int i = 0
    while i < LeaderBattleSpaces.Length
        if (LeaderBattleSpaces[i] as CS_BattleSpaceRegionAll).BorderingBattleSpaces.Find(HoldingBattleSpace) >= 0
            return true
        endif
        i += 1
    endwhile
    
    return false
EndFunction

Function DevelopOpsPlans()
    ObjectReference OpsPlan = PlaceAtMe(CS_FactionWarOperationTemplate00);SetOpsPlan()
    OpsPlans = AddToArray(OpsPlan, OpsPlans)
    SetUpOpsPlan(OpsPlan)
EndFunction

Function SetUpOpsPlan(ObjectReference Plan)
    CS_FactionWarOperationPlan OpsPlanScript = (Plan as CS_FactionWarOperationPlan)
    ObjectReference OpsTarget = ChooseOpsTarget()
    
    debug.trace(GetFactionName(Leader) + " preparing for operation to capture " + (OpsTarget as CS_CityManagementOwnership).VanillaCity.GetName())
    OpsPlanScript.OpsTarget = OpsTarget
    OpsPlanScript.WarActivator = self as ObjectReference
    OpsPlanScript.BattleSpace = (OpsTarget as CS_CityManagementMilitary).BattleSpace
    OpsPlanScript.OperationFaction = Leader
    OpsPlanScript.AggressorMultiplier = AggressorMultiplier
    if AggressorMultiplier == 1
        CS_FactionWarDefenderScript DefenderScript = ((self as ObjectReference) as CS_FactionWarDefenderScript)
        OpsPlanScript.TargetFaction = DefenderScript.Leader
    elseif AggressorMultiplier == -1
        CS_FactionWarAggressorScript AggressorScript = ((self as ObjectReference) as CS_FactionWarAggressorScript)
        OpsPlanScript.TargetFaction = AggressorScript.Leader
    endif
    OpsPlanScript.CurrentLocation = Cities[0]
    ObjectReference NewArmy = (Leader as CS_FactionManagementMilitary).FormArmy()
    ;Get Minimum Regiments
    ;if NewArmy Regiments >= Minimum Regiments
        OpsPlanScript.Regiments = (NewArmy as CS_FactionWarAIArmyScript).Regiments
        OpsPlanScript.SetUpTactics()
        ;/else
        (NewArmy as CS_FactionWarAIArmyScript).DisbandArmy()
        int plannum = OpsPlans.Find(Plan)
        OpsPlans[plannum] = None
        Plan.delete()
    endif/;
EndFunction
;/
ObjectReference[] Function GetAIRegimentsForOperation()
    ObjectReference[] AvailableRegiments

    ObjectReference[] ControlledBattleSpaces = (Leader as CS_FactionManagementMilitary).ControlledBattleSpaces
    
    int FactionNum = GetFactionNum(Leader)
    ObjectReference NewArmy = (Leader as CS_FactionManagementMilitary).FormNewArmy()
    int i = 0
    while i < ControlledBattleSpaces.Length
        CS_BattleSpaceRegionAll BattleSpaceScript = ControlledBattleSpaces[i] as CS_BattleSpaceRegionAll
        ObjectReference FactionArmy = BattleSpaceScript.FactionArmies[FactionNum]
        
        AvailableRegiments = AddArrayToArray(BattleSpaceScript.GetRegimentsForOffensive(), AvailableRegiments)
        i += 1
    endwhile
    ;/
    i = 0
    while i < Villages.Length
        TotalRegiments += 2
        DefensiveRegiments += 1
        AvailableRegiments += 1
        i += 1
    endwhile
    
    i = 0
    while i < Settlements.Length
        TotalRegiments += 1
        AvailableRegiments += 1
        i += 1
    endwhile/;
    ;/
    return AvailableRegiments
EndFunction/;

Function CompleteOpsPlan(ObjectReference OpsPlan)
    OpsPlans = RemoveFromArray(OpsPlan, OpsPlans)
    (Leader as CS_FactionManagementMilitary).SetDefensivePosture()
    DevelopOpsPlans()
EndFunction

State SetUp
    
    Event OnUpdate()
        
        GoToState("SettingUp")
        SetUp()
        GoToState("Ready")
        
    EndEvent
    
EndState