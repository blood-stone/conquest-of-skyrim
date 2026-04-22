Scriptname CS_JarlDeath extends ReferenceAlias  

Event OnDying(Actor akKiller)
    (GetOwningQuest() as CS_RecruitJarl).KillJarl(GetActorRef())
EndEvent