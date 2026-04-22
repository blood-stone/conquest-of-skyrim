Scriptname CS_FactionManagementEconomy extends ObjectReference  

import CS_CommonFunctions

ObjectReference[] Property Cities Auto hidden
ObjectReference[] Property Villages Auto hidden
ObjectReference[] Property Settlements Auto hidden

ActorBase Property CS_StorageTreasury Auto
ActorBase Property CS_StorageFoodFaction Auto
ActorBase Property CS_StorageMaterialsFaction Auto
ActorBase Property CS_StorageEquipmentFaction Auto

FormList Property CS_StorageFoodIncomeItemsFaction Auto
FormList Property CS_StorageMaterialsIncomeItemsFaction Auto
FormList Property CS_StorageEquipmentIncomeItemsFaction Auto

int Property Treasury Auto hidden

ObjectReference Property StorageTreasury Auto hidden
ObjectReference Property StorageFood Auto hidden
ObjectReference Property StorageMaterials Auto hidden
ObjectReference Property StorageEquipment Auto hidden

FormList Property InitialTerritoryLocations Auto
FormList Property InitialRaces Auto

FormList Property CS_RacePresetsAllMale Auto
FormList Property CS_RacePresetsAllFemale Auto

int Property MalesAllowed Auto hidden
int Property FemalesAllowed Auto hidden
int Property MalesAllowedSettlers Auto hidden
int Property FemalesAllowedSettlers Auto hidden

FormList Property CS_RacesAll Auto
FormList Property CS_RaceListTroops Auto
FormList Property CS_RaceListSettlers Auto

int[] Property AllowedRaces Auto
int[] Property AllowedRacesSettlers Auto

LeveledActor Property RaceLChar Auto
LeveledActor Property RaceLCharSettlers Auto

int Property CommonerIncreaseRate Auto hidden

int Property InfluenceCommoner Auto hidden
int Property InfluenceNobility Auto hidden
int Property InfluenceGuard Auto hidden
int Property InfluenceJarl Auto hidden

int Property TotalPopulationCommoner Auto hidden
int Property TotalPopulationNobility Auto hidden
int Property TotalPopulationGuard Auto hidden

Quest Property ThaneQuest Auto

CS_ChooseTroopRacesScript Property CS_ChooseTroopRaces Auto

ObjectReference Property CS_FactionPlayer Auto

ActorBase[] Property Sponsors1000 Auto hidden
ActorBase[] Property Sponsors5000 Auto hidden
ActorBase[] Property Sponsors10000 Auto hidden

Function SetUp()
    SetUpStorage()
    ResetStorage()
    
    int i = 0
    while i < Cities.Length
        (Cities[i] as CS_CityManagementOwnership).SetOwnerFaction(self as ObjectReference)
        Cities[i].RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
    
    if !((self as ObjectReference) as CS_FactionManagementOwnership).HQ
        if Cities.Length > 0
            debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionName.GetName() + " setting HQ to " + (Cities[0] as CS_CityManagementOwnership).VanillaCity.GetName())
            ((self as ObjectReference) as CS_FactionManagementOwnership).SetHQ(Cities[0])
        elseif Settlements.Length > 0
            ((self as ObjectReference) as CS_FactionManagementOwnership).SetHQ(Settlements[0])
        endif
    endif
    ((self as ObjectReference) as CS_FactionManagementOwnership).SetUpGuards()
    ;/
    i = 0
    int loopnum = 0
    while i < Cities.Length && loopnum < 100
        if (Cities[i] as CS_CityManagementEconomy).GetState() == "NotSetUp"
            utility.wait(0.1)
            loopnum += 1
            i = 0
        else
            i += 1
        endif
    endwhile/;
    
    if RaceLChar
        SetUpRaces()
    endif
    UpdatePopulation()
    GoToState("SetUp")
EndFunction

