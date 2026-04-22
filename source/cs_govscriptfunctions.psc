Scriptname CS_GovScriptFunctions extends Quest  


ReferenceAlias Property Throne Auto
ReferenceAlias Property ChoppingBlock Auto
ReferenceAlias Property Steward Auto
ReferenceAlias Property ASIC Auto
ReferenceAlias Property Blacksmith Auto
ReferenceAlias Property CourtMage Auto
ReferenceAlias Property BaseFlag Auto
ReferenceAlias[] Property Stewards Auto
ReferenceAlias[] Property Housecarls Auto
ReferenceAlias Property AttackCampPlayerMarker Auto
ReferenceAlias Property AttackCampImpMarker Auto
ReferenceAlias Property AttackCampSonsMarker Auto
ReferenceAlias Property Traveller Auto

Message Property TravelToCapitalMessage Auto

FormList Property AllHolds Auto
FormList Property AllLocations Auto
FormList Property AllLocationsCS Auto
FormList Property AllLocationsFort Auto
FormList Property AllHoldings Auto
FormList Property AllCrimeFactions Auto
FormList Property AllCampMarkersPlayer Auto
FormList Property AllCampMarkersImp Auto
FormList Property AllCampLocationsImp Auto
FormList Property AllCampMarkersSons Auto
FormList Property AllCampLocationsSons Auto
FormList Property Thrones Auto
FormList Property ChoppingBlocks Auto
FormList Property GarrisonMarkersImp Auto
FormList Property GarrisonMarkersSons Auto
FormList Property MeetingTableMarkers Auto

GlobalVariable Property CapitalGlobal Auto
GlobalVariable Property CatapultsPurchased Auto
GlobalVariable Property BatteringRamsPurchased Auto
GlobalVariable Property LaddersPurchased Auto

LocationAlias Property Capital Auto
LocationAlias Property CapitalCS Auto
LocationAlias Property Palace Auto
LocationAlias Property ParadeCity Auto
LocationAlias Property AttackCity Auto
LocationAlias Property AttackFort Auto
LocationAlias Property AttackHold Auto
LocationAlias Property AttackCityCS Auto

Quest Property ParadeQuest Auto
Quest Property MeetingTableQuest Auto

ObjectReference Property MeetingTableMarker Auto

Keyword Property CWOwner Auto

Keyword Property CS_StoryMeetingJarl Auto
Keyword Property CS_StoryParade Auto

Faction Property JarlNeutralGivingTroopsFaction Auto

int Property AttackPlanningHoldNum Auto

CS_TMScript Property TMPlayer Auto
CS_TMScript Property TMImp Auto
CS_TMScript Property TMSons Auto
CS_AttackPlanningNewScript Property AttackPlanning Auto
CS_ClaimAreaFunctions Property HoldingsQuest Auto
CS_EconomyVariableFunctions Property EconUpdater Auto
CS_RecruitJarl Property RecruitJarl Auto
CS_ChooseTroopRacesScript Property ChooseTroopRaces Auto
CS_UpgradeTroopsMenu Property UpgradeTroops Auto
CS_TroopUpgradeScript Property TroopUpgrade Auto
CS_MapManageMenuScript Property MapManage Auto
CS_LoyaltyCheckScript Property LoyaltyScript Auto
CS_IntelReportScript Property IntelReport Auto

Function SetUpFactionOwners()
    int i = 0
    while i < AllLocations.GetSize()
        Location Holding = AllLocations.GetAt(i) as Location
        ObjectReference GarrisonMarkerImp = GarrisonMarkersImp.GetAt(i) as ObjectReference
        ObjectReference GarrisonMarkerSons = GarrisonMarkersSons.GetAt(i) as ObjectReference
        if Holding.GetKeywordData(CWOwner) == 1 || GarrisonMarkerImp.IsEnabled() == 1
            (AllHoldings.GetAt(i) as GlobalVariable).SetValue(11)
            Holding.SetKeywordData(CWOwner, 1)
        elseif Holding.GetKeywordData(CWOwner) == 2 || GarrisonMarkerSons.IsEnabled() == 1
            (AllHoldings.GetAt(i) as GlobalVariable).SetValue(12)
            Holding.SetKeywordData(CWOwner, 2)
        endif
        i += 1
    endwhile
    
    RecruitJarl.SetUpJarlInitials()
    LoyaltyScript.SetUpInitialJarlLoyalties()
