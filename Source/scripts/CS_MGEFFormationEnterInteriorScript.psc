Scriptname CS_MGEFFormationEnterInteriorScript extends activemagiceffect  

ObjectReference Property EntranceMarker Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.MoveTo(EntranceMarker)
EndEvent