Function SetUpRaces()
    AllowedRaces = GetNewIntArray(CS_RacePresetsAllMale.GetSize())
    AllowedRacesSettlers = GetNewIntArray(CS_RacePresetsAllMale.GetSize())
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " setting up races...")
    int i = 0
    while i < InitialRaces.GetSize()
        FormList RaceList = InitialRaces.GetAt(i) as FormList
        int malenum = CS_RacePresetsAllMale.Find(RaceList)
        if malenum >= 0
            MalesAllowed = 1
            AllowedRaces[malenum] = 1
            MalesAllowedSettlers = 1
            AllowedRacesSettlers[malenum] = 1
        else
            FemalesAllowed = 1
            int femalenum = CS_RacePresetsAllFemale.Find(RaceList)
            AllowedRaces[femalenum] = 1
            FemalesAllowedSettlers = 1
            AllowedRacesSettlers[femalenum] = 1
        endif
        i += 1
    endwhile
    
    UpdateRaces()
    UpdateRacesSettlers()
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " races set up!")
EndFunction

Function UpdateRaces()
    debug.trace("Updating races...")
    RaceLChar.Revert()
    CS_RaceListTroops.Revert()
    int i = 0
    while i < AllowedRaces.Length
        if AllowedRaces[i] == 1
            if MalesAllowed == 1
                FormList RaceList = CS_RacePresetsAllMale.GetAt(i) as FormList
                int index = 0
                while index < RaceList.GetSize()
                    RaceLChar.AddForm(RaceList.GetAt(index) as ActorBase, 1)
                    if (Self as ObjectReference) == CS_FactionPlayer
                        CS_RaceListTroops.AddForm(CS_RacesAll.GetAt(i) as Race)
                    endif
                    index += 1
                endwhile
            endif
            
            if FemalesAllowed == 1
                FormList RaceList = CS_RacePresetsAllFemale.GetAt(i) as FormList
                int index = 0
                while index < RaceList.GetSize()
                    RaceLChar.AddForm(RaceList.GetAt(index) as ActorBase, 1)
                    if (Self as ObjectReference) == CS_FactionPlayer
                        CS_RaceListTroops.AddForm(CS_RacesAll.GetAt(i) as Race)
                    endif
                    index += 1
                endwhile
            endif
        endif
        i += 1
    endwhile
    debug.trace("Races updated!")
EndFunction

Function UpdateRacesSettlers()
    RaceLCharSettlers.Revert()
    CS_RaceListSettlers.Revert()
    int i = 0
    while i < AllowedRacesSettlers.Length
        if AllowedRacesSettlers[i] == 1
            if MalesAllowedSettlers == 1
                FormList RaceList = CS_RacePresetsAllMale.GetAt(i) as FormList
                int index = 0
                while index < RaceList.GetSize()
                    RaceLCharSettlers.AddForm(RaceList.GetAt(index) as ActorBase, 1)
                    if (Self as ObjectReference) == CS_FactionPlayer
                        CS_RaceListSettlers.AddForm(CS_RacesAll.GetAt(i) as Race)
                    endif
                    index += 1
                endwhile
            endif
            
            if FemalesAllowedSettlers == 1
                FormList RaceList = CS_RacePresetsAllFemale.GetAt(i) as FormList
                int index = 0
                while index < RaceList.GetSize()
                    RaceLCharSettlers.AddForm(RaceList.GetAt(index) as ActorBase, 1)
                    if (Self as ObjectReference) == CS_FactionPlayer
                        CS_RaceListSettlers.AddForm(CS_RacesAll.GetAt(i) as Race)
                    endif
                    index += 1
                endwhile
            endif
        endif
        i += 1
    endwhile
EndFunction

