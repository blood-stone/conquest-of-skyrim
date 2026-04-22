Scriptname CS_FactionMajor extends CS_Faction  

; Diplomacy -------------------------------------------------------------------------------------------------------------------------------------

; Hold Governments -----------------------------------------------------------------------------------------------------------------------------

Actor[] Property HoldLeaders Auto
Actor[] Property HoldStewards Auto
Actor[] Property HoldHousecarls Auto
Actor[] Property HoldMages Auto

; Races ----------------------------------------------------------------------------------------------------------------------------------------

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

CS_ChooseTroopRacesScript Property CS_ChooseTroopRaces Auto

Function SetUpRaces()
    AllowedRaces = new int[10]
    AllowedRacesSettlers = new int[10]
    debug.trace(Name.NameString + " setting up races...")
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
    debug.trace(Name.NameString + " races set up!")
EndFunction

Function UpdateRaces()
    debug.trace(Name.NameString + "Updating races...")
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
                    if (self as Quest) as CS_FactionPlayers
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
                    if (self as Quest) as CS_FactionPlayers
                        CS_RaceListTroops.AddForm(CS_RacesAll.GetAt(i) as Race)
                    endif
                    index += 1
                endwhile
            endif
        endif
        i += 1
    endwhile
    debug.trace(Name.NameString + "Races updated!")
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
                    if (self as Quest) as CS_FactionPlayers
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
                    if (self as Quest) as CS_FactionPlayers
                        CS_RaceListSettlers.AddForm(CS_RacesAll.GetAt(i) as Race)
                    endif
                    index += 1
                endwhile
            endif
        endif
        i += 1
    endwhile
EndFunction

; Storage --------------------------------------------------------------------------------------------------------------------------------------

ActorBase Property CS_StorageTreasury Auto
ActorBase Property CS_StorageFoodFaction Auto
ActorBase Property CS_StorageMaterialsFaction Auto
ActorBase Property CS_StorageEquipmentFaction Auto

FormList Property CS_StorageFoodIncomeItemsFaction Auto
FormList Property CS_StorageMaterialsIncomeItemsFaction Auto
FormList Property CS_StorageEquipmentIncomeItemsFaction Auto

int Property Treasury Auto hidden

CS_StorageTreasuryScript Property StorageTreasury Auto hidden
CS_StorageFactionScript Property StorageFood Auto hidden
CS_StorageFactionScript Property StorageMaterials Auto hidden
CS_StorageFactionScript Property StorageEquipment Auto hidden

ObjectReference Property CS_FactionActivatorMarker Auto ;Spawn point for storage actors

Function SetUpStorage()
    StorageTreasury = CS_FactionActivatorMarker.PlaceAtMe(CS_StorageTreasury) as CS_StorageTreasuryScript
    StorageTreasury.FactionOwner = Self
    
    StorageFood = CS_FactionActivatorMarker.PlaceAtMe(CS_StorageFoodFaction) as CS_StorageFactionScript
    StorageFood.FactionOwner = Self
    StorageFood.IncomeStorageItems = CS_StorageFoodIncomeItemsFaction.GetAt(FactionNum) as FormList
    ;(StorageFood as CS_StorageFactionScript).RegisterForSingleUpdate(0.1)/;
    
    StorageMaterials = CS_FactionActivatorMarker.PlaceAtMe(CS_StorageMaterialsFaction) as CS_StorageFactionScript
    StorageMaterials.FactionOwner = Self
    StorageMaterials.IncomeStorageItems = CS_StorageMaterialsIncomeItemsFaction.GetAt(FactionNum) as FormList
    ;(StorageMaterials as CS_StorageFactionScript).RegisterForSingleUpdate(0.1)/;
    
    StorageEquipment = CS_FactionActivatorMarker.PlaceAtMe(CS_StorageEquipmentFaction) as CS_StorageFactionScript
    StorageEquipment.FactionOwner = Self
    StorageEquipment.IncomeStorageItems = CS_StorageEquipmentIncomeItemsFaction.GetAt(FactionNum) as FormList
    ;(StorageEquipment as CS_StorageFactionScript).RegisterForSingleUpdate(0.1)/;
EndFunction

Function ResetStorage()
    StorageTreasury.ResetStorageAmounts()
    StorageFood.ResetStorageAmounts()
    StorageMaterials.ResetStorageAmounts()
    StorageEquipment.ResetStorageAmounts()
EndFunction

Function InitiateStorageTrade()
    StorageFood.InitiateTrade()
    StorageMaterials.InitiateTrade()
    StorageEquipment.InitiateTrade()
EndFunction

CS_StorageFactionScript Function GetStorage(string StorageType)
    if StorageType == "Food"
        return StorageFood
    elseif StorageType == "Materials"
        return StorageMaterials
    elseif StorageType == "Equipment"
        return StorageEquipment
    endif
EndFunction

; SET UP -----------------------------------------------------------------------------------------------------------------

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
    SetUpStorage()
    ResetStorage()
    SetUpRaces()
EndEvent