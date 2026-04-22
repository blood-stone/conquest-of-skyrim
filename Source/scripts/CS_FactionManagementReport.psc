Scriptname CS_FactionManagementReport extends Quest conditional

import CS_CommonFunctions

Message Property CS_FactionManagementReportMenuStart Auto
Message Property CS_FactionManagementReportMenuDiplomacy Auto
Message Property CS_FactionManagementReportMenuDiplomacyVassals Auto
FormList Property CS_FactionManagementReportMenuDiplomacyVassalsHolds Auto
Message Property CS_FactionManagementReportMenuDiplomacyAlliances Auto
FormList Property CS_FactionManagementReportMenuDiplomacyAlliancesList Auto
FormList Property CS_FactionManagementReportMenuDiplomacyTradeAgreementsList Auto
Message Property CS_FactionManagementReportMenuDiplomacyTradeAgreement Auto
FormList Property CS_FactionManagementReportMenuDiplomacyTradeAgreementImportsList Auto
FormList Property CS_FactionManagementReportMenuDiplomacyTradeAgreementImportsAddList Auto
Message Property CS_FactionManagementReportMenuDiplomacyTradeAgreementImportsType Auto
Message Property CS_FactionManagementReportMenuDiplomacyTradeAgreementImportsAdjust Auto
Message Property CS_FactionManagementReportMenuDiplomacyTradeAgreementImportsError Auto
FormList Property CS_FactionManagementReportMenuDiplomacyTradeAgreementExportsList Auto
FormList Property CS_FactionManagementReportMenuDiplomacyTradeAgreementExportsAddList Auto
Message Property CS_FactionManagementReportMenuDiplomacyTradeAgreementExportsType Auto
Message Property CS_FactionManagementReportMenuDiplomacyTradeAgreementExportsAdjust Auto
Message Property CS_FactionManagementReportMenuDiplomacyTradeAgreementExportsError Auto
FormList Property CS_FactionManagementReportMenuMilitary Auto
FormList Property CS_FactionManagementReportMenuMilitaryUnitList Auto
Message Property CS_FactionManagementReportMenuMilitaryEquipment Auto
Message Property CS_FactionManagementReportMenuMilitaryEquipmentTroopsNormal Auto
Message Property CS_FactionManagementReportMenuMilitaryEquipmentTroop Auto
Message Property CS_FactionManagementReportMenuEconomy Auto
Message Property CS_FactionManagementReportMenuEconomyTreasury Auto
Message Property CS_FactionManagementReportMenuEconomyTreasuryDeposit Auto
Message Property CS_FactionManagementReportMenuEconomyTreasuryWithdraw Auto
Message Property CS_FactionManagementReportMenuEconomyReserves Auto
FormList Property CS_FactionManagementReportMenuEconomyReservesBuildingList Auto
FormList Property CS_FactionManagementReportMenuEconomyReservesBuildingGainsList Auto
FormList Property CS_FactionManagementReportMenuEconomyReservesBuildingExpensesList Auto
FormList Property CS_FactionManagementReportMenuEconomyReservesBuildingTributesList Auto
FormList Property CS_FactionManagementReportMenuEconomyReservesBuildingTributesVassalsList Auto
FormList Property CS_FactionManagementReportMenuEconomyReservesBuildingAidVassalsList Auto
FormList Property CS_FactionManagementReportMenuEconomyReservesBuildingAidList Auto
FormList Property CS_FactionManagementReportMenuEconomyReservesBuildingProductionList Auto
FormList Property CS_FactionManagementReportMenuEconomyReservesBuildingDistributionList Auto
FormList Property CS_FactionManagementReportMenuEconomyImportsList Auto
Message Property CS_FactionManagementReportMenuEconomyImport Auto
Message Property CS_FactionManagementReportMenuEconomyImportUnfulfilledTreasury Auto
Message Property CS_FactionManagementReportMenuEconomyImportUnfulfilledSupply Auto
FormList Property CS_FactionManagementReportMenuEconomyExportsList Auto
FormList Property CS_FactionManagementReportMenuEconomyCitiesList Auto
FormList Property CS_FactionManagementReportMenuEconomySettlementsList Auto
Message Property CS_FactionManagementReportMenuGovernment Auto
FormList Property CS_FactionManagementReportMenuGovernmentLoS Auto
Message Property CS_FactionManagementReportMenuPopulation Auto
Message Property CS_FactionManagementReportMenuHoldings Auto

FormList Property CS_FactionActivatorsHolds Auto
FormList Property CS_FactionActivatorsMajor Auto
FormList Property CS_TextFactionTypes Auto
FormList Property CS_TextMilitaryUnitTypes Auto

ReferenceAlias Property PlayerFactionActivator Auto
ReferenceAlias Property FactionLeader Auto
ReferenceAlias Property FactionSteward Auto
ReferenceAlias Property FactionHousecarl Auto
ReferenceAlias Property FactionMage Auto

ReferenceAlias[] Property Recipes Auto
ReferenceAlias[] Property Buildings Auto

LocationAlias[] Property Customers Auto
LocationAlias[] Property MilitaryUnitTypes Auto
LocationAlias[] Property Factions Auto

LocationAlias Property FactionCapital Auto
LocationAlias Property FactionType Auto
LocationAlias Property FactionName Auto
LocationAlias Property FactionNamePrefix Auto
LocationAlias Property Overlord Auto

Location Property CS_NoneLocation Auto

ObjectReference Property NoneObject Auto

ObjectReference Property FactionManagementActivator Auto

MiscObject Property Gold001 Auto
MiscObject Property CS_ResourceWoodenPlank Auto
MiscObject Property Leather01 Auto
MiscObject Property BYOHMaterialNails Auto
MiscObject Property BYOHMaterialStoneBlock Auto
MiscObject Property IngotIron Auto
MiscObject Property CS_RecipeBlacksmith01WorkEquipment Auto

Quest Property CS_TutorialQuests00FirstSteps Auto
Quest Property CS_TutorialQuests01Diplomacy Auto

ActorBase Property CS_CustomEquipmentTroopActor Auto

bool Property ModifiedTroop Auto
bool Property ModifiedCommander Auto

bool Property HasOwningFaction Auto conditional
bool Property HasVassals Auto conditional
bool Property HasHoldings Auto conditional

int Property FactionTypeNum Auto conditional
int Property CurrentImports Auto conditional
int Property CurrentExports Auto conditional
int Property AvailableImports Auto conditional
int Property AvailableExports Auto conditional
int Property TreasuryAmount Auto conditional
int Property CitiesNum Auto conditional
int Property SettlementsNum Auto conditional
int Property ListMaxPages Auto conditional
int Property NumArmies Auto conditional
int Property NumDivisions Auto conditional
int Property NumRegiments Auto conditional
int Property CustomOutfitEnabled Auto conditional
int Property GenderedEquipment Auto conditional

int Property TradeAgreementNum Auto

CS_FactionManagementEconomy EconomyScript
CS_FactionManagementDiplomacy DiplomacyScript
CS_FactionManagementMilitary MilitaryScript
CS_FactionManagementOwnership OwnershipScript
CS_ManagementReserves ReservesScript
CS_ChooseTroopRacesScript Property CS_ChooseTroopRaces Auto
CS_CityManagementReportScript Property CS_CityManagementReport Auto

Function MenuStart(ObjectReference FactionManagement=None, int Response = 0)
    
    SetFaction(FactionManagement)
    
    Response = CS_FactionManagementReportMenuStart.show()
    
    if Response == 0
        MenuDiplomacy()
    elseif Response == 2
        MenuMilitary()
        MenuStart(FactionManagementActivator)
    elseif Response == 3
        MenuEconomy()
    elseif Response == 4
        MenuGovernment()
    elseif Response == 5
        MenuPopulation()
    elseif Response == 6
        MenuHoldings()
    endif
    
    Stop()
    
EndFunction

Function SetFaction(ObjectReference FactionManagement=None)
    if FactionManagement
        FactionManagementActivator = FactionManagement
    else
        int factionnum = ((self as Form) as UILIB_1).ShowTextInput(asTitle="Enter citynum") as int  ;DELETE WHEN DONE
        if factionnum == -3
            FactionManagementActivator = PlayerFactionActivator.GetRef()
        elseif factionnum == -2
            FactionManagementActivator = CS_FactionActivatorsMajor.GetAt(1) as ObjectReference
        elseif factionnum == -1
            FactionManagementActivator = CS_FactionActivatorsMajor.GetAt(0) as ObjectReference
        else
            FactionManagementActivator = CS_FactionActivatorsHolds.GetAt(factionnum) as ObjectReference
        endif
    endif
    
    EconomyScript = FactionManagementActivator as CS_FactionManagementEconomy
    DiplomacyScript = FactionManagementActivator as CS_FactionManagementDiplomacy
    MilitaryScript = FactionManagementActivator as CS_FactionManagementMilitary
    OwnershipScript = FactionManagementActivator as CS_FactionManagementOwnership
    ReservesScript = FactionManagementActivator as CS_ManagementReserves
    
    FactionName.ForceLocationTo(DiplomacyScript.FactionName)
    FactionNamePrefix.ForceLocationTo(DiplomacyScript.FactionNamePrefix)
    
    FactionTypeNum = DiplomacyScript.FactionType
    FactionType.ForceLocationTo(CS_TextFactionTypes.GetAt(FactionTypeNum) as Location)
    
    SetGovernment()
EndFunction

Function SetGovernment()
    
    if OwnershipScript.Leader
        FactionLeader.ForceRefTo(OwnershipScript.Leader)
    else
        FactionLeader.ForceRefTo(NoneObject)
    endif
    
    if OwnershipScript.Second
        FactionSteward.ForceRefTo(OwnershipScript.Second)
    else
        FactionSteward.ForceRefTo(NoneObject)
    endif
    
    if OwnershipScript.ArmyLeader
        FactionHousecarl.ForceRefTo(OwnershipScript.ArmyLeader)
    else
        FactionHousecarl.ForceRefTo(NoneObject)
    endif
    
    if OwnershipScript.Mage
        FactionMage.ForceRefTo(OwnershipScript.Mage)
    else
        FactionMage.ForceRefTo(NoneObject)
    endif
    
    ObjectReference CapitalLocationRef = OwnershipScript.HQ
    if CapitalLocationRef
        Location CapitalLocation = (CapitalLocationRef as CS_CityManagementOwnership).VanillaCity
        FactionCapital.ForceLocationTo(CapitalLocation)
    else
        FactionCapital.ForceLocationTo(CS_NoneLocation)
    endif
    
EndFunction
    
Function MenuDiplomacy(int Response = 0)
    if OwnershipScript.FactionOwnerActivator
        Location OverlordName = (OwnershipScript.FactionOwnerActivator as CS_FactionManagementDiplomacy).FactionName
        Overlord.ForceLocationTo(OverlordName)
        HasOwningFaction = true
    else
        Overlord.ForceLocationTo(CS_NoneLocation)
        HasOwningFaction = false
    endif
    
    int VassalsNum = DiplomacyScript.Vassals.Length
    int AlliancesNum = DiplomacyScript.Alliances.Length
    int NumTradeAgreements = DiplomacyScript.TradeAgreements.Length
    
    Response = CS_FactionManagementReportMenuDiplomacy.show(VassalsNum, AlliancesNum, NumTradeAgreements)
    
    if Response == 0
        MenuDiplomacyVassals()
    elseif Response == 1
        MenuDiplomacyAlliances()
    elseif Response == 2
        MenuDiplomacyTradeAgreements()
    elseif Response == 4
        MenuStart(FactionManagementActivator)
    endif
EndFunction

