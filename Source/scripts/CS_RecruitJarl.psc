Scriptname CS_RecruitJarl extends Quest  conditional

ReferenceAlias[] Property JarlAliases  Auto  
ReferenceAlias[] Property StewardAliases Auto
ReferenceAlias[] Property HousecarlAliases Auto
ReferenceAlias[] Property WizardAliases Auto

int Property JarlsRecruited Auto conditional

FormList Property JarlAppointed  Auto  

Faction Property CS_JarlDeadFaction Auto
Faction Property CS_PlayerFactionGovernment Auto

Keyword Property CWOwner Auto

Keyword Property CS_StoryJarlChooseGov Auto
Keyword Property CS_StoryTransferJarl Auto

Quest[] Property ThaneQuests Auto

CS_GovPositions Property InitialGovPositions Auto
CS_TransferOwnershipScript Property CS_TransferHoldingOwnership Auto

Function SetUpJarlInitials();/
    int i = 0
    while i < 9
        if (AllLocations.GetAt(i) as Location).GetKeywordData(CWOwner) == 1
            JarlAliases[i].ForceRefTo(CS_TransferHoldingOwnership.GetNextJarl(InitialGovPositions.JarlsImp[i] as Actor))
            
            if InitialGovPositions.StewardsImp[i] as Actor
                StewardAliases[i].ForceRefTo(CS_TransferHoldingOwnership.ResetGovPosition(InitialGovPositions.StewardsImp[i] as Actor, i))
            endif
            
            if InitialGovPositions.HousecarlsImp[i] as Actor
                HousecarlAliases[i].ForceRefTo(CS_TransferHoldingOwnership.ResetGovPosition(InitialGovPositions.HousecarlsImp[i] as Actor, i))
            endif
            
        elseif (AllLocations.GetAt(i) as Location).GetKeywordData(CWOwner) == 2
            JarlAliases[i].ForceRefTo(CS_TransferHoldingOwnership.GetNextJarl(InitialGovPositions.JarlsSons[i] as Actor))
            
            if InitialGovPositions.StewardsSons[i] as Actor
                StewardAliases[i].ForceRefTo(CS_TransferHoldingOwnership.ResetGovPosition(InitialGovPositions.StewardsSons[i] as Actor, i))
            endif
            
            if InitialGovPositions.HousecarlsSons[i] as Actor
                HousecarlAliases[i].ForceRefTo(CS_TransferHoldingOwnership.ResetGovPosition(InitialGovPositions.HousecarlsSons[i] as Actor, i))
            endif
            
        endif
        
        if InitialGovPositions.Wizards[i] as Actor
            WizardAliases[i].ForceRefTo(CS_TransferHoldingOwnership.ResetGovPosition(InitialGovPositions.Wizards[i] as Actor, i))
        endif
        
        CS_TransferHoldingOwnership.AddToCitizenAlias(JarlAliases[i].GetActorRef(), i)
        CS_TransferHoldingOwnership.ResetAllGovernmentPositionsCity(i)
        
        JarlFindGovernment(i)
        
        i += 1
    endwhile/;
EndFunction

Function JarlFindGovernment(int citynum)
    if JarlAliases[citynum].GetActorRef() != Game.GetPlayer()
        Location City = AllLocations.GetAt(citynum) as Location  
        CS_StoryJarlChooseGov.SendStoryEvent(City, JarlAliases[citynum].GetActorRef(), aiValue1 = citynum)
    endif
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
        JarlFindGovernment(holdnum)
    endif
EndFunction

Function RecruitSteward(Actor Citizen, int holdnum)
    StewardAliases[holdnum].ForceRefTo(Citizen)
    Citizen.AddToFaction(CS_PlayerFactionGovernment)
EndFunction

Function RecruitHousecarl(Actor Citizen, int holdnum)
    HousecarlAliases[holdnum].ForceRefTo(Citizen)
    Citizen.AddToFaction(CS_PlayerFactionGovernment)
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

Function KillJarl(Actor Jarl)
    Jarl.AddToFaction(CS_JarlDeadFaction)
    CS_StoryTransferJarl.SendStoryEventAndWait(akRef1 = Jarl)
    Jarl.kill()
EndFunction

Function FireSteward(Actor Citizen)
    int i = 0
    while i < StewardAliases.Length
        if Citizen == StewardAliases[i].GetActorRef()
            Citizen.RemoveFromFaction(CS_PlayerFactionGovernment)
            StewardAliases[i].Clear()
        endif
        i += 1
    endwhile
EndFunction

Function FireHousecarl(Actor Citizen)
    int i = 0
    while i < HousecarlAliases.Length
        if Citizen == HousecarlAliases[i].GetActorRef()
            Citizen.RemoveFromFaction(CS_PlayerFactionGovernment)
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
