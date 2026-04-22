Scriptname CS_FormationPlayerFastTravel extends ReferenceAlias
;/
Event OnPlayerFastTravelEnd(float afTravelGameTimeHours)
    debug.trace("Player Fast Travel Ended")
    (GetOwningQuest() as CS_TroopFormUpScript).ResetFormation()
    (GetOwningQuest() as CS_TroopFormUpScript).MoveArmyToPlayer()
EndEvent
/;