Scriptname CS_CityManagementOwnership extends ObjectReference  

import CS_CommonFunctions

int Property holdnum Auto
int Property factionnum Auto hidden

string property CityNameString Auto
Location Property VanillaCity Auto

ObjectReference Property FactionOwnerActivator Auto
ObjectReference Property HoldFactionOwnerActivator Auto ;Faction owner of roads in the hold
ObjectReference Property HQInteriorMarker Auto
ObjectReference Property HQExteriorMarker Auto
ObjectReference Property CityName Auto
ObjectReference Property DefensiveExteriorMarker Auto

FormList Property GarrisonMarkersImp Auto
FormList Property GarrisonMarkersSons Auto
FormList Property SettlementTerritoryList Auto

Keyword Property CWOwner Auto

Actor[] Property initialLineOfSuccessionImp Auto
Actor[] Property initialLineOfSuccessionSons Auto

Actor[] Property LineOfSuccession Auto hidden

ObjectReference Property LeaderStandMarkers Auto
ObjectReference Property SecondStandMarker Auto
ObjectReference Property ArmyLeaderStandMarker Auto
ObjectReference Property MageStandMarker Auto

CS_Jarl Property Jarl Auto
CS_StewardHold Property Steward Auto
CS_Housecarl Property HouseCarl Auto
CS_CourtMageHold Property CourtMage Auto

int Property ExiledFactionInt Auto ; the Faction Num that the Jarl must be in in order to be put in the above aliases


int Property CityClosedToPlayer Auto hidden
ObjectReference[] Property WarsWithPlayer Auto hidden

ObjectReference[] Property Banners Auto hidden

WorldSpace Property CityWorldSpace Auto

CS_GovPositions Property CS_GovernmentsReferenceQuest Auto

Function SetUp()
    if SecondStandMarker
        if HQInteriorMarker
            SecondStandMarker.MoveTo(HQInteriorMarker)
        elseif HQExteriorMarker
            SecondStandMarker.MoveTo(HQExteriorMarker)
        endif
    endif
EndFunction

Function SetOwnerFaction(ObjectReference FactionActivator)
    FactionOwnerActivator = FactionActivator
EndFunction

Function AddBanner(ObjectReference NewBanner)
    Banners = AddToArray(NewBanner, Banners)
EndFunction

Function RemoveBanner(ObjectReference OldBanner)
    Banners = RemoveFromArray(OldBanner, Banners)
EndFunction

Function ChangeOwnerFaction(ObjectReference FactionActivator)
    CS_CityManagementMilitary CityMilitaryScript = (self as ObjectReference) as CS_CityManagementMilitary
    CS_FactionManagementEconomy FactionEconomyScript = FactionOwnerActivator as CS_FactionManagementEconomy
    CS_FactionManagementDiplomacy FactionDiplomacyScript = FactionOwnerActivator as CS_FactionManagementDiplomacy
    CS_FactionManagementDiplomacy ReceivingFactionDiplomacyScript = FactionActivator as CS_FactionManagementDiplomacy
    CS_FactionManagementEconomy ReceivingFactionEconomyScript = FactionActivator as CS_FactionManagementEconomy
    
    if FactionEconomyScript.Cities.Find(self as ObjectReference) >= 0
        FactionEconomyScript.RemoveCity(self as ObjectReference)
        ReceivingFactionEconomyScript.AddCity(self as ObjectReference)
    elseif FactionEconomyScript.Villages.Find(self as ObjectReference) >= 0
        FactionEconomyScript.RemoveVillage(self as ObjectReference)
        ReceivingFactionEconomyScript.AddVillage(self as ObjectReference)
    elseif FactionEconomyScript.Settlements.Find(self as ObjectReference) >= 0
        FactionEconomyScript.RemoveSettlement(self as ObjectReference)
        ReceivingFactionEconomyScript.AddSettlement(self as ObjectReference)
    endif
    
    FactionOwnerActivator = FactionActivator
    
    debug.notification(ReceivingFactionDiplomacyScript.FactionNameString + " has taken control of " + CityNameString + " from " + FactionDiplomacyScript.FactionNameString) 
EndFunction

; TEMP FACTION OWNERSHIP FUNCTIONS----------------------------------------------------

Function TempSetInitialFactionGovernment(CS_FactionManagementOwnership FactionOwnership)
    
EndFunction

Function SetInitialLeaders(int newfaction)
    
