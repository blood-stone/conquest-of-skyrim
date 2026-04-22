Scriptname CS_IntelReportScript extends Quest  conditional

LocationAlias Property IntelCity Auto
LocationAlias Property CoupCityStaging Auto

ReferenceAlias Property IntelJarl Auto
ReferenceAlias Property JarlLoyaltyAlias Auto
ReferenceAlias Property PlayerLoyaltyAlias Auto
ReferenceAlias Property MissionAlias Auto
ReferenceAlias Property TargetAlias Auto

ReferenceAlias Property LoSTargetJarl Auto
ReferenceAlias[] Property LoSTitles Auto
ReferenceAlias[] Property LoSActors Auto
ReferenceAlias[] Property LoSPositions Auto

Keyword Property LoyaltyJarl Auto
Keyword Property Loyalty Auto
Keyword Property SpyNetworkStrength Auto
Keyword Property SpyNetworkFunding Auto
Keyword Property SpyNetworkMission Auto
Keyword Property SpyNetworkLoyalty Auto
Keyword Property SpyNetworkLoyaltyJarl Auto

Keyword Property StoryCoup Auto

Message Property IntelReportStartMessage Auto
Message Property IntelReportStartMinorCitiesMessage Auto
Message Property IntelReportStartVillagesMessage Auto
Message Property IntelReportCityUnownedMessage Auto
Message Property IntelReportSetUpNetwork Auto
Message Property IntelReportMissionMessage Auto
Message Property IntelReportMissionInfluenceMessage Auto
Message Property IntelReportMissionCoupMessage Auto
Message Property IntelReportWarningCoupMessage Auto
Message Property IntelReportLOSMessage Auto

ObjectReference[] Property LoyaltyTexts Auto
ObjectReference Property NoneObject Auto 
ObjectReference Property UnknownObject Auto
ObjectReference Property NoHeirsObject Auto

FormList Property AllLocationsCS Auto
FormList Property AllLocations Auto
FormList Property AllHoldings Auto
FormList Property MissionTexts Auto
FormList Property LoSTitleTexts Auto

Faction Property PlayerMarriedFaction Auto

Quest Property CoupQuest Auto

GlobalVariable Property SpyNetworkGlobal Auto
GlobalVariable Property SpyNetworkFundingGlobal Auto
GlobalVariable Property SpyNetworkAccuracyGlobal Auto
GlobalVariable Property Treasury Auto
GlobalVariable Property TreasuryPerDay Auto

int Property SpyNetworkMissionInt Auto Conditional

CS_RecruitJarl Property JarlScript Auto