Function SetUpStorage()
    ;/int FactionNum = GetFactionNum(self as ObjectReference)
    
    StorageTreasury = PlaceAtMe(CS_StorageTreasury)
    (StorageTreasury as CS_StorageTreasuryScript).FactionOwner = Self as ObjectReference
    
    StorageFood = PlaceAtMe(CS_StorageFoodFaction)
    (StorageFood as CS_StorageFactionScript).FactionOwner = Self as ObjectReference
    (StorageFood as CS_StorageFactionScript).IncomeStorageItems = CS_StorageFoodIncomeItemsFaction.GetAt(FactionNum) as FormList
    ;(StorageFood as CS_StorageFactionScript).RegisterForSingleUpdate(0.1)/;
    ;/
    StorageMaterials = PlaceAtMe(CS_StorageMaterialsFaction)
    (StorageMaterials as CS_StorageFactionScript).FactionOwner = Self as ObjectReference
    (StorageMaterials as CS_StorageFactionScript).IncomeStorageItems = CS_StorageMaterialsIncomeItemsFaction.GetAt(FactionNum) as FormList/;
    ;(StorageMaterials as CS_StorageFactionScript).RegisterForSingleUpdate(0.1)/;
    ;/
    StorageEquipment = PlaceAtMe(CS_StorageEquipmentFaction)
    (StorageEquipment as CS_StorageFactionScript).FactionOwner = Self as ObjectReference
    (StorageEquipment as CS_StorageFactionScript).IncomeStorageItems = CS_StorageEquipmentIncomeItemsFaction.GetAt(FactionNum) as FormList/;
    ;(StorageEquipment as CS_StorageFactionScript).RegisterForSingleUpdate(0.1)/;
EndFunction

Function ResetStorage()
    (StorageTreasury as CS_StorageTreasuryScript).ResetStorageAmounts()
    (StorageFood as CS_StorageFactionScript).ResetStorageAmounts()
    (StorageMaterials as CS_StorageFactionScript).ResetStorageAmounts()
    (StorageEquipment as CS_StorageFactionScript).ResetStorageAmounts()
EndFunction

Function InitiateStorageTrade()
    (StorageFood as CS_StorageFactionScript).InitiateTrade()
    (StorageMaterials as CS_StorageFactionScript).InitiateTrade()
    (StorageEquipment as CS_StorageFactionScript).InitiateTrade()
EndFunction

Function AddSponsor(Actor Person, int amount)
    ActorBase PersonBase = Person.GetActorBase()
    
    if amount == 1000
        Sponsors1000 = AddToActorBaseArray(PersonBase, Sponsors1000)
    elseif amount == 5000
        Sponsors5000 = AddToActorBaseArray(PersonBase, Sponsors5000)
    elseif amount == 10000
        Sponsors10000 = AddToActorBaseArray(PersonBase, Sponsors10000)
    endif
EndFunction

Function RemoveSponsor(Actor Person)
    ActorBase PersonBase = Person.GetActorBase()
    
    if Sponsors1000.Find(PersonBase) >= 0
        Sponsors1000 = RemoveFromActorBaseArray(PersonBase, Sponsors1000)
    elseif Sponsors5000.Find(PersonBase) >= 0
        Sponsors5000 = RemoveFromActorBaseArray(PersonBase, Sponsors5000)
    elseif Sponsors10000.Find(PersonBase) >= 0
        Sponsors10000 = RemoveFromActorBaseArray(PersonBase, Sponsors10000)
    endif
EndFunction

Function SetCommonerIncreaseRate()
    CommonerIncreaseRate = 1*Settlements.Length + 2*Villages.Length + 3*Cities.Length ;Change with influence system later
    
    ObjectReference[] Vassals = GetFactionDiplomacy(self as ObjectReference).Vassals
    int i = 0
    while i < Vassals.Length
        CS_FactionManagementEconomy VassalEconomy = GetFactionEconomy(Vassals[i])
        CommonerIncreaseRate += 1*VassalEconomy.Settlements.Length + 2*VassalEconomy.Villages.Length + 3*VassalEconomy.Cities.Length
        i += 1
    endwhile
    ;/    
    ObjectReference OwnerFaction = ((self as ObjectReference) as CS_FactionManagementOwnership).FactionOwnerActivator
    if OwnerFaction
        CommonerIncreaseRate += (OwnerFaction as CS_FactionManagementEconomy).CommonerIncreaseRate
    endif/;
EndFunction

Function UpdateHoldingCommonerIncreaseRates()
    int i = 0
    while i < Cities.Length
        (Cities[i] as CS_CityManagementPopulation).UpdateCommonerIncreaseRate()
        i += 1
    endwhile
    
    i = 0
    while i < Settlements.Length
        (Settlements[i] as CS_CityManagementPopulation).UpdateCommonerIncreaseRate()
        i += 1
    endwhile
