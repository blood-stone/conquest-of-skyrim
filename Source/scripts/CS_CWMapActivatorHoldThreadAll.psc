Scriptname CS_CWMapActivatorHoldThreadAll extends ObjectReference  

ObjectReference RefOfFlag
ObjectReference RefOfFlagActivator
ObjectReference RefOfCityFlag
ObjectReference RefOfFortFlag

ObjectReference Property BattleSpace Auto
ObjectReference Property HoldCity Auto
Activator Property HoldFlagActivator Auto
string Property HoldString Auto
string Property CityString Auto
string Property FortString Auto

function TryToRemoveHoldFlags()
    if RefOfFlag
        ObjectReference FlagToDisable = RefOfFlag
        RefOfFlag = None
        FlagToDisable.Disable()
        FlagToDisable.Delete()
    EndIf
    
    if RefOfFlagActivator
        ObjectReference FlagToDisable = RefOfFlagActivator
        RefOfFlagActivator = None
        FlagToDisable.Disable()
        FlagToDisable.Delete()
    endif
EndFunction

Function TryToRemoveHoldingFlags()
    
    if RefOfCityFlag
        ObjectReference FlagToDisable = RefOfCityFlag
        RefOfCityFlag = None
        FlagToDisable.Disable()
        FlagToDisable.Delete()
    EndIf
    
    if RefOfFortFlag
        ObjectReference FlagToDisable = RefOfFortFlag
        RefOfFortFlag = None
        FlagToDisable.Disable()
        FlagToDisable.Delete()
    EndIf
    (BattleSpace as CS_BattleSpaceRegionAll).HoldThreadToReset = None
    
EndFunction

Function TryToPlaceFlags()
    TryToPlaceCityFlag()
    TryToPlaceFortFlag()
    TryToPlaceHoldFlag()
    TryToPlaceHoldFlagActivator()
    (BattleSpace as CS_BattleSpaceRegionAll).HoldThreadToReset = self
EndFunction

Function TryToPlaceHoldFlag()
    ObjectReference HoldOwner = (BattleSpace as CS_BattleSpaceRegionAll).BattleSpaceOwner
    Static OwnerFlag = (HoldOwner as CS_FactionManagementDiplomacy).MapFlag
    if HoldOwner == ((self as ObjectReference) as CS_CivilWarMapActivatorScript).CS_FactionPlayer
        RefOfFlag = PlaceAtMe(OwnerFlag, abInitiallyDisabled = true)
        RefOfFlag.MoveToNode(self, HoldString)
        RefOfFlag.SetScale(2)
    else
        RefOfFlag = PlaceAtMe(OwnerFlag, abInitiallyDisabled = true)
        RefOfFlag.MoveToNode(self, HoldString)
        RefOfFlag.SetScale(1.17)
        RefOfFlag.SetAngle(RefOfFlag.GetAngleX(), RefOfFlag.GetAngleY(), afZAngle = RefOfFlag.GetAngleZ() + 180)
    endif
    RefOfFlag.EnableNoWait()
EndFunction

Function TryToPlaceHoldFlagActivator()
    ObjectReference HoldOwner = (BattleSpace as CS_BattleSpaceRegionAll).BattleSpaceOwner
    Static OwnerFlag = (HoldOwner as CS_FactionManagementDiplomacy).MapFlag

    ;/if HoldLoc.GetKeywordData(Contested) == 1
        RefOfFlagActivator = PlaceAtMe(HoldFlagActivatorsContested.GetAt(holdnum) as Activator, abInitiallyDisabled = true)
        ContestedSound.Play(self)
    else/;
        RefOfFlagActivator = PlaceAtMe(HoldFlagActivator, abInitiallyDisabled = true)
        ;endif
    ;RefOfFlagActivator.BlockActivation()
    (RefOfFlagActivator as CS_CWMapFlagActivatorZoomIn).OldMap = self
    RefOfFlagActivator.MoveToNode(self, HoldString)
    RefOfFlagActivator.SetScale(2)
    RefOfFlagActivator.EnableNoWait()
EndFunction

Function TryToPlaceCityFlag()
    ObjectReference CityOwner = (HoldCity as CS_CityManagementOwnership).FactionOwnerActivator
    if (CityOwner as CS_FactionManagementOwnership).FactionOwnerActivator
        CityOwner = (CityOwner as CS_FactionManagementOwnership).FactionOwnerActivator
    endif
    Static OwnerFlag = (CityOwner as CS_FactionManagementDiplomacy).MapFlag
    if CityOwner == ((self as ObjectReference) as CS_CivilWarMapActivatorScript).CS_FactionPlayer
        RefOfCityFlag = PlaceAtMe(OwnerFlag, abInitiallyDisabled = true)
        RefOfCityFlag.MoveToNode(self, CityString)
        RefOfCityFlag.SetScale(1.5)
    else
        RefOfCityFlag = PlaceAtMe(OwnerFlag, abInitiallyDisabled = true)
        RefOfCityFlag.MoveToNode(self, CityString)
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
    if FortOwner == ((self as ObjectReference) as CS_CivilWarMapActivatorScript).CS_FactionPlayer
        RefOfFortFlag = PlaceAtMe(OwnerFlag, abInitiallyDisabled = true)
        RefOfFortFlag.MoveToNode(self, FortString)
        RefOfFortFlag.SetScale(1.5)
    else
        RefOfFortFlag = PlaceAtMe(OwnerFlag, abInitiallyDisabled = true)
        RefOfFortFlag.MoveToNode(self, FortString)
        RefOfFortFlag.SetAngle(RefOfFortFlag.GetAngleX(), RefOfFortFlag.GetAngleY(), afZAngle = RefOfFortFlag.GetAngleZ() + 180)
    EndIf
    RefOfFortFlag.EnableNoWait()
EndFunction

State ResetFlags
    
    Event OnUpdate()
        
        GoToState("Busy")
        TryToRemoveHoldFlags()
        TryToRemoveHoldingFlags()
        TryToPlaceFlags()
        GoToState("Ready")
        
    EndEvent
    
EndState

State RemoveFlags
    
    Event OnUpdate()
        
        GoToState("Busy")
        TryToRemoveHoldFlags()
        TryToRemoveHoldingFlags()
        GoToState("Ready")
        
    EndEvent
    
EndState