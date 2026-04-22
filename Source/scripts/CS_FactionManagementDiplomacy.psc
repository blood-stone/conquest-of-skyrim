Scriptname CS_FactionManagementDiplomacy extends ObjectReference conditional

import CS_CommonFunctions

Location Property FactionName Auto
Location Property FactionNamePrefix Auto

Location Property FactionNameInitial Auto
Location Property FactionNamePrefixInitial Auto

string Property FactionNameString Auto
string Property FactionShortNameString Auto

int Property FactionType Auto
int Property FactionNum Auto ;A number that is used as the index to arrays that this faction is a part of.

Form Property FactionBanner Auto

int Property FactionColor Auto

int Property PlayerFaction Auto

Static Property MapFlag Auto

Keyword Property CS_StoryWarObjectives Auto

FormList Property CS_FactionActivatorsHolds Auto
FormList Property CS_FactionActivatorsMajor Auto

ObjectReference[] Property TradeAgreements Auto
ObjectReference[] Property TradeAgreementChests Auto
ObjectReference[] Property Alliances Auto
ObjectReference[] Property Vassals Auto
Objectreference[] Property Enemies Auto
ObjectReference[] Property Wars Auto

int Property AtWarPlayer=0 Auto conditional

Activator Property CS_FactionWarActivator Auto

ObjectReference[] Property PermanentFavorFactions Auto
ObjectReference[] Property TempFavorFactions Auto
int[] Property PermanentFavors Auto
int[] Property TempFavors Auto

int[] Property IssueStances Auto ;0: Economy, 1: Magic Regulation, 2: Imperial Influence, 3: Non-Human Rights, 4: Environment, 5: Education, 6: Religion, 7: Military, 8: Crime, 9: Diplomacy

;------------------------------Trade Agreements--------------------------------------------;

Function AddTradeAgreement(ObjectReference FactionManagementActivator, float TradeModifier1=1.0, float TradeModifier2=1.0)
    ;/if TradeAgreements.Find(FactionManagementActivator) < 0
        TradeAgreements = AddToArray(FactionManagementActivator, TradeAgreements)
        ObjectReference NewTradeChest = (self as ObjectReference).PlaceAtMe(CS_TradeChest, 1, abForcePersist = true)
        TradeAgreementChests = AddToArray(NewTradeChest, TradeAgreementChests)
        (NewTradeChest as CS_TradeAgreementScript).SetUp(self as ObjectReference, FactionManagementActivator, TradeModifier1, TradeModifier2)
        
        (FactionManagementActivator as CS_FactionManagementDiplomacy).TradeAgreements = AddToArray(self as ObjectReference, (FactionManagementActivator as CS_FactionManagementDiplomacy).TradeAgreements)
        (FactionManagementActivator as CS_FactionManagementDiplomacy).TradeAgreementChests = AddToArray(NewTradeChest, (FactionManagementActivator as CS_FactionManagementDiplomacy).TradeAgreementChests)
        debug.notification(FactionNameString + " has begun a trade agreement with " + (FactionManagementActivator as CS_FactionManagementDiplomacy).FactionNameString)
    endif/;
EndFunction

Function RemoveTradeAgreement(ObjectReference FactionManagementActivator)
    ;/int tradenum = TradeAgreements.Find(FactionManagementActivator)
    ObjectReference TradeChest = TradeAgreementChests[tradenum]
    
    (TradeChest as CS_TradeAgreementScript).CancelAllTrade()
    TradeAgreementChests = RemoveFromArray(TradeChest, TradeAgreementChests)
    (FactionManagementActivator as CS_FactionManagementDiplomacy).TradeAgreementChests = RemoveFromArray(TradeChest, (FactionManagementActivator as CS_FactionManagementDiplomacy).TradeAgreementChests)
    TradeChest.disable()
    TradeChest.delete()
    TradeAgreements = RemoveFromArray(FactionManagementActivator, TradeAgreements)
    
    (FactionManagementActivator as CS_FactionManagementDiplomacy).TradeAgreements = RemoveFromArray(self as ObjectReference, (FactionManagementActivator as CS_FactionManagementDiplomacy).TradeAgreements)
    debug.notification("The trade agreement between " + FactionNameString + " and " + (FactionManagementActivator as CS_FactionManagementDiplomacy).FactionNameString + " has been canceled!")/;
