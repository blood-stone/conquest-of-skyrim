Scriptname CS_FormationPlayerFastTravel extends ReferenceAlias

Event OnPlayerFastTravelEnd(float afTravelGameTimeHours)
    (GetOwningQuest() as CS_TroopFormUpScript).MoveArmyToPlayer()
EndEvent
