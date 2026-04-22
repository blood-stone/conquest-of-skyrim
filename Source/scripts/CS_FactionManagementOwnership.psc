Scriptname CS_FactionManagementOwnership extends ObjectReference  

import CS_CommonFunctions

Location Property FactionLocation Auto

ObjectReference Property FactionOwnerActivator Auto
ObjectReference Property HQ Auto
ObjectReference Property HQInteriorMarker Auto
ObjectReference Property HQExteriorMarker Auto

ObjectReference Property LeaderStandMarkers Auto
ObjectReference Property SecondStandMarker Auto
ObjectReference Property ArmyLeaderStandMarker Auto
ObjectReference Property MageStandMarker Auto

Actor[] Property InitialLeaders Auto
Actor[] Property InitialSeconds Auto
Actor[] Property InitialArmyLeaders Auto
Actor[] Property InitialMages Auto

ReferenceAlias Property LeaderAlias Auto
ReferenceAlias Property SecondAlias Auto
ReferenceAlias Property ArmyLeaderAlias Auto
ReferenceAlias Property MageAlias Auto

ReferenceAlias Property InitialLeaderAlias Auto
ReferenceAlias Property InitialSecondAlias Auto
ReferenceAlias Property InitialArmyLeaderAlias Auto
ReferenceAlias Property InitialMageAlias Auto

ReferenceAlias[] Property ExiledPositions Auto
Actor[] Property ExiledFamily Auto
int Property ExiledFactionNum Auto ; the Faction Num that the Jarl must be in in order to be put in the above aliases

Actor Property Leader Auto
Actor Property Second Auto
Actor Property ArmyLeader Auto
Actor Property Mage Auto

Actor[] Property HoldLeaders Auto
Actor[] Property HoldStewards Auto
Actor[] Property HoldHousecarls Auto
Actor[] Property HoldMages Auto

Actor[] Property LeaderLoS Auto

Keyword Property CS_StoryGetJarlLoS Auto
Keyword Property CWOwner Auto

FormList Property CS_MarkersImpLists Auto
FormList Property CS_MarkersSonsLists Auto
FormList[] Property GuardMarkerLists Auto

ReferenceAlias[] Property LoSAliases Auto

LocationAlias Property Capital Auto

int Property NPC Auto

Function SetHQ(ObjectReference HQRef)
    HQ = HQRef
    HQInteriorMarker = (HQ as CS_CityManagementOwnership).HQInteriorMarker
    if (HQ as CS_CityManagementOwnership).HQExteriorMarker
        HQExteriorMarker = (HQ as CS_CityManagementOwnership).HQExteriorMarker
    elseif (HQ as CS_HQScript).HQExteriorMarker
        HQExteriorMarker = (HQ as CS_HQScript).HQExteriorMarker
    endif
    
    if SecondStandMarker
        if HQInteriorMarker
            SecondStandMarker.MoveTo(HQInteriorMarker)
        elseif HQExteriorMarker
            SecondStandMarker.MoveTo(HQExteriorMarker)
        endif
    endif
    
    if Capital
        Capital.ForceLocationTo((HQRef as CS_CityManagementOwnership).VanillaCity)
    endif
EndFunction

Function SetUpGuards()
    ObjectReference[] Cities = ((self as ObjectReference) as CS_FactionManagementEconomy).Cities
    if Cities && Cities[0]
        int holdnum = (Cities[0] as CS_CityManagementOwnership).holdnum
    
        GuardMarkerLists = new FormList[20]
        GuardMarkerLists[1] = CS_MarkersImpLists.GetAt(holdnum) as FormList
        GuardMarkerLists[2] = CS_MarkersSonsLists.GetAt(holdnum) as FormList
    endif
EndFunction

Function DeactivateGuards()
    int factionownernum = GetFactionNum(FactionOwnerActivator)
    
    int i = 0
    while i < GuardMarkerLists[factionownernum].GetSize()
        (GuardMarkerLists[factionownernum].GetAt(i) as ObjectReference).disable()
        i += 1
    endwhile
EndFunction

Function ActivateGuards()
    int factionownernum = GetFactionNum(FactionOwnerActivator)
    
    int i = 0
    while i < GuardMarkerLists[factionownernum].GetSize()
        (GuardMarkerLists[factionownernum].GetAt(i) as ObjectReference).enable()
        i += 1
    endwhile
EndFunction

Function SetInitialOwnerFaction(ObjectReference OwnerFaction)
    FactionOwnerActivator = OwnerFaction
    SetAllHoldingsCWOwner()
EndFunction

bool Function CheckIfExiled(Actor Person)
    if Person
        int i = 0
        while i < ExiledPositions.Length
            if ExiledPositions[i].GetActorRef() == Person
                return true
            endif
            i += 1
        endwhile
    endif
    
    return false
EndFunction

Function ExileActor(Actor Person)
    if Person
        int i = 0
        while i < ExiledPositions.Length
            if ExiledPositions[i].GetActorRef() == None
                ExiledPositions[i].ForceRefTo(Person)
                debug.trace(Person.GetActorBase().GetName() + " has been exiled!")
                return
            endif
            i += 1
        endwhile
    endif
EndFunction

Function UnExileActor(Actor Person)
    if Person
        int i = 0
        while i < ExiledPositions.Length
            if ExiledPositions[i].GetActorRef() == Person
                ExiledPositions[i].Clear()
                return
            endif
            i += 1
        endwhile
    endif
EndFunction

Function ExileGovernment()
    ExileActor(Leader)
    ExileActor(Second)
    ExileActor(ArmyLeader)
    ExileActor(Mage)
    int i = 0
    while i < ExiledFamily.Length
        ExileActor(ExiledFamily[i])
        i += 1
    endwhile