EndFunction

int Function GetTotalTradeProfits()
    ;/int totalprofits = 0

    int i = 0
    while i < TradeAgreementChests.Length
        totalprofits += (TradeAgreementChests[i] as CS_TradeAgreementScript).GetTotalProfits(self as ObjectReference)
        i += 1
    endwhile
    
    return totalprofits/;
EndFunction

int Function FillDeficit(Form Item, int deficit, ObjectReference SelfReservesChest)
    ;/debug.trace(FactionName.GetName() + " trying to fill deficit of " + deficit + " " + Item.GetName())
    string ReservesType = (SelfReservesChest as CS_ReservesScript).ReservesType

    int i = 0
    while i < TradeAgreements.Length
        ObjectReference ReservesChest
        if ReservesType == "Food"
            ReservesChest = (TradeAgreements[i] as CS_ManagementReserves).FoodReserves
        elseif ReservesType == "BuildingMaterials"
            ReservesChest = (TradeAgreements[i] as CS_ManagementReserves).BuildingMaterialReserves
        elseif ReservesType == "Ingots"
            ReservesChest = (TradeAgreements[i] as CS_ManagementReserves).IngotReserves
        elseif ReservesType == "Equipment"
            ReservesChest = (TradeAgreements[i] as CS_ManagementReserves).EquipmentReserves
        endif
        
        int availableamount = (ReservesChest as CS_ReservesScript).GetAvailableAmount(Item)
        if availableamount >= deficit
            (ReservesChest as CS_BuildingScriptExportThreadManager).AssignToThread(Item, deficit, SelfReservesChest, TradeChest = TradeAgreementChests[i])
            return 0
        elseif availableamount > 0
            (ReservesChest as CS_BuildingScriptExportThreadManager).AssignToThread(Item, availableamount, SelfReservesChest, TradeChest = TradeAgreementChests[i])
            deficit -= availableamount
        endif
        
        i += 1
    endwhile

    ObjectReference FactionOwnerActivator = ((self as ObjectReference) as CS_FactionManagementOwnership).FactionOwnerActivator
    if FactionOwnerActivator
        debug.trace(FactionName.GetName() + " checking other vassals for " + deficit + " " + Item.GetName() + "...")
        ObjectReference[] PossibleTradePartners = (FactionOwnerActivator as CS_FactionManagementDiplomacy).Vassals
        i = 0
        while i < PossibleTradePartners.Length
            ObjectReference TradePartner = PossibleTradePartners[i]
            if TradePartner != self as ObjectReference
                ObjectReference ReservesChest
                if ReservesType == "Food"
                    ReservesChest = (TradePartner as CS_ManagementReserves).FoodReserves
                elseif ReservesType == "BuildingMaterials"
                    ReservesChest = (TradePartner as CS_ManagementReserves).BuildingMaterialReserves
                elseif ReservesType == "Ingots"
                    ReservesChest = (TradePartner as CS_ManagementReserves).IngotReserves
                elseif ReservesType == "Equipment"
                    ReservesChest = (TradePartner as CS_ManagementReserves).EquipmentReserves
                endif
                
                int availableamount = (ReservesChest as CS_ReservesScript).GetAvailableAmount(Item)
                debug.trace(FactionName.GetName() + " found out that " + (TradePartner as CS_FactionManagementDiplomacy).FactionName.GetName() + " has " + availableamount + " of " + Item.GetName() + "...")
                if availableamount >= deficit
                    AddTradeAgreement(TradePartner)
                    int tradenum = TradeAgreements.Find(TradePartner)
                    (TradeAgreementChests[tradenum] as CS_TradeAgreementScript).AdjustTradeAgreement(TradePartner, self as ObjectReference, ReservesChest, SelfReservesChest, Item, deficit)
                    return 0
                elseif availableamount > 0
                    AddTradeAgreement(TradePartner)
                    int tradenum = TradeAgreements.Find(TradePartner)
                    (TradeAgreementChests[tradenum] as CS_TradeAgreementScript).AdjustTradeAgreement(TradePartner, self as ObjectReference, ReservesChest, SelfReservesChest, Item, availableamount)
                    deficit -= availableamount
                endif
            endif
            
            i += 1
        endwhile
    endif

    return deficit/;
