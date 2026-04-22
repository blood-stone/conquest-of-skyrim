Scriptname CS_InfluenceHoldUpdaterScript extends Quest

Location Property City Auto

int Property InfluenceNobility Auto
int Property InfluenceCommoner Auto
int Property InfluenceJarl Auto
int Property InfluenceGuards Auto

int Property JarlInfluenceNobility Auto
int Property JarlInfluenceCommoner Auto
int Property JarlInfluenceGuards Auto

int Property NobilityInfluenceCommoner Auto
int Property NobilityInfluenceJarl Auto
int Property NobilityInfluenceGuards Auto

int Property InfluenceNobilityFromQuests Auto
int Property InfluenceCommonerFromQuests Auto
int Property InfluenceJarlFromQuests Auto
int Property InfluenceGuardsFromQuests Auto

Keyword Property CS_InfluenceNobility Auto
Keyword Property CS_InfluenceCommoners Auto
Keyword Property CS_InfluenceJarl Auto
Keyword Property CS_InfluenceGuards Auto
Keyword Property CS_EventsFeast Auto

int Property ShopsSponsoredByPlayer Auto

int Property PlayerJarl Auto
bool Property Adding Auto

Sound Property CS_NotificationFeastSound Auto

Faction Property CS_MarriedToPlayerFaction Auto

FormList Property CS_AllHoldings Auto

Message Property CS_NotificationFeastMessage Auto

CS_PublicOpinionScript Property CS_PublicOpinion Auto
CS_RecruitJarl Property CS_FactionGovernment Auto
CS_EconomyFactionUpdaterNewScript Property CS_EconomyUpdaterNewFactionPlayer Auto

Function SetInitialInfluence()
    JarlInfluenceNobility = 50
    JarlInfluenceCommoner = 50
    JarlInfluenceGuards = 50
    NobilityInfluenceCommoner = 50
    NobilityInfluenceJarl = 0
    NobilityInfluenceGuards = 0
EndFunction

Function UpdateInfluence()
    CS_EconomyHoldUpdaterNewScript EconomyHold = ((self as Quest) as CS_EconomyHoldUpdaterNewScript)
    CS_GroupsHoldUpdaterScript GroupsHold = ((self as Quest) as CS_GroupsHoldUpdaterScript)
    int MinInfluenceCommoner = 0; DELETE WHEN DONE!!!!!!!!!!
    int MinInfluenceNobility = 0 ; DELETE WHEN DONE!!!!!!!!!!
    int MinInfluenceJarl = 0
    int MinInfluenceGuard = 0
    int InitialInfluenceCommoner = InfluenceCommoner
    int InitialInfluenceNobility = InfluenceNobility
    int InitialInfluenceJarl = InfluenceJarl
    int InitialInfluenceGuard = InfluenceGuards
    int holdnum = EconomyHold.holdnum
    Actor Jarl = CS_FactionGovernment.JarlAliases[holdnum].GetActorRef()
    if Jarl == Game.GetPlayer()
        PlayerJarl = 1
    else
        PlayerJarl = 0
    endif
    
    if Jarl.IsInFaction(CS_MarriedToPlayerFaction)
        MinInfluenceCommoner += 10
        MinInfluenceGuard += 20
        MinInfluenceNobility += 40
        MinInfluenceJarl += 60
    endif
    
    if ShopsSponsoredByPlayer > 0
        if CS_EconomyUpdaterNewFactionPlayer.CoinReserve > ShopsSponsoredByPlayer*1000
            MinInfluenceNobility += ShopsSponsoredByPlayer*5
        else
            MinInfluenceNobility += math.floor(CS_EconomyUpdaterNewFactionPlayer.CoinReserve as float/(1000*ShopsSponsoredByPlayer))
        endif
    endif
    
    MinInfluenceJarl += math.floor((EconomyHold.PlayerInfluenceEconomy as float)/4)
    MinInfluenceNobility += math.floor((EconomyHold.PlayerInfluenceEconomy as float)/4)
    
    if PlayerJarl != 1
        if CS_FactionGovernment.ThaneQuests[holdnum].GetStageDone(200)
            MinInfluenceJarl += 40
            MinInfluenceNobility += 20
            MinInfluenceGuard += 30
            MinInfluenceCommoner += 10
        endif
    endif
    
    if Adding
        AddChanges()
    endif
    
    if holdnum == 3 ; DELETE WHEN DONE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        MinInfluenceNobility = 60
    endif
    
    if InfluenceJarl < MinInfluenceJarl
        InfluenceJarl = MinInfluenceJarl
    endif
    
    if InfluenceJarl > 100 || PlayerJarl == 1
        InfluenceJarl = 100
    endif
    
    if InfluenceNobility < MinInfluenceNobility
        InfluenceNobility = MinInfluenceNobility
    endif
    
    if InfluenceNobility > 100
        InfluenceNobility = 100
    endif
    
    if InfluenceCommoner < MinInfluenceCommoner
        InfluenceCommoner = MinInfluenceCommoner
    endif
    
    if InfluenceCommoner > 100
        InfluenceCommoner = 100
    endif
    
    if InfluenceGuards < MinInfluenceGuard
        InfluenceGuards = MinInfluenceGuard
    endif
    
    if InfluenceGuards > 100 || PlayerJarl == 1
        InfluenceGuards = 100
    endif
    
    if PlayerJarl
        JarlInfluenceCommoner = InfluenceCommoner
        JarlInfluenceNobility = InfluenceNobility
        JarlInfluenceGuards = InfluenceGuards
    endif
    
    if Adding
        ShowInfluenceMessage("Commoners", InitialInfluenceCommoner)
        ShowInfluenceMessage("Nobility", InitialInfluenceNobility)
        ShowInfluenceMessage("Guards", InitialInfluenceGuard)
        ShowInfluenceMessage("Jarl", InitialInfluenceJarl)
    endif
    
    debug.trace("Jarl's influence with nobility in city " + holdnum + " = " + JarlInfluenceNobility)
    debug.trace("Jarl's influence with commoners in city " + holdnum + " = " + JarlInfluenceCommoner)
    debug.trace("Jarl's influence with guards in city " + holdnum + " = " + JarlInfluenceGuards)

    City.SetKeywordData(CS_InfluenceNobility, InfluenceNobility)
    City.SetKeywordData(CS_InfluenceCommoners, InfluenceCommoner)
    City.SetKeywordData(CS_InfluenceGuards, InfluenceGuards)
    City.SetKeywordData(CS_InfluenceJarl, InfluenceJarl)