Function MenuDiplomacyVassals(int Response = 0)
    
    int HoldsNum = DiplomacyScript.Vassals.Length
    int MinorFactionsNum; = DiplomacyScript.Alliances.Length
    
    Response = CS_FactionManagementReportMenuDiplomacyVassals.show(HoldsNum, MinorFactionsNum)
    
    if Response == 0
        MenuDiplomacyVassalsHolds()
    elseif Response == 4
        MenuDiplomacy()
    endif
EndFunction

Function MenuDiplomacyVassalsHolds(int Response = 0)
    
    int HoldsNum = DiplomacyScript.Vassals.Length
    int i = 0
    while i < HoldsNum
        Factions[i].ForceLocationTo((DiplomacyScript.Vassals[i] as CS_FactionManagementDiplomacy).FactionName)
        i += 1
    endwhile
    
    Message VassalsHoldsMessage = CS_FactionManagementReportMenuDiplomacyVassalsHolds.GetAt(HoldsNum) as Message
    
    Response = VassalsHoldsMessage.show()
    
    if Response == HoldsNum
        MenuDiplomacyVassals()
    elseif Response < HoldsNum
        ObjectReference ControllingFaction = FactionManagementActivator
        MenuStart(DiplomacyScript.Vassals[Response])
        ;SetFaction(ControllingFaction)
        ;MenuDiplomacyVassalsHolds()
    endif
EndFunction

Function MenuDiplomacyAlliances(int Response = 0)
    
    int AlliancesNum = DiplomacyScript.Alliances.Length
    int i = 0
    while i < AlliancesNum
        Factions[i].ForceLocationTo((DiplomacyScript.Alliances[i] as CS_FactionManagementDiplomacy).FactionName)
        i += 1
    endwhile
    
    Message AlliancesMessage = CS_FactionManagementReportMenuDiplomacyAlliancesList.GetAt(AlliancesNum) as Message
    
    Response = AlliancesMessage.show()
    
    if Response == AlliancesNum
        MenuDiplomacy()
    elseif Response < AlliancesNum
        ;MenuAlliance()
    endif
EndFunction

Function MenuDiplomacyTradeAgreements(int Response = 0)
    
    int NumTradeAgreements = DiplomacyScript.TradeAgreements.Length
    int[] OpinionValues = new int[9]
    int i = 0
    while i < NumTradeAgreements
        Factions[i].ForceLocationTo((DiplomacyScript.TradeAgreements[i] as CS_FactionManagementDiplomacy).FactionName)
        OpinionValues[i] = (DiplomacyScript.TradeAgreements[i] as CS_FactionManagementDiplomacy).GetOpinion(FactionManagementActivator)
        i += 1
    endwhile
    
    Message TradeAgreementsMessage = CS_FactionManagementReportMenuDiplomacyTradeAgreementsList.GetAt(NumTradeAgreements) as Message
    
    Response = TradeAgreementsMessage.show(OpinionValues[0], OpinionValues[1], OpinionValues[2], OpinionValues[3], OpinionValues[4], \
    OpinionValues[5], OpinionValues[6], OpinionValues[7], OpinionValues[8])
    
    if Response == NumTradeAgreements
        MenuDiplomacy()
    elseif Response < NumTradeAgreements
        TradeAgreementNum = Response
        MenuTradeAgreement()
        MenuDiplomacyTradeAgreements()
    endif
EndFunction

Function MenuTradeAgreement(int Response = 0)
    
    ObjectReference TradeAgreementFaction = DiplomacyScript.TradeAgreements[TradeAgreementNum]
    Factions[0].ForceLocationTo((TradeAgreementFaction as CS_FactionManagementDiplomacy).FactionName)
    ObjectReference TradeAgreementChest = DiplomacyScript.TradeAgreementChests[TradeAgreementNum]
    
    int Imports = GetSumOfArray((TradeAgreementChest as CS_TradeAgreementScript).Faction2ExportAmounts)
    int ImportsGold = -GetSumOfArray((TradeAgreementChest as CS_TradeAgreementScript).Faction2Revenue) - (TradeAgreementChest as CS_TradeAgreementScript).DistanceTradeAddition*Imports
    int Exports = GetSumOfArray((TradeAgreementChest as CS_TradeAgreementScript).Faction1ExportAmounts)
    int ExportsGold = GetSumOfArray((TradeAgreementChest as CS_TradeAgreementScript).Faction1Revenue)
    
    Response = CS_FactionManagementReportMenuDiplomacyTradeAgreement.show(Imports, ImportsGold, Exports, ExportsGold)
    
    if Response == 0
        MenuTradeAgreementImports()
    elseif Response == 1
        MenuTradeAgreementExports()
    endif
    
EndFunction

Function MenuTradeAgreementImports(int Response = 0)
    
    ObjectReference TradeAgreementFaction = DiplomacyScript.TradeAgreements[TradeAgreementNum]
    Factions[0].ForceLocationTo((TradeAgreementFaction as CS_FactionManagementDiplomacy).FactionName)
    ObjectReference TradeAgreementChest = DiplomacyScript.TradeAgreementChests[TradeAgreementNum]
    
    Response = CS_FactionManagementReportMenuDiplomacyTradeAgreementImportsType.show()
    
    if Response == 0
        MenuTradeAgreementImportsList((TradeAgreementFaction as CS_ManagementReserves).FoodReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).FoodReserves)
    elseif Response == 1
        MenuTradeAgreementImportsList((TradeAgreementFaction as CS_ManagementReserves).BuildingMaterialReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).BuildingMaterialReserves)
    elseif Response == 2
        MenuTradeAgreementImportsList((TradeAgreementFaction as CS_ManagementReserves).IngotReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).IngotReserves)
        ;/elseif Response == 3
        MenuTradeAgreementImportsList((TradeAgreementFaction as CS_ManagementReserves).EquipmentReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).EquipmentReserves)/;
    elseif Response == 3
        MenuTradeAgreementImportsList((TradeAgreementFaction as CS_ManagementReserves).TroopEquipmentReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).TroopEquipmentReserves)
    elseif Response == 4
        MenuTradeAgreementImportsList((TradeAgreementFaction as CS_ManagementReserves).JewelryReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).JewelryReserves)
    elseif Response == 5
        MenuTradeAgreement()
    endif
    
EndFunction

Function MenuTradeAgreementImportsList(ObjectReference Building, ObjectReference ImportBuilding, int Response = 0)
    
    ObjectReference TradeAgreementFaction = DiplomacyScript.TradeAgreements[TradeAgreementNum]
    Factions[0].ForceLocationTo((TradeAgreementFaction as CS_FactionManagementDiplomacy).FactionName)
    ObjectReference TradeAgreementChest = DiplomacyScript.TradeAgreementChests[TradeAgreementNum]
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    
    int NumImports = (TradeAgreementChest as CS_TradeAgreementScript).Faction2ExportAmounts.Length
    int totalimports
    int[] ImportAmounts = new int[9]
    int[] AvailableAmounts = new int[9]
    Form[] ImportItems = new Form[9]
    int i = 0
    while i < NumImports
        if BuildingScript.ReservesItems.Find((TradeAgreementChest as CS_TradeAgreementScript).Faction2ExportItems[i]) >= 0
            ImportItems[totalimports] = (TradeAgreementChest as CS_TradeAgreementScript).Faction2ExportItems[i]
            Recipes[totalimports].ForceRefTo(TradeAgreementChest.PlaceAtMe(ImportItems[totalimports]))
            ImportAmounts[totalimports] = (TradeAgreementChest as CS_TradeAgreementScript).Faction2ExportAmounts[i]
            AvailableAmounts[totalimports] = BuildingScript.GetAvailableAmount(ImportItems[totalimports])
            totalimports += 1
        endif
        i += 1
    endwhile
    
    Message TradeAgreementMessage = CS_FactionManagementReportMenuDiplomacyTradeAgreementImportsList.GetAt(totalimports) as Message
    
    Response = TradeAgreementMessage.show(ImportAmounts[0], ImportAmounts[1], ImportAmounts[2], ImportAmounts[3], ImportAmounts[4], \
    ImportAmounts[5], ImportAmounts[6], ImportAmounts[7], ImportAmounts[8])
    
    i = 0
    while i < totalimports
        if Recipes[i].GetRef()
            Recipes[i].GetRef().disable()
            Recipes[i].GetRef().delete()
        endif
        i += 1
    endwhile
    
    if Response == totalimports + 1
        MenuTradeAgreementImports()
    elseif Response == totalimports
        MenuTradeAgreementImportsAdd(Building, ImportBuilding)
    elseif Response < totalimports
        MenuTradeAgreementImportsAdjust(ImportItems[Response], AvailableAmounts[Response], Building, ImportBuilding)
        MenuTradeAgreementImportsList(Building, ImportBuilding)
    endif
    
EndFunction