EndFunction
;------------------------------Alliances---------------------------------------------------;

Function AddAlliance(ObjectReference FactionManagementActivator)
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionName.GetName() + " adding " + \
    (FactionManagementActivator as CS_FactionManagementDiplomacy).FactionName.GetName() + " as an alliance")
    
    Alliances = AddToArray(FactionManagementActivator, Alliances)
    (FactionManagementActivator as CS_FactionManagementDiplomacy).Alliances = AddToArray(self as ObjectReference, (FactionManagementActivator as CS_FactionManagementDiplomacy).Alliances)
    
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionName.GetName() + " ADDED " + \
    (FactionManagementActivator as CS_FactionManagementDiplomacy).FactionName.GetName() + " as an alliance")
    debug.notification(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionName.GetName() + " has formed an alliance with " + (FactionManagementActivator as CS_FactionManagementDiplomacy).FactionName.GetName())
EndFunction

Function RemoveAlliance(ObjectReference FactionManagementActivator)
    Alliances = RemoveFromArray(FactionManagementActivator, Alliances)
    (FactionManagementActivator as CS_FactionManagementDiplomacy).Alliances = RemoveFromArray(self as ObjectReference, (FactionManagementActivator as CS_FactionManagementDiplomacy).Alliances)
    debug.notification(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " has broken their alliance with " + (FactionManagementActivator as CS_FactionManagementDiplomacy).FactionNameString)
EndFunction

;------------------------------Vassals----------------------------------------------------;

