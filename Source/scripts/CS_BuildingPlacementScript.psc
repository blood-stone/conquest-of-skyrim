Scriptname CS_BuildingPlacementScript extends ObjectReference  

Static Property PlacementStatic Auto
ObjectReference Property PlacementStaticOverride Auto
ObjectReference Property IdleMarker Auto
Static[] Property AddOnStatics Auto
Light[] Property AddOnLights Auto
Furniture[] Property AddOnFurniture Auto

ObjectReference Property Placement Auto hidden
ObjectReference[] Property AddOnStaticPlacements Auto
ObjectReference[] Property AddOnLightPlacements Auto
ObjectReference[] Property AddOnFurniturePlacements Auto
ObjectReference[] Property AddOnIdleMarkerPlacements Auto

float Property PlacementScaleAdjustment=1.0 Auto

Activator Property PlacementActivator Auto

Faction Property WorkerFaction Auto

; Building Functions ---------------------------

Function PlaceBuilding()
    if PlacementStaticOverride
        Placement = PlaceAtMe(PlacementStaticOverride.GetBaseObject(), abInitiallyDisabled=true)
        Placement.MoveToNode(self as ObjectReference, "BuildingPlacement")
    elseif PlacementStatic
        Placement = PlaceAtMe(PlacementStatic, abInitiallyDisabled=true)
        Placement.MoveToNode(self as ObjectReference, "BuildingPlacement")
    endif
    
    PlaceAddOns()
    
    if Placement
        Placement.Enable()
        Placement.SetScale(PlacementScaleAdjustment)
    endif
    EnableAddOns()
EndFunction

Function RemoveBuilding()
    if Placement
        ObjectReference PlacementToDelete = Placement
        Placement = None
        PlacementToDelete.delete()
    endif
    
    RemoveAddOns()
EndFunction

Function MoveBuilding(Location BuildingLocation)
    ObjectReference NewPlacement = PlaceAtMe(PlacementActivator)
    
    if Placement
        Placement.disable()
    endif
    
    DisableAddOns()
    
    Disable()

    ObjectReference NewPlacementLocation = (NewPlacement as CS_PlaceObject).BeginPlacement(BuildingLocation)
    NewPlacement.delete()
    if NewPlacementLocation
        MoveTo(NewPlacementLocation)
        NewPlacementLocation.delete()
        Enable()
        utility.wait(1)
        MoveAddOns()
    endif
    
    Enable()
    
    if Placement
        Placement.enable()
    endif
    
    EnableAddOns()
EndFunction
; AddOn Functions --------------------------

Function PlaceAddOns()
    if AddOnStatics
        PlaceAddOnStatics()
    endif
    
    if AddOnLights
        PlaceAddOnLights()
    endif
    
    if AddOnFurniture
        PlaceAddOnFurniture()
    endif
    
    if IdleMarker
        PlaceAddOnIdleMarkers()
    endif
EndFunction

Function RemoveAddOns()
    if AddOnStatics
        RemoveAddOnStatics()
    endif
    
    if AddOnLights
        RemoveAddOnLights()
    endif
    
    if AddOnFurniture
        RemoveAddOnFurniture()
    endif
    
    if IdleMarker
        RemoveAddOnIdleMarkers()
    endif
EndFunction

Function MoveAddOns()
    if AddOnStatics
        MoveAddOnStatics()
    endif
    
    if AddOnLights
        MoveAddOnLights()
    endif
    
    if AddOnFurniture
        MoveAddOnFurniture()
    endif
    
    if IdleMarker
        MoveAddOnIdleMarkers()
    endif
EndFunction

Function EnableAddOns()
    if AddOnStatics
        EnableAddOnStatics()
    endif
    
    if AddOnLights
        EnableAddOnLights()
    endif
    
    if AddOnFurniture
        EnableAddOnFurniture()
    endif
EndFunction

Function DisableAddOns()
    if AddOnStatics
        DisableAddOnStatics()
    endif
    
    if AddOnLights
        DisableAddOnLights()
    endif
    
    if AddOnFurniture
        DisableAddOnFurniture()
    endif
EndFunction

Function PlaceAddOnStatics()
    int i = 0
    while i < AddOnStatics.Length
        AddOnStaticPlacements[i] = PlaceAtMe(AddOnStatics[i], abInitiallyDisabled=true)
        AddOnStaticPlacements[i].MoveToNode(self as ObjectReference, "StaticPlacement" + (i + 1))
        i += 1
    endwhile
EndFunction

Function PlaceAddOnLights()
    int i = 0
    while i < AddOnLights.Length
        AddOnLightPlacements[i] = PlaceAtMe(AddOnLights[i], abInitiallyDisabled=true)
        AddOnLightPlacements[i].MoveToNode(self as ObjectReference, "LightPlacement" + (i + 1))
        i += 1
    endwhile
