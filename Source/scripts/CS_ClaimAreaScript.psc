Scriptname CS_ClaimAreaScript extends Quest  

LocationAlias Property ClaimedLocation Auto

Activator Property CS_PlayerBanner Auto
Activator Property CS_PlayerBannerPlacement Auto
Activator Property CS_FlagChangerMisc Auto
Activator Property CS_CityManagementActivator Auto

ReferenceAlias[] Property Enemies Auto

ReferenceAlias Property FactionFlag Auto
ReferenceAlias Property NameChangerBanner Auto
ReferenceAlias Property CurrentBanner Auto
ReferenceAlias Property LocationMarker Auto
ReferenceAlias PRoperty ExteriorMarker Auto
ReferenceAlias PRoperty InteriorMarker Auto
ReferenceAlias Property CityManagement Auto
ReferenceAlias Property FactionManagement Auto
ReferenceAlias Property GovBaseMarker Auto

Keyword Property CS_StoryArmy Auto
Keyword Property CS_StorySettlementWorkers Auto
Keyword Property CS_MiscMineIron Auto
Keyword Property CS_MiscMineGold Auto
Keyword Property CS_MiscMineOrc Auto
Keyword Property CS_MiscMineMoonstone Auto
Keyword Property CS_MiscType Auto

FormList Property CS_MiscHoldings Auto
FormList Property CS_MiscHoldingsVanilla Auto
FormList Property CS_ClaimedLocations Auto
FormList Property CS_ClaimedLocationActivators Auto
FormList Property CS_RecruitCommanders Auto
FormList Property CS_AllHolds Auto
FormList Property CS_AllBattleSpacesSkyrim Auto

Quest Property CS_TutorialQuests00FirstSteps Auto
Quest Property CS_ArmyRecruitment Auto
Quest Property CS_SettlementWorkersQuest Auto

Message Property CS_ClaimAreaPlaceBannerConfirm Auto
Message Property CS_ClaimAreaMessage Auto

Keyword Property CS_StoryNewFaction Auto

ObjectReference Property ChestMarker Auto
Container Property BuildingChestContainer Auto

GlobalVariable Property CS_ClaimAreaEnemiesRemaining Auto
GlobalVariable Property CS_ClaimAreaEnemiesTotal Auto

MiscObject Property Gold001 Auto

ObjectReference Property LocationMarkerTest Auto
ObjectReference Property CityPlacementMarker Auto
ObjectReference Property PlayerFactionActivator Auto

CS_FactionMilitaryUnitControl Property CS_FactionMilitaryUnitCommanders Auto

Function ReplacePlacement(ObjectReference BannerPlacement, ObjectReference NewBanner)
        
    CS_LocationMarkerScript LocationMarkerScript = LocationMarker.GetRef() as CS_LocationMarkerScript
                    
    BannerPlacement.disable()
    BannerPlacement.delete()
    
    ;NewBanner.EnableNoWait()
    
    LocationMarkerScript.Banner = NewBanner

    NameChangerBanner.ForceRefTo(NewBanner)
    NameChangerBanner.Clear()
EndFunction
    
Function PlaceNewBannerFlag(ObjectReference NewBanner, ObjectReference CityManagementActivator)
    ObjectReference NewBannerFlag = NewBanner.PlaceAtMe(CS_FlagChangerMisc, abForcePersist=true, abInitiallyDisabled = true)
    NewBanner.Enable()
    NewBannerFlag.EnableNoWait()
    NewBannerFlag.MoveTo(NewBanner, afXOffset=3, afZOffset=390)
    NewBanner.SetAngle(0, 0, NewBanner.GetAngleZ() + 180)  
    (NewBannerFlag as CS_FlagChangerMiscScript).CityManagementActivator = CityManagementActivator
    (NewBannerFlag as CS_FlagChangerMiscScript).PlaceBanner()
    
    (NewBanner as CS_ManageHolding).BannerFlag = NewBannerFlag
EndFunction

