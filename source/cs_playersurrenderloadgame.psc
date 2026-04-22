Scriptname CS_PlayerSurrenderLoadGame extends ReferenceAlias  

Event OnPlayerLoadGame()
    GetOwningQuest().SetStage(100)
EndEvent