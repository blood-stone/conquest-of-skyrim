Scriptname CS_MGEFPlayerEnterInteriorScript extends activemagiceffect  

ObjectReference Property EntranceMarker Auto

CS_TroopFormUpScript Property TroopFormUp Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    EntranceMarker.MoveTo(akTarget)
    TroopFormUp.PlayerEnterInterior()
EndEvent