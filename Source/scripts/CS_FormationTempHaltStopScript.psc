Scriptname CS_FormationTempHaltStopScript extends activemagiceffect  

CS_TroopFormUpScript Property TroopFormUp Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    TroopFormUp.FormUpArmy()
EndEvent