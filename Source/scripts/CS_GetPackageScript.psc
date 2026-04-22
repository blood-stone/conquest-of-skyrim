Scriptname CS_GetPackageScript extends activemagiceffect  

ReferenceAlias Property JarlCitizenAlias Auto

CS_AttackFortCampScript Property AttackCampScript Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.StopCombat()
    akTarget.EvaluatePackage()
    int AliasNum
    AliasNum = FindAttackAliasNum(akTarget)
    debug.notification(akTarget.GetCurrentPackage().GetFormID() + ", AliasNum = " + AliasNum)
    debug.trace(akTarget + " Package = " + akTarget.GetCurrentPackage().GetFormID() + ", AliasNum = " + AliasNum)
EndEvent

int Function FindAttackAliasNum(Actor Troop)
    int i = 0
    bool foundalias
    while i < AttackCampScript.Attackers.Length
        if AttackCampScript.Attackers[i].GetActorRef() == Troop
            return i
        endif
        i += 1
    endwhile
EndFunction