Function UpdateCityAliases(int citynum)
    if JarlScript.JarlAliases[citynum].GetActorRef()
        IntelJarl.ForceRefTo(JarlScript.JarlAliases[citynum].GetActorRef())
    else
        if citynum == 9
            IntelJarl.ForceRefTo(JarlScript.JarlAliases[2].GetActorRef())
        elseif citynum == 10
            IntelJarl.ForceRefTo(JarlScript.JarlAliases[1].GetActorRef())
        elseif citynum == 11
            IntelJarl.ForceRefTo(JarlScript.JarlAliases[0].GetActorRef())
        elseif citynum == 12
            IntelJarl.ForceRefTo(JarlScript.JarlAliases[3].GetActorRef())
        elseif citynum == 13
            IntelJarl.ForceRefTo(JarlScript.JarlAliases[3].GetActorRef())
        elseif citynum == 14
            IntelJarl.ForceRefTo(JarlScript.JarlAliases[1].GetActorRef())
        else
            IntelJarl.ForceRefTo(NoneObject)
        endif
    endif

    Location IntelCityLoc = IntelCity.GetLocation()
    int IntelCityJarlLoyalty = IntelCityLoc.GetKeywordData(SpyNetworkLoyaltyJarl) as int
    int IntelCityPlayerLoyalty = IntelCityLoc.GetKeywordData(SpyNetworkLoyalty) as int
    int IntelCityMission = IntelCityLoc.GetKeywordData(SpyNetworkMission) as int
    SpyNetworkMissionInt = IntelCityMission

    int IntelAccuracyModifierMax = (IntelCityLoc.GetKeywordData(SpyNetworkStrength) as int) - 50
    if IntelAccuracyModifierMax > 0
        IntelAccuracyModifierMax = 0
    endif

    int IntelAccuracy = 100 + 2*IntelAccuracyModifierMax

    ;IntelAccuracyModifierMax = math.abs(IntelAccuracyModifierMax) as int

    if IntelCityLoc.GetKeywordData(SpyNetworkStrength) as int == 0
        JarlLoyaltyAlias.ForceRefTo(UnknownObject)
        PlayerLoyaltyAlias.ForceRefTo(UnknownObject)
    else
        if IntelCityJarlLoyalty < 20
            JarlLoyaltyAlias.ForceRefTo(LoyaltyTexts[0])
        elseif IntelCityJarlLoyalty >= 20 && IntelCityJarlLoyalty < 40
            JarlLoyaltyAlias.ForceRefTo(LoyaltyTexts[1])
        elseif IntelCityJarlLoyalty >= 40 && IntelCityJarlLoyalty < 60
            JarlLoyaltyAlias.ForceRefTo(LoyaltyTexts[2])
        elseif IntelCityJarlLoyalty >= 60 && IntelCityJarlLoyalty < 80
            JarlLoyaltyAlias.ForceRefTo(LoyaltyTexts[3])
        elseif IntelCityJarlLoyalty >= 80
            JarlLoyaltyAlias.ForceRefTo(LoyaltyTexts[4])
        endif

        if IntelCityPlayerLoyalty < 20
            PlayerLoyaltyAlias.ForceRefTo(LoyaltyTexts[0])
        elseif IntelCityPlayerLoyalty >= 20 && IntelCityPlayerLoyalty < 40
            PlayerLoyaltyAlias.ForceRefTo(LoyaltyTexts[1])
        elseif IntelCityPlayerLoyalty >= 40 && IntelCityPlayerLoyalty < 60
            PlayerLoyaltyAlias.ForceRefTo(LoyaltyTexts[2])
        elseif IntelCityPlayerLoyalty >= 60 && IntelCityPlayerLoyalty < 80
            PlayerLoyaltyAlias.ForceRefTo(LoyaltyTexts[3])
        elseif IntelCityPlayerLoyalty >= 80
            PlayerLoyaltyAlias.ForceRefTo(LoyaltyTexts[4])
        endif
    endif

    MissionAlias.ForceRefTo(MissionTexts.GetAt(IntelCityMission) as ObjectReference)
    if IntelCityMission == 2 || IntelCityMission == 4
        TargetAlias.ForceRefTo(Game.GetPlayer())
    elseif IntelCityMission == 3 || IntelCityMission == 5
        TargetAlias.ForceRefTo(JarlScript.JarlAliases[citynum].GetActorRef())
    Else
        TargetAlias.ForceRefTo(NoneObject)
    endif

    SpyNetworkGlobal.SetValue(IntelCityLoc.GetKeywordData(SpyNetworkStrength))
    SpyNetworkAccuracyGlobal.SetValue(IntelAccuracy)
    SpyNetworkFundingGlobal.SetValue(IntelCityLoc.GetKeywordData(SpyNetworkFunding))
    UpdateCurrentInstanceGlobal(SpyNetworkGlobal)
    UpdateCurrentInstanceGlobal(SpyNetworkAccuracyGlobal)
    UpdateCurrentInstanceGlobal(SpyNetworkFundingGlobal)
EndFunction

Function UpdateLineOfSuccession()
    
    int i = 0
    while i < LOSActors.Length
        LOSActors[i].ForceRefTo(NoneObject)
        LOSTitles[i].ForceRefTo(NoneObject)
        i += 1
    EndWhile
    
    LoSTargetJarl.ForceRefTo(IntelJarl.GetActorRef())
    if LOSPositions[0].GetOwningQuest().IsRunning()
        LOSPositions[0].GetOwningQuest().Stop()
    endif
    
    LOSPositions[0].GetOwningQuest().Start()
    
    int SuccessionNum = 0
    int positionnum = 0
    if LOSTargetJarl.GetActorRef().IsInFaction(PlayerMarriedFaction)
        LOSPositions[3].ForceRefTo(Game.GetPlayer())
    endif
    while positionnum < LOSPositions.Length
        if LOSPositions[positionnum].GetActorRef()
            LOSActors[SuccessionNum].ForceRefTo(LOSPositions[positionnum].GetActorRef())
            LOSTitles[SuccessionNum].ForceRefTo(LOSTitleTexts.GetAt(SuccessionNum) as ObjectReference)
            SuccessionNum += 1
        EndIf
        
        positionnum += 1
    EndWhile
    
    if SuccessionNum == 0
        LOSTitles[0].ForceRefTo(NoHeirsObject)
    endif
        
EndFunction

Function MenuStart(int Response = 0)
    Response = IntelReportStartMessage.show()
    if Response < 5
        MenuCity(Response)
    elseif Response == 5
        MenuStartMinorCities()
    elseif Response == 6
        MenuStartVillages()
    endif
EndFunction

Function MenuStartMinorCities(int Response = 0)
    Response = IntelReportStartMinorCitiesMessage.show()
    if Response < 4
        MenuCity(Response + 5)
    elseif Response == 4
        MenuStart()
    elseif Response == 5
        MenuStartVillages()
    endif
EndFunction

