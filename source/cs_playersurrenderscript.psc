Scriptname CS_PlayerSurrenderScript extends Quest  

ReferenceAlias Property Arrester Auto
ReferenceAlias Property Player Auto
ReferenceAlias Property DestinationMarker Auto

FormList Property PrisonMarkers Auto

Quest Property PrisonQuest Auto


Function StartArrest(Actor ArresterGuard, int citynum)
    DestinationMarker.ForceRefTo(PrisonMarkers.GetAt(citynum) as ObjectReference)
    Arrester.ForceRefTo(ArresterGuard)
    Player.ForceRefTo(Game.GetPlayer())
    SetStage(10)
EndFunction