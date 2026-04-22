Scriptname CS_FactionMajorSetUp extends Quest  

int Property factionnum Auto

FormList Property CS_MarkersImpAll Auto
FormList Property CS_MarkersSonsAll Auto
FormList Property CS_AllLocations Auto
FormList Property CS_FactionHolds Auto

Keyword Property CWOwner Auto

CS_Faction Property QuestFaction Auto

Function SetUpFactionOwners()
    debug.trace(QuestFaction.GetName() + " setting up...")
    int i = 0
    while i < 9
        Location Holding = CS_AllLocations.GetAt(i) as Location
        ObjectReference GarrisonMarkerImp = CS_MarkersImpAll.GetAt(i) as ObjectReference
        ObjectReference GarrisonMarkerSons = CS_MarkersSonsAll.GetAt(i) as ObjectReference
        CS_Faction Hold = CS_FactionHolds.GetAt(i) as CS_Faction
        
        if factionnum == 1
            if Holding.GetKeywordData(CWOwner) == 1 || GarrisonMarkerImp.IsEnabled() == 1
                Holding.SetKeywordData(CWOwner, 1)
                QuestFaction.AddVassal(Hold)
                ;/CS_FactionWarHolds.HoldOwners[i] = self as ObjectReference
                (CS_AllBattleSpacesSkyrim.GetAt(i) as CS_BattleSpaceRegionAll).GoToState("NotSetUp")
                (CS_AllBattleSpacesSkyrim.GetAt(i) as CS_BattleSpaceRegionAll).RegisterForSingleUpdate(0.1)
                (FactionActivator as CS_FactionManagementDiplomacy).IssueStances = ((self as ObjectReference) as CS_FactionManagementDiplomacy).IssueStances/;
            endif
        elseif factionnum == 2
            if Holding.GetKeywordData(CWOwner) == 2 || GarrisonMarkerSons.IsEnabled() == 1
                Holding.SetKeywordData(CWOwner, 2)
                QuestFaction.AddVassal(Hold)
                ;/CS_FactionWarHolds.HoldOwners[i] = self as ObjectReference
                (CS_AllBattleSpacesSkyrim.GetAt(i) as CS_BattleSpaceRegionAll).GoToState("NotSetUp")
                (CS_AllBattleSpacesSkyrim.GetAt(i) as CS_BattleSpaceRegionAll).RegisterForSingleUpdate(0.1)
                (FactionActivator as CS_FactionManagementDiplomacy).IssueStances = ((self as ObjectReference) as CS_FactionManagementDiplomacy).IssueStances/;
            endif
        endif
        
        i += 1
    endwhile
    RegisterForUpdateGameTime(1)
    debug.trace(QuestFaction.GetName() + " set up!")
EndFunction

Event OnInIt()
    SetUpFactionOwners()
EndEvent