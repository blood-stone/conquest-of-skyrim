Scriptname CS_GroupsHoldUpdaterScript extends Quest  

int Property citynum Auto

int Property WealthCommoner Auto
int Property WealthNobility Auto
int Property WealthTreasury Auto

;Scales
int Property Privilege Auto ; 0-100, values < 50 favors nobility while values > 50 favors commoners
int Property Representation Auto ; 0-100, values < 50 favors nobility while values > 50 favors commoners
int Property Economy Auto ; 0-100, values < 50 favors nobility while values > 50 favors commoners
int Property Guards Auto ; 0-100, values < 50 favors others while values > 50 favors guards

;Guards
int Property PayGuard Auto

;Global Wants
int Property Food Auto

;Issues
int[] Property EconomyHasIssue Auto
int[] Property PrivilegeHasIssue Auto
int[] Property RepresentationHasIssue Auto
int[] Property GuardsHasIssue Auto

Keyword Property CS_EventsFeast Auto
Keyword Property CS_StoryFeast Auto
float Property FeastCoolDown Auto

CS_EconomyHoldUpdaterNewScript Property EconomyHold Auto
CS_LawHoldScript Property LawHold Auto
CS_InfluenceHoldUpdaterScript Property InfluenceHold Auto

Function SetInitialLaws()
    citynum = EconomyHold.holdnum
    LawHold = ((self as Quest) as CS_LawHoldScript)
    InfluenceHold = ((self as Quest) as CS_InfluenceHoldUpdaterScript)
    
    LawHold.SetUpJarlOpinions()
    LawHold.SetUpInitialLaws()
EndFunction

Function UpdateWealthValue(string Group)
    if Group == "Commoners"
        if EconomyHold.WealthCommoners < 0.25*(EconomyHold.CoinCirculation as float) || EconomyHold.WealthCommonersChange < -2000
            WealthCommoner = 0
        elseif EconomyHold.WealthCommoners < 0.50*(EconomyHold.CoinCirculation as float) || EconomyHold.WealthCommonersChange < -1000
            WealthCommoner = 50
        elseif EconomyHold.WealthCommoners < 0.75*(EconomyHold.CoinCirculation as float) || EconomyHold.WealthCommonersChange < 0
            WealthCommoner = 75
        else
            WealthCommoner = 100
        endif
    elseif Group == "Nobility"
        if EconomyHold.WealthNobility < 0.25*(EconomyHold.CoinCirculation as float) || EconomyHold.WealthNobilityChange < -2000
            WealthNobility = 0
        elseif EconomyHold.WealthNobility < 0.50*(EconomyHold.CoinCirculation as float) || EconomyHold.WealthNobilityChange < -1000
            WealthNobility = 50
        elseif EconomyHold.WealthNobility < 0.75*(EconomyHold.CoinCirculation as float) || EconomyHold.WealthNobilityChange < 0
            WealthNobility = 75
        else
            WealthNobility = 100
        endif
    elseif Group == "Jarl"
        if EconomyHold.CoinReserve < 0.10*(EconomyHold.CoinCirculation as float)
            WealthTreasury = 0
        elseif EconomyHold.CoinReserve < 0.25*(EconomyHold.CoinCirculation as float)
            WealthTreasury = 50
        elseif EconomyHold.CoinReserve < 0.50*(EconomyHold.CoinCirculation as float)
            WealthTreasury = 75
        else
            WealthTreasury = 100
        endif
        
        if EconomyHold.TreasuryChange >= 0
            WealthTreasury += 20
        else
            WealthTreasury -= 20
        endif
    endif
EndFunction

Function UpdatePayGuard()
    PayGuard = 50 + (math.floor(EconomyHold.WagesGuard as float/10) - 80)
    if PayGuard > 100
        PayGuard = 100
    elseif PayGuard < 0
        PayGuard = 0
    endif
EndFunction

Function UpdateFood()
    Food = 100
    if EconomyHold.FoodDeficit > 0
        Food -= EconomyHold.FoodDeficit
    endif
EndFunction

Function UpdateWantValues()
    ;WealthCommoner
    UpdateWealthValue("Commoners")
    
    ;WealthNobility
    UpdateWealthValue("Nobility")
    
    ;Treasury
    UpdateWealthValue("Treasury")
EndFunction

Function FindWealthIssues(string Group)
    if Group == "Commoners"
        if WealthCommoner < 20; || Economy < 20
            ;Take major action
            EconomyHasIssue[1] = 3
        elseif WealthCommoner < 50; || Economy < 50
            ;Take moderate action
            EconomyHasIssue[1] = 2
        elseif WealthCommoner < 80; || Economy < 80
            ;Take minor action
            EconomyHasIssue[1] = 1
        else
            EconomyHasIssue[1] = 0
        endif
    elseif Group == "Nobility"
        if WealthNobility < 20; || Economy > 80
            ;Take major action
            EconomyHasIssue[0] = 3
        elseif WealthNobility < 50; || Economy > 50
            ;Take moderate action
            EconomyHasIssue[0] = 2
        elseif WealthNobility < 80; || Economy > 20
            ;Take minor action
            EconomyHasIssue[0] = 1
        else
            EconomyHasIssue[0] = 0
        endif
    elseif Group == "Jarl"
        if WealthTreasury < 20; || Economy > 80
            ;Take major action
            EconomyHasIssue[2] = 3
        elseif WealthTreasury < 50; || Economy > 50
            ;Take moderate action
            EconomyHasIssue[2] = 2
        elseif WealthTreasury < 80; || Economy > 20
            ;Take minor action
            EconomyHasIssue[2] = 1
        else
            EconomyHasIssue[2] = 0
        endif
    endif
EndFunction