EndFunction

Function AdjustPlayerInfluence(string Group, int amount)
    if amount == 0
        return
    endif
    
    int initialinfluence
    if Group == "Commoners"
        initialinfluence = InfluenceCommoner
        InfluenceCommoner += amount
        
        if InfluenceCommoner < 0
            InfluenceCommoner = 0
        elseif InfluenceCommoner > 100
            InfluenceCommoner = 100
        endif
    elseif Group == "Nobility"
        initialinfluence = InfluenceNobility
        InfluenceNobility += amount
        
        if InfluenceNobility < 0
            InfluenceNobility = 0
        elseif InfluenceNobility > 100
            InfluenceNobility = 100
        endif
    elseif Group == "Guards"
        initialinfluence = InfluenceGuards
        InfluenceGuards += amount
        
        if InfluenceGuards < 0
            InfluenceGuards = 0
        elseif InfluenceGuards > 100
            InfluenceGuards = 100
        endif
    endif
    
    ShowInfluenceMessage(Group, initialinfluence)
EndFunction

Function AdjustJarlInfluence(string Group, int amount)
    if amount == 0
        return
    endif
    
    int initialinfluence
    if Group == "Commoners"
        initialinfluence = JarlInfluenceCommoner
        JarlInfluenceCommoner += amount
        
        if JarlInfluenceCommoner < 0
            JarlInfluenceCommoner = 0
        elseif JarlInfluenceCommoner > 100
            JarlInfluenceCommoner = 100
        endif
    elseif Group == "Nobility"
        initialinfluence = JarlInfluenceNobility
        JarlInfluenceNobility += amount
        
        if JarlInfluenceNobility < 0
            JarlInfluenceNobility = 0
        elseif JarlInfluenceNobility > 100
            JarlInfluenceNobility = 100
        endif
    elseif Group == "Guards"
        initialinfluence = JarlInfluenceGuards
        JarlInfluenceGuards += amount
        
        if JarlInfluenceGuards < 0
            JarlInfluenceGuards = 0
        elseif JarlInfluenceGuards > 100
            JarlInfluenceGuards = 100
        endif
    endif
EndFunction

Function AdjustNobilityInfluence(string Group, int amount)
    if amount == 0
        return
    endif
    
    int initialinfluence
    if Group == "Commoners"
        initialinfluence = NobilityInfluenceCommoner
        NobilityInfluenceCommoner += amount
        
        if NobilityInfluenceCommoner < 0
            NobilityInfluenceCommoner = 0
        elseif NobilityInfluenceCommoner > 100
            NobilityInfluenceCommoner = 100
        endif
    elseif Group == "Jarl"
        initialinfluence = NobilityInfluenceJarl
        NobilityInfluenceJarl += amount
        
        if NobilityInfluenceJarl < 0
            NobilityInfluenceJarl = 0
        elseif NobilityInfluenceJarl > 100
            NobilityInfluenceJarl = 100
        endif
    elseif Group == "Guards"
        initialinfluence = NobilityInfluenceGuards
        NobilityInfluenceGuards += amount
        
        if NobilityInfluenceGuards < 0
            NobilityInfluenceGuards = 0
        elseif NobilityInfluenceGuards > 100
            NobilityInfluenceGuards = 100
        endif
    endif
