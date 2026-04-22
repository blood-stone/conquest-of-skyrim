Scriptname CS_ClaimAreaEnemyDeath extends ReferenceAlias  

Event OnDying(Actor akKiller)
    (GetOwningQuest() as CS_ClaimAreaScript).ObjectiveEnemyDeath()
    Clear()
EndEvent