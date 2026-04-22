Scriptname CS_CWMapActivatorHoldScript extends ObjectReference  


int Property holdnum Auto

CS_BattleSpaceRegionAll Property BattleSpace Auto

Location Property TownLoc Auto
Location Property FortLoc Auto
Location Property HoldLoc Auto
Location Property VillageLoc Auto
Location Property VillageLoc2 Auto

ObjectReference Property OldMap Auto

ObjectReference Property CampMarkerImp Auto
ObjectReference Property CampMarkerSons Auto
ObjectReference Property CampMarkerPlayer Auto

GlobalVariable Property BannerNum Auto

Keyword Property CWOwner Auto
Keyword Property LandSuperiority Auto
Keyword Property Patrol1 Auto
Keyword Property Patrol2 Auto
Keyword Property Patrol3 Auto
Keyword Property Patrol4 Auto

ObjectReference Property TownFlag Auto Hidden
ObjectReference Property FortFlag Auto Hidden
ObjectReference Property VillageFlag Auto Hidden
ObjectReference Property Village2Flag Auto Hidden
ObjectReference Property TownFlagActivator Auto Hidden
ObjectReference Property FortFlagActivator Auto Hidden
ObjectReference Property VillageFlagActivator Auto Hidden
ObjectReference Property Village2FlagActivator Auto Hidden
ObjectReference Property Patrol1Flag Auto Hidden
ObjectReference Property Patrol2Flag Auto Hidden
ObjectReference Property Patrol3Flag Auto Hidden
ObjectReference Property Patrol4Flag Auto Hidden
ObjectReference Property CampImpFlag Auto Hidden
ObjectReference Property CampSonsFlag Auto Hidden
ObjectReference Property CampPlayerFlag Auto Hidden
ObjectReference Property CampImpFlagActivator Auto Hidden
ObjectReference Property CampSonsFlagActivator Auto Hidden
ObjectReference Property CampPlayerFlagActivator Auto Hidden
ObjectReference Property BackButtonRef Auto Hidden
ObjectReference Property BackButtonRefStatic Auto Hidden
;References to all of the placed flags

FormList Property PlayerMapFlags Auto
FormList Property AllLocations Auto
FormList Property AllLocationsCS Auto
FormList Property AllLocationsFort Auto
FormList Property CampMarkersImp Auto
FormList Property CampMarkersSons Auto
FormList Property CampMarkersPlayer Auto

FormList Property EnemyTownActivators Auto
FormList Property EnemyFortActivators Auto
FormList Property PlayerTownActivators Auto
FormList Property PlayerFortActivators Auto
Activator Property PlayerTownActivator Auto
Activator Property EnemyTownActivator Auto
Activator Property PlayerFortActivator Auto
Activator Property EnemyFortActivator Auto
Activator Property EnemyVillageActivator Auto
Activator Property EnemyVillage2Activator Auto
Activator Property EnemyCampImpActivator Auto
Activator Property EnemyCampSonsActivator Auto
Activator Property PlayerCampActivator Auto
Activator Property BackButton Auto

bool Property IsVisual Auto

Static Property ImpFlag Auto
Static Property SonsFlag Auto
Static Property BackFlag Auto
Static Property PlayerFlag Auto

CS_TMScript Property TMDataImp Auto
CS_TMScript Property TMDataSons Auto

ObjectReference Property CS_FactionMajorEmpireSkyrim Auto
ObjectReference Property CS_FactionMajorSons Auto
ObjectReference Property CS_FactionPlayer Auto

Function TryToRemoveFlag(ObjectReference FlagRef)

    if FlagRef
        FlagRef.disable()
        FlagRef.delete()
    endif
    
EndFunction

Function RemoveAllFlags()
    
    PlayerFlag = PlayerMapFlags.GetAt(BannerNum.GetValueInt()) as Static

    debug.trace("Removing all flags")
    if BackButtonRef
        ObjectReference BackButtonToDelete = BackButtonRef
        BackButtonRef = None
        BackButtonToDelete.disable()
        BackButtonToDelete.delete()
    endif
     
    TryToRemoveFlag(TownFlagActivator) 
    TryToRemoveFlag(FortFlagActivator)
    TryToRemoveFlag(CampImpFlagActivator) 
    TryToRemoveFlag(CampSonsFlagActivator) 
    TryToRemoveFlag(CampPlayerFlagActivator)

    ((self as ObjectReference) as CS_CWMapHoldCampsScript).GoToState("RemoveFlags")
    ((self as ObjectReference) as CS_CWMapHoldHoldingsScript).GoToState("RemoveFlags")
    ((self as ObjectReference) as CS_CWMapHoldPatrolsScript).GoToState("RemoveFlags")
    RegisterForSingleUpdate(0.1)
    
    TryToRemoveFlag(BackButtonRefStatic)
    BattleSpace.MapToReset = None

