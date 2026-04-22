Scriptname CS_TroopDeath extends ReferenceAlias  

Event OnDying(Actor akKiller)
    if self.GetActorRef().IsDead() == 1
        (GetOwningQuest() as CS_ArmyTroopDeath).AdjustTroopCount(self)
    endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
    if akSource != (GetOwningQuest() as CS_ArmyTroopDeath).HealOther && akSource != (GetOwningQuest() as CS_ArmyTroopDeath).Oakflesh && akSource != (GetOwningQuest() as CS_ArmyTroopDeath).StoneFlesh && akSource != (GetOwningQuest() as CS_ArmyTroopDeath).IronFlesh && akSource != (GetOwningQuest() as CS_ArmyTroopDeath).EbonyFlesh && (GetOwningQuest() as CS_ArmyTroopDeath).CS_HealersFindTarget.IsRunning() == 0
        StartHealingQuest()
    endif
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    if !(GetOwningQuest() as CS_ArmyTroopDeath).CS_BuffersFindTarget.IsRunning()
        (GetOwningQuest() as CS_ArmyTroopDeath).CS_BuffersFindTarget.Start()
    endif
EndEvent

Function StartHealingQuest()
    (GetOwningQuest() as CS_ArmyTroopDeath).CS_HealersFindTarget.Start()
EndFunction

GlobalVariable Property TroopCount  Auto  