ObjectReference Function AddCityManagementActivator(Location ClaimedLoc, ObjectReference NewBanner)
    CS_FactionManagementEconomy FactionEconomy = FactionManagement.GetRef() as CS_FactionManagementEconomy
    CS_FactionManagementMilitary FactionMilitary = FactionManagement.GetRef() as CS_FactionManagementMilitary
    CS_LocationMarkerScript LocationMarkerScript = LocationMarker.GetRef() as CS_LocationMarkerScript
    ObjectReference CityManagementActivator = CityPlacementMarker.PlaceAtMe(CS_CityManagementActivator, abForcePersist=true)
    
    (CityManagementActivator as CS_CityManagementOwnership).VanillaCity = ClaimedLoc
    int holdnum = GetHoldNum(ExteriorMarker.GetRef())
    (CityManagementActivator as CS_CityManagementOwnership).holdnum = holdnum
    (CityManagementActivator as CS_CityManagementOwnership).HQExteriorMarker = ExteriorMarker.GetRef()
    (CityManagementActivator as CS_CityManagementMilitary).BattleSpace = CS_AllBattleSpacesSkyrim.GetAt(holdnum) as ObjectReference
    if InteriorMarker.GetRef()
        (CityManagementActivator as CS_CityManagementOwnership).HQInteriorMarker = InteriorMarker.GetRef()
    endif
    (CityManagementActivator as CS_CityManagementEconomy).IsSettlement = 1
    (CityManagementActivator as CS_CityManagementEconomy).GoToState("StartSetUp")
    CityManagementActivator.RegisterForSingleUpdate(0.1)
    (NewBanner as CS_PlacedObjectActivator).CityManagementActivator = CityManagementActivator
    (NewBanner as CS_ManageHolding).CityManagementActivator = CityManagementActivator
    CS_ClaimedLocations.AddForm(ClaimedLoc)
    CS_ClaimedLocationActivators.AddForm(CityManagementActivator)
    if LocationMarkerScript.InitialBuilding
        (LocationMarkerScript.InitialBuilding as CS_BuildingManagementScript).City = CityManagementActivator
        (LocationMarkerScript.InitialBuilding as CS_BuildingManagementScript).VanillaLocation = ClaimedLoc
        (LocationMarkerScript.InitialBuilding as CS_BuildingManagementScript).SetUp()
        (CityManagementActivator as CS_CityManagementEconomy).AddBuilding(LocationMarkerScript.InitialBuilding, "Mine")
    endif
    (CityManagementActivator as CS_CityManagementOwnership).AddBanner(NewBanner)
    LocationMarkerScript.VanillaLocation = ClaimedLoc
    LocationMarkerScript.GoToState("Captured")
    FactionEconomy.AddSettlement(CityManagementActivator)
    CS_FactionMilitaryUnitCommanders.CreateUnit(CityManagementActivator)
    
    return CityManagementActivator
EndFunction

int Function GetHoldNum(ObjectReference ObjectToCheck)
    int i = 0
    while i < CS_AllHolds.GetSize()
        if ObjectToCheck.IsInLocation(CS_AllHolds.GetAt(i) as Location)
            return i
        endif
        i += 1
    endwhile
    
    return -1
EndFunction

int Function CheckForEnemies()
    int i = 0
    int totalenemies = 0
    while i < Enemies.Length
        if Enemies[i].GetActorRef() && !Enemies[i].GetActorRef().IsDead()
            totalenemies += 1
        endif
        i += 1
    endwhile
    
    return totalenemies
EndFunction

Function TryToClaimLocation()
    Location ClaimedLoc = ClaimedLocation.GetLocation()
    
    if LocationMarker.GetRef() && ClaimedLoc
        
        if !CurrentBanner.GetRef()
            
            int totalenemies = CheckForEnemies()
            
            if totalenemies == 0
                
                ObjectReference BannerPlacement = Game.GetPlayer().PlaceAtMe(CS_PlayerBannerPlacement, abForcePersist = true, abInitiallyDisabled = true)
                ;BannerPlacement.EnableNoWait()
                ObjectReference NewBanner = (BannerPlacement as CS_PlaceObject).BeginPlacement(ClaimedLoc)
                if NewBanner
                    
                    ReplacePlacement(BannerPlacement, NewBanner)
                    ObjectReference CityManagementActivator = AddCityManagementActivator(ClaimedLoc, NewBanner)
                    ;NewBanner.EnableNoWait()
                    PlaceNewBannerFlag(NewBanner, CityManagementActivator)

                    If CS_TutorialQuests00FirstSteps.GetStage() == 0
                        GovBaseMarker.ForceRefTo(NewBanner)
                        CS_TutorialQuests00FirstSteps.SetStage(10)
                    EndIf
                    
                    CS_ClaimAreaMessage.show()
                    
                else
                    BannerPlacement.disable()
                    BannerPlacement.delete()
                endif
                
                Stop()
            
            else
                
                CS_ClaimAreaEnemiesTotal.SetValue(totalenemies)
                CS_ClaimAreaEnemiesRemaining.SetValue(0)
                UpdateCurrentInstanceGlobal(CS_ClaimAreaEnemiesTotal)
                UpdateCurrentInstanceGlobal(CS_ClaimAreaEnemiesRemaining)
                debug.notification("Can not claim this area while there are still " + totalenemies as string + " enemies alive!")
                SetObjectiveDisplayed(0, true, true)
                
            endif
            
        else
            
            ObjectReference BannerPlacement = Game.GetPlayer().PlaceAtMe(CS_PlayerBannerPlacement, abForcePersist = true, abInitiallyDisabled = true)
            ;BannerPlacement.EnableNoWait()
            ObjectReference NewBanner = (BannerPlacement as CS_PlaceObject).BeginPlacement(ClaimedLoc)
            if NewBanner
                ReplacePlacement(BannerPlacement, NewBanner)
                ObjectReference CityManagementActivator = (CurrentBanner.GetRef() as CS_ManageHolding).CityManagementActivator
                (NewBanner as CS_PlacedObjectActivator).CityManagementActivator = CityManagementActivator
                (NewBanner as CS_ManageHolding).CityManagementActivator = CityManagementActivator
                PlaceNewBannerFlag(NewBanner, CityManagementActivator)
            else
                BannerPlacement.disable()
                BannerPlacement.delete()
            endif

            Stop()
            
        endif
        
    else
        
        debug.notification("This area is unavailable for claiming!")
        Stop()
        
    endif
EndFunction

Function ObjectiveEnemyDeath()
    ModObjectiveGlobal(1, CS_ClaimAreaEnemiesRemaining, 0, CS_ClaimAreaEnemiesTotal.GetValue())
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
    TryToClaimLocation()
EndEvent