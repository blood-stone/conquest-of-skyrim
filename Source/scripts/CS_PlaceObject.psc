Scriptname CS_PlaceObject extends ObjectReference  

Message Property CS_PlaceObjectConfirmation Auto

Activator Property PlacedBuildingActivator Auto
Furniture Property PlacedBuildingFurniture Auto

float Property ConstructionSiteScale=1.0 Auto

Sound Property CS_ConstructionPlacementS Auto

bool Property ForceOutdoors Auto

Auto State Placing

    Event OnActivate(ObjectReference akActivatorRef)
        if CS_PlaceObjectConfirmation.show() == 0
            ;Game.EnablePlayerControls()
            GoToState("Placed")
        else
            ;Game.EnablePlayerControls()
            GoToState("NotPlaced")
        endif
    EndEvent
    
EndState

ObjectReference Function BeginPlacement(Location PlacementLocation)
    if (ForceOutdoors && IsInInterior())
        debug.notification("Can not place in interior, cancelling placement")
        return None
    endif;/
    Game.ForceFirstPerson()
    Game.DisablePlayerControls(false, false, true, false, false, false, false)/;
    ObjectReference InvalidPlacementRef
    ObjectReference PlayerRef = Game.GetPlayer()
    float PlayerX = PlayerRef.GetPositionX()
    float PlayerY = PlayerRef.GetPositionY()
    float PlayerAngleX = PlayerRef.GetAngleX()
    float PlayerAngleY = PlayerRef.GetAngleY()
    float PlayerAngleZ = PlayerRef.GetAngleZ()
    float ZOffset = 20
    MoveTo(PlayerRef, 150.0 * Math.Sin(PlayerAngleZ), 150.0 * Math.Cos(PlayerAngleZ), -5, abMatchRotation = false)
    ;MoveTo(PlayerRef, 150.0 * Math.Sin(PlayerAngleZ), 150.0 * Math.Cos(PlayerAngleZ), -150.0 * Math.Sin(PlayerAngleX), false) ;PlayerRef.GetHeight() -220 from height
    SetAngle(0, 0, PlayerAngleZ - 90)
    Enable()
    while GetState() == "Placing"
        float NewPlayerX = PlayerRef.GetPositionX()
        float NewPlayerY = PlayerRef.GetPositionY()
        float NewPlayerAngleX = PlayerRef.GetAngleX()
        float NewPlayerAngleY = PlayerRef.GetAngleY()
        float NewPlayerAngleZ = PlayerRef.GetAngleZ()
        
        if NewPlayerX > PlayerX + 10 || NewPlayerX < PlayerX - 10 \
            || NewPlayerY > PlayerY + 10 || NewPlayerY < PlayerY - 20 \
            || NewPlayerAngleZ > (PlayerAngleZ + 5) || NewPlayerAngleZ < (PlayerAngleZ - 5) \
            || NewPlayerAngleX > (PlayerAngleX + 2) || NewPlayerAngleX < (PlayerAngleX - 2)
            PlayerX = NewPlayerX
            PlayerY = NewPlayerY
            PlayerAngleX = NewPlayerAngleX
            PlayerAngleY = NewPlayerAngleY
            PlayerAngleZ = NewPlayerAngleZ
            ZOffset = -150.0 * Math.Sin(PlayerAngleX) + 50
            if ZOffset > 40
                ZOffset = 40
            elseif ZOffset < -40
                ZOffset = -40
            endif
            DisableNoWait()
            MoveTo(PlayerRef, 150.0 * Math.Sin(PlayerAngleZ), 150.0 * Math.Cos(PlayerAngleZ), ZOffset, abMatchRotation = false)
            ;MoveTo(PlayerRef, 150.0 * Math.Sin(PlayerAngleZ), 150.0 * Math.Cos(PlayerAngleZ), -150.0 * Math.Sin(PlayerAngleX), false)
            SetAngle(0, 0, PlayerAngleZ - 90)
            
            if IsInLocation(PlacementLocation) && (!ForceOutdoors || !IsInInterior())
                EnableNoWait(false)
            elseif !IsInLocation(PlacementLocation)
                debug.notification("Exited Location, cancelling placement")
                ;Game.EnablePlayerControls()
                return None
            elseif (ForceOutdoors && IsInInterior())
                debug.notification("Can not place in interior, cancelling placement")
                ;Game.EnablePlayerControls()
                return None
            endif
        endif
        utility.wait(0.1)
    endwhile
    
    if GetState() == "Placed"
        ObjectReference NewBuilding
        if PlacedBuildingActivator
            NewBuilding = PlaceAtMe(PlacedBuildingActivator, abForcePersist = true, abInitiallyDisabled = true)
        elseif PlacedBuildingFurniture
            NewBuilding = PlaceAtMe(PlacedBuildingFurniture, abForcePersist = true, abInitiallyDisabled = true)
        endif
        
        return NewBuilding
    else
        delete()
        return None
    endif
EndFunction