Function MenuTradeAgreementImportsAdd(ObjectReference Building, ObjectReference ImportBuilding, int Response = 0)
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    ObjectReference TradeAgreementFaction = DiplomacyScript.TradeAgreements[TradeAgreementNum]
    
    int[] TotalChanges = new int[8]
    ObjectReference[] AvailableItems = new ObjectReference[8]
    Form[] AvailableItemForms = new Form[8]
    Form[] NPCTradeItems = (TradeAgreementFaction as CS_FactionManagementEconomy).NPCTradeItems
    int[] NPCTradeItemAmounts = (TradeAgreementFaction as CS_FactionManagementEconomy).NPCTradeItemAmounts
    int totalavailableitems = 0
    
    ;/
    CS_ReservesScriptItemThread01 ReservesThread01 = Building as CS_ReservesScriptItemThread01
    CS_ReservesScriptItemThread02 ReservesThread02 = Building as CS_ReservesScriptItemThread02
    CS_ReservesScriptItemThread03 ReservesThread03 = Building as CS_ReservesScriptItemThread03
    CS_ReservesScriptItemThread04 ReservesThread04 = Building as CS_ReservesScriptItemThread04
    CS_ReservesScriptItemThread05 ReservesThread05 = Building as CS_ReservesScriptItemThread05
    CS_ReservesScriptItemThread06 ReservesThread06 = Building as CS_ReservesScriptItemThread06
    CS_ReservesScriptItemThread07 ReservesThread07 = Building as CS_ReservesScriptItemThread07
    CS_ReservesScriptItemThread08 ReservesThread08 = Building as CS_ReservesScriptItemThread08
    CS_ReservesScriptItemThread09 ReservesThread09 = Building as CS_ReservesScriptItemThread09
    CS_ReservesScriptItemThread10 ReservesThread10 = Building as CS_ReservesScriptItemThread10
    
    int ReservesItemSize = BuildingScript.ReservesItems.GetSize()
    
    if ReservesItemSize > 0 && ReservesThread01.Item
        ReservesThread01.UpdateTradeValues()
        if ReservesThread01.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread01.Item
            AvailableItems[totalavailableitems] = (Building as ObjectReference).PlaceAtMe(ReservesThread01.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread01.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 1 && ReservesThread02.Item
        ReservesThread02.UpdateTradeValues()
        if ReservesThread02.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread02.Item
            AvailableItems[totalavailableitems] = (Building as ObjectReference).PlaceAtMe(ReservesThread02.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread02.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 2 && ReservesThread03.Item
        ReservesThread03.UpdateTradeValues()
        if ReservesThread03.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread03.Item
            AvailableItems[totalavailableitems] = (Building as ObjectReference).PlaceAtMe(ReservesThread03.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread03.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 3 && ReservesThread04.Item
        ReservesThread04.UpdateTradeValues()
        if ReservesThread04.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread04.Item
            AvailableItems[totalavailableitems] = (Building as ObjectReference).PlaceAtMe(ReservesThread04.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread04.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 4 && ReservesThread05.Item
        ReservesThread05.UpdateTradeValues()
        if ReservesThread05.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread05.Item
            AvailableItems[totalavailableitems] = (Building as ObjectReference).PlaceAtMe(ReservesThread05.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread05.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 5 && ReservesThread06.Item
        ReservesThread06.UpdateTradeValues()
        if ReservesThread06.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread06.Item
            AvailableItems[totalavailableitems] = (Building as ObjectReference).PlaceAtMe(ReservesThread06.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread06.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 6 && ReservesThread07.Item
        ReservesThread07.UpdateTradeValues()
        if ReservesThread07.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread07.Item
            AvailableItems[totalavailableitems] = (Building as ObjectReference).PlaceAtMe(ReservesThread07.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread07.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 7 && ReservesThread08.Item
        ReservesThread08.UpdateTradeValues()
        if ReservesThread08.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread08.Item
            AvailableItems[totalavailableitems] = (Building as ObjectReference).PlaceAtMe(ReservesThread08.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread08.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 8 && ReservesThread09.Item
        ReservesThread09.UpdateTradeValues()
        if ReservesThread09.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread09.Item
            AvailableItems[totalavailableitems] = (Building as ObjectReference).PlaceAtMe(ReservesThread09.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread09.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 9 && ReservesThread10.Item
        ReservesThread10.UpdateTradeValues()
        if ReservesThread10.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread10.Item
            AvailableItems[totalavailableitems] = (Building as ObjectReference).PlaceAtMe(ReservesThread10.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread10.TradeAmount
            totalavailableitems += 1
        endif
    endif/;
    ;/
    int i = 0
    int totalavailableitems = 0
    while i < BuildingScript.NetChanges.Length
        if BuildingScript.NetChanges[i] != 0
            ObjectReference AvailableItem = (Building as ObjectReference).PlaceAtMe(BuildingScript.ReservesItems.GetAt(i) as Form)
            Recipes[totalavailableitems].ForceRefTo(AvailableItem)
            TotalChanges[totalavailableitems] = BuildingScript.NetChanges[i]
            totalavailableitems += 1
        endif
        i += 1
    endwhile/;
    
    int i = 0
    while i < NPCTradeItems.Length
        if NPCTradeItemAmounts[i] > 0 && BuildingScript.ReservesItems.HasForm(NPCTradeItems[i])
            AvailableItemForms[totalavailableitems] = NPCTradeItems[i]
            AvailableItems[totalavailableitems] = (Building as ObjectReference).PlaceAtMe(NPCTradeItems[i])
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = NPCTradeItemAmounts[i]
            totalavailableitems += 1
        endif
        i += 1
    endwhile
    
    Response = (CS_FactionManagementReportMenuDiplomacyTradeAgreementImportsAddList.GetAt(totalavailableitems) as Message).show(TotalChanges[0], \
    TotalChanges[1], TotalChanges[2], TotalChanges[3], TotalChanges[4], TotalChanges[5], TotalChanges[6], TotalChanges[7])
    
    i = 0
    while i < totalavailableitems
        if Recipes[i].GetRef()
            Recipes[i].GetRef().disable()
            Recipes[i].GetRef().delete()
        endif
        i += 1
    endwhile
    
    if Response == totalavailableitems
        MenuTradeAgreementImportsList(Building, ImportBuilding)
    elseif Response < totalavailableitems
        MenuTradeAgreementImportsAdjust(AvailableItemForms[Response], TotalChanges[Response], Building, ImportBuilding)
        MenuTradeAgreementImportsAdd(Building, ImportBuilding)
    endif
    
EndFunction

Function MenuTradeAgreementImportsAdjust(Form Item, int AvailableAmount, ObjectReference ExportReserves, ObjectReference ImportReserves, int Response = 0)
    
    ObjectReference TradeAgreementFaction = DiplomacyScript.TradeAgreements[TradeAgreementNum]
    ObjectReference TradeAgreementChest = DiplomacyScript.TradeAgreementChests[TradeAgreementNum]
    CS_TradeAgreementScript TradeAgreementScript = TradeAgreementChest as CS_TradeAgreementScript
    
    if TradeAgreementScript.Faction1ExportItems.Find(Item) >= 0
        
        CS_FactionManagementReportMenuDiplomacyTradeAgreementImportsError.show()
        
    else
    
        ObjectReference ItemText = TradeAgreementFaction.PlaceAtMe(Item)
        Recipes[0].ForceRefTo(ItemText)
        
        int ItemNum = TradeAgreementScript.Faction2ExportItems.Find(Item)
        int BaseCost = math.floor(Item.GetGoldValue())
        int AgreedCostChange = math.floor(TradeAgreementScript.Faction2TradeModifier*Item.GetGoldValue()) - BaseCost
        int DistanceCost = TradeAgreementScript.DistanceTradeAddition
        int Cost = BaseCost + AgreedCostChange + DistanceCost
        int CurrentImportsCost
        if ItemNum >= 0
            CurrentImports = TradeAgreementScript.Faction2ExportAmounts[ItemNum]
            CurrentImportsCost = TradeAgreementScript.Faction2Revenue[ItemNum] + TradeAgreementScript.Faction2ExportAmounts[ItemNum]*DistanceCost
        else
            CurrentImports = 0
        endif
        AvailableImports = AvailableAmount
        int originalimports = CurrentImports
        
        while Response < 6
        
            Response = CS_FactionManagementReportMenuDiplomacyTradeAgreementImportsAdjust.show(CurrentImports, 0 - CurrentImportsCost, AvailableImports, BaseCost, AgreedCostChange, DistanceCost, Cost)
            
            if Response == 0
                CurrentImports += 1
                AvailableImports -= 1
                CurrentImportsCost += Cost
            elseif Response == 1
                CurrentImports += 10
                AvailableImports -= 10
                CurrentImportsCost += 10*Cost
            elseif Response == 2
                CurrentImports += 100
                AvailableImports -= 100
                CurrentImportsCost += 100*Cost
            elseif Response == 3
                AvailableImports += 1
                CurrentImports -= 1
                CurrentImportsCost -= Cost
            elseif Response == 4
                AvailableImports += 10
                CurrentImports -= 10
                CurrentImportsCost -= 10*Cost
            elseif Response == 5
                AvailableImports += 100
                CurrentImports -= 100
                CurrentImportsCost -= 100*Cost
            elseif Response == 6
                if CurrentImports != originalimports
                    Recipes[0].GetRef().disable()
                    Recipes[0].GetRef().delete()
                    TradeAgreementScript.AdjustTradeAgreement(TradeAgreementFaction, PlayerFactionActivator.GetRef(), ExportReserves, ImportReserves, Item, CurrentImports)
                endif
            endif
            ;/
            if Item == CS_RecipeBlacksmith01WorkEquipment && CS_TutorialQuests01Diplomacy.GetStage() == 2
                ObjectReference EquipmentReserves = (FactionManagementActivator as CS_ManagementReserves).EquipmentReserves
                if (EquipmentReserves as CS_ReservesScript).GetTotalTradeImports(CS_RecipeBlacksmith01WorkEquipment) >= 5
                    CS_TutorialQuests01Diplomacy.SetStage(3)
                    utility.wait(0.5)
                endif
            endif/;
            
        endwhile
        
    endif
    
EndFunction

Function MenuTradeAgreementExports(int Response = 0)
    
    ObjectReference TradeAgreementFaction = DiplomacyScript.TradeAgreements[TradeAgreementNum]
    Factions[0].ForceLocationTo((TradeAgreementFaction as CS_FactionManagementDiplomacy).FactionName)
    ObjectReference TradeAgreementChest = DiplomacyScript.TradeAgreementChests[TradeAgreementNum]
    
    Response = CS_FactionManagementReportMenuDiplomacyTradeAgreementExportsType.show()
    
    if Response == 0
        MenuTradeAgreementExportsList((TradeAgreementFaction as CS_ManagementReserves).FoodReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).FoodReserves)
    elseif Response == 1
        MenuTradeAgreementExportsList((TradeAgreementFaction as CS_ManagementReserves).BuildingMaterialReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).BuildingMaterialReserves)
    elseif Response == 2
        MenuTradeAgreementExportsList((TradeAgreementFaction as CS_ManagementReserves).IngotReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).IngotReserves)
        ;/elseif Response == 3
        MenuTradeAgreementExportsList((TradeAgreementFaction as CS_ManagementReserves).EquipmentReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).EquipmentReserves)/;
    elseif Response == 3
        MenuTradeAgreementExportsList((TradeAgreementFaction as CS_ManagementReserves).TroopEquipmentReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).TroopEquipmentReserves)
    elseif Response == 4
        MenuTradeAgreementExportsList((TradeAgreementFaction as CS_ManagementReserves).JewelryReserves, (PlayerFactionActivator.GetRef() as CS_ManagementReserves).JewelryReserves)
    elseif Response == 5
        MenuTradeAgreement()
    endif
    
EndFunction

Function MenuTradeAgreementExportsList(ObjectReference Building, ObjectReference ExportBuilding, int Response = 0)
    
    ObjectReference TradeAgreementFaction = DiplomacyScript.TradeAgreements[TradeAgreementNum]
    Factions[0].ForceLocationTo((TradeAgreementFaction as CS_FactionManagementDiplomacy).FactionName)
    ObjectReference TradeAgreementChest = DiplomacyScript.TradeAgreementChests[TradeAgreementNum]
    CS_ReservesScript BuildingScript = ExportBuilding as CS_ReservesScript
    
    int NumExports = (TradeAgreementChest as CS_TradeAgreementScript).Faction1ExportAmounts.Length
    int totalExports
    int[] ExportAmounts = new int[9]
    int[] AvailableAmounts = new int[9]
    Form[] ExportItems = new Form[9]
    int i = 0
    while i < NumExports
        if BuildingScript.ReservesItems.Find((TradeAgreementChest as CS_TradeAgreementScript).Faction1ExportItems[i]) >= 0
            ExportItems[totalExports] = (TradeAgreementChest as CS_TradeAgreementScript).Faction1ExportItems[i]
            Recipes[totalExports].ForceRefTo(TradeAgreementChest.PlaceAtMe(ExportItems[totalExports]))
            ExportAmounts[totalExports] = (TradeAgreementChest as CS_TradeAgreementScript).Faction1ExportAmounts[i]
            AvailableAmounts[totalExports] = BuildingScript.GetAvailableAmount(ExportItems[totalExports])
            totalExports += 1
        endif
        i += 1
    endwhile
    
    Message TradeAgreementMessage = CS_FactionManagementReportMenuDiplomacyTradeAgreementExportsList.GetAt(totalExports) as Message
    
    Response = TradeAgreementMessage.show(ExportAmounts[0], ExportAmounts[1], ExportAmounts[2], ExportAmounts[3], ExportAmounts[4], \
    ExportAmounts[5], ExportAmounts[6], ExportAmounts[7], ExportAmounts[8])
    
    i = 0
    while i < totalExports
        if Recipes[i].GetRef()
            Recipes[i].GetRef().disable()
            Recipes[i].GetRef().delete()
        endif
        i += 1
    endwhile
    
    if Response == totalExports + 1
        MenuTradeAgreementExports()
    elseif Response == totalExports
        MenuTradeAgreementExportsAdd(Building, ExportBuilding)
    elseif Response < totalExports
        MenuTradeAgreementExportsAdjust(ExportItems[Response], AvailableAmounts[Response], ExportBuilding, Building)
        MenuTradeAgreementExportsList(Building, ExportBuilding)
    endif
    
EndFunction

Function MenuTradeAgreementExportsAdd(ObjectReference Building, ObjectReference ExportBuilding, int Response = 0)
    CS_ReservesScript BuildingScript = ExportBuilding as CS_ReservesScript
    
    int[] TotalChanges = new int[8]
    ObjectReference[] AvailableItems = new ObjectReference[8]
    Form[] AvailableItemForms = new Form[8]
    
    CS_ReservesScriptItemThread01 ReservesThread01 = ExportBuilding as CS_ReservesScriptItemThread01
    CS_ReservesScriptItemThread02 ReservesThread02 = ExportBuilding as CS_ReservesScriptItemThread02
    CS_ReservesScriptItemThread03 ReservesThread03 = ExportBuilding as CS_ReservesScriptItemThread03
    CS_ReservesScriptItemThread04 ReservesThread04 = ExportBuilding as CS_ReservesScriptItemThread04
    CS_ReservesScriptItemThread05 ReservesThread05 = ExportBuilding as CS_ReservesScriptItemThread05
    CS_ReservesScriptItemThread06 ReservesThread06 = ExportBuilding as CS_ReservesScriptItemThread06
    CS_ReservesScriptItemThread07 ReservesThread07 = ExportBuilding as CS_ReservesScriptItemThread07
    CS_ReservesScriptItemThread08 ReservesThread08 = ExportBuilding as CS_ReservesScriptItemThread08
    CS_ReservesScriptItemThread09 ReservesThread09 = ExportBuilding as CS_ReservesScriptItemThread09
    CS_ReservesScriptItemThread10 ReservesThread10 = ExportBuilding as CS_ReservesScriptItemThread10
    
    int totalavailableitems = 0
    int ReservesItemSize = BuildingScript.ReservesItems.GetSize()
    
    if ReservesItemSize > 0 && ReservesThread01.Item
        ReservesThread01.UpdateTradeValues()
        if ReservesThread01.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread01.Item
            AvailableItems[totalavailableitems] = (ExportBuilding as ObjectReference).PlaceAtMe(ReservesThread01.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread01.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 1 && ReservesThread02.Item
        ReservesThread02.UpdateTradeValues()
        if ReservesThread02.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread02.Item
            AvailableItems[totalavailableitems] = (ExportBuilding as ObjectReference).PlaceAtMe(ReservesThread02.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread02.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 2 && ReservesThread03.Item
        ReservesThread03.UpdateTradeValues()
        if ReservesThread03.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread03.Item
            AvailableItems[totalavailableitems] = (ExportBuilding as ObjectReference).PlaceAtMe(ReservesThread03.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread03.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 3 && ReservesThread04.Item
        ReservesThread04.UpdateTradeValues()
        if ReservesThread04.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread04.Item
            AvailableItems[totalavailableitems] = (ExportBuilding as ObjectReference).PlaceAtMe(ReservesThread04.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread04.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 4 && ReservesThread05.Item
        ReservesThread05.UpdateTradeValues()
        if ReservesThread05.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread05.Item
            AvailableItems[totalavailableitems] = (ExportBuilding as ObjectReference).PlaceAtMe(ReservesThread05.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread05.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 5 && ReservesThread06.Item
        ReservesThread06.UpdateTradeValues()
        if ReservesThread06.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread06.Item
            AvailableItems[totalavailableitems] = (ExportBuilding as ObjectReference).PlaceAtMe(ReservesThread06.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread06.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 6 && ReservesThread07.Item
        ReservesThread07.UpdateTradeValues()
        if ReservesThread07.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread07.Item
            AvailableItems[totalavailableitems] = (ExportBuilding as ObjectReference).PlaceAtMe(ReservesThread07.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread07.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 7 && ReservesThread08.Item
        ReservesThread08.UpdateTradeValues()
        if ReservesThread08.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread08.Item
            AvailableItems[totalavailableitems] = (ExportBuilding as ObjectReference).PlaceAtMe(ReservesThread08.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread08.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 8 && ReservesThread09.Item
        ReservesThread09.UpdateTradeValues()
        if ReservesThread09.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread09.Item
            AvailableItems[totalavailableitems] = (ExportBuilding as ObjectReference).PlaceAtMe(ReservesThread09.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread09.TradeAmount
            totalavailableitems += 1
        endif
    endif
    
    if ReservesItemSize > 9 && ReservesThread10.Item
        ReservesThread10.UpdateTradeValues()
        if ReservesThread10.TradeAmount > 0
            AvailableItemForms[totalavailableitems] = ReservesThread10.Item
            AvailableItems[totalavailableitems] = (ExportBuilding as ObjectReference).PlaceAtMe(ReservesThread10.Item)
            Recipes[totalavailableitems].ForceRefTo(AvailableItems[totalavailableitems])
            TotalChanges[totalavailableitems] = ReservesThread10.TradeAmount
            totalavailableitems += 1
        endif
    endif
    ;/
    int i = 0
    int totalavailableitems = 0
    while i < BuildingScript.NetChanges.Length
        if BuildingScript.NetChanges[i] != 0
            ObjectReference AvailableItem = (Building as ObjectReference).PlaceAtMe(BuildingScript.ReservesItems.GetAt(i) as Form)
            Recipes[totalavailableitems].ForceRefTo(AvailableItem)
            TotalChanges[totalavailableitems] = BuildingScript.NetChanges[i]
            totalavailableitems += 1
        endif
        i += 1
    endwhile/;
    
    Response = (CS_FactionManagementReportMenuDiplomacyTradeAgreementExportsAddList.GetAt(totalavailableitems) as Message).show(TotalChanges[0], \
    TotalChanges[1], TotalChanges[2], TotalChanges[3], TotalChanges[4], TotalChanges[5], TotalChanges[6], TotalChanges[7])
    
    int i = 0
    while i < totalavailableitems
        if Recipes[i].GetRef()
            Recipes[i].GetRef().disable()
            Recipes[i].GetRef().delete()
        endif
        i += 1
    endwhile
    
    if Response == totalavailableitems
        MenuTradeAgreementExportsList(Building, ExportBuilding)
    elseif Response < totalavailableitems
        MenuTradeAgreementExportsAdjust(AvailableItemForms[Response], TotalChanges[Response], ExportBuilding, Building)
        MenuTradeAgreementExportsAdd(Building, ExportBuilding)
    endif
    
EndFunction

Function MenuTradeAgreementExportsAdjust(Form Item, int AvailableAmount, ObjectReference ExportReserves, ObjectReference ImportReserves, int Response = 0)
    
    ObjectReference TradeAgreementFaction = DiplomacyScript.TradeAgreements[TradeAgreementNum]
    ObjectReference TradeAgreementChest = DiplomacyScript.TradeAgreementChests[TradeAgreementNum]
    CS_TradeAgreementScript TradeAgreementScript = TradeAgreementChest as CS_TradeAgreementScript
    
    if TradeAgreementScript.Faction2ExportItems.Find(Item) >= 0
        
        CS_FactionManagementReportMenuDiplomacyTradeAgreementExportsError.show()
        
    else
    
        ObjectReference ItemText = TradeAgreementFaction.PlaceAtMe(Item)
        Recipes[0].ForceRefTo(ItemText)
        
        int ItemNum = TradeAgreementScript.Faction1ExportItems.Find(Item)
        int Cost = math.floor(TradeAgreementScript.Faction1TradeModifier*Item.GetGoldValue())
        int CurrentExportsCost
        if ItemNum >= 0
            CurrentExports = TradeAgreementScript.Faction1ExportAmounts[ItemNum]
            CurrentExportsCost = TradeAgreementScript.Faction1Revenue[ItemNum]
        else
            CurrentExports = 0
        endif
        AvailableExports = AvailableAmount
        int originalExports = CurrentExports
        
        while Response < 6
        
            Response = CS_FactionManagementReportMenuDiplomacyTradeAgreementExportsAdjust.show(Cost, CurrentExports, CurrentExportsCost, AvailableExports)
            
            if Response == 0
                CurrentExports += 1
                AvailableExports -= 1
                CurrentExportsCost += Cost
            elseif Response == 1
                CurrentExports += 10
                AvailableExports -= 10
                CurrentExportsCost += 10*Cost
            elseif Response == 2
                CurrentExports += 100
                AvailableExports -= 100
                CurrentExportsCost += 100*Cost
            elseif Response == 3
                AvailableExports += 1
                CurrentExports -= 1
                CurrentExportsCost -= Cost
            elseif Response == 4
                AvailableExports += 10
                CurrentExports -= 10
                CurrentExportsCost -= 10*Cost
            elseif Response == 5
                AvailableExports += 100
                CurrentExports -= 100
                CurrentExportsCost -= 100*Cost
            elseif Response == 6
                if CurrentExports != originalExports
                    Recipes[0].GetRef().disable()
                    Recipes[0].GetRef().delete()
                    TradeAgreementScript.AdjustTradeAgreement(PlayerFactionActivator.GetRef(), TradeAgreementFaction, ExportReserves, ImportReserves, Item, CurrentExports)
                endif
            endif
            
            if CS_TutorialQuests01Diplomacy.GetStage() == 2 && CurrentExports > 0
                CS_TutorialQuests01Diplomacy.SetStage(3)
                utility.wait(0.5)
            endif
            
        endwhile
        
    endif
    
EndFunction

Function MenuEconomy(int Response = 0)
    ObjectReference[] Vassals = DiplomacyScript.Vassals
    
    TreasuryAmount = ReservesScript.Treasury
    int TradeProfits = DiplomacyScript.GetTotalTradeProfits()
    int Tributes = 0
    int Sponsors = 1000*EconomyScript.Sponsors1000.Length + 5000*EconomyScript.Sponsors5000.Length + 10000*EconomyScript.Sponsors10000.Length
    int Salaries = 0
    int DailyChanges = TradeProfits + Tributes + Sponsors - Salaries
    
    Response = CS_FactionManagementReportMenuEconomy.show(TreasuryAmount, DailyChanges)
    
    if Response == 0
        MenuEconomyTreasury()
    elseif Response == 1
        MenuEconomyReserves()
    elseif Response == 2
        MenuStart(FactionManagementActivator)
    endif
EndFunction

Function MenuEconomyTreasury(int Response = 0)
    
    TreasuryAmount = ReservesScript.Treasury
    int TradeProfits = DiplomacyScript.GetTotalTradeProfits()
    int Tributes = 0
    int Sponsors = 1000*EconomyScript.Sponsors1000.Length + 5000*EconomyScript.Sponsors5000.Length + 10000*EconomyScript.Sponsors10000.Length
    int Salaries = 0
    int DailyChanges = TradeProfits + Tributes + Sponsors - Salaries
    
    Response = CS_FactionManagementReportMenuEconomyTreasury.show(TreasuryAmount, DailyChanges, TradeProfits, Tributes, Sponsors, Salaries)
    
    if Response == 0
        MenuEconomyTreasuryDeposit()
    elseif Response == 1
        MenuEconomyTreasuryWithdraw()
    elseif Response == 2
        MenuEconomy()
    endif
EndFunction

Function MenuEconomyTreasuryDeposit(int Response = 0)
    
    TreasuryAmount = ReservesScript.Treasury
    
    Response = CS_FactionManagementReportMenuEconomyTreasuryDeposit.show(TreasuryAmount)
    
    if Response < 7
        int changeamount = math.pow(10, Response) as int
        ReservesScript.Treasury = ReservesScript.Treasury + changeamount
        Game.GetPlayer().RemoveItem(Gold001, changeamount)
        if CS_TutorialQuests00FirstSteps.GetStage() == 2 && ReservesScript.Treasury >= 1000
            CS_TutorialQuests00FirstSteps.SetStage(3)
            utility.wait(0.3)
        endif
        MenuEconomyTreasuryDeposit()
    elseif Response == 7
        MenuEconomyTreasury()
    endif
EndFunction

Function MenuEconomyTreasuryWithdraw(int Response = 0)
    
    TreasuryAmount = ReservesScript.Treasury
    
    Response = CS_FactionManagementReportMenuEconomyTreasuryWithdraw.show(TreasuryAmount)
    
    if Response < 7
        int changeamount = math.pow(10, Response) as int
        ReservesScript.Treasury = ReservesScript.Treasury - changeamount
        Game.GetPlayer().AddItem(Gold001, changeamount)
        MenuEconomyTreasuryWithdraw()
    elseif Response == 7
        MenuEconomyTreasury()
    endif
EndFunction

Function MenuEconomyReserves(int Response = 0)

    Response = CS_FactionManagementReportMenuEconomyReserves.show()
    
    if Response == 0
        MenuEconomyReservesBuilding(ReservesScript.FoodReserves)
        MenuEconomyReserves()
    elseif Response == 1
        MenuEconomyReservesBuilding(ReservesScript.BuildingMaterialReserves)
        MenuEconomyReserves()
    elseif Response == 2
        MenuEconomyReservesBuilding(ReservesScript.IngotReserves)
        MenuEconomyReserves();/
    elseif Response == 3
        MenuEconomyReservesBuilding(ReservesScript.EquipmentReserves)
        MenuEconomyReserves()/;
    elseif Response == 3;4
        MenuEconomyReservesBuilding(ReservesScript.TroopEquipmentReserves)
        MenuEconomyReserves()
    elseif Response == 4
        MenuEconomyReservesBuilding(ReservesScript.JewelryReserves)
        MenuEconomyReserves()
    elseif Response == 5
        MenuEconomy()
    endif
    
EndFunction

Function MenuEconomyReservesBuilding(ObjectReference Building, int Response = 0)
    
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    
    Buildings[0].ForceRefTo(Building)
    
    int[] TotalChanges = new int[10]
    
    int totalrequireditems = 0
    int ReservesItemSize = BuildingScript.ReservesItems.GetSize()
    
    int i = 0
    while i < ReservesItemSize
        Form Item = BuildingScript.ReservesItems.GetAt(i) as Form
        int NetChange = BuildingScript.GetNetChange(Item)
        if NetChange != 0
            ObjectReference RequiredItem = (Building as ObjectReference).PlaceAtMe(Item)
            Recipes[totalrequireditems].ForceRefTo(RequiredItem)
            TotalChanges[totalrequireditems] = NetChange
            totalrequireditems += 1
        endif
        i += 1
    endwhile
    
    Response = (CS_FactionManagementReportMenuEconomyReservesBuildingList.GetAt(totalrequireditems) as Message).show(TotalChanges[0], \
    TotalChanges[1], TotalChanges[2], TotalChanges[3], TotalChanges[4], TotalChanges[5], TotalChanges[6], TotalChanges[7], TotalChanges[8])
    
     i = 0
   while i < totalrequireditems
        if Recipes[i].GetRef()
            Recipes[i].GetRef().disable()
            Recipes[i].GetRef().delete()
        endif
        i += 1
    endwhile
    
    if Response == 0
        Building.Activate(Game.GetPlayer())
        while utility.IsInMenuMode()
            utility.wait(0.1)
        endwhile
        if CS_TutorialQuests00FirstSteps.GetStage() == 3 && Building == ReservesScript.BuildingMaterialReserves && Building.GetItemCount(CS_ResourceWoodenPlank) >= 30 && \
            Building.GetItemCount(Leather01) >= 5 && Building.GetItemCount(BYOHMaterialStoneBlock) >= 20 && \
            Building.GetItemCount(BYOHMaterialNails) >= 50
            CS_TutorialQuests00FirstSteps.SetStage(4)
            utility.wait(0.5)
        elseif CS_TutorialQuests00FirstSteps.GetStage() == 9 && Building == ReservesScript.IngotReserves && \
            Building.GetItemCount(IngotIron) >= 6
            CS_TutorialQuests00FirstSteps.SetStage(10)
            utility.wait(0.5)
        endif
        MenuEconomyReservesBuilding(Building)
    elseif Response == 1
        MenuEconomyReservesBuildingGains(Building)
    elseif Response == 2
        MenuEconomyReservesBuildingExpenses(Building)
    endif
    
EndFunction

Function MenuEconomyReservesBuildingGains(ObjectReference Building, int Response = 0)
    
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    
    if OwnershipScript.FactionOwnerActivator
        Location OverlordName = (OwnershipScript.FactionOwnerActivator as CS_FactionManagementDiplomacy).FactionName
        Overlord.ForceLocationTo(OverlordName)
        HasOwningFaction = true
    else
        Overlord.ForceLocationTo(CS_NoneLocation)
        HasOwningFaction = false
    endif
    
    if DiplomacyScript.Vassals.Length > 0
        HasVassals = true
    else
        HasVassals = false
    endif
    
    if EconomyScript.Cities.Length > 0 || EconomyScript.Settlements.Length > 0
        HasHoldings = true
    else
        HasHoldings = false
    endif
    
    int[] TotalGains = new int[10]
    
    int totalgaineditems = 0
    int ReservesItemSize = BuildingScript.ReservesItems.GetSize()
    
    int i = 0
    while i < ReservesItemSize
        Form Item = BuildingScript.ReservesItems.GetAt(i) as Form
        int ItemReceived = BuildingScript.GetItemReceived(Item)
        if ItemReceived != 0
            ObjectReference gainedItem = (Building as ObjectReference).PlaceAtMe(Item)
            Recipes[totalgaineditems].ForceRefTo(gainedItem)
            TotalGains[totalgaineditems] = ItemReceived
            totalgaineditems += 1
        endif
        i += 1
    endwhile
    
    Response = (CS_FactionManagementReportMenuEconomyReservesBuildingGainsList.GetAt(totalgaineditems) as Message).show(TotalGains[0], \
    TotalGains[1], TotalGains[2], TotalGains[3], TotalGains[4], TotalGains[5], TotalGains[6], TotalGains[7], TotalGains[8])
    
    if Response == 0
        if totalgaineditems > 0
            MenuEconomyReservesBuildingImports(Building)
            MenuEconomyReservesBuildingGains(Building)
        else
            MenuEconomyReservesBuilding(Building)
        endif
    elseif Response == 1
        MenuEconomyReservesBuildingAid(Building)
        MenuEconomyReservesBuildingGains(Building)
    elseif Response == 2
        MenuEconomyReservesBuildingTributesVassals(Building)
        MenuEconomyReservesBuildingGains(Building)
    elseif Response == 3
        MenuEconomyReservesBuildingProductionHoldings(Building)
        MenuEconomyReservesBuildingGains(Building)
    elseif Response == 4
        MenuEconomyReservesBuilding(Building)
    endif
EndFunction

Function MenuEconomyReservesBuildingExpenses(ObjectReference Building, int Response = 0)
    
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    
    if OwnershipScript.FactionOwnerActivator
        Location OverlordName = (OwnershipScript.FactionOwnerActivator as CS_FactionManagementDiplomacy).FactionName
        Overlord.ForceLocationTo(OverlordName)
        HasOwningFaction = true
    else
        Overlord.ForceLocationTo(CS_NoneLocation)
        HasOwningFaction = false
    endif
    
    if DiplomacyScript.Vassals.Length > 0
        HasVassals = true
    else
        HasVassals = false
    endif
    
    if EconomyScript.Cities.Length > 0 || EconomyScript.Settlements.Length > 0
        HasHoldings = true
    else
        HasHoldings = false
    endif
    
    int[] TotalExpenses = new int[10]
    
    int totallostitems = 0
    int ReservesItemSize = BuildingScript.ReservesItems.GetSize()
    
    int i = 0
    while i < ReservesItemSize
        Form Item = BuildingScript.ReservesItems.GetAt(i) as Form
        int ItemRequired = BuildingScript.GetItemRequired(Item)
        if ItemRequired != 0
            ObjectReference lostItem = (Building as ObjectReference).PlaceAtMe(Item)
            Recipes[totallostitems].ForceRefTo(lostItem)
            TotalExpenses[totallostitems] = -ItemRequired
            totallostitems += 1
        endif
        i += 1
    endwhile
    
    Response = (CS_FactionManagementReportMenuEconomyReservesBuildingExpensesList.GetAt(totallostitems) as Message).show(TotalExpenses[0], \
    TotalExpenses[1], TotalExpenses[2], TotalExpenses[3], TotalExpenses[4], TotalExpenses[5], TotalExpenses[6], TotalExpenses[7], TotalExpenses[8])
    
    if Response == 0
        if totallostitems > 0
            MenuEconomyReservesBuildingExports(Building)
            MenuEconomyReservesBuildingExpenses(Building)
        else
            MenuEconomyReservesBuilding(Building)
        endif
    elseif Response == 1
        MenuEconomyReservesBuildingTributes(Building)
        MenuEconomyReservesBuildingExpenses(Building)
    elseif Response == 2
        MenuEconomyReservesBuildingAidVassals(Building)
        MenuEconomyReservesBuildingExpenses(Building)
    elseif Response == 3
        MenuEconomyReservesBuildingDistributionHoldings(Building)
        MenuEconomyReservesBuildingExpenses(Building)
    elseif Response == 4
        MenuEconomyReservesBuilding(Building)
    endif
EndFunction

Function MenuEconomyReservesBuildingImports(ObjectReference Building, int Response = 0)
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    ;/
    CS_BuildingScriptImportThreadManager ImportThreadManager = Building as CS_BuildingScriptImportThreadManager
    
    CS_BuildingScriptImportThread01 Thread01 = ImportThreadManager.Thread01
    CS_BuildingScriptImportThread02 Thread02 = ImportThreadManager.Thread02
    CS_BuildingScriptImportThread03 Thread03 = ImportThreadManager.Thread03
    CS_BuildingScriptImportThread04 Thread04 = ImportThreadManager.Thread04
    CS_BuildingScriptImportThread05 Thread05 = ImportThreadManager.Thread05
    CS_BuildingScriptImportThread06 Thread06 = ImportThreadManager.Thread06
    CS_BuildingScriptImportThread07 Thread07 = ImportThreadManager.Thread07
    CS_BuildingScriptImportThread08 Thread08 = ImportThreadManager.Thread08/;
    
    int totalimports = 0
    int[] importamounts = new int[10]
    int[] importamountsreceived = new int[10]
    int[] insufficientreasons = new int[10]
    Form[] ImportItems = new Form[10]
    ObjectReference[] ImportLocations = new ObjectReference[10]
    ;/
    if Thread01.ImportAmount > 0
        importamounts[totalimports] = Thread01.AdjustedImportAmount
        importamountsreceived[totalimports] = Thread01.ItemReceived
        insufficientreasons[totalimports] = Thread01.InsufficientReason
        ImportItems[totalimports] = Thread01.ImportItem
        Recipes[totalimports].ForceRefTo(Building.PlaceAtMe(Thread01.ImportItem))
        ObjectReference FactionOwnerActivator = (Thread01.ImportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalimports += 1
    endif
    
    if Thread02.ImportAmount > 0
        importamounts[totalimports] = Thread02.AdjustedImportAmount
        importamountsreceived[totalimports] = Thread02.ItemReceived
        insufficientreasons[totalimports] = Thread02.InsufficientReason
        ImportItems[totalimports] = Thread02.ImportItem
        Recipes[totalimports].ForceRefTo(Building.PlaceAtMe(Thread02.ImportItem))
        ObjectReference FactionOwnerActivator = (Thread02.ImportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalimports += 1
    endif
    
    if Thread03.ImportAmount > 0
        importamounts[totalimports] = Thread03.AdjustedImportAmount
        importamountsreceived[totalimports] = Thread03.ItemReceived
        insufficientreasons[totalimports] = Thread03.InsufficientReason
        ImportItems[totalimports] = Thread03.ImportItem
        Recipes[totalimports].ForceRefTo(Building.PlaceAtMe(Thread03.ImportItem))
        ObjectReference FactionOwnerActivator = (Thread03.ImportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalimports += 1
    endif
    
    if Thread04.ImportAmount > 0
        importamounts[totalimports] = Thread04.AdjustedImportAmount
        importamountsreceived[totalimports] = Thread04.ItemReceived
        insufficientreasons[totalimports] = Thread04.InsufficientReason
        ImportItems[totalimports] = Thread04.ImportItem
        Recipes[totalimports].ForceRefTo(Building.PlaceAtMe(Thread04.ImportItem))
        ObjectReference FactionOwnerActivator = (Thread04.ImportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalimports += 1
    endif
    
    if Thread05.ImportAmount > 0
        importamounts[totalimports] = Thread05.AdjustedImportAmount
        importamountsreceived[totalimports] = Thread05.ItemReceived
        insufficientreasons[totalimports] = Thread05.InsufficientReason
        ImportItems[totalimports] = Thread05.ImportItem
        Recipes[totalimports].ForceRefTo(Building.PlaceAtMe(Thread05.ImportItem))
        ObjectReference FactionOwnerActivator = (Thread05.ImportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalimports += 1
    endif
    
    if Thread06.ImportAmount > 0
        importamounts[totalimports] = Thread06.AdjustedImportAmount
        importamountsreceived[totalimports] = Thread06.ItemReceived
        insufficientreasons[totalimports] = Thread06.InsufficientReason
        ImportItems[totalimports] = Thread06.ImportItem
        Recipes[totalimports].ForceRefTo(Building.PlaceAtMe(Thread06.ImportItem))
        ObjectReference FactionOwnerActivator = (Thread06.ImportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalimports += 1
    endif
    
    if Thread07.ImportAmount > 0
        importamounts[totalimports] = Thread07.AdjustedImportAmount
        importamountsreceived[totalimports] = Thread07.ItemReceived
        insufficientreasons[totalimports] = Thread07.InsufficientReason
        ImportItems[totalimports] = Thread07.ImportItem
        Recipes[totalimports].ForceRefTo(Building.PlaceAtMe(Thread07.ImportItem))
        ObjectReference FactionOwnerActivator = (Thread07.ImportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalimports += 1
    endif
    
    if Thread08.ImportAmount > 0
        importamounts[totalimports] = Thread08.AdjustedImportAmount
        importamountsreceived[totalimports] = Thread08.ItemReceived
        insufficientreasons[totalimports] = Thread08.InsufficientReason
        ImportItems[totalimports] = Thread08.ImportItem
        Recipes[totalimports].ForceRefTo(Building.PlaceAtMe(Thread08.ImportItem))
        ObjectReference FactionOwnerActivator = (Thread08.ImportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalImports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalimports += 1
    endif/;
    
    int i = 0
    while i < BuildingScript.ReservesItems.GetSize()
        Form ImportItem = BuildingScript.ReservesItems.GetAt(i) as Form
        ObjectReference[] ItemImportLocations = BuildingScript.GetItemImportLocations(ImportItem)
        if ItemImportLocations
            int[] ItemImportAmounts = BuildingScript.GetItemImportAmounts(ImportItem)
            int index = 0
            while index < ItemImportLocations.Length
                ImportItems[totalimports] = ImportItem
                ImportLocations[totalimports] = ItemImportLocations[index]
                importamounts[totalimports] = ItemImportAmounts[index]
                Recipes[totalimports].ForceRefTo(Building.PlaceAtMe(ImportItem))
                Customers[totalImports].ForceLocationTo((ItemImportLocations[index] as CS_FactionManagementOwnership).FactionLocation)
                totalimports += 1
                index += 1
            endwhile
        endif
        i += 1
    endwhile    
    
    Response = (CS_FactionManagementReportMenuEconomyImportsList.GetAt(totalimports) as Message).show(importamounts[0], importamounts[1], \
    importamounts[2], importamounts[3], importamounts[4], importamounts[5], importamounts[6], importamounts[7])
    
    i = 0
    while i < totalimports
        Recipes[i].GetRef().delete()
        i += 1
    endwhile
    
    if Response < totalimports
        MenuEconomyReservesBuildingImport(Customers[Response].GetLocation(), importamounts[Response], ImportItems[Response], importamountsreceived[Response], insufficientreasons[Response])
    endif
EndFunction

Function MenuEconomyReservesBuildingImport(Location ExportFaction, int importamount, Form ImportItem, int importamountreceived, int insufficientreason)
   
    Customers[0].ForceLocationTo(ExportFaction)
    Recipes[0].ForceRefTo(FactionManagementActivator.PlaceAtMe(ImportItem))
    
    if insufficientreason == 0
        CS_FactionManagementReportMenuEconomyImport.show(importamount, importamountreceived, importamount)
    elseif insufficientreason == 1
        CS_FactionManagementReportMenuEconomyImportUnfulfilledTreasury.show(importamount, importamountreceived, importamount)
    elseif insufficientreason == 2
        CS_FactionManagementReportMenuEconomyImportUnfulfilledSupply.show(importamount, importamountreceived, importamount)
    endif
EndFunction
    
Function MenuEconomyReservesBuildingExports(ObjectReference Building, int Response = 0)
    
    CS_BuildingScriptExportThreadManager ExportThreadManager = Building as CS_BuildingScriptExportThreadManager
    
    CS_BuildingScriptExportThread01 Thread01 = ExportThreadManager.Thread01
    CS_BuildingScriptExportThread02 Thread02 = ExportThreadManager.Thread02
    CS_BuildingScriptExportThread03 Thread03 = ExportThreadManager.Thread03
    CS_BuildingScriptExportThread04 Thread04 = ExportThreadManager.Thread04
    CS_BuildingScriptExportThread05 Thread05 = ExportThreadManager.Thread05
    CS_BuildingScriptExportThread06 Thread06 = ExportThreadManager.Thread06
    CS_BuildingScriptExportThread07 Thread07 = ExportThreadManager.Thread07
    CS_BuildingScriptExportThread08 Thread08 = ExportThreadManager.Thread08
    CS_BuildingScriptExportThread09 Thread09 = ExportThreadManager.Thread09
    CS_BuildingScriptExportThread10 Thread10 = ExportThreadManager.Thread10
    
    int totalexports = 0
    int[] exportamounts = new int[10]
    
    if Thread01.ExportItem
        exportamounts[totalexports] = Thread01.ExportAmount
        Recipes[totalexports].ForceRefTo(Building.PlaceAtMe(Thread01.ExportItem))
        ObjectReference FactionOwnerActivator = (Thread01.ExportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalexports += 1
    endif
    
    if Thread02.ExportItem
        exportamounts[totalexports] = Thread02.ExportAmount
        Recipes[totalexports].ForceRefTo(Building.PlaceAtMe(Thread02.ExportItem))
        ObjectReference FactionOwnerActivator = (Thread02.ExportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalexports += 1
    endif
    
    if Thread03.ExportItem
        exportamounts[totalexports] = Thread03.ExportAmount
        Recipes[totalexports].ForceRefTo(Building.PlaceAtMe(Thread03.ExportItem))
        ObjectReference FactionOwnerActivator = (Thread03.ExportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalexports += 1
    endif
    
    if Thread04.ExportItem
        exportamounts[totalexports] = Thread04.ExportAmount
        Recipes[totalexports].ForceRefTo(Building.PlaceAtMe(Thread04.ExportItem))
        ObjectReference FactionOwnerActivator = (Thread04.ExportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalexports += 1
    endif
    
    if Thread05.ExportItem
        exportamounts[totalexports] = Thread05.ExportAmount
        Recipes[totalexports].ForceRefTo(Building.PlaceAtMe(Thread05.ExportItem))
        ObjectReference FactionOwnerActivator = (Thread05.ExportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalexports += 1
    endif
    
    if Thread06.ExportItem
        exportamounts[totalexports] = Thread06.ExportAmount
        Recipes[totalexports].ForceRefTo(Building.PlaceAtMe(Thread06.ExportItem))
        ObjectReference FactionOwnerActivator = (Thread06.ExportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalexports += 1
    endif
    
    if Thread07.ExportItem
        exportamounts[totalexports] = Thread07.ExportAmount
        Recipes[totalexports].ForceRefTo(Building.PlaceAtMe(Thread07.ExportItem))
        ObjectReference FactionOwnerActivator = (Thread07.ExportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalexports += 1
    endif
    
    if Thread08.ExportItem
        exportamounts[totalexports] = Thread08.ExportAmount
        Recipes[totalexports].ForceRefTo(Building.PlaceAtMe(Thread08.ExportItem))
        ObjectReference FactionOwnerActivator = (Thread08.ExportLocation as CS_ReservesScript).FactionOwnerActivator
        if FactionOwnerActivator as CS_CityManagementOwnership
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_CityManagementOwnership).VanillaCity)
        elseif (FactionOwnerActivator as CS_FactionManagementDiplomacy)
            Customers[totalExports].ForceLocationTo((FactionOwnerActivator as CS_FactionManagementOwnership).FactionLocation)
        endif
        totalexports += 1
    endif
    
    Response = (CS_FactionManagementReportMenuEconomyExportsList.GetAt(totalexports) as Message).show(exportamounts[0], exportamounts[1], \
    exportamounts[2], exportamounts[3], exportamounts[4], exportamounts[5], exportamounts[6], exportamounts[7])
    
    int i = 0
    while i < totalexports
        Recipes[i].GetRef().delete()
        i += 1
    endwhile
    
    ;if Response == totalexports
EndFunction

Function MenuEconomyReservesBuildingTributes(ObjectReference Building, int Response = 0)
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    
    Buildings[0].ForceRefTo(Building)
    
    ;BuildingScript.SetNetChanges()
    
    int[] TotalSent = new int[10]
    
    int totalsentitems = 0
    int ReservesItemSize = BuildingScript.ReservesItems.GetSize()
    
    int i = 0
    while i < ReservesItemSize
        Form Item = BuildingScript.ReservesItems.GetAt(i) as Form
        int ItemSentToFaction = BuildingScript.GetItemSentToFaction(Item)
        if ItemSentToFaction > 0
            ObjectReference SentItem = (Building as ObjectReference).PlaceAtMe(Item)
            Recipes[totalsentitems].ForceRefTo(SentItem)
            TotalSent[totalsentitems] = -ItemSentToFaction
            totalsentitems += 1
        endif
        i += 1
    endwhile
    
    Response = (CS_FactionManagementReportMenuEconomyReservesBuildingTributesList.GetAt(totalsentitems) as Message).show(TotalSent[0], \
    TotalSent[1], TotalSent[2], TotalSent[3], TotalSent[4], TotalSent[5], TotalSent[6], TotalSent[7], TotalSent[8])
EndFunction

Function MenuEconomyReservesBuildingAidVassals(ObjectReference Building, int Response = 0)
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    
    Buildings[0].ForceRefTo(Building)
    
    ;BuildingScript.SetNetChanges()
    
    int[] TotalSent = new int[10]
    
    int totalsentitems = 0
    int ReservesItemSize = BuildingScript.ReservesItems.GetSize()
    
    int i = 0
    while i < ReservesItemSize
        Form Item = BuildingScript.ReservesItems.GetAt(i) as Form
        int ItemSentToVassals = BuildingScript.GetItemSentToVassals(Item)
        if ItemSentToVassals > 0
            ObjectReference SentItem = (Building as ObjectReference).PlaceAtMe(Item)
            Recipes[totalsentitems].ForceRefTo(SentItem)
            TotalSent[totalsentitems] = -ItemSentToVassals
            totalsentitems += 1
        endif
        i += 1
    endwhile
    
    Response = (CS_FactionManagementReportMenuEconomyReservesBuildingAidVassalsList.GetAt(totalsentitems) as Message).show(TotalSent[0], \
    TotalSent[1], TotalSent[2], TotalSent[3], TotalSent[4], TotalSent[5], TotalSent[6], TotalSent[7], TotalSent[8])
EndFunction

Function MenuEconomyReservesBuildingDistributionHoldings(ObjectReference Building, int Response = 0)
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    
    Buildings[0].ForceRefTo(Building)
    
    ;BuildingScript.SetNetChanges()
    
    int[] TotalSent = new int[10]
    
    int totalsentitems = 0
    int ReservesItemSize = BuildingScript.ReservesItems.GetSize()
    
    int i = 0
    while i < ReservesItemSize
        Form Item = BuildingScript.ReservesItems.GetAt(i) as Form
        int ItemSentToHoldings = BuildingScript.GetItemSentToHoldings(Item)
        if ItemSentToHoldings > 0
            ObjectReference SentItem = (Building as ObjectReference).PlaceAtMe(Item)
            Recipes[totalsentitems].ForceRefTo(SentItem)
            TotalSent[totalsentitems] = -ItemSentToHoldings
            totalsentitems += 1
        endif
        i += 1
    endwhile
    
    Response = (CS_FactionManagementReportMenuEconomyReservesBuildingDistributionList.GetAt(totalsentitems) as Message).show(TotalSent[0], \
    TotalSent[1], TotalSent[2], TotalSent[3], TotalSent[4], TotalSent[5], TotalSent[6], TotalSent[7], TotalSent[8])
EndFunction

Function MenuEconomyReservesBuildingAid(ObjectReference Building, int Response = 0)
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    
    Buildings[0].ForceRefTo(Building)
    
    ;BuildingScript.SetNetChanges()
    
    int[] TotalReceived = new int[10]
    
    int TotalReceiveditems = 0
    int ReservesItemSize = BuildingScript.ReservesItems.GetSize()
    
    int i = 0
    while i < ReservesItemSize
        Form Item = BuildingScript.ReservesItems.GetAt(i) as Form
        int ItemReceivedFromFaction = BuildingScript.GetItemReceivedFromFaction(Item)
        if ItemReceivedFromFaction > 0
            ObjectReference ReceivedItem = (Building as ObjectReference).PlaceAtMe(Item)
            Recipes[TotalReceiveditems].ForceRefTo(ReceivedItem)
            TotalReceived[TotalReceiveditems] = ItemReceivedFromFaction
            TotalReceiveditems += 1
        endif
        i += 1
    endwhile
    
    Response = (CS_FactionManagementReportMenuEconomyReservesBuildingAidList.GetAt(TotalReceivedItems) as Message).show(TotalReceived[0], \
    TotalReceived[1], TotalReceived[2], TotalReceived[3], TotalReceived[4], TotalReceived[5], TotalReceived[6], TotalReceived[7], TotalReceived[8])
EndFunction

Function MenuEconomyReservesBuildingTributesVassals(ObjectReference Building, int Response = 0)
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    
    Buildings[0].ForceRefTo(Building)
    
    ;BuildingScript.SetNetChanges()
    
    int[] TotalReceived = new int[10]
    
    int TotalReceiveditems = 0
    int ReservesItemSize = BuildingScript.ReservesItems.GetSize()
    
    int i = 0
    while i < ReservesItemSize
        Form Item = BuildingScript.ReservesItems.GetAt(i) as Form
        int ItemReceivedFromVassals = BuildingScript.GetItemReceivedFromVassals(Item)
        if ItemReceivedFromVassals > 0
            ObjectReference ReceivedItem = (Building as ObjectReference).PlaceAtMe(Item)
            Recipes[TotalReceiveditems].ForceRefTo(ReceivedItem)
            TotalReceived[TotalReceiveditems] = ItemReceivedFromVassals
            TotalReceiveditems += 1
        endif
        i += 1
    endwhile
    
    Response = (CS_FactionManagementReportMenuEconomyReservesBuildingTributesVassalsList.GetAt(TotalReceivedItems) as Message).show(TotalReceived[0], \
    TotalReceived[1], TotalReceived[2], TotalReceived[3], TotalReceived[4], TotalReceived[5], TotalReceived[6], TotalReceived[7], TotalReceived[8])
EndFunction

Function MenuEconomyReservesBuildingProductionHoldings(ObjectReference Building, int Response = 0)
    CS_ReservesScript BuildingScript = Building as CS_ReservesScript
    
    Buildings[0].ForceRefTo(Building)
    
    ;BuildingScript.SetNetChanges()
    
    int[] TotalReceived = new int[10]
    
    int TotalReceiveditems = 0
    int ReservesItemSize = BuildingScript.ReservesItems.GetSize()
    
    int i = 0
    while i < ReservesItemSize
        Form Item = BuildingScript.ReservesItems.GetAt(i) as Form
        int ItemReceivedFromHoldings = BuildingScript.GetItemReceivedFromHoldings(Item)
        if ItemReceivedFromHoldings > 0
            ObjectReference ReceivedItem = (Building as ObjectReference).PlaceAtMe(Item)
            Recipes[TotalReceiveditems].ForceRefTo(ReceivedItem)
            TotalReceived[TotalReceiveditems] = ItemReceivedFromHoldings
            TotalReceiveditems += 1
        endif
        i += 1
    endwhile
    
    Response = (CS_FactionManagementReportMenuEconomyReservesBuildingProductionList.GetAt(TotalReceivedItems) as Message).show(TotalReceived[0], \
    TotalReceived[1], TotalReceived[2], TotalReceived[3], TotalReceived[4], TotalReceived[5], TotalReceived[6], TotalReceived[7], TotalReceived[8])
EndFunction

Function MenuHoldings(int Response = 0)
    
    CitiesNum = EconomyScript.Cities.Length
    SettlementsNum = EconomyScript.Settlements.Length;/
    int i = 0
    while i < Vassals.Length
        CitiesNum += (Vassals[i] as CS_FactionManagementEconomy).Cities.Length
        SettlementsNum += (Vassals[i] as CS_FactionManagementEconomy).Settlements.Length
        i += 1
    endwhile/;
    
    Response = CS_FactionManagementReportMenuHoldings.show(CitiesNum, SettlementsNum)
    
    if Response == 0
        MenuHoldingsCities()
    elseif Response == 1
        MenuHoldingsSettlements()
    elseif Response == 2
        MenuStart()
    endif
EndFunction

Function MenuHoldingsCities(int Response = 0)
    
    ObjectReference[] Cities = EconomyScript.Cities
    
    int totalcities = Cities.Length
    int i = 0
    while i < Cities.Length
        Customers[i].ForceLocationTo((Cities[i] as CS_CityManagementOwnership).VanillaCity)
        i += 1
    endwhile
    
    Message CitiesListMessage = CS_FactionManagementReportMenuEconomyCitiesList.GetAt(totalcities) as Message
    
    Response = CitiesListMessage.show()
    
    if Response == totalcities
        MenuHoldings()
    else
        CS_CityManagementReport.Stop()
        CS_CityManagementReport.Start()
        CS_CityManagementReport.MenuStart(Cities[Response])
        MenuHoldingsCities()
    endif
EndFunction

Function MenuHoldingsSettlements(int Response = 0)
    
    ObjectReference[] Settlements = EconomyScript.Settlements
    
    int totalSettlements = Settlements.Length
    int i = 0
    while i < Settlements.Length
        Customers[i].ForceLocationTo((Settlements[i] as CS_CityManagementOwnership).VanillaCity)
        i += 1
    endwhile
    
    Message SettlementsListMessage = CS_FactionManagementReportMenuEconomySettlementsList.GetAt(totalSettlements) as Message
    
    Response = SettlementsListMessage.show()
    
    if Response == totalSettlements
        MenuHoldings()
    else
        CS_CityManagementReport.Stop()
        CS_CityManagementReport.Start()
        CS_CityManagementReport.MenuStart(Settlements[Response])
        MenuHoldingsSettlements()
    endif
EndFunction

Function MenuMilitary(int Response = 0)
    
    NumArmies = MilitaryScript.Armies.Length
    NumDivisions = MilitaryScript.Divisions.Length
    NumRegiments = MilitaryScript.Regiments.Length
    
    int[] Values = new int[3]
    
    Message MilitaryMessage
    
    if NumArmies >= 1 && NumDivisions >= 1 && NumRegiments >= 1
        MilitaryMessage = CS_FactionManagementReportMenuMilitary.GetAt(3) as Message
        int i = 0
        while i < MilitaryUnitTypes.Length
            MilitaryUnitTypes[i].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(i) as Location)
            i += 1
        endwhile
        Values[0] = NumArmies
        Values[1] = NumDivisions
        Values[2] = NumRegiments
    elseif (NumArmies >= 1 && NumDivisions >= 1)
        MilitaryMessage = CS_FactionManagementReportMenuMilitary.GetAt(2) as Message
        MilitaryUnitTypes[0].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(0) as Location)
        MilitaryUnitTypes[1].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(1) as Location)
        Values[0] = NumArmies
        Values[1] = NumDivisions
    elseif (NumRegiments >= 1 && NumDivisions >= 1)
        MilitaryMessage = CS_FactionManagementReportMenuMilitary.GetAt(2) as Message
        MilitaryUnitTypes[0].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(1) as Location)
        MilitaryUnitTypes[1].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(2) as Location)
        Values[0] = NumDivisions
        Values[1] = NumRegiments
    elseif (NumArmies >= 1 && NumRegiments >= 1)
        MilitaryMessage = CS_FactionManagementReportMenuMilitary.GetAt(2) as Message
        MilitaryUnitTypes[0].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(0) as Location)
        MilitaryUnitTypes[1].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(2) as Location)
        Values[0] = NumArmies
        Values[1] = NumRegiments
    elseif NumArmies >= 1
        MilitaryMessage = CS_FactionManagementReportMenuMilitary.GetAt(1) as Message
        MilitaryUnitTypes[0].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(0) as Location)
        Values[0] = NumArmies
    elseif NumDivisions >= 1
        MilitaryMessage = CS_FactionManagementReportMenuMilitary.GetAt(1) as Message
        MilitaryUnitTypes[0].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(1) as Location)
        Values[0] = NumDivisions
    elseif NumRegiments >= 1
        MilitaryMessage = CS_FactionManagementReportMenuMilitary.GetAt(1) as Message
        MilitaryUnitTypes[0].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(2) as Location)
        Values[0] = NumRegiments
    else
        MilitaryMessage = CS_FactionManagementReportMenuMilitary.GetAt(0) as Message
    endif
    
    Response = MilitaryMessage.show(Values[0], Values[1], Values[2])
    
    if Response < 3
        MenuMilitaryUnit(Response)
    elseif Response == 3
        MenuMilitaryEquipment()
    elseif Response == 5
        MenuStart(FactionManagementActivator)
    endif
EndFunction

Function MenuMilitaryUnit(int unittype, int Response = 0)
    MilitaryUnitTypes[0].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(unittype) as Location)
    int NumUnits
    if unittype == 0
        NumUnits = MilitaryScript.Armies.Length
    elseif unittype == 1
        NumUnits = MilitaryScript.Divisions.Length
    elseif unittype == 2
        NumUnits = MilitaryScript.Regiments.Length
        int i = 0
        while i < NumUnits
            Customers[i].ForceLocationTo((MilitaryScript.Regiments[i] as CS_RegimentScript).BaseLocation.GetLocation())
            i += 1
        endwhile
    endif
    
    ListMaxPages = math.ceiling(NumUnits as float/5)
    
    Response = ShowMultiPageMessage(CS_FactionManagementReportMenuMilitaryUnitList, NumUnits, true)
    if Response == -1
        MenuMilitary()
    elseif Response < NumUnits
        ObjectReference CityManagementActivator = (MilitaryScript.Regiments[Response] as CS_RegimentScript).CityManagementActivator.GetRef()
        CS_CityManagementReport.Stop()
        CS_CityManagementReport.Start()
        CS_CityManagementReport.SetCity(CityManagementActivator)
        CS_CityManagementReport.MenuMilitaryRegiment()
        CS_CityManagementReport.Stop()
        MenuMilitaryUnit(unittype)
    endif
EndFunction

Function MenuMilitaryEquipment(int Response = 0)
    
    Response = CS_FactionManagementReportMenuMilitaryEquipment.show()
    
    if Response == 0
        MenuMilitaryEquipmentTroopsNormal()
    elseif Response == 2
        MenuMilitaryEquipmentCommander(0)
    elseif Response == 3
        MenuMilitaryEquipmentCommander(1)
    elseif Response == 4
        MenuMilitaryEquipmentCommander(2)
    elseif Response == 6
        MenuMilitary()
    endif
    
EndFunction

Function MenuMilitaryEquipmentTroopsNormal(int Response = 0)
    
    Response = CS_FactionManagementReportMenuMilitaryEquipmentTroopsNormal.show()
    
    if Response < 4
        MenuMilitaryEquipmentTroop(Response)
    elseif Response == 4
        MenuMilitary()
    endif
    
EndFunction

Function MenuMilitaryEquipmentTroop(int trooptype, int Response = 0)
    
    CustomOutfitEnabled = MilitaryScript.HasCustomOutfits[trooptype]
    GenderedEquipment = MilitaryScript.HasGenderedOutfits[trooptype]
    
    Response = CS_FactionManagementReportMenuMilitaryEquipmentTroop.show()
    
    if Response == 0
        GetTroopEquipment(Response)
        MenuMilitaryEquipmentTroop(trooptype)
    elseif Response == 1
        GetTroopEquipment(Response, 0)
        MenuMilitaryEquipmentTroop(trooptype)
    elseif Response == 2
        GetTroopEquipment(Response, 1)
        MenuMilitaryEquipmentTroop(trooptype)
    elseif Response == 3
        MilitaryScript.HasGenderedOutfits[trooptype] = 1
        MenuMilitaryEquipmentTroop(trooptype)
    elseif Response == 4
        MilitaryScript.HasGenderedOutfits[trooptype] = 0
        MenuMilitaryEquipmentTroop(trooptype)
    elseif Response == 5
        MilitaryScript.HasCustomOutfits[trooptype] = 1
        MenuMilitaryEquipmentTroop(trooptype)
    elseif Response == 6
        MilitaryScript.HasCustomOutfits[trooptype] = 0
        MenuMilitaryEquipmentTroop(trooptype)
    elseif Response == 7
        MenuMilitaryEquipmentTroopsNormal()
    endif
    
EndFunction

Function MenuMilitaryEquipmentCommander(int unittype, int Response = 0)
    
    Customers[0].ForceLocationTo(CS_TextMilitaryUnitTypes.GetAt(unittype) as Location)
    
    CustomOutfitEnabled = MilitaryScript.HasCustomCommanderOutfits[unittype]
    GenderedEquipment = MilitaryScript.HasGenderedCommanderOutfits[unittype]
    
    Response = CS_FactionManagementReportMenuMilitaryEquipmentTroop.show()
    
    if Response == 0
        GetCommanderEquipment(Response)
        MenuMilitaryEquipmentCommander(unittype)
    elseif Response == 1
        GetCommanderEquipment(Response, 0)
        MenuMilitaryEquipmentCommander(unittype)
    elseif Response == 2
        GetCommanderEquipment(Response, 1)
        MenuMilitaryEquipmentCommander(unittype)
    elseif Response == 3
        MilitaryScript.HasGenderedCommanderOutfits[unittype] = 1
        MenuMilitaryEquipmentCommander(unittype)
    elseif Response == 4
        MilitaryScript.HasGenderedCommanderOutfits[unittype] = 0
        MenuMilitaryEquipmentCommander(unittype)
    elseif Response == 5
        MilitaryScript.HasCustomCommanderOutfits[unittype] = 1
        MenuMilitaryEquipmentCommander(unittype)
    elseif Response == 6
        MilitaryScript.HasCustomCommanderOutfits[unittype] = 0
        MenuMilitaryEquipmentCommander(unittype)
    elseif Response == 7
        MenuMilitaryEquipment()
    endif
    
EndFunction

Function GetTroopEquipment(int trooptype, int gender=-1)
    
    Actor EquipmentActor = FactionManagementActivator.PlaceAtMe(CS_CustomEquipmentTroopActor) as Actor
    Armor[] TroopArmor
    Form[] TroopItems
    
    if trooptype == 0
        if gender == 0
            TroopArmor = MilitaryScript.CustomOutfitSoldierMale
            TroopItems = MilitaryScript.CustomItemsSoldierMale
        elseif gender == 1
            TroopArmor = MilitaryScript.CustomOutfitSoldierFemale
            TroopItems = MilitaryScript.CustomItemsSoldierFemale
        else
            TroopArmor = MilitaryScript.CustomOutfitSoldier
            TroopItems = MilitaryScript.CustomItemsSoldier
        endif
    elseif trooptype == 1
        if gender == 0
            TroopArmor = MilitaryScript.CustomOutfitWarriorMale
            TroopItems = MilitaryScript.CustomItemsWarriorMale
        elseif gender == 1
            TroopArmor = MilitaryScript.CustomOutfitWarriorFemale
            TroopItems = MilitaryScript.CustomItemsWarriorFemale
        else
            TroopArmor = MilitaryScript.CustomOutfitWarrior
            TroopItems = MilitaryScript.CustomItemsWarrior
        endif
    elseif trooptype == 2
        if gender == 0
            TroopArmor = MilitaryScript.CustomOutfitArcherMale
            TroopItems = MilitaryScript.CustomItemsArcherMale
        elseif gender == 1
            TroopArmor = MilitaryScript.CustomOutfitArcherFemale
            TroopItems = MilitaryScript.CustomItemsArcherFemale
        else
            TroopArmor = MilitaryScript.CustomOutfitArcher
            TroopItems = MilitaryScript.CustomItemsArcher
        endif
    elseif trooptype == 3
        if gender == 0
            TroopArmor = MilitaryScript.CustomOutfitCrossbowMale
            TroopItems = MilitaryScript.CustomItemsCrossbowMale
        elseif gender == 1
            TroopArmor = MilitaryScript.CustomOutfitCrossbowFemale
            TroopItems = MilitaryScript.CustomItemsCrossbowFemale
        else
            TroopArmor = MilitaryScript.CustomOutfitCrossbow
            TroopItems = MilitaryScript.CustomItemsCrossbow
        endif
    endif
    
    int i = 0
    while i < TroopArmor.Length
        EquipmentActor.AddItem(TroopArmor[i], 1)
        i += 1
    endwhile
    
    i = 0
    while i < TroopItems.Length
        EquipmentActor.AddItem(TroopItems[i], 1)
        i += 1
    endwhile
    
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).MilitaryScript = MilitaryScript
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).TroopType = TroopType
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).gender = gender
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).GoToState("TroopReady")
    
    EquipmentActor.OpenInventory(true)
    while utility.IsInMenuMode()
        utility.wait(0.1)
    endwhile
    
    EquipmentActor.delete()
    
    if ModifiedTroop
        ModifiedTroop = false
        MilitaryScript.UpdateEquipment(trooptype, gender)
    endif
    
EndFunction

Function GetCommanderEquipment(int unittype, int gender=-1)
    
    Actor EquipmentActor = FactionManagementActivator.PlaceAtMe(CS_CustomEquipmentTroopActor) as Actor
    Armor[] CommanderArmor
    Form[] CommanderItems
    
    if unittype == 0
        if gender == 0
            CommanderArmor = MilitaryScript.CustomOutfitCommanderRegimentMale
            CommanderItems = MilitaryScript.CustomItemsCommanderRegimentMale
        elseif gender == 1
            CommanderArmor = MilitaryScript.CustomOutfitCommanderRegimentFemale
            CommanderItems = MilitaryScript.CustomItemsCommanderRegimentFemale
        else
            CommanderArmor = MilitaryScript.CustomOutfitCommanderRegiment
            CommanderItems = MilitaryScript.CustomItemsCommanderRegiment
        endif
    elseif unittype == 1
        if gender == 0
            CommanderArmor = MilitaryScript.CustomOutfitCommanderDivisionMale
            CommanderItems = MilitaryScript.CustomItemsCommanderDivisionMale
        elseif gender == 1
            CommanderArmor = MilitaryScript.CustomOutfitCommanderDivisionFemale
            CommanderItems = MilitaryScript.CustomItemsCommanderDivisionFemale
        else
            CommanderArmor = MilitaryScript.CustomOutfitCommanderDivision
            CommanderItems = MilitaryScript.CustomItemsCommanderDivision
        endif
    elseif unittype == 2
        if gender == 0
            CommanderArmor = MilitaryScript.CustomOutfitCommanderArmyMale
            CommanderItems = MilitaryScript.CustomItemsCommanderArmyMale
        elseif gender == 1
            CommanderArmor = MilitaryScript.CustomOutfitCommanderArmyFemale
            CommanderItems = MilitaryScript.CustomItemsCommanderArmyFemale
        else
            CommanderArmor = MilitaryScript.CustomOutfitCommanderArmy
            CommanderItems = MilitaryScript.CustomItemsCommanderArmy
        endif;/
    elseif unittype == 3
        if gender == 0
            CommanderArmor = MilitaryScript.CustomOutfitCommanderGrandArmyMale
        elseif gender == 1
            CommanderArmor = MilitaryScript.CustomOutfitCrossbowFemale
        else
            CommanderArmor = MilitaryScript.CustomOutfitCrossbow
        endif/;
    endif
    
    int i = 0
    while i < CommanderArmor.Length
        EquipmentActor.AddItem(CommanderArmor[i], 1)
        i += 1
    endwhile
    
    i = 0
    while i < CommanderItems.Length
        EquipmentActor.AddItem(CommanderItems[i], 1)
        i += 1
    endwhile
    
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).MilitaryScript = MilitaryScript
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).trooptype = unittype
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).gender = gender
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).GoToState("CommanderReady")
    
    EquipmentActor.OpenInventory(true)
    while utility.IsInMenuMode()
        utility.wait(0.1)
    endwhile
    
    EquipmentActor.delete()
    
    if ModifiedCommander
        ModifiedCommander = false
        MilitaryScript.UpdateCommanderEquipment(unittype, gender)
    endif
    
EndFunction

Function MenuGovernment(int Response = 0)
    Response = CS_FactionManagementReportMenuGovernment.show()
    
    if Response == 0
        MenuGovernmentLoS()
    else
        MenuStart(FactionManagementActivator)
    endif
EndFunction

Function MenuGovernmentLoS(int Response = 0)
    if OwnershipScript.LeaderLoS
        AddActorsToAliasArray(OwnershipScript.LeaderLoS, Recipes)
    elseif OwnershipScript.Leader
        OwnershipScript.SetLoS(OwnershipScript.Leader)
        AddActorsToAliasArray(OwnershipScript.LeaderLoS, Recipes)
    endif
    
    int numsuccession = OwnershipScript.LeaderLoS.Length
    
    Response = (CS_FactionManagementReportMenuGovernmentLoS.GetAt(numsuccession) as Message).show()
EndFunction

Function MenuPopulation(int Response = 0)
    
    Response = CS_FactionManagementReportMenuPopulation.show()
    
    if Response == 0
        CS_ChooseTroopRaces.Stop()
        CS_ChooseTroopRaces.Start()
        CS_ChooseTroopRaces.StartMenu(FactionManagementActivator)
        MenuPopulation()
    elseif Response == 1
        MenuStart(FactionManagementActivator)
    endif
    
EndFunction