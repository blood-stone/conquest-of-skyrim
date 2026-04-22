Scriptname CS_GroupsFactionUpdaterScript extends Quest  

int Property factionnum Auto

int[] Property CityTributePercentages Auto
int[] Property EconomyHasIssue Auto

FormList Property CS_AllHoldings Auto

CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto
CS_EconomyFactionUpdaterNewScript Property EconomyFaction Auto
CS_InfluenceFactionUpdaterScript Property InfluenceFaction Auto
CS_LawFactionScript Property LawFaction Auto
;/
Function SetUp()
    SetUpTributes()
    SetUpAid()
EndFunction

Function SetUpTributes()
    int i = 0
    
    while i < 9
        if (CS_AllHoldings.GetAt(i) as GlobalVariable).GetValue() == factionnum
            CityTributePercentages[i] = 0
        endif
        i += 1
    endwhile
EndFunction

Function SetUpAid()
    int i = 0
    
    while i < 9
        if (CS_AllHoldings.GetAt(i) as GlobalVariable).GetValue() == factionnum
            LeaderTryToRaiseAid(i)
        endif
        i += 1
    endwhile
EndFunction
/;
Function FindIssues()
    debug.trace("Faction " + factionnum + " entering findissues loop...")
    int i = 0
    while i < 9
        debug.trace("Faction " + factionnum + " entered findissues loop...")
        if (CS_AllHoldings.GetAt(i) as GlobalVariable).GetValue() == factionnum
            if CS_EconomyUpdaterNew.EconomyHoldUpdaters[i].TreasuryChange < 0
                if !LeaderTryToRaiseAid(i)
                    LeaderTryToLowerTribute(i)
                endif
            elseif CS_EconomyUpdaterNew.EconomyHoldUpdaters[i].TreasuryChange - CS_EconomyUpdaterNew.EconomyHoldUpdaters[i].CoinFactionAid > 2000
                if !LeaderTryToLowerAid(i)
                    LeaderTryToRaiseTribute(i)
                endif
            endif
        endif
       i += 1
   endwhile
   debug.trace("Faction " + factionnum + " exited findissues loop...")
EndFunction

bool Function LeaderTryToLowerTribute(int citynum) ; Determines the amount of tribute Jarl can provide
    CS_EconomyHoldUpdaterNewScript EconomyHold = CS_EconomyUpdaterNew.EconomyHoldUpdaters[citynum]
    int initialCoinFactionTribute = EconomyHold.CoinFactionTribute
    int HoldTreasuryChange = EconomyHold.TreasuryChange
    int FactionTreasuryChange = EconomyFaction.ChangeCoin
    int TributeDecreaseValue = 100
    
    int MaxFactionTreasuryChangeSteps = math.floor((FactionTreasuryChange as float + 0.10*EconomyFaction.CoinReserve - 1000)/TributeDecreaseValue)
    int idealHoldTreasuryChangeSteps = math.floor((math.abs(HoldTreasuryChange) as float + 2000)/TributeDecreaseValue)
    
    if MaxFactionTreasuryChangeSteps <= 0 || idealHoldTreasuryChangeSteps <= 0
        return false
    endif
    
    if MaxFactionTreasuryChangeSteps >= idealHoldTreasuryChangeSteps
        if TributeDecreaseValue*idealHoldTreasuryChangeSteps < initialCoinFactionTribute
            EconomyHold.CoinFactionTribute -= TributeDecreaseValue*idealHoldTreasuryChangeSteps
        else
            return false
        endif
    else
        if TributeDecreaseValue*MaxFactionTreasuryChangeSteps < initialCoinFactionTribute
            EconomyHold.CoinFactionTribute -= TributeDecreaseValue*MaxFactionTreasuryChangeSteps
        else
            return false
        endif
    endif
    
    if EconomyHold.CoinFactionTribute < initialCoinFactionTribute
        int influencechange = math.floor((initialCoinFactionTribute - EconomyHold.CoinFactionTribute) as float/100)
        InfluenceFaction.AdjustLeaderInfluence("Jarl", influencechange, citynum)
        return true
    else
        return false
    endif
EndFunction

bool Function LeaderTryToRaiseTribute(int citynum) ; Determines the amount of tribute Jarl can provide
    CS_EconomyHoldUpdaterNewScript EconomyHold = CS_EconomyUpdaterNew.EconomyHoldUpdaters[citynum]
    int initialCoinFactionTribute = EconomyHold.CoinFactionTribute
    int HoldTreasuryChange = EconomyHold.TreasuryChange
    int FactionTreasuryChange = EconomyFaction.ChangeCoin
    int TributeIncreaseValue = 100
    
    int MaxHoldTreasuryChangeSteps = math.floor((HoldTreasuryChange as float - 2000)/TributeIncreaseValue)
    int idealFactionTreasuryChangeSteps = math.floor((math.abs(FactionTreasuryChange) as float + 2000)/TributeIncreaseValue)
    
    if MaxHoldTreasuryChangeSteps <= 0; || idealFactionTreasuryChangeSteps <= 0
        return false
    endif
    
    ;/if MaxHoldTreasuryChangeSteps >= idealFactionTreasuryChangeSteps
        if TributeIncreaseValue*idealFactionTreasuryChangeSteps > initialCoinFactionTribute
            EconomyHold.CoinFactionTribute += TributeIncreaseValue*idealFactionTreasuryChangeSteps
        else
            return false
        endif
    else/;
        if TributeIncreaseValue*MaxHoldTreasuryChangeSteps > initialCoinFactionTribute
            EconomyHold.CoinFactionTribute += TributeIncreaseValue*MaxHoldTreasuryChangeSteps
        else
            return false
        endif
        ;endif
    
    if EconomyHold.CoinFactionTribute > initialCoinFactionTribute
        int influencechange = math.floor((initialCoinFactionTribute - EconomyHold.CoinFactionTribute) as float/100)
        InfluenceFaction.AdjustLeaderInfluence("Jarl", influencechange, citynum)
        return true
    else
        return false
    endif
