Scriptname CS_ExecutioneeDeath extends ReferenceAlias  

Event OnDeath(Actor akKiller)
    if GetActorRef().GetActorBase() == (Game.GetForm(0x7) as ActorBase)
        Game.GetPlayer().MoveTo(GetActorRef())
        Utility.Wait(0.5)
        Game.GetPlayer().kill()
    endif
    (GetOwningQuest() as CS_ExecutionScript).NextExecutionee()
EndEvent