EndFunction

Function SetUpCapital(int capitalnum)
    if RecruitJarl.JarlAliases[capitalnum].GetActorRef() != None
        RecruitJarl.FireJarl(RecruitJarl.JarlAliases[capitalnum].GetActorRef())
    endif
    if CapitalGlobal.GetValue() != -1
        Stewards[CapitalGlobal.GetValue() as int].Clear()
        Housecarls[CapitalGlobal.GetValue() as int].Clear()
    endif
    Utility.Wait(0.5)
    Stewards[capitalnum].ForceRefTo(Steward.GetActorRef())
    Housecarls[capitalnum].ForceRefTo(ASIC.GetActorRef())
    if (AllLocationsCS.GetAt(CapitalGlobal.GetValue() as int) as Location).GetKeywordData(EconUpdater.JarlEconomy) == 1
        EconUpdater.StewardStopManageEconomy(CapitalGlobal.GetValue() as int)
        DisplayStopManageEconomyMessage(CapitalGlobal.GetValue() as int)
        EconUpdater.StewardManageEconomy(capitalnum)
        DisplayManageEconomyMessage(capitalnum)
    endif
    if MeetingTableMarker
        MeetingTableMarker.disable()
    endif
    Capital.ForceLocationTo(AllLocations.GetAt(capitalnum) as Location)
    CapitalCS.ForceLocationTo(AllLocationsCS.GetAt(capitalnum) as Location)
    Palace.ForceLocationTo(AllPalaces.GetAt(capitalnum) as Location)
    CapitalGlobal.SetValue(capitalnum)
    ChoppingBlock.ForceRefTo(ChoppingBlocks.GetAt(capitalnum) as ObjectReference)
    (MeetingTableMarkers.GetAt(capitalnum) as ObjectReference).enable()
    MeetingTableMarker = (MeetingTableMarkers.GetAt(capitalnum) as ObjectReference)
EndFunction

Function FindNewCapital(int citynum)
    if CapitalGlobal.GetValue() == citynum
        Capital.Clear()
        CapitalCS.Clear()
        Throne.Clear()
        ChoppingBlock.Clear()
        int i = 0
        int NewCapitalFound = 0
        while i < AllHoldings.GetSize() && NewCapitalFound == 0
            if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
                SetUpCapital(i)
                NewCapitalFound = 1
            endif
            i += 1
        endwhile
        if NewCapitalFound == 0
            CapitalGlobal.SetValue(-1)
            CapitalChangeMessageNoCity.show()
        else
            CapitalChangeMessage.show()
        endif
        HoldingsQuest.RefreshGovPackages()
    endif
EndFunction

Function SetUpParade(int citynum)
    CS_StoryParade.SendStoryEvent(AllLocations.GetAt(citynum) as Location)
EndFunction

Function FactionStewardManageCapital()
    EconUpdater.StewardManageEconomy(CapitalGlobal.GetValue() as int)
    DisplayManageEconomyMessage(CapitalGlobal.GetValue() as int)
EndFunction

Function FactionStewardStopManageCapital()
    EconUpdater.StewardStopManageEconomy(CapitalGlobal.GetValue() as int)
    DisplayStopManageEconomyMessage(CapitalGlobal.GetValue() as int)
EndFunction

Function DisplayManageEconomyMessage(int citynum)
    JarlChoose.ForceRefTo(Steward.GetActorRef())
    JarlChooseCity.ForceLocationTo(AllLocations.GetAt(citynum) as Location)
    JarlManageEconomyMessage.show()
EndFunction

Function DisplayStopManageEconomyMessage(int citynum)
    JarlChoose.ForceRefTo(Steward.GetActorRef())
    JarlChooseCity.ForceLocationTo(AllLocations.GetAt(citynum) as Location)
    JarlStopManageEconomyMessage.show()
EndFunction

Function ChooseTroopRacesMenu()
    ChooseTroopRaces.StartMenu()
EndFunction