Function FindIssues()
    if citynum == 3
        debug.trace("City 3 Finding Issues...")
    endif
    ;debug.trace("Finding issues...")
    ; Checks if any of the groups have issues, Ex. if EconomyHasIssue[1] = 1, commoners have a minor issue with economy, EconomyHasIssue[0] = 3, nobles have a major issue with economy

    EconomyHold.UpdateAllChangeValues()
    FindWealthIssues("Commoners")
    FindWealthIssues("Nobility")
    FindWealthIssues("Jarl")
    
    NobilityActions()
    NobilityManageInfluence()
    
    JarlActions()
    JarlManageInfluence()
    ;/
    EconomyHold.UpdateQuotas("Food")
    EconomyHold.UpdateQuotas("Wood")
    EconomyHold.UpdateQuotas("Metal")
    
    EconomyHold.UpdateResourceProductionCounts("Food")
    EconomyHold.UpdateResourceProductionCounts("Wood")
    EconomyHold.UpdateResourceProductionCounts("Metal")
    
    EconomyHold.UpdateResourceChange("Food")
    EconomyHold.UpdateResourceChange("Wood")
    EconomyHold.UpdateResourceChange("Metal")
    /;
    EconomyHold.UpdateTreasuryChange()
    EconomyHold.UpdateWealthChange()
    
    if citynum == 3
        debug.trace("City 3 Issue Finding Complete!")
    endif
EndFunction

Function NobilityActions()
    if EconomyHasIssue[0] > 0
        if NobilityDeficitActions()
            EconomyHasIssue[0] = 0
        else
            debug.trace("Nobility in City " + citynum + " had no raising actions... petitioning Jarl")
        endif
    endif
    
    if EconomyHasIssue[1] > 0
        if NobilitySurplusActions()
            EconomyHasIssue[1] = 0
        else
            debug.trace("Nobility in City " + citynum + " had no lowering actions... petitioning Jarl")
        endif
    endif
EndFunction

Function JarlActions()
    if EconomyHasIssue[2] > 0
        PetitionJarl("Economy", EconomyHasIssue[2], "Jarl")
    endif
    
    if EconomyHasIssue[0] == EconomyHasIssue[1] && EconomyHasIssue[0] >= 2
        int grouppriority = 0
        
        if LawHold.OpinionsJarl[3] == 1
            grouppriority += 1
            if InfluenceHold.JarlInfluenceCommoner < 60
                grouppriority += 5
            endif
            
            if InfluenceHold.JarlInfluenceNobility < 30
                grouppriority -= 5
            endif
        elseif LawHold.OpinionsJarl[3] == -1
            grouppriority -= 1
            if InfluenceHold.JarlInfluenceCommoner < 30
                grouppriority += 5
            endif
            
            if InfluenceHold.JarlInfluenceNobility < 60
                grouppriority -= 5
            endif
        else
            if InfluenceHold.JarlInfluenceCommoner < 30
                grouppriority += 5
            endif
            
            if InfluenceHold.JarlInfluenceNobility < 30
                grouppriority -= 5
            endif
        endif
        
        if grouppriority > 0
            PetitionJarl("Economy", EconomyHasIssue[1], "Greater")
        elseif grouppriority < 0
            PetitionJarl("Economy", EconomyHasIssue[0], "Lesser")
        else
            int randomnum = utility.randomint(0,1)
            if randomnum == 0
                PetitionJarl("Economy", EconomyHasIssue[0], "Lesser")
            else
                PetitionJarl("Economy", EconomyHasIssue[1], "Greater")
            endif
        endif
    elseif EconomyHasIssue[0] > EconomyHasIssue[1] && EconomyHasIssue[0] >= 2
        PetitionJarl("Economy", EconomyHasIssue[0], "Lesser")
    elseif EconomyHasIssue[1] > EconomyHasIssue[0] && EconomyHasIssue[1] >= 2
        PetitionJarl("Economy", EconomyHasIssue[1], "Greater")
    endif
EndFunction

Function JarlManageInfluence()
    if InfluenceHold.JarlInfluenceCommoner < 30
        if LawHold.JarlChangeLaw("Commoners")
            debug.trace("Jarl of City " + citynum + " changed law to benefit Commoners")
        endif
    endif
    
    if InfluenceHold.JarlInfluenceNobility < 30
        if JarlTryToStartFeast()
            debug.trace("Jarl of City " + citynum + " succesfully started feast")
        elseif LawHold.JarlChangeLaw("Nobility")
            debug.trace("Jarl of City " + citynum + " changed law to benefit Nobility")
        endif
    endif
EndFunction

Function NobilityManageInfluence()
    if InfluenceHold.NobilityInfluenceCommoner < 30
        NobilityDonateToCommoners()
    endif
    
    if InfluenceHold.NobilityInfluenceJarl < 30
        if EconomyHold.WealthNobilityChange > 1000
            NobilityTryToRaiseTribute()
        endif
    endif
EndFunction

bool Function NobilityDeficitActions()

    if EconomyHold.WealthNobilityChange < 0
        ; Lower Tributes to Jarl
        if NobilityTryToLowerTribute()
            return true
        endif
        
        ;Try to raise rent
        if NobilityTryToRaiseRent()
            return true
        endif
        
        ;Try to lower wages
        if NobilityTryToLowerWage()
            return true
        endif
    endif
    
    return false
EndFunction

bool Function NobilitySurplusActions()

    if EconomyHold.WealthNobilityChange > 1000
        ;Try to lower rent
        if NobilityTryToLowerRent()
            return true
        endif
        
        ;Try to raise wages
        if NobilityTryToRaiseWage()
            return true
        endif
    endif
    
    return false
EndFunction

