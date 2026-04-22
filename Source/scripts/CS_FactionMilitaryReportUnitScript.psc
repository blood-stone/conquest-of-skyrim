Scriptname CS_FactionMilitaryReportUnitScript extends ReferenceAlias

Quest Property Unit Auto hidden

LocationAlias Property UnitName Auto

int Property TroopCount Auto hidden

State Update

    Event OnUpdate()
        
        Location UnitNameLoc = (Unit as CS_ArmyUnitAliasScript).UnitName
        UnitName.ForceLocationTo(UnitNameLoc)
        TroopCount = (Unit as CS_ArmyUnitAliasScript).AliveTroopCount
        GoToState("Updated")
        
    EndEvent
    
EndState