EndFunction

Function PlaceAddOnFurniture()
    int i = 0
    while i < AddOnFurniture.Length
        AddOnFurniturePlacements[i] = PlaceAtMe(AddOnFurniture[i], abInitiallyDisabled=true)
        if Is3DLoaded()
            AddOnFurniturePlacements[i].MoveToNode(self as ObjectReference, "FurniturePlacement" + (i + 1))
        endif
        AddOnFurniturePlacements[i].SetFactionOwner(WorkerFaction)
        i += 1
    endwhile
EndFunction

Function PlaceAddOnIdleMarkers()
    int i = 0
    while i < AddOnIdleMarkerPlacements.Length
        AddOnIdleMarkerPlacements[i] = PlaceAtMe(IdleMarker.GetBaseObject(), abInitiallyDisabled=false)
        AddOnIdleMarkerPlacements[i].MoveToNode(self as ObjectReference, "IdleMarkerPlacement" + (i + 1))
        AddOnIdleMarkerPlacements[i].SetFactionOwner(WorkerFaction)
        i += 1
    endwhile
EndFunction

Function RemoveAddOnStatics()
    int i = 0
    while i < AddOnStatics.Length
        ObjectReference RefToDelete = AddOnStaticPlacements[i]
        AddOnStaticPlacements[i] = None
        RefToDelete.delete()
        i += 1
    endwhile
EndFunction

Function RemoveAddOnLights()
    int i = 0
    while i < AddOnLights.Length
        ObjectReference RefToDelete = AddOnLightPlacements[i]
        AddOnLightPlacements[i] = None
        RefToDelete.delete()
        i += 1
    endwhile
EndFunction

Function RemoveAddOnFurniture()
    int i = 0
    while i < AddOnFurniture.Length
        ObjectReference RefToDelete = AddOnFurniturePlacements[i]
        AddOnFurniturePlacements[i] = None
        RefToDelete.delete()
        i += 1
    endwhile
EndFunction

Function RemoveAddOnIdleMarkers()
    int i = 0
    while i < AddOnIdleMarkerPlacements.Length
        ObjectReference RefToDelete = AddOnIdleMarkerPlacements[i]
        AddOnIdleMarkerPlacements[i] = None
        RefToDelete.delete()
        i += 1
    endwhile
EndFunction

Function EnableAddOnStatics()
    int i = 0
    while i < AddOnStatics.Length
        AddOnStaticPlacements[i].EnableNoWait()
        i += 1
    endwhile
EndFunction

Function EnableAddOnLights()
    int i = 0
    while i < AddOnLights.Length
        AddOnLightPlacements[i].EnableNoWait()
        i += 1
    endwhile
EndFunction

Function EnableAddOnFurniture()
    int i = 0
    while i < AddOnFurniture.Length
        AddOnFurniturePlacements[i].EnableNoWait()
        i += 1
    endwhile
EndFunction

Function DisableAddOnStatics()
    int i = 0
    while i < AddOnStatics.Length
        AddOnStaticPlacements[i].DisableNoWait()
        i += 1
    endwhile
EndFunction

Function DisableAddOnLights()
    int i = 0
    while i < AddOnLights.Length
        AddOnLightPlacements[i].DisableNoWait()
        i += 1
    endwhile
EndFunction

Function DisableAddOnFurniture()
    int i = 0
    while i < AddOnFurniture.Length
        AddOnFurniturePlacements[i].DisableNoWait()
        i += 1
    endwhile
EndFunction

Function MoveAddOnStatics()
    int i = 0
    while i < AddOnStatics.Length
        AddOnStaticPlacements[i].MoveToNode(self as ObjectReference, "StaticPlacement" + (i + 1))
        i += 1
    endwhile
EndFunction

Function MoveAddOnLights()
    int i = 0
    while i < AddOnLights.Length
        AddOnLightPlacements[i].MoveToNode(self as ObjectReference, "LightPlacement" + (i + 1))
        i += 1
    endwhile
EndFunction

Function MoveAddOnFurniture()
    int i = 0
    while i < AddOnFurniture.Length
        AddOnFurniturePlacements[i].MoveToNode(self as ObjectReference, "FurniturePlacement" + (i + 1))
        i += 1
    endwhile
EndFunction

Function MoveAddOnIdleMarkers()
    int i = 0
    while i < AddOnIdleMarkerPlacements.Length
        AddOnIdleMarkerPlacements[i].MoveToNode(self as ObjectReference, "IdleMarkerPlacement" + (i + 1))
        i += 1
    endwhile
EndFunction
    