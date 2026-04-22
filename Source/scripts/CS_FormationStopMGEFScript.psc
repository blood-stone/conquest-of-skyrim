Scriptname CS_FormationStopMGEFScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    
    ;debug.trace(akTarget + " Breaking formation...")
    akTarget.ClearLookAt()
    akTarget.ClearKeepOffsetFromActor()
EndEvent