Scriptname CS_GovDeath extends ReferenceAlias  

int Property citynum Auto

Event OnDying(Actor akKiller)
    if GetActorRef().IsDead()
        Clear()
        CS_RecruitJarl JarlScript = GetOwningQuest() as CS_RecruitJarl
        
        JarlScript.JarlFindGovernment(citynum)
    endif
EndEvent