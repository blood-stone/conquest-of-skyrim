Scriptname CS_FormationTeleportMGEFScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.MoveTo(Game.GetPlayer(), afYOffset = -240 as float)
EndEvent