EndFunction

Function UnExileGovernment()
    UnExileActor(Leader)
    UnExileActor(Second)
    UnExileActor(ArmyLeader)
    UnExileActor(Mage)
    int i = 0
    while i < ExiledFamily.Length
        UnExileActor(ExiledFamily[i])
        i += 1
    endwhile
EndFunction

Function ChangeGovernments(ObjectReference NewFaction)
    int FactionNum = GetFactionNum(NewFaction)
    
    if InitialLeaders.Find(Leader) == ExiledFactionNum
        ExileGovernment()
    endif
    
    Leader = InitialLeaders[FactionNum]
    Second = InitialSeconds[FactionNum]
    ArmyLeader = InitialArmyLeaders[FactionNum]
    Mage = InitialMages[FactionNum]
    
    LeaderAlias.GetOwningQuest().Start()
    
    if Leader
        InitialLeaderAlias.GetOwningQuest().UnRegisterForUpdate()
        InitialLeaderAlias.Clear()
        LeaderAlias.ForceRefTo(Leader)
        debug.notification(Leader.GetActorBase().GetName() + " has become the new leader of " + GetFactionName(self as ObjectReference) + "!")
    else
        Leader = (FactionOwnerActivator as CS_FactionManagementOwnership).Leader
    endif
    
    if Second
        InitialSecondAlias.Clear()
        SecondAlias.ForceRefTo(Second)
    endif
    
    if ArmyLeader
        InitialArmyLeaderAlias.Clear()
        ArmyLeaderAlias.ForceRefTo(ArmyLeader)
    endif
    
    if Mage
        InitialMageAlias.Clear()
        MageAlias.ForceRefTo(Mage)
    endif
    
    if InitialLeaders.Find(Leader) == ExiledFactionNum
        UnExileGovernment()
    endif
    
EndFunction

Function UnEssentialLeaders()
    int i = 0
    while i < InitialLeaders.Length
        if InitialLeaders[i]
            if i == 2 && InitialLeaders[2].GetActorBase() == InitialLeaders[1].GetActorBase()
                InitialLeaders[2] = InitialLeaders[1]
            elseif i == 2 && InitialLeaders[2].GetActorBase() == (FactionOwnerActivator as CS_FactionManagementOwnership).InitialLeaders[0].GetActorBase()
                InitialLeaders[2] = (FactionOwnerActivator as CS_FactionManagementOwnership).InitialLeaders[0]
            else
                Actor NewLeader = InitialLeaders[i].PlaceAtMe(InitialLeaders[i].GetActorBase()) as Actor
                (InitialLeaders[i] as ObjectReference).disable()
                InitialLeaders[i] = NewLeader
            endif
        endif
        i += 1
    endwhile
EndFunction

Function SetInitialLeaders(int factionnum)
    Leader = InitialLeaders[factionnum]
    Second = InitialSeconds[factionnum]
    ArmyLeader = InitialArmyLeaders[factionnum]
    Mage = InitialMages[factionnum]
    
    LeaderAlias.GetOwningQuest().Start()
    
    if Leader
        LeaderAlias.ForceRefTo(Leader)
    else
        Leader = (FactionOwnerActivator as CS_FactionManagementOwnership).Leader
    endif
    
    if Second
        SecondAlias.ForceRefTo(Second)
    endif
    
    if ArmyLeader
        ArmyLeaderAlias.ForceRefTo(ArmyLeader)
    endif
    
    if Mage
        MageAlias.ForceRefTo(Mage)
    endif
EndFunction

Function SetNewFactionLeader(Actor NewLeader)
    
    Leader = NewLeader
    LeaderAlias.ForceRefTo(NewLeader)
    
EndFunction

Function SetLoS(Actor Person)
    LoSAliases[0].GetOwningQuest().Stop()
    CS_StoryGetJarlLoS.SendStoryEventAndWait(akRef1 = Person)
    LeaderLoS = ConvertRefAliasArrayToActors(LoSAliases)
EndFunction

Function SetHoldingsCWOwner(ObjectReference[] Holdings, string type, int factionnum)
    int i = 0
    while i < Holdings.Length
        (Holdings[i] as CS_CityManagementOwnership).VanillaCity.SetKeywordData(CWOwner, factionnum)
        i += 1
    endwhile
EndFunction

Function SetAllHoldingsCWOwner()
    int factionnum
    if FactionOwnerActivator
        factionnum = GetFactionNum(FactionOwnerActivator)
    else
        factionnum = GetFactionNum(self as ObjectReference)
    endif
    
    ObjectReference[] Cities = ((self as ObjectReference) as CS_FactionManagementEconomy).Cities
    ObjectReference[] Villages = ((self as ObjectReference) as CS_FactionManagementEconomy).Villages
    ObjectReference[] Settlements = ((self as ObjectReference) as CS_FactionManagementEconomy).Settlements
    
    if Cities
        SetHoldingsCWOwner(Cities, "Cities", factionnum)
    endif
    if Villages
        SetHoldingsCWOwner(Villages, "Villages", factionnum)
    endif
    if Settlements
        SetHoldingsCWOwner(Settlements, "Settlements", factionnum)
    endif
EndFunction

Function RemoveFactionOwner()
    if GuardMarkerLists
        DeactivateGuards()
    endif
    
    FactionOwnerActivator = None
EndFunction

Function SetOwnerFaction(ObjectReference OwnerFaction)
    
    FactionOwnerActivator = OwnerFaction
    SetAllHoldingsCWOwner()
    
    if GuardMarkerLists
        ActivateGuards()
    endif
EndFunction