Function ChangeGovOutfit(Actor GovPerson)
    int i = 0
    while i < GovPositions.Length
        if GovPositions[i].GetActorRef() == GovPerson
            GovCustomOutfits[i].OpenInventory(true)
            GovPerson.RemoveFromFaction(DefaultOutfitFaction)
            GovPerson.AddToFaction(CustomOutfitFaction)
        endif
        i += 1
    endwhile
EndFunction

Function ChangeJarlOutfit(Actor JarlPerson)
    int i = 0
    while i < RecruitJarl.JarlAliases.Length
        if RecruitJarl.JarlAliases[i].GetActorRef() == JarlPerson
            JarlCustomOutfits[i].OpenInventory(true)
            JarlPerson.RemoveFromFaction(DefaultOutfitFaction)
            JarlPerson.AddToFaction(CustomOutfitFaction)
        endif
        i += 1
    endwhile
EndFunction

Function ChangeStewardOutfit(Actor StewardPerson)
    int i = 0
    while i < RecruitJarl.StewardAliases.Length
        if RecruitJarl.StewardAliases[i].GetActorRef() == StewardPerson
            StewardCustomOutfits[i].OpenInventory(true)
            StewardPerson.RemoveFromFaction(DefaultOutfitFaction)
            StewardPerson.AddToFaction(CustomOutfitFaction)
        endif
        i += 1
    endwhile
EndFunction

Function ChangeHousecarlOutfit(Actor HousecarlPerson)
    int i = 0
    while i < RecruitJarl.HousecarlAliases.Length
        if RecruitJarl.HousecarlAliases[i].GetActorRef() == HousecarlPerson
            HousecarlCustomOutfits[i].OpenInventory(true)
            HousecarlPerson.RemoveFromFaction(DefaultOutfitFaction)
            HousecarlPerson.AddToFaction(CustomOutfitFaction)
        endif
        i += 1
    endwhile
EndFunction

Function RemoveAllOutfitFactions(Actor Person)
    Person.RemoveFromFaction(CustomOutfitFaction)
    Person.RemoveFromFaction(DefaultOutfitFaction)  
EndFunction

Function AddToDefaultOutfitFaction(Actor Person)
    Person.RemoveFromFaction(CustomOutfitFaction)
    Person.AddToFaction(DefaultOutfitFaction)
EndFunction

