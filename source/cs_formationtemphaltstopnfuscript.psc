Scriptname CS_FormationTempHaltStopNFUScript extends activemagiceffect  

CS_TroopFormUpScript Property TroopFormUp Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    TroopFormUp.TempWait = 0
EndEvent