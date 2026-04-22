Scriptname CS_FormationDisberseMGEFScript extends activemagiceffect  

CS_TroopFormUpScript Property TroopFormUp Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    TroopFormUp.DisbandArmy()
EndEvent