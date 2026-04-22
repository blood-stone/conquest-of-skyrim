Scriptname CS_MGEF_StopCombatScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.StopCombat()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akTarget.StopCombat()
EndEvent