Function MenuStartVillages(int Response = 0)
    Response = IntelReportStartVillagesMessage.show()
    if Response < 6
        MenuCity(Response + 9)
    elseif Response == 6
        MenuStart()
    elseif Response == 7
        MenuStartVillages()
    endif
EndFunction

Function MenuCity(int citynum, int Response = 0)
    IntelCity.ForceLocationTo(AllLocationsCS.GetAt(citynum) as Location)
    ;if (AllHoldings.GetAt(citynum) as GlobalVariable).GetValueInt() != 1
        UpdateCityAliases(citynum)
        Response = IntelReportCityUnownedMessage.show()
    ;endif

    if Response == 0
        MenuSetUpNetwork(citynum)
    elseif Response == 1
        MenuCityMission(citynum)
    elseif Response == 2
        MenuCityLoS(citynum)
    elseif Response == 3 ;CHANGE WHEN NEW OPTIONS ARE ADDED
        MenuStart()
    endif
EndFunction

Function MenuCityLoS(int citynum, int Response = 0)
    UpdateLineOfSuccession()
    Response = IntelReportLOSMessage.show()
    if Response == 0
        MenuCity(citynum)
    endif
EndFunction

Function MenuCityMission(int citynum, int Response = 0)
    Location IntelCityLoc = IntelCity.GetLocation()
    if DisplayWarningMessage() == 0
        Response = IntelReportMissionMessage.show()
        if Response == 0
            IntelCityLoc.SetKeywordData(SpyNetworkMission, 1)
            MenuCity(citynum)
        ElseIf Response == 1
            MenuCityMissionInfluence(citynum, true)
        ElseIf Response == 2
            MenuCityMissionInfluence(citynum, false)
        ElseIf Response == 4
            MenuCityMissionCoup(citynum)
        ElseIf Response == 5
            MenuCity(citynum)
        EndIf
    else
        MenuCity(citynum)
    endif
EndFunction
    
Function MenuCityMissionInfluence(int citynum, bool player, int Response = 0)
    if player
        TargetAlias.ForceRefTo(Game.GetPlayer())
    Else
        TargetAlias.ForceRefTo(JarlScript.JarlAliases[citynum].GetActorRef())
    EndIf
    Location IntelCityLoc = IntelCity.GetLocation()
    Response = IntelReportMissionInfluenceMessage.show()
    if Response == 0
        if player
            IntelCityLoc.SetKeywordData(SpyNetworkMission, 2)
        Else
            IntelCityLoc.SetKeywordData(SpyNetworkMission, 3)
        EndIf
        MenuCity(citynum)
    ElseIf Response == 1
        if player
            IntelCityLoc.SetKeywordData(SpyNetworkMission, 4)
        Else
            IntelCityLoc.SetKeywordData(SpyNetworkMission, 5)
        EndIf
        MenuCity(citynum)
    ElseIf Response == 2
        MenuCityMission(citynum)
    EndIf
EndFunction

int Function DisplayWarningMessage()
    Location IntelCityLoc = IntelCity.GetLocation()
    int Response = 0
    if IntelCityLoc.GetKeywordData(SpyNetworkMission) == 7
        Response = IntelReportWarningCoupMessage.show()
    endif
    return Response
EndFunction

Function MenuCityMissionCoup(int citynum, int Response = 0)
    Location IntelCityLoc = IntelCity.GetLocation()
    Location IntelCityVanilla = AllLocations.GetAt(citynum) as Location
    Response = IntelReportMissionCoupMessage.show()
    if Response == 0
        IntelCityLoc.SetKeywordData(SpyNetworkMission, 7)
        StoryCoup.SendStoryEvent(IntelCityVanilla)
        ;CoupCityStaging.ForceLocationTo(AllLocations.GetAt(citynum) as Location)
        ;CoupQuest.Start()
    else
        MenuCityMission(citynum)
    endif
EndFunction

Function MenuSetUpNetwork(int citynum, int Response = 0)
    Location IntelCityLoc = IntelCity.GetLocation()
    UpdateCurrentInstanceGlobal(Treasury)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    Response = IntelReportSetUpNetwork.show()
    if Response == 0
        IntelCityLoc.SetKeywordData(SpyNetworkFunding, 1000)
        IntelCityLoc.SetKeywordData(SpyNetworkMission, 1)
        TreasuryPerDay.Mod(-1000)
    elseif Response == 1
        IntelCityLoc.SetKeywordData(SpyNetworkFunding, 5000)
        IntelCityLoc.SetKeywordData(SpyNetworkMission, 1)
        TreasuryPerDay.Mod(-5000)
    elseif Response == 2
        IntelCityLoc.SetKeywordData(SpyNetworkFunding, 10000)
        IntelCityLoc.SetKeywordData(SpyNetworkMission, 1)
        TreasuryPerDay.Mod(-10000)
    endif
    MenuCity(citynum)
EndFunction