Scriptname CS_RecruitJarl extends Quest  conditional

ReferenceAlias[] Property JarlAliases  Auto  
ReferenceAlias[] Property StewardAliases Auto
ReferenceAlias[] Property HousecarlAliases Auto

int Property JarlsRecruited Auto conditional

FormList Property JarlAppointed  Auto  

Keyword Property CWOwner Auto

Keyword Property CS_StoryJarlChooseGov Auto

CS_GovPositions Property InitialGovPositions Auto

Function SetUpJarlInitials()
    int i = 0
    while i < 9
        if (AllLocations.GetAt(i) as Location).GetKeywordData(CWOwner) == 1
            JarlAliases[i].ForceRefTo(InitialGovPositions.JarlsImp[i])
        elseif (AllLocations.GetAt(i) as Location).GetKeywordData(CWOwner) == 2
            JarlAliases[i].ForceRefTo(InitialGovPositions.JarlsSons[i])
        endif
        i += 1
    endwhile
EndFunction

Function RecruitJarl(Actor Citizen, int holdnum)
    JarlAliases[holdnum].ForceRefTo(Citizen)
    JarlsRecruited += 1
    Citizen.AddToFaction(GovFaction)
    EconomyUpdater.JarlStartManageEconomy(Citizen)
    JarlChoose.ForceRefTo(Citizen)
    Location City = AllLocations.GetAt(holdnum) as Location
    CityChoose.ForceLocationTo(City)
    JarlManageEconomyMessage.show()
    if holdnum < 9
        (JarlAppointed.GetAt(holdnum) as GlobalVariable).SetValue(1)
        CS_StoryJarlChooseGov.SendStoryEvent(City, Citizen, aiValue1 = holdnum)
    endif
EndFunction

Function RecruitSteward(Actor Citizen, int holdnum)
    StewardAliases[holdnum].ForceRefTo(Citizen)
    ;Citizen.SetOutfit(JarlOutfit[9])
EndFunction

Function RecruitHousecarl(Actor Citizen, int holdnum)
    HousecarlAliases[holdnum].ForceRefTo(Citizen)
    ;Citizen.SetOutfit(JarlOutfit[9])
EndFunction

Function FireJarl(Actor Citizen)
    int i = 0
    while i < JarlAliases.Length
        if JarlAliases[i].GetActorRef() == Citizen
            EconomyUpdater.JarlStopManageEconomy(Citizen)
            JarlsRecruited -= 1
            JarlChoose.ForceRefTo(Citizen)
            CityChoose.ForceLocationTo(AllLocations.GetAt(i) as Location)
            JarlStopManageEconomyMessage.show()
            Citizen.RemoveFromFaction(GovFaction)
            JarlAliases[i].Clear()
        endif
        i += 1
    endwhile            
EndFunction

Function FireJarlSpecific(int holdingnum)
    if JarlAliases[holdingnum].GetActorRef() != None && JarlAliases[holdingnum].GetActorRef() != Game.GetPlayer()
        JarlsRecruited -= 1
        EconomyUpdater.JarlStopManageEconomy(JarlAliases[holdingnum].GetActorRef())
        JarlChoose.ForceRefTo(JarlAliases[holdingnum].GetActorRef())
        CityChoose.ForceLocationTo(AllLocations.GetAt(holdingnum) as Location)
        JarlStopManageEconomyMessage.show()
        JarlAliases[holdingnum].GetActorRef().RemoveFromFaction(GovFaction)
        JarlAliases[holdingnum].Clear()
        JarlChoose.Clear()
        CityChoose.Clear()
    endif
EndFunction

Function FireSteward(Actor Citizen)
    int i = 0
    while i < StewardAliases.Length
        if Citizen == StewardAliases[i].GetActorRef()
            StewardAliases[i].Clear()
        endif
        i += 1
    endwhile
EndFunction

Function FireHousecarl(Actor Citizen)
    int i = 0
    while i < HousecarlAliases.Length
        if Citizen == HousecarlAliases[i].GetActorRef()
            HousecarlAliases[i].Clear()
        endif
        i += 1
    endwhile
EndFunction

int Function FindSteward(Actor Steward)
    int i = 0
    int stewardnum = -1
    while i < StewardAliases.Length
        if StewardAliases[i].GetActorRef() == Steward
            stewardnum = i
        endif
        i += 1
    endwhile
    return stewardnum
EndFunction

int Function FindJarl(Actor Jarl)
    int i = 0
    int jarlnum = -1
    while i < JarlAliases.Length
        if JarlAliases[i].GetActorRef() == Jarl
            jarlnum = i
        endif
        i += 1
    endwhile
    return jarlnum
EndFunction

Outfit[] Property JarlOutfit  Auto  

CS_EconomyVariableFunctions Property EconomyUpdater Auto

Quest Property ChooseStewardQuest Auto
ReferenceAlias Property JarlChoose  Auto  

LocationAlias Property CityChoose  Auto  

FormList Property AllLocations Auto
Faction Property GovFaction  Auto  

Faction Property JarlManageFaction  Auto  

Message Property JarlManageEconomyMessage  Auto  
Message Property JarlStopManageEconomyMessage  Auto  