EndFunction

Function AddCity(ObjectReference City)
    if Cities.Find(City) >= 0
        return
    endif
    
    Cities = AddToArray(City, Cities)
    (City as CS_CityManagementOwnership).SetOwnerFaction(self as ObjectReference)
    if Cities.Length == 1 && !((self as ObjectReference) as CS_FactionManagementOwnership).HQ
        ((self as ObjectReference) as CS_FactionManagementOwnership).SetHQ(City)
    endif
EndFunction

Function RemoveCity(ObjectReference City)
    Cities = RemoveFromArray(City, Cities)
    (City as CS_CityManagementOwnership).SetOwnerFaction(None)
EndFunction

Function AddVillage(ObjectReference Village)
    if Villages.Find(Village) >= 0
        return
    endif
    
    Villages = AddToArray(Village, Villages)
    (Village as CS_CityManagementOwnership).SetOwnerFaction(self as ObjectReference)
    if Villages.Length == 1 && !((self as ObjectReference) as CS_FactionManagementOwnership).HQ
        ((self as ObjectReference) as CS_FactionManagementOwnership).SetHQ(Village)
    endif
EndFunction

Function RemoveVillage(ObjectReference Village)
    Villages = RemoveFromArray(Village, Villages)
    (Village as CS_CityManagementOwnership).SetOwnerFaction(None)
EndFunction

Function AddSettlement(ObjectReference Settlement)
    if Settlements.Find(Settlement) >= 0
        return
    endif
    
    Settlements = AddToArray(Settlement, Settlements)
    (Settlement as CS_CityManagementOwnership).SetOwnerFaction(self as ObjectReference)
    if Settlements.Length == 1 && !((self as ObjectReference) as CS_FactionManagementOwnership).HQ
        ((self as ObjectReference) as CS_FactionManagementOwnership).SetHQ(Settlement)
    endif
EndFunction

Function RemoveSettlement(ObjectReference Settlement)
    Settlements = RemoveFromArray(Settlement, Settlements)
    (Settlement as CS_CityManagementOwnership).SetOwnerFaction(None)
EndFunction

ObjectReference Function GetStorage(string StorageType)
    if StorageType == "Food"
        return StorageFood
    elseif StorageType == "Materials"
        return StorageMaterials
    elseif StorageType == "Equipment"
        return StorageEquipment
    endif
EndFunction

Function UpdatePopulation()
    TotalPopulationCommoner = 0
    TotalPopulationNobility = 0
    TotalPopulationGuard = 0
    
    int i = 0
    while i < Cities.Length
        TotalPopulationCommoner += (Cities[i] as CS_CityManagementPopulation).PopulationCommoners
        TotalPopulationNobility += (Cities[i] as CS_CityManagementPopulation).Nobles.Length
        TotalPopulationCommoner += (Cities[i] as CS_CityManagementMilitary).Guards
        i += 1
    endwhile
    
    ObjectReference[] Vassals = ((self as ObjectReference) as CS_FactionManagementDiplomacy).Vassals
    if Vassals
        i = 0
        while i < Vassals.Length
            (Vassals[i] as CS_FactionManagementEconomy).UpdatePopulation()
            
            TotalPopulationCommoner += (Vassals[i] as CS_FactionManagementEconomy).TotalPopulationCommoner
            TotalPopulationNobility += (Vassals[i] as CS_FactionManagementEconomy).TotalPopulationNobility
            i += 1
        endwhile
    endif
    
EndFunction