Function PetitionJarl(string Issue, int extremity, string petitioningside)
    ;debug.trace(petitioningside + " has issues with " + Issue + ". lawscale = " + lawscale)
    if Issue == "Economy"
        if petitioningside == "Lesser"
            if JarlCanLowerTaxes("Nobility", extremity) && JarlTryToLowerTaxes("Nobility", extremity)
                return
            endif
            
            if EconomyHold.WealthNobilityChange < 0 && JarlTryToRaiseSubsidies()
                return
            endif
            
            if JarlTryToUpgradeBuilding()
                return
            endif
        elseif petitioningside == "Greater"
            if JarlCanLowerTaxes("Commoners", extremity) && JarlTryToLowerTaxes("Commoners", extremity)
                return
            endif
            
            if EconomyHold.WealthCommonersChange < 0 && JarlTryToRaiseGuardWages()
                return
            endif
            
            if EconomyHold.WealthCommonersChange < 0 && JarlTryToRaiseStipends()
                return
            endif
            
            if JarlTryToUpgradeBuilding()
                return
            endif
        elseif petitioningside == "Jarl"
            if LawHold.OpinionsJarl[3] == 1
                if JarlTryToLowerSubsidies()
                    EconomyHasIssue[2] = 0
                    return
                endif
                
               if JarlCanRaiseTaxes("Nobility") && JarlTryToRaiseTaxes("Nobility")
                   EconomyHasIssue[2] = 0
                   return
               endif
               
           elseif LawHold.OpinionsJarl[3] == -1
               if JarlTryToLowerStipends()
                    EconomyHasIssue[2] = 0
                    return
                endif
                
               if JarlCanRaiseTaxes("Commoners") && JarlTryToRaiseTaxes("Commoners")
                   EconomyHasIssue[2] = 0
                   return
               endif
               
           else
               int randomnum = utility.randomint(0,1)
               if randomnum == 0
                   if JarlTryToLowerStipends()
                        EconomyHasIssue[2] = 0
                        return
                   endif
                    
                   if JarlCanRaiseTaxes("Commoners") && JarlTryToRaiseTaxes("Commoners")
                        EconomyHasIssue[2] = 0
                       return
                   endif
                   
                    if JarlTryToLowerSubsidies()
                        EconomyHasIssue[2] = 0
                        return
                    endif
                   
                   if JarlCanRaiseTaxes("Nobility") && JarlTryToRaiseTaxes("Nobility")
                       EconomyHasIssue[2] = 0
                       return
                   endif
               else
                    if JarlTryToLowerSubsidies()
                        EconomyHasIssue[2] = 0
                        return
                    endif
                    
                   if JarlCanRaiseTaxes("Nobility") && JarlTryToRaiseTaxes("Nobility")
                       EconomyHasIssue[2] = 0
                       return
                   endif
                   
                   if JarlTryToLowerStipends()
                        EconomyHasIssue[2] = 0
                        return
                   endif
                   
                   if JarlCanRaiseTaxes("Commoners") && JarlTryToRaiseTaxes("Commoners")
                       EconomyHasIssue[2] = 0
                       return
                   endif
               endif
           endif
           
           if JarlTryToLowerGuardWages()
               EconomyHasIssue[2] = 0
               return
           endif

        endif
    endif
EndFunction

bool Function JarlTryToStartFeast()
    Location City = EconomyHold.CS_AllLocations.GetAt(citynum) as Location
    Location Palace = EconomyHold.CS_AllAttackPalaces.GetAt(citynum) as Location
    GlobalVariable GameDaysPassed = EconomyHold.GameDaysPassed
    if GameDaysPassed.GetValue() < FeastCoolDown
        debug.trace("Jarl in city " + citynum + " can not start feast due to cooldown")
        return false
    else
        if InfluenceHold.InfluenceJarl >= 40 || InfluenceHold.InfluenceNobility >= 40
            debug.trace("Jarl in city " + citynum + " attempting to start feast...")
            if CS_StoryFeast.SendStoryEventAndWait(Palace)
                debug.trace("Jarl in city " + citynum + " started feast")
            else
                debug.trace("Jarl in city " + citynum + " failed to start feast due to a feast already started, will try again next time...")
                return false
            endif
        else
            InfluenceHold.AdjustJarlInfluence("Nobility", 20)
            FeastCoolDown = GameDaysPassed.GetValue() + 7
            debug.trace("Jarl in city " + citynum + " had feast")
        endif
        return true
    endif
EndFunction

bool Function JarlCanLowerTaxes(string Group, int extremity)
    int lowertaxnum = 0
    if Group == "Commoners"
        if InfluenceHold.JarlInfluenceCommoner > 60
            lowertaxnum -= 1
        elseif InfluenceHold.JarlInfluenceCommoner < 30
            lowertaxnum += 1
        endif
        
        if WealthCommoner < 50
            lowertaxnum += 1
        else
            lowertaxnum -= 1
        endif
    elseif Group == "Nobility"
        if InfluenceHold.JarlInfluenceNobility > 60 || InfluenceHold.NobilityInfluenceJarl < 30
            lowertaxnum -= 1
        elseif InfluenceHold.JarlInfluenceNobility < 30 || InfluenceHold.NobilityInfluenceJarl > 60
            lowertaxnum += 1
        endif
        
        if WealthNobility < 50
            lowertaxnum += 1
        else
            lowertaxnum -= 1
        endif
    endif
        
    lowertaxnum += extremity
    
    int lowertaxchance = utility.randomint(0, 100)
    if lowertaxchance <= lowertaxnum*20
        return true
    else
        return false
    endif
EndFunction

