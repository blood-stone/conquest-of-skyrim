Scriptname CS_SetUpHoldScript extends Quest  

int Property holdnum Auto
Location Property VanillaCity Auto

FormList Property GarrisonMarkersImp Auto
FormList Property GarrisonMarkersSons Auto

Keyword Property CWOwner Auto

Keyword Property CS_StoryJarlChooseGov Auto
Keyword Property CS_StoryTransferJarl Auto

CS_GovPositions Property InitialGovPositions Auto
CS_TransferOwnershipScript Property CS_TransferHoldingOwnership Auto

Function SetUp()
    ObjectReference GarrisonMarkerImp = GarrisonMarkersImp.GetAt(holdnum) as ObjectReference
    ObjectReference GarrisonMarkerSons = GarrisonMarkersSons.GetAt(holdnum) as ObjectReference
    
    if VanillaCity.GetKeywordData(CWOwner) == 1 || GarrisonMarkerImp.IsEnabled()
        VanillaCity.SetKeywordData(CWOwner, 1)
    elseif VanillaCity.GetKeywordData(CWOwner) == 2 || GarrisonMarkerSons.IsEnabled()
        VanillaCity.SetKeywordData(CWOwner, 2)
    endif
EndFunction

Auto State NotSetUp

    Event OnUpdate()
        SetUp()
        GoToState("SetUp")
    EndEvent
    
EndState