Function UpdateInfluences()
    int initialinfluencecommoner = InfluenceCommoner
    int initialinfluencenobility = InfluenceNobility
    int initialinfluenceguard = InfluenceGuard
    int initialinfluencejarl = InfluenceJarl
    
    InfluenceCommoner = 0
    InfluenceNobility = 0
    InfluenceGuard = 0
    
    int i = 0
    while i < Cities.Length
        if TotalPopulationCommoner > 0
            float commonerpercentage = ((Cities[i] as CS_CityManagementPopulation).PopulationCommoners as float/TotalPopulationCommoner)
            InfluenceCommoner += math.floor(commonerpercentage*(Cities[i] as CS_CityManagementPopulation).InfluenceCommoner)
        endif
        
        if TotalPopulationNobility > 0
            float nobilitypercentage = ((Cities[i] as CS_CityManagementPopulation).Nobles.Length as float/TotalPopulationNobility)
            InfluenceNobility += math.floor(nobilitypercentage*(Cities[i] as CS_CityManagementPopulation).InfluenceNobility)
        endif
        
        if TotalPopulationGuard > 0
            float guardpercentage = ((Cities[i] as CS_CityManagementMilitary).Guards as float/TotalPopulationGuard)
            InfluenceGuard += math.floor(guardpercentage*(Cities[i] as CS_CityManagementPopulation).InfluenceGuard)
        endif
        
        InfluenceJarl = (Cities[i] as CS_CityManagementPopulation).InfluenceJarl
        i += 1
    endwhile
    
    ShowInfluenceDifferenceMessage("Commoners", InfluenceCommoner - initialinfluenceCommoner)
    ShowInfluenceDifferenceMessage("Nobility", InfluenceNobility - initialinfluenceNobility)
    ShowInfluenceDifferenceMessage("Guards", InfluenceGuard - initialinfluenceGuard)
    ShowInfluenceDifferenceMessage("Jarl", InfluenceJarl - initialinfluenceJarl)
    
    ShowInfluenceMessage("Commoners", initialinfluencecommoner)
    ShowInfluenceMessage("Nobility", initialinfluencenobility)
    ShowInfluenceMessage("Guards", initialinfluenceguard)
    ShowInfluenceMessage("Jarl", initialinfluencejarl)
EndFunction