bool Function JarlCanRaiseTaxes(string Group)
    int raisetaxnum = 0
    if Group == "Commoners"
        Keyword TaxRate = EconomyHold.CS_CityManagementTaxRate
        int initialTaxRate = EconomyHold.City.GetKeywordData(TaxRate) as int
        
        if InfluenceHold.JarlInfluenceCommoner > 60
            raisetaxnum += 5
        elseif InfluenceHold.JarlInfluenceCommoner < 30
            raisetaxnum -= 5
        endif
        
        if WealthCommoner >= 50
            raisetaxnum += 5
        else
            raisetaxnum -= 5
        endif
        
        raisetaxnum -= initialTaxRate
    elseif Group == "Nobility"
        Keyword TaxRate = EconomyHold.CS_CityManagementTaxRateNobility
        int initialTaxRate = EconomyHold.City.GetKeywordData(TaxRate) as int
        
        if InfluenceHold.JarlInfluenceNobility > 60 || InfluenceHold.NobilityInfluenceJarl < 30
            raisetaxnum += 5
        elseif InfluenceHold.JarlInfluenceNobility < 30 || InfluenceHold.NobilityInfluenceJarl > 60
            raisetaxnum -= 5
        endif
        
        if WealthNobility >= 50
            raisetaxnum += 5
        else
            raisetaxnum -= 5
        endif
        
        raisetaxnum -= initialTaxRate
    endif
    
    int raisetaxchance = utility.randomint(0, 99)
    if raisetaxchance < raisetaxnum*10
        return true
    else
        return false
    endif
EndFunction

bool Function JarlTryToLowerTaxes(string Group, int extremity)
    Keyword TaxRate
    int initialTaxRate
    int NewTaxRate
    int InfluenceDifference
    
    if Group == "Commoners"
        TaxRate = EconomyHold.CS_CityManagementTaxRate
        initialTaxRate = EconomyHold.City.GetKeywordData(TaxRate) as int
    elseif Group == "Nobility"
        TaxRate = EconomyHold.CS_CityManagementTaxRateNobility
        initialTaxRate = EconomyHold.City.GetKeywordData(TaxRate) as int
    endif
        
    NewTaxRate = initialTaxRate - extremity
    
    if NewTaxRate < 0
        NewTaxRate = 0
    endif
    
    InfluenceDifference = 10*(initialTaxRate - NewTaxRate)
    
    if NewTaxRate < initialTaxRate
        EconomyHold.City.SetKeywordData(TaxRate, NewTaxRate)
        InfluenceHold.AdjustJarlInfluence(Group, InfluenceDifference)
        debug.trace("Jarl of City " + citynum + " has lowered taxes on " + Group + " to " + NewTaxRate + "0% from " + initialTaxRate + "0%")
        EconomyHold.UpdateTaxes(Group)
        return true
    else
        return false
    endif
EndFunction

bool Function JarlTryToRaiseTaxes(string Group)
    Keyword TaxRate
    int initialTaxRate
    int NewTaxRate
    int InfluenceDifference
    
    if Group == "Commoners"
        TaxRate = EconomyHold.CS_CityManagementTaxRate
        initialTaxRate = EconomyHold.City.GetKeywordData(TaxRate) as int
    elseif Group == "Nobility"
        TaxRate = EconomyHold.CS_CityManagementTaxRateNobility
        initialTaxRate = EconomyHold.City.GetKeywordData(TaxRate) as int
    endif
        
    NewTaxRate = initialTaxRate + 1
    
    if NewTaxRate > 10
        NewTaxRate = 10
    endif
    
    InfluenceDifference = 10*(initialTaxRate - NewTaxRate)
    
    if NewTaxRate > initialTaxRate
        EconomyHold.City.SetKeywordData(TaxRate, NewTaxRate)
        InfluenceHold.AdjustJarlInfluence(Group, InfluenceDifference)
        debug.trace("Jarl of City " + citynum + " has raised taxes on " + Group + " to " + NewTaxRate + "0% from " + initialTaxRate + "0%")
        EconomyHold.UpdateTaxes(Group)
        return true
    else
        return false
    endif
EndFunction

bool Function JarlTryToRaiseSubsidies() ; Determines the amount of subsidies to the nobility that the Jarl can provide
    int initialCoinSubsidies = EconomyHold.CoinSubsidies
    int TreasuryChange = EconomyHold.TreasuryChange
    int NobilityWealthChange = EconomyHold.WealthNobilityChange
    int StipendIncreaseValue = 100
    
    int MaxTreasuryChangeSteps = math.floor((TreasuryChange as float + 0.10*EconomyHold.CoinReserve as float)/StipendIncreaseValue)
    int idealNobilityWealthChangeSteps = math.floor((math.abs(NobilityWealthChange) as float + 1000)/StipendIncreaseValue)
    
    if MaxTreasuryChangeSteps <= 0 || idealNobilityWealthChangeSteps <= 0
        return false
    endif
    
    if MaxTreasuryChangeSteps >= idealNobilityWealthChangeSteps
        if 100*idealNobilityWealthChangeSteps > initialCoinSubsidies
            EconomyHold.CoinSubsidies += 100*idealNobilityWealthChangeSteps
        else
            return false
        endif
    else
        if 100*MaxTreasuryChangeSteps > initialCoinSubsidies
            EconomyHold.CoinSubsidies += 100*MaxTreasuryChangeSteps
        else
            return false
        endif
    endif

    if EconomyHold.CoinSubsidies < 0
        EconomyHold.CoinSubsidies = 0
    endif
    
    int InfluenceDifference = math.floor((EconomyHold.CoinSubsidies - initialCoinSubsidies) as float/100)

    if EconomyHold.CoinSubsidies > initialCoinSubsidies
        InfluenceHold.AdjustJarlInfluence("Nobility", InfluenceDifference)
        debug.trace("Jarl of City " + citynum + " has raised subsidies on Nobility to " + EconomyHold.CoinSubsidies + " from " + initialCoinSubsidies)
        return true
    else
        debug.trace("Jarl of City " + citynum + " failed to raise subsidies on Nobility (" + EconomyHold.CoinSubsidies + " <= " + initialCoinSubsidies + ")")
        return false
    endif
