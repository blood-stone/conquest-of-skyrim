Scriptname CS_CityQuestDeath extends ReferenceAlias  

Event OnDying(Actor akKiller)
    GetOwningQuest().SetStage(103)
EndEvent