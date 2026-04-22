Scriptname CS_ClaimArea extends activemagiceffect  

Keyword Property CS_StoryClaimArea Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    CS_StoryClaimArea.SendStoryEvent()
EndEvent