EndFunction

bool Function JarlTryToLowerSubsidies() ; Determines the amount of subsidies to the nobility that the Jarl can provide
    int initialCoinSubsidies = EconomyHold.CoinSubsidies
    int TreasuryChange = EconomyHold.TreasuryChange
    int NobilityWealthChange = EconomyHold.WealthNobilityChange
    int StipendDecreaseValue = 100
    
    int MaxNobilityWealthChangeSteps = math.floor((NobilityWealthChange as float - 500)/StipendDecreaseValue)
    int idealTreasuryChangeSteps = math.floor((math.abs(TreasuryChange) as float + 1000)/StipendDecreaseValue)

    if MaxNobilityWealthChangeSteps <= 0 || idealTreasuryChangeSteps <= 0
        return false
    endif
    
    if MaxNobilityWealthChangeSteps >= idealTreasuryChangeSteps
        if 100*idealTreasuryChangeSteps < initialCoinSubsidies
            EconomyHold.CoinSubsidies -= 100*idealTreasuryChangeSteps
        else
            return false
        endif
    else
        if 100*MaxNobilityWealthChangeSteps < initialCoinSubsidies
            EconomyHold.CoinSubsidies -= 100*MaxNobilityWealthChangeSteps
        else
            return false
        endif
    endif

    if EconomyHold.CoinSubsidies < 0
        EconomyHold.CoinSubsidies = 0
    endif
    
    int InfluenceDifference = math.floor((EconomyHold.CoinSubsidies - initialCoinSubsidies) as float/100)

    if EconomyHold.CoinSubsidies < initialCoinSubsidies
        InfluenceHold.AdjustJarlInfluence("Nobility", InfluenceDifference)
        debug.trace("Jarl of City " + citynum + " has lowered subsidies on Nobility to " + EconomyHold.CoinSubsidies + " from " + initialCoinSubsidies)
        return true
    else
        return false
    endif
EndFunction

bool Function JarlTryToRaiseStipends() ; Determines the amount of Stipends to the Commoners that the Jarl can provide
    int initialCoinStipends = EconomyHold.CoinStipends
    int TreasuryChange = EconomyHold.TreasuryChange
    int CommonerWealthChange = EconomyHold.WealthCommonersChange
    int StipendIncreaseValue = 100
    
    int MaxTreasuryChangeSteps = math.floor((TreasuryChange as float + 0.10*EconomyHold.CoinReserve)/StipendIncreaseValue)
    int idealCommonerWealthChangeSteps = math.floor((math.abs(CommonerWealthChange) as float + 1000)/StipendIncreaseValue)
    
    if MaxTreasuryChangeSteps <= 0 || idealCommonerWealthChangeSteps <= 0
        return false
    endif
    
    if MaxTreasuryChangeSteps >= idealCommonerWealthChangeSteps
        if 100*idealCommonerWealthChangeSteps > initialCoinStipends
            EconomyHold.CoinStipends += 100*idealCommonerWealthChangeSteps
        else
            return false
        endif
    else
        if 100*MaxTreasuryChangeSteps > initialCoinStipends
            EconomyHold.CoinStipends += 100*MaxTreasuryChangeSteps
        else
            return false
        endif
    endif

    if EconomyHold.CoinStipends < 0
        EconomyHold.CoinStipends = 0
    endif
    
    int InfluenceDifference = math.floor((EconomyHold.CoinStipends - initialCoinStipends) as float/100)

    if EconomyHold.CoinStipends > initialCoinStipends
        InfluenceHold.AdjustJarlInfluence("Commoners", InfluenceDifference)
        debug.trace("Jarl of City " + citynum + " has raised stipends on Commoners to " + EconomyHold.CoinStipends + " from " + initialCoinStipends)
        return true
    else
        return false
    endif
EndFunction

bool Function JarlTryToLowerStipends() ; Determines the amount of Stipends to the Commoners that the Jarl can provide
    int initialCoinStipends = EconomyHold.CoinStipends
    int TreasuryChange = EconomyHold.TreasuryChange
    int CommonerWealthChange = EconomyHold.WealthCommonersChange
    int StipendDecreaseValue = 100
    
    int MaxCommonerWealthChangeSteps = math.floor((CommonerWealthChange as float - 500)/StipendDecreaseValue)
    int idealTreasuryChangeSteps = math.floor((math.abs(TreasuryChange) as float + 1000)/StipendDecreaseValue)

    if MaxCommonerWealthChangeSteps <= 0 || idealTreasuryChangeSteps <= 0
        return false
    endif
    
    if MaxCommonerWealthChangeSteps >= idealTreasuryChangeSteps
        if 100*idealTreasuryChangeSteps < initialCoinStipends
            EconomyHold.CoinStipends -= 100*idealTreasuryChangeSteps
        else
            return false
        endif
    else
        if 100*MaxCommonerWealthChangeSteps < initialCoinStipends
            EconomyHold.CoinStipends -= 100*MaxCommonerWealthChangeSteps
        else
            return false
        endif
    endif

    if EconomyHold.CoinStipends < 0
        EconomyHold.CoinStipends = 0
    endif
    
    int InfluenceDifference = math.floor((EconomyHold.CoinStipends - initialCoinStipends) as float/100)

    if EconomyHold.CoinStipends < initialCoinStipends
        InfluenceHold.AdjustJarlInfluence("Commoners", InfluenceDifference)
        debug.trace("Jarl of City " + citynum + " has lowered stipends on Commoners to " + EconomyHold.CoinStipends + " from " + initialCoinStipends)
        return true
    else
        return false
    endif
EndFunction