EndFunction

Function SetNewFactionLeader(Actor NewLeader)
    Jarl.ForceRefTo(NewLeader)
EndFunction

bool Function CheckIfExiled(Actor Person)

EndFunction

Function ExileActor(Actor Person)
    
EndFunction

Function UnExileActor(Actor Person)
    
EndFunction

Function ExileGovernment()
    Jarl.Fire()
    Steward.Fire()
    Housecarl.Fire()
    CourtMage.Fire()
EndFunction

Function UnExileGovernment()
    
EndFunction

Function ChangeGovernments(ObjectReference NewFaction)
    Jarl.GetOwningQuest().Start()
    
    ExileGovernment()
    
    CS_FactionManagementOwnership FactionOwnership = NewFaction as CS_FactionManagementOwnership
    
    factionnum = GetFactionNum(NewFaction)
    
    if factionnum == 0 && !FactionOwnership.HoldLeaders[holdnum]
        Jarl.Recruit(Game.GetPlayer())
    else
        Jarl.Recruit(FactionOwnership.HoldLeaders[holdnum])
    endif
    Steward.Recruit(FactionOwnership.HoldStewards[holdnum])
    HouseCarl.Recruit(FactionOwnership.HoldHousecarls[holdnum])
    CourtMage.Recruit(FactionOwnership.HoldMages[holdnum])
EndFunction

;/ Come back to this stuff later
Function SetUpSetFaction()
    ObjectReference GarrisonMarkerImp = GarrisonMarkersImp.GetAt(holdnum) as ObjectReference
    ObjectReference GarrisonMarkerSons = GarrisonMarkersSons.GetAt(holdnum) as ObjectReference
    
    if VanillaCity.GetKeywordData(CWOwner) == 1 || GarrisonMarkerImp.IsEnabled()
        VanillaCity.SetKeywordData(CWOwner, 1)
        factionnum = 11
        LineOfSuccession = initialLineOfSuccessionImp
    elseif VanillaCity.GetKeywordData(CWOwner) == 2 || GarrisonMarkerSons.IsEnabled()
        VanillaCity.SetKeywordData(CWOwner, 2)
        factionnum = 12
        LineOfSuccession = initialLineOfSuccessionSons
    endif
EndFunction

Function SetUpSetGovernment()
    Jarl.ForceRefTo(ReplaceWithDuplicate(LineOfSuccession[0]))
    
    if factionnum == 11
        if CS_GovernmentsReferenceQuest.StewardsImp[holdnum]
            Steward.ForceRefTo(ReplaceWithDuplicate(CS_GovernmentsReferenceQuest.StewardsImp[holdnum]))
        endif
        
        if CS_GovernmentsReferenceQuest.HouseCarlsImp[holdnum]
            HouseCarl.ForceRefTo(ReplaceWithDuplicate(CS_GovernmentsReferenceQuest.HouseCarlsImp[holdnum]))
        endif
    elseif factionnum == 12
        if CS_GovernmentsReferenceQuest.StewardsSons[holdnum]
            Steward.ForceRefTo(ReplaceWithDuplicate(CS_GovernmentsReferenceQuest.StewardsSons[holdnum]))
        endif
        
        if CS_GovernmentsReferenceQuest.HouseCarlsSons[holdnum]
            HouseCarl.ForceRefTo(ReplaceWithDuplicate(CS_GovernmentsReferenceQuest.HouseCarlsSons[holdnum]))
        endif
    endif
        
    if CS_GovernmentsReferenceQuest.Wizards[holdnum]
        CourtMage.ForceRefTo(ReplaceWithDuplicate(CS_GovernmentsReferenceQuest.Wizards[holdnum]))
    endif
EndFunction

Actor Function ReplaceWithDuplicate(ObjectReference ReplaceeRef)
    Actor Replacee = ReplaceeRef as Actor
    Actor Replacer = Replacee.PlaceAtMe(Replacee.GetActorBase(), abForcePersist=true) as Actor
    Replacee.disable()
    Replacer.GetActorBase().SetEssential(false)
    Replacer.GetActorBase().SetProtected(true)
    
    return Replacer
EndFunction/;

Auto State NotSetUp

    Event OnUpdate()
        debug.trace("Starting city " + holdnum + " ownership set up...")
        SetUp()
        debug.trace("City " + holdnum + " ownership SET UP!")
        GoToState("SetUp")
    EndEvent
    
EndState