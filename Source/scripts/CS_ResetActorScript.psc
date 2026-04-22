Scriptname CS_ResetActorScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.disable()
	akTarget.reset(akTarget)
	akTarget.enable()
EndEvent