bool Function JarlTryToRaiseGuardWages() ; Jarl tries to raise guard wages, adding more wealth to Commoners
    int LawMinWage = EconomyHold.City.GetKeywordData(LawHold.CS_LawsEconomy.GetAt(0) as Keyword) as int
    int CurrentWage = EconomyHold.WagesGuard
    int MinWage = LawMinWage*50
    int TreasuryChange = EconomyHold.TreasuryChange
    int CommonerWealthChange = EconomyHold.WealthCommonersChange
    int WageIncreaseValue = 50*EconomyHold.Guards
    
    int MaxTreasuryChangeSteps = math.floor((TreasuryChange as float + 0.10*EconomyHold.CoinReserve)/WageIncreaseValue)
    int idealCommonerWealthChangeSteps = math.floor((math.abs(CommonerWealthChange) as float + 1000)/WageIncreaseValue)
    
    if MaxTreasuryChangeSteps <= 0 || idealCommonerWealthChangeSteps <= 0
        return false
    endif
    
    if MaxTreasuryChangeSteps >= idealCommonerWealthChangeSteps
        if 50*idealCommonerWealthChangeSteps > CurrentWage
            EconomyHold.WagesGuard += 50*idealCommonerWealthChangeSteps
        else
            return false
        endif
    else
        if 50*MaxTreasuryChangeSteps > CurrentWage
            EconomyHold.WagesGuard += 50*MaxTreasuryChangeSteps
        else
            return false
        endif
    endif
    
    if EconomyHold.WagesGuard < MinWage
        EconomyHold.WagesGuard = MinWage
    elseif EconomyHold.WagesGuard > 500
        EconomyHold.WagesGuard = 500
    endif
    
    if EconomyHold.WagesGuard > CurrentWage
        debug.trace("Jarl of City " + citynum + " raised guard wages to " + EconomyHold.WagesGuard + " from " + CurrentWage)
        EconomyHold.UpdateWages()
        return true
    else
        return false
    endif
EndFunction

bool Function JarlTryToLowerGuardWages() ; Jarl tries to lower guard wages, adding more wealth to Treasury
    int LawMinWage = EconomyHold.City.GetKeywordData(LawHold.CS_LawsEconomy.GetAt(0) as Keyword) as int
    int CurrentWage = EconomyHold.WagesGuard
    int MinWage = LawMinWage*50
    int TreasuryChange = EconomyHold.TreasuryChange
    int CommonerWealthChange = EconomyHold.WealthCommonersChange
    int WageIncreaseValue = 50*EconomyHold.Guards
    
    int MaxCommonerWealthChangeSteps = math.floor((CommonerWealthChange as float - 500)/WageIncreaseValue)
    int idealTreasuryChangeSteps = math.floor((math.abs(TreasuryChange) as float + 1000)/WageIncreaseValue)

    if MaxCommonerWealthChangeSteps <= 0 || idealTreasuryChangeSteps <= 0
        return false
    endif
    
    if MaxCommonerWealthChangeSteps >= idealTreasuryChangeSteps
        if 50*idealTreasuryChangeSteps < CurrentWage
            EconomyHold.WagesGuard -= 50*idealTreasuryChangeSteps
        else
            return false
        endif
    else
        if 50*MaxCommonerWealthChangeSteps < CurrentWage
            EconomyHold.WagesGuard -= 50*MaxCommonerWealthChangeSteps
        else
            return false
        endif
    endif
    
    if EconomyHold.WagesGuard < MinWage
        EconomyHold.WagesGuard = MinWage
    elseif EconomyHold.WagesGuard > 500
        EconomyHold.WagesGuard = 500
    endif
    
    if EconomyHold.WagesGuard < CurrentWage
        debug.trace("Jarl of City " + citynum + " lowered guard wages to " + EconomyHold.WagesGuard + " from " + CurrentWage)
        EconomyHold.UpdateWages()
        return true
    else
        return false
    endif
EndFunction

bool Function JarlTryToUpgradeBuilding() ; Jarl tries to upgrade a building using the Treasury, adding more wealth to Commoners
    debug.trace("Jarl " + citynum + " Trying to Upgrade Building")
    debug.trace("Jarl " + citynum + " Could not upgrade building")
    return false
EndFunction

bool Function NobilityTryToLowerTribute() ; Determines the amount of tribute nobility can provide
    int initialCoinTribute = EconomyHold.CoinTribute
    float BaseTribute = EconomyHold.WealthNobility * 0.1
    float InfluenceFactor = InfluenceHold.JarlInfluenceNobility as float/100
    float WealthChangeFactor
    if EconomyHold.WealthNobility <= 0
        WealthChangeFactor = 0
    else
        WealthChangeFactor = 1 + (EconomyHold.WealthNobilityChange as float/EconomyHold.WealthNobility as float)
    endif
    
    int MaxCoinTribute = math.floor(BaseTribute*InfluenceFactor*WealthChangeFactor)
    if MaxCoinTribute < 0
        MaxCoinTribute = 0
    endif
    
    EconomyHold.CoinTribute = math.floor(MaxCoinTribute)
    
    int InfluenceDifference = math.floor((EconomyHold.CoinTribute - initialCoinTribute) as float/100)
    
    if EconomyHold.CoinTribute < initialCoinTribute
        debug.trace("Nobility in City " + citynum + " lowered Jarl tributes to " + EconomyHold.CoinTribute + " from " + initialCoinTribute)
        InfluenceHold.AdjustNobilityInfluence("Jarl", InfluenceDifference)
        return true
    else
        return false
    endif
EndFunction