EndFunction

Function TryToPlaceFlags()

    debug.trace("Placing all flags")
    
    PlayerFlag = PlayerMapFlags.GetAt(BannerNum.GetValueInt()) as Static

    BackButtonRef = self.PlaceAtMe(BackButton, abInitiallyDisabled = true)
    ;BackButtonRef.BlockActivation()
    (BackButtonRef as CS_CWMapBackButtonScript).HoldMap = self
    (BackButtonRef as CS_CWMapBackButtonScript).WholeMap = OldMap
    BackButtonRef.MoveToNode(self, "BackButton")
    BackButtonRefStatic = BackButtonRef.PlaceAtMe(BackFlag, abInitiallyDisabled = true)
    BackButtonRef.SetScale(1.17)
    BackButtonRefStatic.SetScale(2)
    IsVisual = (OldMap as CS_CivilWarMapActivatorScript).IsVisual
    
    ((self as ObjectReference) as CS_CWMapHoldCampsScript).GoToState("ResetFlags")
    ((self as ObjectReference) as CS_CWMapHoldHoldingsScript).GoToState("ResetFlags")
    ((self as ObjectReference) as CS_CWMapHoldPatrolsScript).GoToState("ResetFlags")
    RegisterForSingleUpdate(0.1)
    
    TownFlagActivator = TryToPlaceActivatorFlag(TownLoc, "City", TownFlagActivator, PlayerTownActivator, EnemyTownActivator)
    FortFlagActivator = TryToPlaceActivatorFlag(FortLoc, "Fort", FortFlagActivator, PlayerFortActivator, EnemyFortActivator)
    CampImpFlagActivator = TryToPlaceActivatorFlag(None, "CampImp", CampImpFlagActivator, PlayerCampActivator, EnemyCampImpActivator, CampMarkerImp)
    CampSonsFlagActivator = TryToPlaceActivatorFlag(None, "CampSons", CampSonsFlagActivator, PlayerCampActivator, EnemyCampSonsActivator, CampMarkerSons)
    CampPlayerFlagActivator = TryToPlaceActivatorFlag(None, "CampPlayer", CampPlayerFlagActivator, PlayerCampActivator, EnemyCampImpActivator, CampMarkerPlayer)

    EnableAllFlags()
    BattleSpace.MapToReset = self as ObjectReference

EndFunction

ObjectReference Function TryToPlaceFlag(ObjectReference Holding, string node, ObjectReference CampMarker = None)

    ObjectReference PlacedFlag

    Static FlagToPlace
    float NewScale = 1
    if node == "Patrol1" && BattleSpace.PatrolRegiments[0]
        FlagToPlace = (BattleSpace.BattleSpaceOwner as CS_FactionManagementDiplomacy).MapFlag
        NewScale = 0.5
    elseif node == "Patrol2" && BattleSpace.PatrolRegiments[1]
        FlagToPlace = (BattleSpace.BattleSpaceOwner as CS_FactionManagementDiplomacy).MapFlag
        NewScale = 0.5
    elseif node == "Patrol3" && BattleSpace.PatrolRegiments[2]
        FlagToPlace = (BattleSpace.BattleSpaceOwner as CS_FactionManagementDiplomacy).MapFlag
        NewScale = 0.5
    elseif node == "Patrol4" && BattleSpace.PatrolRegiments[3]
        FlagToPlace = (BattleSpace.BattleSpaceOwner as CS_FactionManagementDiplomacy).MapFlag
        NewScale = 0.5
    elseif node == "CampImp" && CampMarker.IsEnabled()
        FlagToPlace = ImpFlag
        NewScale = 0.75
    elseif node == "CampSons" && CampMarker.IsEnabled()
        FlagToPlace = SonsFlag
        NewScale = 0.75
    elseif node == "CampPlayer" && CampMarker.IsEnabled()
        FlagToPlace = (CS_FactionPlayer as CS_FactionManagementDiplomacy).MapFlag
        NewScale = 1.5
    elseif node == "City" || node == "Fort" || node == "Village" || node == "Village2"
        FlagToPlace = (BattleSpace.BattleSpaceOwner as CS_FactionManagementDiplomacy).MapFlag
        if BattleSpace.BattleSpaceOwner == CS_FactionPlayer
            NewScale = 2
        endif
    else
        return None
    endif
    
    PlacedFlag = self.PlaceAtMe(FlagToPlace, abInitiallyDisabled = true)
    PlacedFlag.SetScale(NewScale)

    PlacedFlag.MoveToNode(self, node)
    
    return PlacedFlag
    
