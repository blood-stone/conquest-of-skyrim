Scriptname CS_FormationTempHaltScript extends activemagiceffect  

CS_TroopFormUpScript Property TroopFormUp Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    TroopFormUp.ArmyWaitTemp()
EndEvent