EndFunction

bool Function LeaderTryToRaiseAid(int citynum) ; Determines the amount of Aid to the City that the Faction can provide
    CS_EconomyHoldUpdaterNewScript EconomyHold = CS_EconomyUpdaterNew.EconomyHoldUpdaters[citynum]
    int initialCoinFactionAid = EconomyHold.CoinFactionAid
    int HoldTreasuryChange = EconomyHold.TreasuryChange
    int FactionTreasuryChange = EconomyFaction.ChangeCoin
    int AidIncreaseValue = 100
    
    int MaxFactionTreasuryChangeSteps = math.floor((FactionTreasuryChange as float + 0.10*EconomyFaction.CoinReserve - 1000)/AidIncreaseValue)
    int idealHoldTreasuryChangeSteps = math.floor((math.abs(HoldTreasuryChange) as float + 2000)/AidIncreaseValue)
    
    if MaxFactionTreasuryChangeSteps <= 0 || idealHoldTreasuryChangeSteps <= 0
        return false
    endif
    
    if MaxFactionTreasuryChangeSteps >= idealHoldTreasuryChangeSteps
        if AidIncreaseValue*idealHoldTreasuryChangeSteps > initialCoinFactionAid
            EconomyHold.CoinFactionAid += AidIncreaseValue*idealHoldTreasuryChangeSteps
        else
            return false
        endif
    else
        if AidIncreaseValue*MaxFactionTreasuryChangeSteps > initialCoinFactionAid
            EconomyHold.CoinFactionAid += AidIncreaseValue*MaxFactionTreasuryChangeSteps
        else
            return false
        endif
    endif

    if EconomyHold.CoinFactionAid < 0
        EconomyHold.CoinFactionAid = 0
    endif
    
    debug.trace("Faction " + factionnum + " providing " + EconomyHold.CoinFactionAid + " coin to City " + citynum)

    if EconomyHold.CoinFactionAid > initialCoinFactionAid
        int influencechange = math.floor((EconomyHold.CoinFactionAid - initialCoinFactionAid) as float/100)
        InfluenceFaction.AdjustLeaderInfluence("Jarl", influencechange, citynum)
        return true
    else
        return false
    endif
EndFunction

bool Function LeaderTryToLowerAid(int citynum) ; Determines the amount of Aid to the nobility that the Jarl can provide
    CS_EconomyHoldUpdaterNewScript EconomyHold = CS_EconomyUpdaterNew.EconomyHoldUpdaters[citynum]
    int initialCoinFactionAid = EconomyHold.CoinFactionAid
    int HoldTreasuryChange = EconomyHold.TreasuryChange
    int FactionTreasuryChange = EconomyFaction.ChangeCoin
    int AidDecreaseValue = 100
    
    int MaxHoldTreasuryChangeSteps = math.floor((HoldTreasuryChange as float - 2000)/AidDecreaseValue)
    ;int idealFactionTreasuryChangeSteps = math.floor((math.abs(FactionTreasuryChange) as float + 2000)/AidDecreaseValue)
    
    if MaxHoldTreasuryChangeSteps <= 0; || idealFactionTreasuryChangeSteps <= 0
        return false
    endif
    
    ;/if MaxHoldTreasuryChangeSteps >= idealFactionTreasuryChangeSteps
        if AidDecreaseValue*idealFactionTreasuryChangeSteps < initialCoinFactionAid
            EconomyHold.CoinFactionAid -= AidDecreaseValue*idealFactionTreasuryChangeSteps
        else
            return false
        endif
    else/;
        if AidDecreaseValue*MaxHoldTreasuryChangeSteps < initialCoinFactionAid
            EconomyHold.CoinFactionAid -= AidDecreaseValue*MaxHoldTreasuryChangeSteps
        else
            return false
        endif
        ;endif

    if EconomyHold.CoinFactionAid < 0
        EconomyHold.CoinFactionAid = 0
    endif
    
    debug.trace("Faction " + factionnum + " providing " + EconomyHold.CoinFactionAid + " coin to City " + citynum)

    if EconomyHold.CoinFactionAid < initialCoinFactionAid
        int influencechange = math.floor((EconomyHold.CoinFactionAid - initialCoinFactionAid) as float/100)
        InfluenceFaction.AdjustLeaderInfluence("Jarl", influencechange, citynum)
        return true
    else
        return false
    endif
EndFunction

int Function GetTotalTreasuryChange()
    int treasurychange

    int i = 0
    while i < 9
        if (CS_AllHoldings.GetAt(i) as GlobalVariable).GetValue() == factionnum
            treasurychange += CS_EconomyUpdaterNew.EconomyHoldUpdaters[i].TreasuryChange
        endif
        i += 1
    endwhile
    
    return treasurychange
EndFunction

Event OnUpdate()
    if CS_EconomyUpdaterNew.UpdatePhase == 5
        EconomyFaction.Updated = false
        ;SetUp()
        InfluenceFaction.SetInitialInfluence()
        EconomyFaction.Updated = true
    elseif CS_EconomyUpdaterNew.UpdatePhase == 6
        debug.trace("Faction " + factionnum + " started economy update...")
        EconomyFaction.Updated = false
        debug.trace("Faction " + factionnum + " finding issues...")
        FindIssues()
        debug.trace("Faction " + factionnum + " done finding issues...")
        EconomyFaction.UpdateResources()
        EconomyFaction.Updated = true
        debug.trace("Faction " + factionnum + " should be done updating!")
    endif
EndEvent