Function UpdateGovOutfit(Actor Person)
    if Person.IsInFaction(JarlFaction) || Person.IsInFaction(VillageLeaderFaction)
        int index = 0
        while index < RecruitJarl.JarlAliases.Length
            if RecruitJarl.JarlAliases[index].GetActorRef() == Person
                if Person.IsInFaction(CustomOutfitFaction)
                    FormList CustomOutfit = (RecruitJarl.JarlAliases[index] as CS_GovUpdateOutfit).CustomOutfit
                    RecruitJarl.JarlAliases[index].GetActorRef().UnequipAll()
                    debug.trace("Person in faction")
                    int i = 0
                    while i < CustomOutfit.GetSize()
                        debug.trace("Equipping items...")
                        RecruitJarl.JarlAliases[index].GetActorRef().AddItem(CustomOutfit.GetAt(i) as Armor, 1)
                        RecruitJarl.JarlAliases[index].GetActorRef().EquipItem(CustomOutfit.GetAt(i) as Armor, true)
                        i += 1
                    endwhile
                elseif Person.IsInFaction(DefaultOutfitFaction)
                    int i = 0
                    while i < JarlDefaultOutfits[index].GetSize()
                        RecruitJarl.JarlAliases[index].GetActorRef().AddItem(JarlDefaultOutfits[index].GetAt(i) as Armor, 1)
                        RecruitJarl.JarlAliases[index].GetActorRef().EquipItem(JarlDefaultOutfits[index].GetAt(i) as Armor, true)
                        i += 1
                    endwhile                    
                endif
            endif
            index += 1
        endwhile
    elseif Person.IsInFaction(StewardFaction) && Person != Steward.GetActorRef()
        int index = 0
        while index < RecruitJarl.StewardAliases.Length
            if RecruitJarl.StewardAliases[index].GetActorRef() == Person
                if Person.IsInFaction(CustomOutfitFaction)
                    FormList CustomOutfit = (RecruitJarl.StewardAliases[index] as CS_GovUpdateOutfit).CustomOutfit
                    RecruitJarl.StewardAliases[index].GetActorRef().UnequipAll()
                    debug.trace("Person in faction")
                    int i = 0
                    while i < CustomOutfit.GetSize()
                        debug.trace("Equipping items...")
                        RecruitJarl.StewardAliases[index].GetActorRef().AddItem(CustomOutfit.GetAt(i) as Armor, 1)
                        RecruitJarl.StewardAliases[index].GetActorRef().EquipItem(CustomOutfit.GetAt(i) as Armor, true)
                        i += 1
                    endwhile
                elseif Person.IsInFaction(DefaultOutfitFaction)
                    int i = 0
                    while i < StewardDefaultOutfit.GetSize()
                        RecruitJarl.StewardAliases[index].GetActorRef().AddItem(StewardDefaultOutfit.GetAt(i) as Armor, 1)
                        RecruitJarl.StewardAliases[index].GetActorRef().EquipItem(StewardDefaultOutfit.GetAt(i) as Armor, true)
                        i += 1
                    endwhile                    
                endif
            endif
            index += 1
        endwhile
    elseif Person.IsInFaction(HousecarlFaction) && Person != ASIC.GetActorRef()
        int index = 0
        while index < RecruitJarl.HousecarlAliases.Length
            if RecruitJarl.HousecarlAliases[index].GetActorRef() == Person
                if Person.IsInFaction(CustomOutfitFaction)
                    FormList CustomOutfit = (RecruitJarl.HousecarlAliases[index] as CS_GovUpdateOutfit).CustomOutfit
                    RecruitJarl.HousecarlAliases[index].GetActorRef().UnequipAll()
                    debug.trace("Person in faction")
                    int i = 0
                    while i < CustomOutfit.GetSize()
                        debug.trace("Equipping items...")
                        RecruitJarl.HousecarlAliases[index].GetActorRef().AddItem(CustomOutfit.GetAt(i) as Armor, 1)
                        RecruitJarl.HousecarlAliases[index].GetActorRef().EquipItem(CustomOutfit.GetAt(i) as Armor, true)
                        i += 1
                    endwhile
                elseif Person.IsInFaction(DefaultOutfitFaction)
                    int i = 0
                    while i < HousecarlDefaultOutfit.GetSize()
                        RecruitJarl.HousecarlAliases[index].GetActorRef().AddItem(HousecarlDefaultOutfit.GetAt(i) as Armor, 1)
                        RecruitJarl.HousecarlAliases[index].GetActorRef().EquipItem(HousecarlDefaultOutfit.GetAt(i) as Armor, true)
                        i += 1
                    endwhile                    
                endif
            endif
            index += 1
        endwhile
    else
        int index = 0
        while index < GovPositions.Length
            if GovPositions[index].GetActorRef() == Person
                if Person.IsInFaction(CustomOutfitFaction)
                    FormList CustomOutfit = (GovPositions[index] as CS_GovUpdateOutfit).CustomOutfit as FormList
                    GovPositions[index].GetActorRef().UnequipAll()
                    debug.trace("Person in faction")
                    int i = 0
                    while i < CustomOutfit.GetSize()
                        debug.trace("Equipping items...")
                        if GovPositions[index].GetActorRef().IsEquipped(CustomOutfit.GetAt(i) as Armor) != true
                            if GovPositions[index].GetActorRef().GetItemCount(CustomOutfit.GetAt(i) as Armor) < 1
                                GovPositions[index].GetActorRef().AddItem(CustomOutfit.GetAt(i) as Armor, 1)
                            endif
                            GovPositions[index].GetActorRef().EquipItem(CustomOutfit.GetAt(i) as Armor, true)
                        endif
                        i += 1
                    endwhile
                elseif Person.IsInFaction(DefaultOutfitFaction)
                    GovPositions[index].GetActorRef().UnequipAll()
                    int i = 0
                    while i < GovDefaultOutfits[index].GetSize()
                        if GovPositions[index].GetActorRef().IsEquipped(GovDefaultOutfits[index].GetAt(i) as Armor) != true
                            if GovPositions[index].GetActorRef().GetItemCount(GovDefaultOutfits[index].GetAt(i) as Armor) < 1
                                GovPositions[index].GetActorRef().AddItem(GovDefaultOutfits[index].GetAt(i) as Armor, 1)
                            endif
                            GovPositions[index].GetActorRef().EquipItem(GovDefaultOutfits[index].GetAt(i) as Armor, true)
                        endif
                        i += 1
                    endwhile                    
                endif
            endif
            index += 1
        endwhile
    endif