Function AddVassal(ObjectReference FactionManagementActivator, bool initial=false)
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionName.GetName() + " adding " + \
    (FactionManagementActivator as CS_FactionManagementDiplomacy).FactionName.GetName() + " as a vassal")
    
    if initial
        (FactionManagementActivator as CS_FactionManagementOwnership).SetInitialOwnerFaction(self as ObjectReference)
        (FactionManagementActivator as CS_FactionManagementEconomy).GoToState("NotSetUp")
        (FactionManagementActivator as CS_FactionManagementMilitary).GoToState("NotSetUp")
        FactionManagementActivator.RegisterForSingleUpdate(0.1)
    else
        (FactionManagementActivator as CS_FactionManagementOwnership).SetOwnerFaction(self as ObjectReference)
        if CS_FactionActivatorsMajor.HasForm(FactionManagementActivator)
            CS_FactionActivatorsMajor.RemoveAddedForm(FactionManagementActivator)
        endif
        (FactionManagementActivator as CS_FactionManagementEconomy).SetCommonerIncreaseRate()
        (FactionManagementActivator as CS_FactionManagementEconomy).UpdateHoldingCommonerIncreaseRates()
        (FactionManagementActivator as CS_FactionManagementMilitary).SetOwner()
        (FactionManagementActivator as CS_FactionManagementOwnership).ChangeGovernments(self as ObjectReference)
        debug.notification((FactionManagementActivator as CS_FactionManagementDiplomacy).FactionNameString + " has become a vassal of " + ((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + "!")
    endif
    Vassals = AddToArray(FactionManagementActivator, Vassals)
    
    if FactionType <= (FactionManagementActivator as CS_FactionManagementDiplomacy).FactionType
        FactionType = (FactionManagementActivator as CS_FactionManagementDiplomacy).FactionType + 1
        if FactionType == 1
            debug.notification(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " has become a Regional Power!")
        elseif FactionType == 2
            debug.notification(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " has become a Major Power!")
        endif    
    endif
    
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionName.GetName() + " ADDED " + \
    (FactionManagementActivator as CS_FactionManagementDiplomacy).FactionName.GetName() + " as a vassal")
EndFunction

Function RemoveVassal(ObjectReference FactionManagementActivator)
    (FactionManagementActivator as CS_FactionManagementOwnership).RemoveFactionOwner()
    (FactionManagementActivator as CS_FactionManagementEconomy).SetCommonerIncreaseRate()
    (FactionManagementActivator as CS_FactionManagementMilitary).SetOwner()
    Vassals = RemoveFromArray(FactionManagementActivator, Vassals);/
    int i = 0
    while i < Vassals.Length
        if Vassals[i] != FactionManagementActivator
            (Vassals[i] as CS_FactionManagementDiplomacy).RemoveAlliance(FactionManagementActivator)
            (Vassals[i] as CS_FactionManagementDiplomacy).RemoveTradeAgreement(FactionManagementActivator)
        endif
        i += 1
    endwhile/;
    debug.trace((FactionManagementActivator as CS_FactionManagementDiplomacy).FactionNameString + " is no longer a vassal of " + ((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString)
    debug.notification((FactionManagementActivator as CS_FactionManagementDiplomacy).FactionNameString + " is no longer a vassal of " + ((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + "!")
EndFunction

;--------------------------------Opinions----------------------------------------------------;

Function AddPermanentFavor(ObjectReference FactionManagementActivator, int favoramount)
    int favornum = PermanentFavorFactions.Find(FactionManagementActivator)
    if favornum >= 0
        PermanentFavors[favornum] = PermanentFavors[favornum] + favoramount
    else
        PermanentFavorFactions = AddToArray(FactionManagementActivator, PermanentFavorFactions)
        PermanentFavors = AddToIntArray(favoramount, PermanentFavors)
    endif
EndFunction

Function AddTempFavor(ObjectReference FactionManagementActivator, int favoramount)
    int favornum = TempFavorFactions.Find(FactionManagementActivator)
    if favornum >= 0
        TempFavors[favornum] = TempFavors[favornum] + favoramount
    else
        TempFavorFactions = AddToArray(FactionManagementActivator, TempFavorFactions)
        TempFavors = AddToIntArray(favoramount, TempFavors)
    endif
EndFunction

Function RemoveTempFavor(ObjectReference FactionManagementActivator)
    int favornum = TempFavorFactions.Find(FactionManagementActivator)
    TempFavorFactions = RemoveFromArray(FactionManagementActivator, TempFavorFactions)
    
    TempFavors[favornum] = -69420
    TempFavors = RemoveFromIntArray(-69420, TempFavors)
EndFunction

Function DailyTempFavorSubtraction()
    int i = 0
    while i < TempFavors.Length
        TempFavors[i] = TempFavors[i] - 1
        if TempFavors[i] <= 0
            RemoveTempFavor(TempFavorFactions[i])
        endif
        i += 1
    endwhile
EndFunction

int Function GetTempFavorValue(ObjectReference FactionManagementActivator)
    int favornum = TempFavorFactions.Find(FactionManagementActivator)
    if favornum >= 0
        return TempFavors[favornum]
    endif
    return 0
EndFunction

int Function GetPermanentFavorValue(ObjectReference FactionManagementActivator)
    int favornum = PermanentFavorFactions.Find(FactionManagementActivator)
    if favornum >= 0
        return PermanentFavors[favornum]
    endif
    return 0
EndFunction

int Function GetStancesAgreement(ObjectReference FactionManagementActivator)
    int AgreementValue = 0
    int[] FactionStances = (FactionManagementActivator as CS_FactionManagementDiplomacy).IssueStances
    
    int i = 0
    while i < IssueStances.Length
        int stancedifference = math.abs(IssueStances[i] - FactionStances[i]) as int
        if stancedifference == 2
            AgreementValue -= 5
        elseif stancedifference == 0
            AgreementValue += 5
        endif
        i += 1
    endwhile
    
    return AgreementValue
EndFunction

int Function GetOpinion(ObjectReference FactionManagementActivator)
    int OpinionValue
    
    int StanceAgreement = GetStancesAgreement(FactionManagementActivator)
    int PermanentFavorValue = GetPermanentFavorValue(FactionManagementActivator)
    int TempFavorValue = GetTempFavorValue(FactionManagementActivator)
    
    OpinionValue = StanceAgreement + PermanentFavorValue + TempFavorValue
    
    if TradeAgreements.Find(FactionManagementActivator) >= 0
        OpinionValue += 10
    endif
    
    if Alliances.Find(FactionManagementActivator) >= 0
        OpinionValue += 20
    endif
    
    if Vassals.Find(FactionManagementActivator) >= 0 || (FactionManagementActivator as CS_FactionManagementDiplomacy).Vassals.Find(self as ObjectReference) >= 0
        OpinionValue += 30
    endif
    
    if OpinionValue > 100
        OpinionValue = 100
    elseif OpinionValue < -100
        OpinionValue = -100
    endif
    
    return OpinionValue
EndFunction

;--------------------------------War----------------------------------------------------;

Function StartWar(ObjectReference EnemyFaction)
    if TradeAgreements.Find(EnemyFaction) >= 0
        RemoveTradeAgreement(EnemyFaction)
    endif
    
    if Alliances.Find(EnemyFaction) >= 0
        RemoveAlliance(EnemyFaction)
    endif
    
    if Vassals.Find(EnemyFaction) >= 0
        RemoveVassal(EnemyFaction)
    endif
    
    ObjectReference WarActivator = PlaceAtMe(CS_FactionWarActivator)
    Wars = AddToArray(WarActivator, Wars)
    (EnemyFaction as CS_FactionManagementDiplomacy).Wars = AddToArray(WarActivator, (EnemyFaction as CS_FactionManagementDiplomacy).Wars)
    (WarActivator as CS_FactionWarMasterScript).SetUp(self as ObjectReference, EnemyFaction)
    if PlayerFaction == 1
        CS_StoryWarObjectives.SendStoryEvent((EnemyFaction as CS_FactionManagementDiplomacy).FactionName, WarActivator, EnemyFaction)
        (EnemyFaction as CS_FactionManagementDiplomacy).AtWarPlayer = 1
    endif
    Enemies = AddToArray(EnemyFaction, Enemies)
    (EnemyFaction as CS_FactionManagementDiplomacy).Enemies = AddToArray(self as ObjectReference, (EnemyFaction as CS_FactionManagementDiplomacy).Enemies)
    debug.notification("A war between " + FactionNameString + " and " + (EnemyFaction as CS_FactionManagementDiplomacy).FactionNameString + " has broken out!")
    debug.trace("A war between " + FactionNameString + " and " + (EnemyFaction as CS_FactionManagementDiplomacy).FactionNameString + " has broken out!")
EndFunction

bool Function GetIsAllied(ObjectReference OtherFaction)
    
    if ((self as ObjectReference) as CS_FactionManagementOwnership).FactionOwnerActivator == OtherFaction
        return true
    elseif Alliances.Find(OtherFaction) >= 0
        return true
    elseif Vassals.Find(OtherFaction) >= 0
        return true
    else
        return false
    endif
    
EndFunction

State Hourly

    Event OnUpdate()
        if Vassals.Length > 0
            int i = 0
            while i < Vassals.Length
                (Vassals[i] as CS_FactionManagementDiplomacy).GoToState("Hourly")
                if PlayerFaction == 1
                    (Vassals[i] as CS_FactionManagementEconomy).GoToState("Hourly")
                endif
                Vassals[i].RegisterForSingleUpdate(0.1)
                i += 1
            endwhile
            
            i = 0
            int loopnum = 0
            while i < Vassals.Length && loopnum < 50
                if (Vassals[i] as CS_FactionManagementDiplomacy).GetState() != "Updated"
                    utility.wait(0.1)
                    i = 0
                    loopnum += 1
                else
                    i += 1
                endif
            endwhile
        endif
        GoToState("Updated")
    EndEvent
    
EndState

State Daily

    Event OnUpdate()
        if Vassals.Length > 0
            int i = 0
            while i < Vassals.Length
                (Vassals[i] as CS_FactionManagementDiplomacy).GoToState("Daily")
                if PlayerFaction == 1
                    (Vassals[i] as CS_FactionManagementEconomy).GoToState("Daily")
                endif
                Vassals[i].RegisterForSingleUpdate(0.1)
                i += 1
            endwhile
            
            i = 0
            int loopnum = 0
            while i < Vassals.Length && loopnum < 100
                if (Vassals[i] as CS_FactionManagementDiplomacy).GetState() != "Updated"
                    utility.wait(0.1)
                    i = 0
                    loopnum += 1
                else
                    i += 1
                endif
            endwhile
        endif
        
        DailyTempFavorSubtraction()
        GoToState("Updated")
    EndEvent
    
EndState