bool Function NobilityDonateToCommoners()
    int DonationAmount = math.floor(0.05*EconomyHold.WealthNobility)
    
    if DonationAmount > 0
        EconomyHold.WealthCommoners += DonationAmount
        EconomyHold.WealthNobility -= DonationAmount
        int InfluenceDifference = math.floor(DonationAmount as float/100)
        InfluenceHold.AdjustNobilityInfluence("Commoners", InfluenceDifference)
        debug.trace("Nobility of City " + citynum + " has donated " + DonationAmount + " gold to Commoners!")
        return true
    else
        return false
    endif
EndFunction

bool Function NobilityTryToRaiseRent()
    int LawMaxRent = EconomyHold.City.GetKeywordData(LawHold.CS_LawsEconomy.GetAt(1) as Keyword) as int
    int CurrentRent = EconomyHold.RentCommoner
    int MaxRent = 500 - LawMaxRent*50
    int NobilityWealthChange = EconomyHold.WealthNobilityChange
    int CommonerWealthChange = EconomyHold.WealthCommonersChange
    int RentIncreaseValue = 50*(EconomyHold.PopulationCommoner - EconomyHold.Guards)
    
    int MaxCommonerWealthChangeSteps = math.floor((CommonerWealthChange as float - 500)/RentIncreaseValue)
    int idealNobilityWealthChangeSteps = math.floor((math.abs(NobilityWealthChange) as float + 1000)/RentIncreaseValue)

    if MaxCommonerWealthChangeSteps <= 0 || idealNobilityWealthChangeSteps <= 0
        return false
    endif
    
    if MaxCommonerWealthChangeSteps >= idealNobilityWealthChangeSteps
        if 50*idealNobilityWealthChangeSteps < CurrentRent
            EconomyHold.RentCommoner += 50*idealNobilityWealthChangeSteps
        else
            return false
        endif
    else
        if 50*MaxCommonerWealthChangeSteps < CurrentRent
            EconomyHold.RentCommoner += 50*MaxCommonerWealthChangeSteps
        else
            return false
        endif
    endif
    
    if EconomyHold.RentCommoner < 0
        EconomyHold.RentCommoner = 0
    elseif EconomyHold.RentCommoner > MaxRent
        EconomyHold.RentCommoner = MaxRent
    endif
    
    int InfluenceDifference = math.floor((CurrentRent - EconomyHold.RentCommoner) as float/10)
    
    if EconomyHold.RentCommoner > CurrentRent
        debug.trace("Nobility in City " + citynum + " raised rent to " + EconomyHold.RentCommoner + " from " + CurrentRent)
        InfluenceHold.AdjustNobilityInfluence("Commoners", InfluenceDifference)
        EconomyHold.UpdateRent()
        return true
    else
        return false
    endif
EndFunction
    
bool Function NobilityTryToLowerWage()
    int LawMinWage = EconomyHold.City.GetKeywordData(LawHold.CS_LawsEconomy.GetAt(0) as Keyword) as int
    int CurrentWage = EconomyHold.WagesCommoner
    int MinWage = LawMinWage*50
    int NobilityWealthChange = EconomyHold.WealthNobilityChange
    int CommonerWealthChange = EconomyHold.WealthCommonersChange
    int WageIncreaseValue = 50*(EconomyHold.PopulationCommoner - EconomyHold.Guards)
    
    int MaxCommonerWealthChangeSteps = math.floor((CommonerWealthChange as float - 500)/WageIncreaseValue)
    int idealNobilityWealthChangeSteps = math.floor((math.abs(NobilityWealthChange) as float + 1000)/WageIncreaseValue)

    if MaxCommonerWealthChangeSteps <= 0 || idealNobilityWealthChangeSteps <= 0
        return false
    endif
    
    if MaxCommonerWealthChangeSteps >= idealNobilityWealthChangeSteps
        if 50*idealNobilityWealthChangeSteps < CurrentWage
            EconomyHold.WagesCommoner -= 50*idealNobilityWealthChangeSteps
        else
            return false
        endif
    else
        if 50*MaxCommonerWealthChangeSteps < CurrentWage
            EconomyHold.WagesCommoner -= 50*MaxCommonerWealthChangeSteps
        else
            return false
        endif
    endif
    
    if EconomyHold.WagesCommoner < MinWage
        EconomyHold.WagesCommoner = MinWage
    elseif EconomyHold.WagesCommoner > 500
        EconomyHold.WagesCommoner = 500
    endif
    
    int InfluenceDifference = math.floor((EconomyHold.WagesCommoner - CurrentWage) as float/10)
    
    if EconomyHold.WagesCommoner < CurrentWage
        debug.trace("Nobility in City " + citynum + " lowered wages to " + EconomyHold.WagesCommoner + " from " + CurrentWage)
        InfluenceHold.AdjustNobilityInfluence("Commoners", InfluenceDifference)
        EconomyHold.UpdateWages()
        return true
    else
        return false
    endif
EndFunction

bool Function NobilityTryToRaiseTribute() ; Determines the amount of tribute nobility can provide
    int initialCoinTribute = EconomyHold.CoinTribute
    float BaseTribute = EconomyHold.WealthNobility * 0.1
    float InfluenceFactor = InfluenceHold.JarlInfluenceNobility as float/100
    float WealthChangeFactor
    if EconomyHold.WealthNobility <= 0
        WealthChangeFactor = 0
    else
        WealthChangeFactor = 1 + (EconomyHold.WealthNobilityChange as float/EconomyHold.WealthNobility as float)
    endif
    
    int MaxCoinTribute = math.floor(BaseTribute*InfluenceFactor*WealthChangeFactor)
    if MaxCoinTribute < 0
        MaxCoinTribute = 0
    endif
    
    EconomyHold.CoinTribute = math.floor(MaxCoinTribute)
    
    int InfluenceDifference = math.floor((EconomyHold.CoinTribute - initialCoinTribute) as float/100)
    
    if EconomyHold.CoinTribute > initialCoinTribute
        debug.trace("Nobility in City " + citynum + " raised Jarl tributes to " + EconomyHold.CoinTribute + " from " + initialCoinTribute)
        InfluenceHold.AdjustNobilityInfluence("Jarl", InfluenceDifference)
        return true
    else
        return false
    endif
