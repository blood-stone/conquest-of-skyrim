Scriptname CS_TroopFormUpDeath extends ReferenceAlias

Event OnDying(Actor akKiller)
    (GetOwningQuest() as CS_TroopFormUpScript).FillInHole(self)
EndEvent
