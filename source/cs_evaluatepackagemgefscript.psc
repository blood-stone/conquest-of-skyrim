Scriptname CS_EvaluatePackageMGEFScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    ;debug.trace(akTarget + " Evaluating Package...")
    akTarget.EvaluatePackage()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    utility.wait(2)
    akTarget.EvaluatePackage()
EndEvent