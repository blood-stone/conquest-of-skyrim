Scriptname CS_CWMapActivatorHoldScript extends ObjectReference  


int Property holdnum Auto

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

Function TryToRemoveFlag(ObjectReference FlagRef)

    if FlagRef
        FlagRef.disable()
        FlagRef.delete()
    endif
    
EndFunction

Function RemoveAllFlags()
    
    PlayerFlag = PlayerMapFlags.GetAt(BannerNum.GetValueInt()) as Static

    debug.trace("Removing all flags")
    
     
    TryToRemoveFlag(TownFlagActivator) 
    TryToRemoveFlag(FortFlagActivator)
    TryToRemoveFlag(CampImpFlagActivator) 
    TryToRemoveFlag(CampSonsFlagActivator) 
    TryToRemoveFlag(CampPlayerFlagActivator)

    TryToRemoveFlag(TownFlag) 
    TryToRemoveFlag(FortFlag)
    TryToRemoveFlag(VillageFlag) 
    TryToRemoveFlag(Village2Flag)
    TryToRemoveFlag(Patrol1Flag) 
    TryToRemoveFlag(Patrol2Flag)
    TryToRemoveFlag(Patrol3Flag) 
    TryToRemoveFlag(Patrol4Flag) 
    TryToRemoveFlag(CampImpFlag) 
    TryToRemoveFlag(CampSonsFlag) 
    TryToRemoveFlag(CampPlayerFlag)
    TryToRemoveFlag(BackButtonRef)
    TryToRemoveFlag(BackButtonRefStatic)

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
    
    TownFlag = TryToPlaceFlag(TownLoc, HoldLoc, "City", TownFlag)
    FortFlag = TryToPlaceFlag(FortLoc, HoldLoc, "Fort", FortFlag)
    VillageFlag = TryToPlaceFlag(VillageLoc, HoldLoc, "Village", VillageFlag)
    Village2Flag = TryToPlaceFlag(VillageLoc2, HoldLoc, "Village2", Village2Flag)
    CampImpFlag = TryToPlaceFlag(None, HoldLoc, "CampImp", CampImpFlag, CampMarkerImp)
    CampSonsFlag = TryToPlaceFlag(None, HoldLoc, "CampSons", CampSonsFlag, CampMarkerSons)
    CampPlayerFlag = TryToPlaceFlag(None, HoldLoc, "CampPlayer", CampPlayerFlag, CampMarkerPlayer)
    Patrol1Flag = TryToPlaceFlag(None, HoldLoc, "Patrol1", Patrol1Flag, None, Patrol1)
    Patrol2Flag = TryToPlaceFlag(None, HoldLoc, "Patrol2", Patrol2Flag, None, Patrol2)
    Patrol3Flag = TryToPlaceFlag(None, HoldLoc, "Patrol3", Patrol3Flag, None, Patrol3)
    Patrol4Flag = TryToPlaceFlag(None, HoldLoc, "Patrol4", Patrol4Flag, None, Patrol4)
    
    TownFlagActivator = TryToPlaceActivatorFlag(TownLoc, "City", TownFlagActivator, PlayerTownActivator, EnemyTownActivator)
    FortFlagActivator = TryToPlaceActivatorFlag(FortLoc, "Fort", FortFlagActivator, PlayerFortActivator, EnemyFortActivator)
    CampImpFlagActivator = TryToPlaceActivatorFlag(None, "CampImp", CampImpFlagActivator, PlayerCampActivator, EnemyCampImpActivator, CampMarkerImp)
    CampSonsFlagActivator = TryToPlaceActivatorFlag(None, "CampSons", CampSonsFlagActivator, PlayerCampActivator, EnemyCampSonsActivator, CampMarkerSons)
    CampPlayerFlagActivator = TryToPlaceActivatorFlag(None, "CampPlayer", CampPlayerFlagActivator, PlayerCampActivator, EnemyCampImpActivator, CampMarkerPlayer)

    EnableAllFlags()

EndFunction

