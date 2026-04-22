Scriptname CS_ClaimArea extends activemagiceffect  

Keyword Property CS_StoryClaimArea Auto

Quest Property CS_ClaimAreaNew Auto

State ClaimingArea
    
    Event OnEffectStart(Actor akTarget, Actor akCaster)
        debug.notification("Currently claiming area!")
    EndEvent
    
EndState

Event OnEffectStart(Actor akTarget, Actor akCaster)
    GoToState("ClaimingArea")
    CS_ClaimAreaNew.SetObjectiveDisplayed(0, false)
    if CS_ClaimAreaNew.IsRunning()
        CS_ClaimAreaNew.Stop()
    endif
    CS_ClaimAreaNew.Start()
    GoToState("Empty")
    ;(CS_ClaimAreaNew as CS_ClaimAreaScript).TryToClaimLocation()
EndEvent
