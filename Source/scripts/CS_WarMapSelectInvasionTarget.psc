Scriptname CS_WarMapSelectInvasionTarget extends ObjectReference  

Quest Property AttackPlanning Auto

Location Property HoldingLoc Auto

int Property HoldNum Auto

int Property enemyfactionnum Auto

bool Property BlockActivation Auto
;/
Event OnActivate(ObjectReference akActivatorRef)
    if !BlockActivation
        BlockActivation = true
        AttackPlanning.Start()
        (AttackPlanning as CS_AttackPlanningNewScript).InvasionTarget.ForceLocationTo(HoldingLoc)
        (AttackPlanning as CS_AttackPlanningNewScript).holdnum = HoldNum
        (AttackPlanning as CS_AttackPlanningNewScript).enemyfactionnum = enemyfactionnum
        (AttackPlanning as CS_AttackPlanningNewScript).SelectTarget()
        AttackPlanning.Stop()
        BlockActivation = false
    endif
EndEvent/;