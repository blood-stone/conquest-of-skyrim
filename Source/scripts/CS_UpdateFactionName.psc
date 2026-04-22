Scriptname CS_UpdateFactionName  extends ReferenceAlias 

Event OnPlayerLoadGame()
    debug.trace("Player Faction Load Game update received")
    (GetOwningQuest() as CS_Faction).Name.UpdateName()
EndEvent