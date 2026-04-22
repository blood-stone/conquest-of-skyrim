Scriptname CS_LocationMarkerScript extends ObjectReference  

Keyword Property CS_StoryClaimAreaRemoveEnemies Auto

ObjectReference Property Banner Auto hidden
ObjectReference Property BuildingChest Auto
ObjectReference Property InitialBuilding Auto

Quest Property CS_ClaimAreaRemoveEnemies Auto

Location Property VanillaLocation Auto hidden

string Property LocationType Auto

State Captured

    Event OnCellAttach()
        CS_ClaimAreaRemoveEnemies.Stop()
        CS_StoryClaimAreaRemoveEnemies.SendStoryEvent(VanillaLocation)
    EndEvent
    
EndState