EndFunction

Function SiegeEquipmentMenu(int Response=0)
    UpdateCurrentInstanceGlobal(EconUpdater.CoinTotalPlayer)
    UpdateCurrentInstanceGlobal(EconUpdater.WoodTotalPlayer)
    UpdateCurrentInstanceGlobal(CatapultsPurchased)
    UpdateCurrentInstanceGlobal(BatteringRamsPurchased)
    UpdateCurrentInstanceGlobal(LaddersPurchased)
    Response = SiegeEquipmentMessage.show()
    if Response == 0
        if EconUpdater.CoinTotalPlayer.GetValue() >= 5000 && EconUpdater.WoodTotalPlayer.GetValue() >= 50
            PayForSiegeEquipment(5000, 50)
            CatapultsPurchased.Mod(1)
            UpdateCurrentInstanceGlobal(CatapultsPurchased)
            SiegeEquipmentMenu()
        elseif EconUpdater.CoinTotalPlayer.GetValue() < 5000 && EconUpdater.WoodTotalPlayer.GetValue() < 50
            debug.notification("You do not have enough coin and wood!")
            SiegeEquipmentMenu()
        elseif EconUpdater.CoinTotalPlayer.GetValue() < 5000
            debug.notification("You do not have enough coin!")
            SiegeEquipmentMenu()
        elseif EconUpdater.WoodTotalPlayer.GetValue() < 50
            debug.notification("You do not have enough wood!")
            SiegeEquipmentMenu()
        endif
    elseif Response == 1
        if EconUpdater.CoinTotalPlayer.GetValue() >= 3000 && EconUpdater.WoodTotalPlayer.GetValue() >= 30
            PayForSiegeEquipment(3000, 30)
            BatteringRamsPurchased.Mod(1)
            UpdateCurrentInstanceGlobal(BatteringRamsPurchased)
            SiegeEquipmentMenu()
        elseif EconUpdater.CoinTotalPlayer.GetValue() < 3000 && EconUpdater.WoodTotalPlayer.GetValue() < 30
            debug.notification("You do not have enough coin and wood!")
            SiegeEquipmentMenu()
        elseif EconUpdater.CoinTotalPlayer.GetValue() < 3000
            debug.notification("You do not have enough coin!")
            SiegeEquipmentMenu()
        elseif EconUpdater.WoodTotalPlayer.GetValue() < 30
            debug.notification("You do not have enough wood!")
            SiegeEquipmentMenu()
        endif
    elseif Response == 2
        if EconUpdater.CoinTotalPlayer.GetValue() >= 1000 && EconUpdater.WoodTotalPlayer.GetValue() >= 10
            PayForSiegeEquipment(1000, 10)
            LaddersPurchased.Mod(1)
            UpdateCurrentInstanceGlobal(LaddersPurchased)
            SiegeEquipmentMenu()
        elseif EconUpdater.CoinTotalPlayer.GetValue() < 1000 && EconUpdater.WoodTotalPlayer.GetValue() < 10
            debug.notification("You do not have enough coin and wood!")
            SiegeEquipmentMenu()
        elseif EconUpdater.CoinTotalPlayer.GetValue() < 1000
            debug.notification("You do not have enough coin!")
            SiegeEquipmentMenu()
        elseif EconUpdater.WoodTotalPlayer.GetValue() < 10
            debug.notification("You do not have enough wood!")
            SiegeEquipmentMenu()
        endif
    endif
EndFunction

Function PayForSiegeEquipment(int coinamount, int woodamount)
    EconUpdater.CoinTotalPlayer.Mod(-coinamount)
    EconUpdater.WoodTotalPlayer.Mod(-woodamount)
    EconUpdater.CoinSound.Play(Game.GetPlayer())
    UpdateCurrentInstanceGlobal(EconUpdater.CoinTotalPlayer)
    UpdateCurrentInstanceGlobal(EconUpdater.WoodTotalPlayer)
EndFunction

