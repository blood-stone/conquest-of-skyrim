Scriptname CS_FormationNoInteriorScript extends activemagiceffect  

ObjectReference Property UnusedNPCCellMarker Auto

Actor Property PlayerRef Auto

WorldSpace Property Tamriel Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if PlayerRef.GetWorldSpace() != Tamriel
        akTarget.MoveTo(UnusedNPCCellMarker)
    endif
EndEvent