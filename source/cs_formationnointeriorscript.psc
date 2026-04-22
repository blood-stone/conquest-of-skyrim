Scriptname CS_FormationNoInteriorScript extends activemagiceffect  

ObjectReference Property UnusedNPCCellMarker Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.MoveTo(UnusedNPCCellMarker)
EndEvent