ObjectReference Function TryToPlaceFlag(Location Loc, Location LocCS, string node, ObjectReference PlacedFlag, ObjectReference CampMarker = None, Keyword PatrolKeyword = None)

    if Loc || CampMarker || PatrolKeyword

        Int Owner
        float NewScale = 1
        if node == "Patrol1" || node == "Patrol2" || node == "Patrol3" || node == "Patrol4"
            int PatrolInt = LocCS.GetKeywordData(PatrolKeyword) as int
            if PatrolInt != -1
                int LandSuperiorityInt = LocCS.GetKeywordData(LandSuperiority) as int
                if LandSuperiorityInt == 11
                    Owner = 1
                    NewScale = 0.5
                elseif LandSuperiorityInt == 12
                    Owner = 2
                    NewScale = 0.5
                elseif LandSuperiorityInt == 1
                    Owner = 69
                else
                    Owner = 0
                endif
            else
                Owner = 0
            endif
        elseif node == "CampImp" && CampMarker.IsEnabled()
            Owner = 1
            NewScale = 0.75
        elseif node == "CampSons" && CampMarker.IsEnabled()
            Owner = 2
            NewScale = 0.75
        elseif node == "CampPlayer" && CampMarker.IsEnabled()
            Owner = 69
            NewScale = 1.5
        elseif node == "City" || node == "Fort" || node == "Village" || node == "Village2"
            Owner = Loc.GetKeywordData(CWOwner) as int
            if Owner == 69
                NewScale = 2
            endif
        else
            Owner = 0
        endif
        
        if Owner != 0
            
            if Owner == 1
                PlacedFlag = self.PlaceAtMe(ImpFlag, abInitiallyDisabled = true)
                ;PlacedFlag.SetAngle(PlacedFlag.GetAngleX(), PlacedFlag.GetAngleY(), afZAngle = PlacedFlag.GetAngleZ() + 180)
            elseif Owner == 2
                PlacedFlag = self.PlaceAtMe(SonsFlag, abInitiallyDisabled = true)
                ;PlacedFlag.SetAngle(PlacedFlag.GetAngleX(), PlacedFlag.GetAngleY(), afZAngle = PlacedFlag.GetAngleZ() + 180)
            elseif Owner == 69
                PlayerFlag = PlayerMapFlags.GetAt(BannerNum.GetValueInt()) as Static
                PlacedFlag = self.PlaceAtMe(PlayerFlag, abInitiallyDisabled = true)
            endif
            PlacedFlag.SetScale(NewScale)
        
            PlacedFlag.MoveToNode(self, node)
            
        endif
        
        return PlacedFlag
        
    else
        
        debug.trace("Did not find " + node)
        return None
        
    endif
    
EndFunction

ObjectReference Function TryToPlaceActivatorFlag(Location Loc, string node, ObjectReference FlagActivatorRef, Activator PlayerFlagActivator, Activator EnemyFlagActivator, ObjectReference CampMarker = None)

    Int Owner
    float NewScale = 1
    if node == "CampImp" && CampMarker.IsEnabled()
        Owner = 1
        NewScale = 0.75
    elseif node == "CampSons" && CampMarker.IsEnabled()
        Owner = 2
        NewScale = 0.75
    elseif node == "CampPlayer" && CampMarker.IsEnabled()
        Owner = 69
        NewScale = 1.5
    elseif node == "Fort" || node == "City"
        Owner = Loc.GetKeywordData(CWOwner) as int
        if Owner == 69
            NewScale = 2
        endif
    endif    
            
    if Owner != 0
    
        if Owner == 1 || Owner == 2
            FlagActivatorRef = self.PlaceAtMe(EnemyFlagActivator, abInitiallyDisabled = true)
            ;FlagActivatorRef.SetAngle(FlagActivatorRef.GetAngleX(), FlagActivatorRef.GetAngleY(), afZAngle = FlagActivatorRef.GetAngleZ() + 180)
        else
            FlagActivatorRef = self.PlaceAtMe(PlayerFlagActivator, abInitiallyDisabled = true)
        endif
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