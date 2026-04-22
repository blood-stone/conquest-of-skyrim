Scriptname CS_PlacedObjectActivator extends ObjectReference  

import CS_CommonFunctions

Activator Property BuildingPlacementActivator Auto

ObjectReference Property BuildingChest Auto hidden
ObjectReference Property CityManagementActivator Auto hidden
ObjectReference Property ActivatorMarker Auto hidden
ObjectReference[] Property PlacedIdles Auto hidden

string[] Property Nodes Auto
Furniture[] Property Idles Auto
ObjectReference[] Property IdleMarkerRefs Auto
Faction[] Property FactionOwners Auto
ActorBase[] Property ActorOwners Auto

ReferenceAlias Property FactionName Auto

Message Property CS_PlaceObjectMove Auto
Message Property ActivatorMessage Auto

;CS_CityManagementReportScript Property CS_CityManagementReport Auto
CS_SettlementManagementScript Property CS_SettlementManagementReport Auto
CS_BuildingManagementMenu Property CS_BuildingManagementReport Auto

Function InitialSetUp(ObjectReference ManagementActivator)
    CityManagementActivator = ManagementActivator
    if ((self as ObjectReference).GetBaseObject() as Furniture)
        BlockActivation()
    endif
    if ActorOwners
        SetActorOwner(ActorOwners[0])
    elseif FactionOwners
        SetFactionOwner(FactionOwners[0])
    endif
    while !Is3DLoaded()
        utility.wait(0.1)
    endwhile
    PlaceIdles()
EndFunction

Function MoveObject()
    disable()
    DisableIdles()
    if ActivatorMarker
        ActivatorMarker.disable()
    endif
    ObjectReference BannerFlag
    if ((self as ObjectReference) as CS_ManageHolding)
        BannerFlag = ((self as ObjectReference) as CS_ManageHolding).BannerFlag
        ((self as ObjectReference) as CS_ManageHolding).DisableBanner()
    endif
    
    ObjectReference BuildingPlacement = Game.GetPlayer().PlaceAtMe(BuildingPlacementActivator, abForcePersist = true, abInitiallyDisabled = true)
    BuildingPlacement.EnableNoWait()
    ObjectReference BuildingActivatorRef = (BuildingPlacement as CS_PlaceObject).BeginPlacement((CityManagementActivator as CS_CityManagementOwnership).VanillaCity)
    if BuildingActivatorRef
        
        BuildingPlacement.disable()
        BuildingPlacement.delete()
        
        if (BuildingActivatorRef as CS_BuildingManagementScript)
            
            MoveTo(BuildingActivatorRef)
            BuildingActivatorRef.delete()
            EnableNoWait()
            
        else
        
            BuildingActivatorRef.EnableNoWait()

            if ActivatorMarker
                (BuildingActivatorRef as CS_PlacedObjectActivatorMarker).InitialSetUp(CityManagementActivator)
                ObjectReference ActivatorMarkerToDelete = ActivatorMarker
                ActivatorMarker = None
                ActivatorMarkerToDelete.delete()
            else
                (BuildingActivatorRef as CS_PlacedObjectActivator).InitialSetUp(CityManagementActivator)
            endif;/
            if ((self as ObjectReference) as CS_ManageHolding)
                ((self as ObjectReference) as CS_ManageHolding).RemoveBanner()
            endif/;
            
            if (BuildingActivatorRef as CS_ManageHolding)
                FactionName.ForceRefTo(BuildingActivatorRef)
                FactionName.Clear()
                ObjectReference NewBannerFlag = BannerFlag
                NewBannerFlag.EnableNoWait()
                NewBannerFlag.MoveTo(BuildingActivatorRef, afXOffset=3, afZOffset=390)
                BuildingActivatorRef.SetAngle(0, 0, BuildingActivatorRef.GetAngleZ() + 180)
                (NewBannerFlag as CS_FlagChangerMiscScript).PlaceBanner()
                (BuildingActivatorRef as CS_ManageHolding).BannerFlag = NewBannerFlag
            endif
            
            RemoveIdles()
            
            delete()
        endif
    else
        
        BuildingPlacement.disable()
        BuildingPlacement.delete()
        enable()
        ActivatorMarker.enable()
        if ((self as ObjectReference) as CS_ManageHolding)
            ((self as ObjectReference) as CS_ManageHolding).EnableBanner()
        endif
        
    endif
EndFunction

Function DeleteObject()
    RemoveIdles()
    
    if ((self as ObjectReference) as CS_ManageHolding)
        (CityManagementActivator as CS_CityManagementOwnership).RemoveBanner(self as ObjectReference)
        ((self as ObjectReference) as CS_ManageHolding).RemoveBanner()
    endif
        
    delete()
EndFunction

Function PlaceIdles()
    PlacedIdles = GetNewArray(Nodes.Length)
    
    int i = 0
    while i < Nodes.Length
        ObjectReference PlacedIdle
        if Idles && Idles[i]
            PlacedIdle = PlaceAtMe(Idles[i])
        elseif IdleMarkerRefs && IdleMarkerRefs[i]
            PlacedIdle = PlaceAtMe(IdleMarkerRefs[i].GetBaseObject())
        endif
        
        PlacedIdle.MoveToNode(self as ObjectReference, Nodes[i])
        if ActorOwners && ActorOwners[i]
            PlacedIdle.SetActorOwner(ActorOwners[i])
        elseif FactionOwners && FactionOwners[i]
            PlacedIdle.SetFactionOwner(FactionOwners[i])
        endif
        PlacedIdles[i] = PlacedIdle
        i += 1
    endwhile
EndFunction

Function MoveIdles(ObjectReference NewRef)
    while !NewRef.Is3DLoaded()
        utility.wait(0.1)
    endwhile
    int i = 0
    while i < PlacedIdles.Length
        PlacedIdles[i].MoveToNode(NewRef, Nodes[i])
        PlacedIdles[i].enable()
        i += 1
    endwhile
EndFunction

Function DisableIdles()
    int i = 0
    while i < PlacedIdles.Length
        ObjectReference PlacedIdle = PlacedIdles[i]
        PlacedIdles[i] = None
        PlacedIdle.disable()
        i += 1
    endwhile
EndFunction

Function RemoveIdles()
    int i = 0
    while i < PlacedIdles.Length
        ObjectReference PlacedIdle = PlacedIdles[i]
        PlacedIdles[i] = None
        PlacedIdle.disable()
        PlacedIdle.delete()
        i += 1
    endwhile
EndFunction

Auto State CanActivate
    
    Event OnActivate(ObjectReference akActionRef)
        
        GoToState("Activating")
        if akActionRef == Game.GetPlayer()
            if (akActionRef as Actor).IsSneaking()
                int Response = CS_PlaceObjectMove.show()
                if Response == 0
                    disable()
                    MoveObject()
                elseif Response == 2
                    DeleteObject()
                endif
            elseif ((self as ObjectReference) as CS_ManageHolding)
                CS_SettlementManagementReport.Stop()
                CS_SettlementManagementReport.Start()
                CS_SettlementManagementReport.Menu(CityManagementActivator)
            elseif ((self as ObjectReference) as CS_BuildingManagementScript)
                CS_BuildingManagementReport.Stop()
                CS_BuildingManagementReport.Start()
                CS_BuildingManagementReport.Menu(self as ObjectReference)
            else
                BlockActivation(false)
                Activate(akActionRef)
                BlockActivation(true)
            endif
        endif
        GoToState("CanActivate")
        
    EndEvent
    
EndState