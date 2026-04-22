Scriptname CS_FlagChangerMiscScript extends ObjectReference  

ObjectReference Property PlacedFlag Auto

ObjectReference Property CityManagementActivator Auto

Function PlaceBanner()
    ObjectReference FactionOwner = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
    Form FactionFlag = (FactionOwner as CS_FactionManagementDiplomacy).FactionBanner
    
    if !PlacedFlag
        PlacedFlag = PlaceAtMe(FactionFlag, abForcePersist = true)
    else
        if PlacedFlag.GetBaseObject() != FactionFlag
            PlacedFlag.disable()
            PlacedFlag.delete()
            PlacedFlag = PlaceAtMe(FactionFlag, abForcePersist = true)
        endif
    endif
EndFunction

Function DisableBanner()
    if PlacedFlag
        ObjectReference FlagToDelete = PlacedFlag
        PlacedFlag = None
        FlagToDelete.disable()
        FlagToDelete.delete()
    endif
    disable()
EndFunction

Function RemoveBanner()
    if PlacedFlag
        ObjectReference FlagToDelete = PlacedFlag
        PlacedFlag = None
        FlagToDelete.disable()
        FlagToDelete.delete()
    endif
    disable()
    delete()
EndFunction

Event OnCellAttach()
    PlaceBanner()
EndEvent