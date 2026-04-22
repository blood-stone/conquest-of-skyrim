Scriptname CS_FactionWarMasterScript extends ObjectReference  

CS_FactionWarAggressorScript Property FactionWarAggressorScript Auto
CS_FactionWarDefenderScript Property FactionWarDefenderScript Auto

CS_FactionWarHoldsScript Property CS_FactionWarHolds Auto

int Property WarScore Auto ; positive value = favors aggressors

int Property RelativeDiplomaticPower Auto ; positive value = favors aggressors
int Property RelativeIntelligencePower Auto ; positive value = favors aggressors
int Property RelativeMilitaryPower Auto ; positive value = favors aggressors
int Property RelativeEconomicPower Auto ; positive value = favors aggressors

ObjectReference Property CS_FactionPlayer Auto

Function SetUp(ObjectReference Aggressor, ObjectReference Defender)
    debug.trace("Setting up War between " + (Aggressor as CS_FactionManagementDiplomacy).FactionNameString + " and " + (Defender as CS_FactionManagementDiplomacy).FactionNameString + "!")
    FactionWarAggressorScript = (self as ObjectReference) as CS_FactionWarAggressorScript
    FactionWarAggressorScript.Leader = Aggressor
    
    FactionWarDefenderScript = (self as ObjectReference) as CS_FactionWarDefenderScript
    FactionWarDefenderScript.Leader = Defender
    
    UpdateRelativePowers()
    SetFactionEnemies()
    FactionWarAggressorScript.GoToState("SetUp")
    FactionWarDefenderScript.GoToState("SetUp")
    RegisterForSingleUpdate(0.01)
    debug.trace("War between " + (Aggressor as CS_FactionManagementDiplomacy).FactionNameString + " and " + (Defender as CS_FactionManagementDiplomacy).FactionNameString + " has been set up!")
EndFunction

Function SetFactionEnemies()
    Faction AggressorLeaderFaction = (FactionWarAggressorScript.Leader as CS_FactionManagementMilitary).ArmyFaction
    Faction AggressorLeaderNPCFaction = (FactionWarAggressorScript.Leader as CS_FactionManagementMilitary).ArmyNPCFaction
    Faction DefenderLeaderFaction = (FactionWarDefenderScript.Leader as CS_FactionManagementMilitary).ArmyFaction
    Faction DefenderLeaderNPCFaction = (FactionWarDefenderScript.Leader as CS_FactionManagementMilitary).ArmyNPCFaction
    
    AggressorLeaderFaction.SetEnemy(DefenderLeaderFaction)
    if DefenderLeaderNPCFaction
        AggressorLeaderFaction.SetEnemy(DefenderLeaderNPCFaction)
    endif
    
    if AggressorLeaderNPCFaction
        AggressorLeaderNPCFaction.SetEnemy(DefenderLeaderFaction)
        if DefenderLeaderNPCFaction
            AggressorLeaderNPCFaction.SetEnemy(DefenderLeaderNPCFaction)
        endif
    endif
EndFunction

Function SetFactionTempAllies()
    Faction AggressorLeaderFaction = (FactionWarAggressorScript.Leader as CS_FactionManagementMilitary).ArmyFaction
    Faction AggressorLeaderNPCFaction = (FactionWarAggressorScript.Leader as CS_FactionManagementMilitary).ArmyNPCFaction
    Faction DefenderLeaderFaction = (FactionWarDefenderScript.Leader as CS_FactionManagementMilitary).ArmyFaction
    Faction DefenderLeaderNPCFaction = (FactionWarDefenderScript.Leader as CS_FactionManagementMilitary).ArmyNPCFaction
    
    AggressorLeaderFaction.SetAlly(DefenderLeaderFaction)
    if DefenderLeaderNPCFaction
        AggressorLeaderFaction.SetAlly(DefenderLeaderNPCFaction)
    endif
    
    if AggressorLeaderNPCFaction
        AggressorLeaderNPCFaction.SetAlly(DefenderLeaderFaction)
        if DefenderLeaderNPCFaction
            AggressorLeaderNPCFaction.SetAlly(DefenderLeaderNPCFaction)
        endif
    endif
EndFunction

Function UpdateRelativePowers();/
    RelativeDiplomaticPower = CalculateRelativePower("Diplomatic")
    RelativeIntelligencePower = CalculateRelativePower("Intelligence")
    RelativeMilitaryPower = CalculateRelativePower("Military")
    RelativeEconomicPower = CalculateRelativePower("Economic")/;
    (FactionWarAggressorScript.Leader as CS_FactionManagementMilitary).SetPowerLevels()
    (FactionWarDefenderScript.Leader as CS_FactionManagementMilitary).SetPowerLevels()
    (FactionWarAggressorScript.Leader as CS_FactionManagementMilitary).SetStrategyAttributes()
    (FactionWarDefenderScript.Leader as CS_FactionManagementMilitary).SetStrategyAttributes()
EndFunction

int Function CalculateRelativePower(string PowerType)
    return 0; change when ready
EndFunction