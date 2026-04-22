Scriptname CS_SetPlayerTeammateMGEFScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.SetPlayerTeammate(true, true)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akTarget.SetPlayerTeammate(false, false)
EndEvent