EndFunction

Function ShowInfluenceMessage(string group, int initialinfluence)
    int citynum = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).holdnum
    string citystring = "None"
    string changetext
    int newinfluence
    string newinfluencetext = "None"
    
    if citynum == 0
        citystring = "The Reach"
    elseif citynum == 1
        citystring = "The Rift"
    elseif citynum == 2
        citystring = "Haafingar"
    elseif citynum == 3
        citystring = "Whiterun"
    elseif citynum == 4
        citystring = "Eastmarch"
    elseif citynum == 5
        citystring = "The Pale"
    elseif citynum == 6
        citystring = "Falkreath"
    elseif citynum == 7
        citystring = "Hjaalmarch"
    elseif citynum == 8
        citystring = "Winterhold"
    endif
    
    if group == "Commoners"
        newinfluence = InfluenceCommoner
    elseif group == "Nobility"
        newinfluence = InfluenceNobility
    elseif group == "Guards"
        newinfluence = InfluenceGuards
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
    if initialinfluence >= 20 && newinfluence < 20
        newinfluencetext = "an Outsider"
    elseif initialinfluence >= 40 && newinfluence < 40 && newinfluence >= 20
        newinfluencetext = "an Acquantance"
    elseif initialinfluence >= 60 && newinfluence < 60 && newinfluence >= 40
        newinfluencetext = "a Respected Figure"
    elseif initialinfluence >= 80 && newinfluence < 80 && newinfluence >= 60
        newinfluencetext = "an Influential Power"
    elseif initialinfluence < 20 && newinfluence >= 20 && newinfluence < 40
        newinfluencetext = "an Acquantance"
    elseif initialinfluence < 40 && newinfluence >= 40 && newinfluence < 60
        newinfluencetext = "a Respected Figure"
    elseif initialinfluence < 60 && newinfluence >= 60 && newinfluence < 80
        newinfluencetext = "an Influential Power"
    elseif initialinfluence < 80 && newinfluence >= 80 && newinfluence < 100
        newinfluencetext = "the Champion"
    endif
    
    if newinfluencetext != "None" && city != "None"
        debug.notification("You are now seen as " + newinfluencetext + " of the " + group + " in " + citystring + "!")
    endif
EndFunction

Function AddChanges()
    CS_EconomyHoldUpdaterNewScript EconomyHold = ((self as Quest) as CS_EconomyHoldUpdaterNewScript)
    int holdnum = EconomyHold.holdnum
    
    if PlayerJarl
        
        if EconomyHold.City.GetKeywordData(EconomyHold.CS_CityManagementTaxRate) > 20
            InfluenceCommoner += math.floor(0.5*(20 - EconomyHold.City.GetKeywordData(EconomyHold.CS_CityManagementTaxRate)))
        endif
        
        if EconomyHold.City.GetKeywordData(EconomyHold.CS_CityManagementTaxRateNobility) > 20
            InfluenceNobility += math.floor(0.5*(20 - EconomyHold.City.GetKeywordData(EconomyHold.CS_CityManagementTaxRateNobility)))
        endif
        
    endif
EndFunction

Function InviteToFeast()
    CS_EconomyHoldUpdaterNewScript EconomyHold = ((self as Quest) as CS_EconomyHoldUpdaterNewScript)
    int citynum = EconomyHold.holdnum
    string citystring = "None"
    
    if citynum == 0
        citystring = "Markarth"
    elseif citynum == 1
        citystring = "Riften"
    elseif citynum == 2
        citystring = "Solitude"
    elseif citynum == 3
        citystring = "Whiterun"
    elseif citynum == 4
        citystring = "Windhelm"
    elseif citynum == 5
        citystring = "Dawnstar"
    elseif citynum == 6
        citystring = "Falkreath"
    elseif citynum == 7
        citystring = "Morthal"
    elseif citynum == 8
        citystring = "Winterhold"
    endif
    
    if City.GetKeywordData(CS_EventsFeast) != 1
    
        if citystring != "None"
            City.SetKeywordData(CS_EventsFeast, 1)
            Message.ResetHelpMessage("Feast" + citystring)
            ;CS_NotificationFeastSound.Play(Game.GetPlayer())
            CS_NotificationFeastMessage.ShowAsHelpMessage("Feast" + citystring, 5, 0, 1)
        endif
    
    else
        
        City.SetKeywordData(CS_EventsFeast, 0)
        debug.notification("The feast in " + citystring + " has ended") 
        
    endif
EndFunction
    ;/
Event OnUpdate()
    if ((self as Quest) as CS_EconomyHoldUpdaterNewScript).EconomyUpdater.UpdatePhase >= 6
        if ((self as Quest) as CS_EconomyHoldUpdaterNewScript).EconomyUpdater.UpdatePhase == 7
            Adding = true
        endif
        UpdateInfluence()
        Adding = false
    endif
EndEvent
/;