EndFunction

bool Function NobilityTryToLowerRent()
    int LawMaxRent = EconomyHold.City.GetKeywordData(LawHold.CS_LawsEconomy.GetAt(1) as Keyword) as int
    int CurrentRent = EconomyHold.RentCommoner
    int MaxRent = 500 - LawMaxRent*50
    int NobilityWealthChange = EconomyHold.WealthNobilityChange
    int CommonerWealthChange = EconomyHold.WealthCommonersChange
    int RentIncreaseValue = 50*(EconomyHold.PopulationCommoner - EconomyHold.Guards)
    
    int MaxNobilityWealthChangeSteps = math.floor((NobilityWealthChange as float - 1000)/RentIncreaseValue)
    int idealCommonerWealthChangeSteps = math.floor((math.abs(CommonerWealthChange) as float + 500)/RentIncreaseValue)
    
    if MaxNobilityWealthChangeSteps <= 0 || idealCommonerWealthChangeSteps <= 0
        return false
    endif
    
    if MaxNobilityWealthChangeSteps >= idealCommonerWealthChangeSteps
        if 50*idealCommonerWealthChangeSteps > CurrentRent
            EconomyHold.RentCommoner += 50*idealCommonerWealthChangeSteps
        else
            return false
        endif
    else
        if 50*MaxNobilityWealthChangeSteps > CurrentRent
            EconomyHold.RentCommoner += 50*MaxNobilityWealthChangeSteps
        else
            return false
        endif
    endif
    
    if EconomyHold.RentCommoner < 0
        EconomyHold.RentCommoner = 0
    elseif EconomyHold.RentCommoner > MaxRent
        EconomyHold.RentCommoner = MaxRent
    endif
    
    int InfluenceDifference = math.floor((CurrentRent - EconomyHold.RentCommoner) as float/10)
    
    if EconomyHold.RentCommoner < CurrentRent
        debug.trace("Nobility in City " + citynum + " lowered rent to " + EconomyHold.RentCommoner + " from " + CurrentRent)
        InfluenceHold.AdjustNobilityInfluence("Commoners", InfluenceDifference)
        EconomyHold.UpdateRent()
        return true
    else
        return false
    endif
EndFunction

bool Function NobilityTryToRaiseWage()
    int LawMinWage = EconomyHold.City.GetKeywordData(LawHold.CS_LawsEconomy.GetAt(0) as Keyword) as int
    int CurrentWage = EconomyHold.WagesCommoner
    int MinWage = LawMinWage*50
    int NobilityWealthChange = EconomyHold.WealthNobilityChange
    int CommonerWealthChange = EconomyHold.WealthCommonersChange
    int WageIncreaseValue = 50*(EconomyHold.PopulationCommoner - EconomyHold.Guards)
    
    int MaxNobilityWealthChangeSteps = math.floor((NobilityWealthChange as float - 1000)/WageIncreaseValue)
    int idealCommonerWealthChangeSteps = math.floor((math.abs(CommonerWealthChange) as float + 500)/WageIncreaseValue)
    
    if MaxNobilityWealthChangeSteps <= 0 || idealCommonerWealthChangeSteps <= 0
        return false
    endif
    
    if MaxNobilityWealthChangeSteps >= idealCommonerWealthChangeSteps
        if 50*idealCommonerWealthChangeSteps > CurrentWage
            EconomyHold.WagesCommoner += 50*idealCommonerWealthChangeSteps
        else
            return false
        endif
    else
        if 50*MaxNobilityWealthChangeSteps > CurrentWage
            EconomyHold.WagesCommoner += 50*MaxNobilityWealthChangeSteps
        else
            return false
        endif
    endif
    
    if EconomyHold.WagesCommoner < MinWage
        EconomyHold.WagesCommoner = MinWage
    elseif EconomyHold.WagesCommoner > 500
        EconomyHold.WagesCommoner = 500
    endif
    
    int InfluenceDifference = math.floor((EconomyHold.WagesCommoner - CurrentWage) as float/10)
    
    if EconomyHold.WagesCommoner > CurrentWage
        debug.trace("Nobility in City " + citynum + " raised wages to " + EconomyHold.WagesCommoner + " from " + CurrentWage)
        InfluenceHold.AdjustNobilityInfluence("Commoners", InfluenceDifference)
        EconomyHold.UpdateWages()
        return true
    else
        return false
    endif
EndFunction

Function ShowCityGroupReport()
    debug.MessageBox("EconomyScale = " + Economy + ", PrivilegeScale = " + Privilege + ", RepresentationScale = " + Representation)
EndFunction

Location Function GetVanillaCity()
    return EconomyHold.CS_AllLocations.GetAt(citynum) as Location
EndFunction
;/
Event OnUpdate()
    if EconomyHold.EconomyUpdater.UpdatePhase == 0
        SetInitialLaws()
        ((self as Quest) as CS_InfluenceHoldUpdaterScript).SetInitialInfluence()
    elseif EconomyHold.EconomyUpdater.UpdatePhase == 6
        EconomyHold.Updated = false
        ;UpdateWantValues()
        ;FindIssues()
        ;EconomyHold.AddChanges()
        EconomyHold.Updated = true
    elseif EconomyHold.EconomyUpdater.UpdatePhase == 7
        EconomyHold.Updated = false
        ;UpdateWantValues()
        ;FindIssues()
        ;EconomyHold.UpdateAllChangeValues()
        EconomyHold.AddChanges()
        EconomyHold.Updated = true
    endif
    debug.trace("City " + citynum + " should be done updating!")
EndEvent/;