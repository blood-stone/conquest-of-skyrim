Scriptname CS_CityManagementScript extends Quest  conditional

int Property citynum Auto

LocationAlias Property CityAlias Auto
LocationAlias Property CityCS Auto
LocationAlias Property Palace Auto
LocationAlias Property GuardTitle Auto

ReferenceAlias Property GuardFollower Auto
ReferenceAlias Property Jarl Auto
ReferenceAlias[] Property GuardAliases Auto
ReferenceAlias[] Property PalaceGuardAliases Auto
ReferenceAlias[] Property PatrolMarkerAliases Auto
ReferenceAlias[] Property PalacePatrolMarkerAliases Auto

FormList Property CS_AllLocations Auto
FormList Property CS_AllHolds Auto
FormList Property CS_AllUpgradeLocations Auto
FormList Property CS_AllAttackPalaces Auto
FormList Property CS_CityManagementActivators Auto

WorldSpace Property Tamriel Auto

Quest Property CS_AttackCityApproachGates Auto

GlobalVariable Property CS_InfluenceCost Auto

Keyword Property CS_PlayerJarl Auto
Keyword Property CS_StoryEconomyReportCity Auto
Keyword Property CS_StoryCoup Auto
Keyword Property CS_StoryAttackCityApproachGates Auto

;Issues
int Property IssueEconomyCommoner Auto conditional
int Property IssueEconomyNobility Auto conditional

int Property IssuePrivilegeCommoner Auto conditional
int Property IssuePrivilegeNobility Auto conditional

int Property IssueRepresentationCommoner Auto conditional
int Property IssueRepresentationNobility Auto conditional

int Property IssueGuardsPeople Auto conditional
int Property IssueGuardsGuards Auto conditional

int Property InfluenceCommoner Auto conditional
int Property InfluenceNobility Auto conditional
int Property InfluenceGuard Auto conditional

int Property PlayerJarl Auto conditional

MiscObject Property Gold001 Auto

ObjectReference Property CityManagementActivator Auto

ObjectReference Property CS_FactionPlayer Auto

;CS_RecruitJarl Property CS_FactionGovernment Auto
;CS_PrisonScript Property CS_PrisonCommands Auto
;CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto
CS_CityManagementReportScript Property CS_CityManagementReport Auto

CS_CityManagementEconomy EconomyScript
CS_CityManagementMilitary MilitaryScript
CS_CityManagementPopulation PopulationScript
CS_CityManagementOwnership OwnershipScript

Function SetUp()
    UnRegisterForUpdateGameTime()
    citynum = CS_AllLocations.Find(CityAlias.GetLocation())
    CityManagementActivator = CS_CityManagementActivators.GetAt(citynum) as ObjectReference
    if !CityManagementActivator
        debug.notification("Can't find citymanagementactivator at " + citynum + ", stopping quest!")
        Stop()
        return
    endif
    Palace.ForceLocationTo(CS_AllAttackPalaces.GetAt(citynum) as Location)
    EconomyScript = CityManagementActivator as CS_CityManagementEconomy
    MilitaryScript = CityManagementActivator as CS_CityManagementMilitary
    PopulationScript = CityManagementActivator as CS_CityManagementPopulation
    OwnershipScript = CityManagementActivator as CS_CityManagementOwnership
    ObjectReference FactionOwnerActivator = OwnershipScript.FactionOwnerActivator
    CheckIfPlayerExiled()
    Jarl.ForceRefTo((FactionOwnerActivator as CS_FactionManagementOwnership).Leader)
    if Jarl.GetActorRef() == Game.GetPlayer()
        Game.SetPlayerReportCrime(false)
        PlayerJarl = 1
    else
        Game.SetPlayerReportCrime(true)
        PlayerJarl = 0
    endif
    ;SpawnGuards()
    SetInfluences()
    PopulationScript.CheckCityEvents()
    debug.trace("City Management started, citynum = " + citynum)
EndFunction

Function CheckIfPlayerExiled()
    debug.trace("Checking if player exiled")
    Actor PlayerRef = Game.GetPlayer()
    if OwnershipScript.CityClosedToPlayer == 1 && PlayerRef.GetWorldSpace() == OwnershipScript.CityWorldSpace\
        && OwnershipScript.CityWorldSpace != Tamriel ;Include minor cities later
        ObjectReference War
        if OwnershipScript.WarsWithPlayer
            War = OwnershipScript.WarsWithPlayer[0]
        endif
        if CS_AttackCityApproachGates.IsRunning()
            CS_AttackCityApproachGates.SetStage(100)
            while CS_AttackCityApproachGates.IsRunning()
                debug.trace("Waiting for gates quest to end...")
                utility.wait(0.1)
            endwhile
        endif
        CS_StoryAttackCityApproachGates.SendStoryEvent(OwnershipScript.VanillaCity, CityManagementActivator, War)
        ;Teleport Player to outside city walls and start Attack City Quest
        debug.notification("Player has traveled into exiled city!")
        debug.trace("Player has traveled into exiled city!")
        return
    endif
    debug.trace("Player not exiled")
EndFunction

