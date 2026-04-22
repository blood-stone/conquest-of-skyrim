Scriptname CS_BuildingLoggingScript extends ObjectReference  

Quest Property CS_SettlementGetClosestTrees Auto

Event OnInIt() ; Places markers at the closest trees to the logging camp for the settlers to find
    CS_SettlementGetClosestTrees.Stop()
    CS_SettlementGetClosestTrees.Start()
EndEvent