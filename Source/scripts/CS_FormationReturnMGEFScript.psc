Scriptname CS_FormationReturnMGEFScript extends activemagiceffect  

CS_TroopFormUpScript Property TroopFormUp Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    TroopFormUp.MoveArmyToPlayer()
EndEvent