Function ShowInfluenceDifferenceMessage(string group, int Influencedifference)
    string factionstring = ((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString
    if InfluenceDifference < 0
        if InfluenceDifference <= -20
            debug.notification("Your influence with the " + group + " in " + factionstring + " has greatly decreased!")
        elseif InfluenceDifference <= -10
            debug.notification("Your influence with the " + group + " in " + factionstring + " has moderately decreased!")
        elseif InfluenceDifference < 0
            debug.notification("Your influence with the " + group + " in " + factionstring + " has slightly decreased!")
        endif
    elseif InfluenceDifference > 0
        if InfluenceDifference >= 20
            debug.notification("Your influence with the " + group + " in " + factionstring + " has greatly increased!")
        elseif InfluenceDifference >= 10
            debug.notification("Your influence with the " + group + " in " + factionstring + " has moderately increased!")
        elseif InfluenceDifference > 0
            debug.notification("Your influence with the " + group + " in " + factionstring + " has slightly increased!")
        endif
    endif
EndFunction

Function ShowInfluenceMessage(string group, int initialinfluence)
    string factionstring = ((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString
    string changetext
    int newinfluence
    string newinfluencetext = "None"
    
    if group == "Commoners"
        newinfluence = InfluenceCommoner
    elseif group == "Nobility"
        newinfluence = InfluenceNobility
    elseif group == "Guards"
        newinfluence = InfluenceGuard
    elseif group == "Jarl"
        newinfluence = InfluenceJarl
    endif
    
    ;/    
    int change = newinfluence - initialinfluence
    
    if change >= 10
        changetext = "greatly increased"
    elseif change >= 5
        changetext = "increased"
    elseif change > 0
        changetext = "slightly increased"
    elseif change == 0
        changetext = "not changed"
    elseif change >= -5
        changetext = "slightly decreased"
    elseif change >= -10
        changetext = "decreased"
    elseif change < -10
        changetext = "greatly decreased"
    endif

    if change != 0
        debug.notification("Influence with the " + group + " of " + city + " has " + changetext + "!")
    endif
    /;
    if initialinfluence > -70 && newinfluence <= -70
        newinfluencetext = "an Enemy of the "
    elseif (initialinfluence > -40 || initialinfluence <= -70) && newinfluence <= -40 && newinfluence > -70
        newinfluencetext = "Distrusted by the "
    elseif (initialinfluence > -20 || initialinfluence <= -40) && newinfluence <= -20 && newinfluence > -40
        newinfluencetext = "Disliked by the "
    elseif (initialinfluence >= 20 || initialinfluence <= -20) && newinfluence > -20 && newinfluence < 20
        newinfluencetext = "an Outsider of the "
    elseif (initialinfluence < 20 || initialinfluence >= 40) && newinfluence >= 20 && newinfluence < 40
        newinfluencetext = "an Acquaintance of the "
    elseif (initialinfluence < 40 || initialinfluence >= 70) && newinfluence >= 40 && newinfluence < 70
        newinfluencetext = "a Respected Figure to the "
    elseif initialinfluence < 70 && newinfluence >= 70
        newinfluencetext = "a Champion of the "
    endif
    
    if newinfluencetext != "None"
        debug.notification("You are now " + newinfluencetext + group + " of " + factionstring + "!")
    endif
EndFunction

Auto State NotSetUp

    Event OnUpdate()
        SetUp()
    EndEvent
    
EndState

State Hourly
    
    Event OnUpdate()
        if ((self as ObjectReference) as CS_FactionManagementDiplomacy).PlayerFaction == 1
            int i = 0
            while i < Cities.Length
                (Cities[i] as CS_CityManagementEconomy).GoToState("Hourly")
                Cities[i].RegisterForSingleUpdate(0.1)
                i += 1
            endwhile
        
            i = 0
            while i < Settlements.Length
                (Settlements[i] as CS_CityManagementEconomy).GoToState("Hourly")
                Settlements[i].RegisterForSingleUpdate(0.1)
                i += 1
            endwhile
        
            i = 0
            int loopnum = 0
            while i < Cities.Length && loopnum < 50
                if (Cities[i] as CS_CityManagementEconomy).GetState() != "Updated"
                    utility.wait(0.1)
                    i = 0
                    loopnum += 1
                else
                    i += 1
                endif
            endwhile
        
            i = 0
            loopnum = 0
            while i < Settlements.Length && loopnum < 50
                if (Settlements[i] as CS_CityManagementEconomy).GetState() != "Updated"
                    utility.wait(0.1)
                    i = 0
                    loopnum += 1
                else
                    i += 1
                endif
            endwhile
        endif
        
        ;((self as ObjectReference) as CS_ManagementReserves).UpdateReserves()
        
        GoToState("Updated")
    EndEvent
    
EndState

State Daily
    
    Event OnUpdate()
        
        SetCommonerIncreaseRate()
        if ((self as ObjectReference) as CS_FactionManagementDiplomacy).PlayerFaction == 1
            ResetStorage()
            InitiateStorageTrade()
            
            int i = 0
            while i < Cities.Length
                (Cities[i] as CS_CityManagementEconomy).GoToState("Daily")
                (Cities[i] as CS_CityManagementPopulation).GoToState("Daily")
                Cities[i].RegisterForSingleUpdate(0.1)
                i += 1
            endwhile
            
            i = 0
            while i < Settlements.Length
                (Settlements[i] as CS_CityManagementEconomy).GoToState("Daily")
                (Settlements[i] as CS_CityManagementPopulation).GoToState("Daily")
                Settlements[i].RegisterForSingleUpdate(0.1)
                i += 1
            endwhile
            
            i = 0
            int loopnum = 0
            while i < Cities.Length && loopnum < 50
                if (Cities[i] as CS_CityManagementEconomy).GetState() != "Updated"
                    utility.wait(0.1)
                    i = 0
                    loopnum += 1
                else
                    i += 1
                endif
            endwhile
            
            i = 0
            loopnum = 0
            while i < Settlements.Length && loopnum < 50
                if (Settlements[i] as CS_CityManagementEconomy).GetState() != "Updated"
                    utility.wait(0.1)
                    i = 0
                    loopnum += 1
                else
                    i += 1
                endif
            endwhile
            
            ;((self as ObjectReference) as CS_ManagementReserves).ExportReserves()
        endif
        
        GoToState("Updated")
    EndEvent
    
EndState