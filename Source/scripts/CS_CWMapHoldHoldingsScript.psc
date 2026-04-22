Scriptname CS_CWMapHoldHoldingsScript extends ObjectReference  

CS_BattleSpaceRegionAll Property BattleSpace Auto

ObjectReference RefOfCityFlag
ObjectReference RefOfFortFlag
ObjectReference Village1Flag
ObjectReference Village2Flag

Function TryToRemoveFlags()
    
    if RefOfCityFlag
        ObjectReference FlagToDelete = RefOfCityFlag
        RefOfCityFlag = None
        FlagToDelete.disable()
        FlagToDelete.delete()
    endif
    
    if RefOfFortFlag
        ObjectReference FlagToDelete = RefOfFortFlag
        RefOfFortFlag = None
        FlagToDelete.disable()
        FlagToDelete.delete()
    endif
    
    if Village1Flag
        ObjectReference FlagToDelete = Village1Flag
        Village1Flag = None
        FlagToDelete.disable()
        FlagToDelete.delete()
    endif
    
    if Village2Flag
        ObjectReference FlagToDelete = Village2Flag
        Village2Flag = None
        FlagToDelete.disable()
        FlagToDelete.delete()
    endif
EndFunction

Function TryToPlaceFlags()
    BattleSpace = ((self as ObjectReference) as CS_CWMapActivatorHoldScript).BattleSpace
    
    TryToPlaceCityFlag()
    TryToPlaceFortFlag()
    ;TryToPlaceVillage1Flag()
    ;TryToPlaceVillage2Flag()
EndFunction

Function TryToPlaceCityFlag()
    ObjectReference HoldCity = BattleSpace.City
    ObjectReference CityOwner = (HoldCity as CS_CityManagementOwnership).FactionOwnerActivator
    if (CityOwner as CS_FactionManagementOwnership).FactionOwnerActivator
        CityOwner = (CityOwner as CS_FactionManagementOwnership).FactionOwnerActivator
    endif
    Static OwnerFlag = (CityOwner as CS_FactionManagementDiplomacy).MapFlag
    if CityOwner == BattleSpace.CS_FactionPlayer
        RefOfCityFlag = PlaceAtMe(OwnerFlag, abInitiallyDisabled = true)
        RefOfCityFlag.MoveToNode(self, "City")
        RefOfCityFlag.SetScale(1.5)
    else
        RefOfCityFlag = PlaceAtMe(OwnerFlag, abInitiallyDisabled = true)
        RefOfCityFlag.MoveToNode(self, "City")
        RefOfCityFlag.SetAngle(RefOfCityFlag.GetAngleX(), RefOfCityFlag.GetAngleY(), afZAngle = RefOfCityFlag.GetAngleZ() + 180)
    EndIf
    RefOfCityFlag.EnableNoWait()
EndFunction

Function TryToPlaceFortFlag()
    ObjectReference HoldFort = (BattleSpace as CS_BattleSpaceRegionAll).Fort
    ObjectReference FortOwner = (HoldFort as CS_FortManagementScript).FactionOwnerActivator
    if (FortOwner as CS_FactionManagementOwnership).FactionOwnerActivator
        FortOwner = (FortOwner as CS_FactionManagementOwnership).FactionOwnerActivator
    endif
    Static OwnerFlag = (FortOwner as CS_FactionManagementDiplomacy).MapFlag
    if FortOwner == BattleSpace.CS_FactionPlayer
        RefOfFortFlag = PlaceAtMe(OwnerFlag, abInitiallyDisabled = true)
        RefOfFortFlag.MoveToNode(self, "Fort")
        RefOfFortFlag.SetScale(1.5)
    else
        RefOfFortFlag = PlaceAtMe(OwnerFlag, abInitiallyDisabled = true)
        RefOfFortFlag.MoveToNode(self, "Fort")
        RefOfFortFlag.SetAngle(RefOfFortFlag.GetAngleX(), RefOfFortFlag.GetAngleY(), afZAngle = RefOfFortFlag.GetAngleZ() + 180)
    EndIf
    RefOfFortFlag.EnableNoWait()
EndFunction

State ResetFlags

    Event OnUpdate()
        
        TryToRemoveFlags()
        TryToPlaceFlags()
        
    EndEvent
    
EndState

State RemoveFlags

    Event OnUpdate()
        
        TryToRemoveFlags()
        
    EndEvent
    
EndState