EndFunction

ObjectReference Function TryToPlaceActivatorFlag(Location Loc, string node, ObjectReference FlagActivatorRef, Activator PlayerFlagActivator, Activator EnemyFlagActivator, ObjectReference CampMarker = None)

    Int Owner
    float NewScale = 1
    ObjectReference Holding
    if node == "CampImp" && CampMarker.IsEnabled()
        Holding = BattleSpace.CampManagementActivators[1]
        Owner = 1
        NewScale = 0.75
    elseif node == "CampSons" && CampMarker.IsEnabled()
        Holding = BattleSpace.CampManagementActivators[2]
        Owner = 2
        NewScale = 0.75
    elseif node == "CampPlayer" && CampMarker.IsEnabled()
        Holding = BattleSpace.CampManagementActivators[0]
        Owner = 69
        NewScale = 1.5
    elseif node == "Fort" || node == "City"
        Owner = Loc.GetKeywordData(CWOwner) as int
        if Owner == 69
            NewScale = 2
        endif
        
        if node == "Fort"
            Holding = BattleSpace.Fort
        elseif node == "City"
            Holding = BattleSpace.City
        endif
    endif    
            
    if Owner != 0
    
        if Owner == 1 || Owner == 2
            FlagActivatorRef = self.PlaceAtMe(EnemyFlagActivator, abInitiallyDisabled = true)
            ;FlagActivatorRef.SetAngle(FlagActivatorRef.GetAngleX(), FlagActivatorRef.GetAngleY(), afZAngle = FlagActivatorRef.GetAngleZ() + 180)
        else
            FlagActivatorRef = self.PlaceAtMe(PlayerFlagActivator, abInitiallyDisabled = true)
        endif
        (FlagActivatorRef as CS_WarMapHoldingSelectScript).Holding = Holding
        FlagActivatorRef.SetScale(NewScale)  
        FlagActivatorRef.MoveToNode(self, node)
        
    endif
    
    return FlagActivatorRef
    
EndFunction

Function EnableAllFlags()

    debug.trace("Enabling all flags")
    
    EnableFlag(TownFlag) 
    EnableFlag(FortFlag)
    EnableFlag(VillageFlag) 
    EnableFlag(Village2Flag)
    EnableFlag(Patrol1Flag) 
    EnableFlag(Patrol2Flag)
    EnableFlag(Patrol3Flag) 
    EnableFlag(Patrol4Flag) 
    EnableFlag(CampImpFlag) 
    EnableFlag(CampSonsFlag) 
    EnableFlag(CampPlayerFlag)
    
    EnableFlag(TownFlagActivator) 
    EnableFlag(FortFlagActivator)
    EnableFlag(CampImpFlagActivator) 
    EnableFlag(CampSonsFlagActivator) 
    EnableFlag(CampPlayerFlagActivator)
    
    EnableFlag(BackButtonRef)
    EnableFlag(BackButtonRefStatic)

EndFunction

Function EnableFlag(ObjectReference Flag)
    if Flag
        Flag.EnableNoWait()
        ;/
        if Flag.GetBaseObject() != (CS_FactionPlayer as CS_FactionManagementDiplomacy).MapFlag
            Flag.SetAngle(Flag.GetAngleX(), Flag.GetAngleY(), afZAngle = Flag.GetAngleZ() + 180)
        endif/;
    endif
EndFunction

Function ResetFlags()

    RemoveAllFlags()

    if Is3DLoaded()
        TryToPlaceFlags()
    endif

EndFunction

Event OnCellAttach()

        ResetFlags()

EndEvent