Scriptname CS_MGEF_DefendPlayerScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.StartCombat(Game.GetPlayer().GetCombatTarget())
EndEvent