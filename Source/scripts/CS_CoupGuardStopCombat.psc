Scriptname CS_CoupGuardStopCombat extends ReferenceAlias  

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    if akTarget == Game.GetPlayer()
        if aeCombatState == 0 && !GetActorRef().IsDead()
		debug.notification("Combat with the Player Stopped")
            ;GetOwningQuest().SetStage(45)
        endif
    endif
EndEvent