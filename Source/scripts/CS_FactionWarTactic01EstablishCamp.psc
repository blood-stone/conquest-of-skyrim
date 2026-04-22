Scriptname CS_FactionWarTactic01EstablishCamp extends ObjectReference  

bool Function CheckIfComplete()
    ObjectReference OpsPlan = ((self as ObjectReference) as CS_FactionWarTacticScript).OpsPlan
    ObjectReference BattleSpace = (OpsPlan as CS_FactionWarOperationPlan).BattleSpace
    CS_BattleSpaceRegionAll BattleSpaceScript = BattleSpace as CS_BattleSpaceRegionAll
    ObjectReference OperationFaction = (OpsPlan as CS_FactionWarOperationPlan).OperationFaction
    
    if BattleSpaceScript.CS_FactionMajorEmpireSkyrim == OperationFaction
        if BattleSpaceScript.CampImp.IsEnabled()
            return true
        else
            return false
        endif
    elseif BattleSpaceScript.CS_FactionMajorSons == OperationFaction
        if BattleSpaceScript.CampSons.IsEnabled()
            return true
        else
            return false
        endif
    elseif BattleSpaceScript.CS_FactionPlayer == OperationFaction
        if BattleSpaceScript.CampPlayer.IsEnabled()
            return true
        else
            return false
        endif
    endif
EndFunction

Function EstablishCamp()
    ObjectReference OpsPlan = ((self as ObjectReference) as CS_FactionWarTacticScript).OpsPlan
    ObjectReference BattleSpace = (OpsPlan as CS_FactionWarOperationPlan).BattleSpace
    CS_BattleSpaceRegionAll BattleSpaceScript = BattleSpace as CS_BattleSpaceRegionAll
    ObjectReference OperationFaction = (OpsPlan as CS_FactionWarOperationPlan).OperationFaction
    
    BattleSpaceScript.FactionEstablishInvasionCamp(OperationFaction, OpsPlan)
    (OpsPlan as CS_FactionWarOperationPlan).FinishCurrentTactic()
EndFunction

Event OnUpdate()
    
    EstablishCamp()
    
EndEvent