Function SpawnGuards()
    ObjectReference FactionOwnerActivator = OwnershipScript.FactionOwnerActivator
    GuardTitle.ForceLocationTo((FactionOwnerActivator as CS_FactionManagementDiplomacy).FactionNamePrefix)
    int i = 0
    while i < PatrolMarkerAliases.Length
        ObjectReference SpawnMarker
        if PatrolMarkerAliases[i].GetRef()
            SpawnMarker = PatrolMarkerAliases[i].GetRef()
        else
            SpawnMarker = PatrolMarkerAliases[0].GetRef()
        endif
        (GuardAliases[i] as CS_CityManagementGuardScript).TempPlacementMarker = SpawnMarker
        (GuardAliases[i] as CS_CityManagementGuardScript).GoToState("Assigned")
        (GuardAliases[i] as CS_CityManagementGuardScript).RegisterForSingleUpdate(0.05)
        i += 1
    endwhile
    
    i = 0
    while i < PalacePatrolMarkerAliases.Length
        ObjectReference SpawnMarker
        if PalacePatrolMarkerAliases[i].GetRef()
            SpawnMarker = PalacePatrolMarkerAliases[i].GetRef()
        else
            SpawnMarker = PalacePatrolMarkerAliases[0].GetRef()
        endif
        (PalaceGuardAliases[i] as CS_CityManagementGuardScript).TempPlacementMarker = SpawnMarker
        (PalaceGuardAliases[i] as CS_CityManagementGuardScript).GoToState("Assigned")
        (PalaceGuardAliases[i] as CS_CityManagementGuardScript).RegisterForSingleUpdate(0.05)
        i += 1
    endwhile
EndFunction

Function DeleteGuards()
    int i = 0
    while i < GuardAliases.Length
        if GuardAliases[i].GetActorRef()
            (GuardAliases[i] as CS_CityManagementGuardScript).GoToState("InitiateDelete")
            (GuardAliases[i] as CS_CityManagementGuardScript).RegisterForSingleUpdate(0.05)
        endif
        i += 1
    endwhile
    
    i = 0
    while i < PalaceGuardAliases.Length
        if PalaceGuardAliases[i].GetActorRef()
            (PalaceGuardAliases[i] as CS_CityManagementGuardScript).GoToState("InitiateDelete")
            (PalaceGuardAliases[i] as CS_CityManagementGuardScript).RegisterForSingleUpdate(0.05)
        endif
        i += 1
    endwhile
EndFunction

Function SetInfluences()
    ObjectReference FactionOwnerActivator = OwnershipScript.FactionOwnerActivator
    CS_FactionManagementEconomy FactionEconomyScript = FactionOwnerActivator as CS_FactionManagementEconomy
    InfluenceCommoner = FactionEconomyScript.InfluenceCommoner
    InfluenceNobility = FactionEconomyScript.InfluenceNobility
    InfluenceGuard = FactionEconomyScript.InfluenceGuard
EndFunction

Function StartEconomyMenu(Actor Steward)
    CS_CityManagementReport.Stop()
    CS_CityManagementReport.Start()
    CS_CityManagementReport.MenuStart(CityManagementActivator)
EndFunction

Function GetGuardInfluenceCost(Actor Guard)
    Faction CrimeFaction = Guard.GetCrimeFaction()
    
    CS_InfluenceCost.SetValue(math.ceiling(CrimeFaction.GetCrimeGold() as float/40))
EndFunction

Function UseGuardInfluence(Actor Guard)
    Faction CrimeFaction = Guard.GetCrimeFaction()
    
    CrimeFaction.SetCrimeGold(0)
    CrimeFaction.SetCrimeGoldViolent(0)
    
    PopulationScript.AdjustInfluence("Player", "Guards", -CS_InfluenceCost.GetValueInt())
    SetInfluences()
EndFunction

Function LaunchCoup()
    CS_StoryCoup.SendStoryEvent(CityAlias.GetLocation())
EndFunction

Function DonateToGuards()
    Game.GetPlayer().RemoveItem(Gold001)
    PopulationScript.AdjustInfluence("Player", "Guard", 10)
    SetInfluences()
EndFunction

Function DonateToPoor()
    Game.GetPlayer().RemoveItem(Gold001)
    ;EconomyHold.WealthCommoners = EconomyHold.WealthCommoners + 1000
    PopulationScript.AdjustInfluence("Player", "Commoner", 10)
    SetInfluences()
EndFunction

Function GuardFollowPlayer(Actor Guard)
    GuardFollower.ForceRefTo(Guard)
    Guard.EvaluatePackage()
EndFunction

Function SendToPrison(Actor Prisoner)
    ;CS_PrisonCommands.ArrestGuard.ForceRefTo(GuardFollower.GetActorRef())
    GuardFollower.Clear()
    ;CS_PrisonCommands.SendToPrison(Prisoner, citynum)
EndFunction

Function ChangeFactionLeader(Actor NewLeader)
    ObjectReference FactionOwnerActivator = OwnershipScript.FactionOwnerActivator
    
    (FactionOwnerActivator as CS_FactionManagementOwnership).SetNewFactionLeader(NewLeader)
    SetUp()
EndFunction

Function PurgeCityData()
    DeleteGuards()
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
    SetUp()
endEvent

Event OnUpdateGameTime()
    ;GroupsHold.FindIssues()
    ;GroupsHold.ShowCityGroupReport()
EndEvent