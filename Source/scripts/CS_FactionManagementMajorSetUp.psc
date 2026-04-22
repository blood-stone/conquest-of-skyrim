Scriptname CS_FactionManagementMajorSetUp extends ObjectReference

int Property factionnum Auto

FormList Property CS_MarkersImpAll Auto
FormList Property CS_MarkersSonsAll Auto
FormList Property CS_AllLocations Auto
FormList Property CS_FactionActivatorsHolds Auto
FormList Property CS_AllBattleSpacesSkyrim Auto

ObjectReference Property InitialCapital Auto

FormList Property CS_BannersFactions Auto
FormList Property CS_BannersHolds Auto

Keyword Property CWOwner Auto

CS_FactionWarHoldsScript Property CS_FactionWarHolds Auto

Function SetUpFactionOwners();/
    ((self as ObjectReference) as CS_FactionManagementOwnership).UnEssentialLeaders()
    ((self as ObjectReference) as CS_FactionManagementOwnership).SetInitialLeaders(0)/;
    ((self as ObjectReference) as CS_FactionManagementOwnership).SetHQ(InitialCapital)
    ((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionBanner = CS_BannersFactions.GetAt(factionnum) as Form
    CS_FactionWarHolds.Start()
    ((self as ObjectReference) as CS_FactionManagementMilitary).HomeArmies = new ObjectReference[9]
    
    int i = 0
    while i < 9
        Location Holding = CS_AllLocations.GetAt(i) as Location
        ObjectReference GarrisonMarkerImp = CS_MarkersImpAll.GetAt(i) as ObjectReference
        ObjectReference GarrisonMarkerSons = CS_MarkersSonsAll.GetAt(i) as ObjectReference
        ObjectReference FactionActivator = CS_FactionActivatorsHolds.GetAt(i) as ObjectReference
        
        if factionnum == 1
            if Holding.GetKeywordData(CWOwner) == 1 || GarrisonMarkerImp.IsEnabled() == 1
                Holding.SetKeywordData(CWOwner, 1)
                CS_FactionWarHolds.HoldOwners[i] = self as ObjectReference
                ObjectReference City = (FactionActivator as CS_FactionManagementEconomy).Cities[0]
                (City as CS_CityManagementOwnership).HoldFactionOwnerActivator = (self as ObjectReference)
                (City as CS_CityManagementOwnership).ChangeGovernments(self as ObjectReference)
                ((self as ObjectReference) as CS_FactionManagementEconomy).AddCity(City)
                (CS_AllBattleSpacesSkyrim.GetAt(i) as CS_BattleSpaceRegionAll).GoToState("NotSetUp")
                (CS_AllBattleSpacesSkyrim.GetAt(i) as CS_BattleSpaceRegionAll).RegisterForSingleUpdate(0.1)
                ;(FactionActivator as CS_FactionManagementDiplomacy).IssueStances = ((self as ObjectReference) as CS_FactionManagementDiplomacy).IssueStances
            endif
        elseif factionnum == 2
            if Holding.GetKeywordData(CWOwner) == 2 || GarrisonMarkerSons.IsEnabled() == 1
                Holding.SetKeywordData(CWOwner, 2)
                CS_FactionWarHolds.HoldOwners[i] = self as ObjectReference
                ObjectReference City = (FactionActivator as CS_FactionManagementEconomy).Cities[0]
                (City as CS_CityManagementOwnership).HoldFactionOwnerActivator = (self as ObjectReference)
                (City as CS_CityManagementOwnership).ChangeGovernments(self as ObjectReference)
                ((self as ObjectReference) as CS_FactionManagementEconomy).AddCity(City)
                (CS_AllBattleSpacesSkyrim.GetAt(i) as CS_BattleSpaceRegionAll).GoToState("NotSetUp")
                (CS_AllBattleSpacesSkyrim.GetAt(i) as CS_BattleSpaceRegionAll).RegisterForSingleUpdate(0.1)
                ;(FactionActivator as CS_FactionManagementDiplomacy).IssueStances = ((self as ObjectReference) as CS_FactionManagementDiplomacy).IssueStances
            endif
        endif
        
        i += 1
    endwhile
    GoToState("SetUp")
EndFunction

Auto State NotSetUp

    Event OnUpdate()
        SetUpFactionOwners()
    EndEvent
    
EndState