Function MoveGovToBase()
    if BaseFlag.GetRef().IsInLocation(Capital.GetLocation())
        Steward.GetRef().MoveTo(BaseFlag.GetRef(), 10, 10, 50)
        ASIC.GetRef().MoveTo(BaseFlag.GetRef(), 10, 10, 50)
        Blacksmith.GetRef().MoveTo(BaseFlag.GetRef(), 10, 10, 50)
        CourtMage.GetRef().MoveTo(BaseFlag.GetRef(), 10, 10, 50)
    endif
EndFunction

Function DisplayTravelMessage(Actor akTraveller)
    Traveller.ForceRefTo(akTraveller)
    TravelToCapitalMessage.show()
EndFunction

Function RemoveFromAllCrimeFactions(Actor Citizen)
    int i = 0
    while i < AllCrimeFactions.GetSize()
        Citizen.RemoveFromFaction(AllCrimeFactions.GetAt(i) as Faction)
        i += 1
    endwhile
EndFunction

Function ChooseAttackHold(int holdnum)
    AttackPlanningHoldNum = holdnum
    MapManage.CheckIfEnemyHasLandSuperiority(holdnum)
    AttackHold.ForceLocationTo(AllHolds.GetAt(holdnum) as Location)
    AttackCity.ForceLocationTo(AllLocations.GetAt(holdnum) as Location)
    AttackCityCS.ForceLocationTo(AllLocationsCS.GetAt(holdnum) as Location)
    AttackFort.ForceLocationTo(AllLocationsFort.GetAt(holdnum) as Location)
    AttackCampPlayerMarker.ForceRefTo(AllCampMarkersPlayer.GetAt(holdnum) as ObjectReference)
    AttackCampImpMarker.ForceRefTo(AllCampMarkersImp.GetAt(holdnum) as ObjectReference)
    AttackCampSonsMarker.ForceRefTo(AllCampMarkersSons.GetAt(holdnum) as ObjectReference)
EndFunction

Function StartInvasion(int holdnum)
    Location HoldLoc = AllHolds.GetAt(holdnum) as Location
EndFunction


Quest Property houseQuest  Auto  
Quest Property HouseQuestDawnstar Auto
Quest Property HouseQuestFalkreath Auto
Quest Property HouseQuestMorthal Auto

Actor Property HousecarlMarkarth Auto
Actor Property HousecarlRiften Auto
Actor Property HousecarlSolitude Auto
Actor Property HousecarlWhiterun Auto
Actor Property HousecarlWindhelm Auto
Actor Property HousecarlDawnstar Auto
Actor Property HousecarlFalkreath Auto
Actor Property HousecarlMorthal Auto

Actor[] Property GovCustomOutfits Auto
Actor[] Property JarlCustomOutfits Auto
Actor[] Property StewardCustomOutfits Auto
Actor[] Property HousecarlCustomOutfits Auto

FormList[] Property GovDefaultOutfits Auto
FormList[] Property JarlDefaultOutfits Auto
FormList Property StewardDefaultOutfit Auto
FormList Property HousecarlDefaultOutfit Auto

ReferenceAlias[] Property GovPositions Auto

ObjectReference Property BedroomMarkarth Auto
ObjectReference Property BedroomRiften Auto
ObjectReference Property BedroomSolitude Auto
ObjectReference Property BedroomWhiterun Auto
ObjectReference Property BedroomWindhelm Auto

GlobalVariable Property CS_BYOHHPCost Auto
GlobalVariable Property Version Auto

FormList Property AllPalaces  Auto  

ReferenceAlias Property JarlChoose  Auto  

LocationAlias Property JarlChooseCity  Auto  

Message Property JarlManageEconomyMessage  Auto  
Message Property JarlStopManageEconomyMessage  Auto  
Message Property SiegeEquipmentMessage Auto

LocationAlias Property FirstCity  Auto  

Message Property CapitalChangeMessage  Auto  
Message Property CapitalChangeMessageNoCity Auto

Faction Property CustomOutfitFaction  Auto  
Faction Property DefaultOutfitFaction Auto
Faction Property JarlFaction Auto
Faction Property StewardFaction Auto
Faction Property HousecarlFaction Auto
Faction Property VillageLeaderFaction Auto
