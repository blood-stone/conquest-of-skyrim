Scriptname CS_HoldingLoyaltyCheckScript extends Quest  

CS_LoyaltyCheckScript Property LoyaltyCheck Auto

int Property holdingnum Auto
bool Property AllowUpdate Auto

Location Function ConvertVanillaToCS(Location VanillaHolding)
    Location CSLoc = LoyaltyCheck.AllLocations.GetAt(holdingnum) as Location
    return CSLoc
EndFunction

Location Function ConvertCSToVanilla(Location CSHolding)
    Location VanillaLoc = LoyaltyCheck.AllVanillaLocations.GetAt(holdingnum) as Location
    return VanillaLoc
EndFunction

Function AdjustLoyalty(Location Holding, int amount)
    LoyaltyCheck.LoyaltyCity.ForceLocationTo(Holding)
    int InitialLoyalty = Holding.GetKeywordData(LoyaltyCheck.Loyalty) as int
    Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) + amount)
    if amount > 0
        if amount <= 3
            LoyaltyCheck.LoyaltyIncrease1.show()
        elseif amount > 3 && amount <= 7
            LoyaltyCheck.LoyaltyIncrease2.show()
        elseif amount > 7
            LoyaltyCheck.LoyaltyIncrease3.show()
        endif
    elseif amount < 0
        if math.abs(amount) <= 3
            LoyaltyCheck.LoyaltyDecrease1.show()
        elseif math.abs(amount) > 3 && math.abs(amount) <= 7
            LoyaltyCheck.LoyaltyDecrease2.show()
        elseif math.abs(amount) > 7
            LoyaltyCheck.LoyaltyDecrease3.show()
        endif
    endif
    LoyaltyCheck.EconUpdater.ShowLoyaltyMessage(Holding, InitialLoyalty)
EndFunction

Function MakeRebellionLeader(Actor Citizen, Location Holding)
    if LoyaltyCheck.RebellionLeaders[holdingnum].GetActorRef() == None
        LoyaltyCheck.RebellionLeaders[holdingnum].ForceRefTo(Citizen)
    endif
EndFunction

Function MakeAliasRebellionLeader(ReferenceAlias NewAlias, Location Holding)
    if LoyaltyCheck.RebellionLeaders[holdingnum].GetActorRef() != None
        NewAlias.ForceRefTo(LoyaltyCheck.RebellionLeaders[holdingnum].GetActorRef())
    endif
EndFunction

Function CheckLoyalties(int i)

    debug.trace("Checking Loyalties for Holding " + i)

        if (LoyaltyCheck.AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
            
            if LoyaltyCheck.CS_LoyaltySpouseHold.GetValueInt() == i
                Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) + LoyaltyCheck.CS_LoyaltySpouseAddition.GetValue())
                LoyaltyCheck.CS_LoyaltySpouseAddition.Mod(5)
                if LoyaltyCheck.CS_LoyaltySpouseAddition.GetValue() > 30
                    LoyaltyCheck.CS_LoyaltySpouseAddition.SetValue(30)
                endif
            endif
            Location Holding = LoyaltyCheck.AllLocations.GetAt(i) as Location
            LoyaltyCheck.EconUpdater.InitialLoyalties[i] = Holding.GetKeywordData(LoyaltyCheck.Loyalty) as int
            Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) - 10*Holding.GetKeywordData(LoyaltyCheck.EconUpdater.TaxRate))
            if Holding.GetKeywordData(LoyaltyCheck.EconUpdater.RecruitablePercentage) != -1
                Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) - 10*Holding.GetKeywordData(LoyaltyCheck.EconUpdater.RecruitablePercentage))
            else
                if LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.EconUpdater.RecruitablePercentage) != -1
                    Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) - 10*LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.EconUpdater.RecruitablePercentage))
                endif
            endif

            debug.trace("Calculation percentages for Holding " + i)

            float GuardPercentage = Holding.GetKeywordData(LoyaltyCheck.CS_NumGuards)/((LoyaltyCheck.CS_AllGuardFormLists.GetAt(i) as FormList).GetSize())
            float UnemploymentPercentage = Holding.GetKeywordData(LoyaltyCheck.CS_CityManagementUnemployment)/Holding.GetKeywordData(LoyaltyCheck.CS_Population)
            float LoyaltyPercentage = Holding.GetKeywordData(LoyaltyCheck.Loyalty)/100
            float HarshnessPercentage = Holding.GetKeywordData(LoyaltyCheck.CS_CityManagementHarshness)/100

            If i < 9
                If Holding.GetKeywordData(LoyaltyCheck.ArmiesDefending) == 0
                    Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) - 10)
                    Holding.SetKeywordData(LoyaltyCheck.NoGarrison, 1)
                Else
                    Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) + 10*Holding.GetKeywordData(LoyaltyCheck.ArmiesDefending))
                    Holding.SetKeywordData(LoyaltyCheck.NoGarrison, 0)
                EndIf
                If Holding.GetKeywordData(LoyaltyCheck.CourtCases) >= 6
                    Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) - 10)
                    Holding.SetKeywordData(LoyaltyCheck.CourtCases, 6)
                    Holding.SetKeywordData(LoyaltyCheck.NoCourt, 1)
                Else
                    Holding.SetKeywordData(LoyaltyCheck.NoCourt, 0)
                EndIf
            Else
                if GuardPercentage > 0.50
                    Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) + 10*GuardPercentage)
                endif
            EndIf

            If Holding.GetKeywordData(LoyaltyCheck.NoFood) == 1
                Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) - 20)
            EndIf
    
            If Holding.GetKeywordData(LoyaltyCheck.Harshness) > 100
                Holding.SetKeywordData(LoyaltyCheck.Harshness, 100)
            ElseIf Holding.GetKeywordData(LoyaltyCheck.Harshness) < 0
                Holding.SetKeywordData(LoyaltyCheck.Harshness, 0)
            EndIf

            float CrimePercentage = 0.5*(((1 - 0.9*GuardPercentage) + (UnemploymentPercentage) + (1 - 0.9*LoyaltyPercentage))/3 + (1 - HarshnessPercentage))/2
            int crimenum = math.floor(CrimePercentage*Holding.GetKeywordData(LoyaltyCheck.CS_Population))
            crimenum = CalculateCrime(crimenum, Holding)
            Holding.SetKeywordData(LoyaltyCheck.CS_CityManagementCrime, crimenum)
            int oldprisonernum = math.floor(GuardPercentage*0.8*Holding.GetKeywordData(LoyaltyCheck.CS_CityManagementCrime))
            int prisonernum = CalculatePrisonerNum(oldprisonernum, Holding)
            Holding.SetKeywordData(LoyaltyCheck.CS_PrisonerNum, prisonernum)
            Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) - 0.7*CrimePercentage*Holding.GetKeywordData(LoyaltyCheck.Loyalty))

            If Holding.GetKeywordData(LoyaltyCheck.Loyalty) > 100
                Holding.SetKeywordData(LoyaltyCheck.Loyalty, 100)
            ElseIf Holding.GetKeywordData(LoyaltyCheck.Loyalty) < 0
                Holding.SetKeywordData(LoyaltyCheck.Loyalty, 0)
            EndIf       
        
            If i < 9

                Holding.SetKeywordData(LoyaltyCheck.CourtDemand, 0)
                
                Utility.Wait(i/10)

                If Holding.GetKeywordData(LoyaltyCheck.Loyalty) >= 0 && Holding.GetKeywordData(LoyaltyCheck.Loyalty) < 20
                    LoyaltyCheck.PossibleRebellionCities.AddForm(Holding)
                ElseIf Holding.GetKeywordData(LoyaltyCheck.Loyalty) >= 20 && Holding.GetKeywordData(LoyaltyCheck.Loyalty) < 40
                    LoyaltyCheck.PossibleProtestCities.AddForm(Holding)
                EndIf
            EndIf
            debug.trace("Loyalties Checked for Holding " + i)
        endif

EndFunction

int Function CalculateCrime(int crimenum, Location Holding)
    debug.trace("initial crimenum for " + Holding + " = " + crimenum)
    int theftnum = math.ceiling(0.6*crimenum)
    int assaultnum = math.ceiling(0.3*crimenum)
    int murdernum = math.ceiling(0.1*crimenum)

    if Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(0) as Keyword) == 0
        debug.trace("Found " + Holding + " has legal theft")
        crimenum -= theftnum
    elseif Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(0) as Keyword) == -1
        debug.trace("Found " + Holding + " has manual crime punishment")
        if LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(0) as Keyword) == 0
            debug.trace("Found Faction has theft legal")
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) - 5*theftnum)
            AdjustLoyaltySilent(Holding, -2*theftnum)
            crimenum -= theftnum
        endif
    endif

    if Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(1) as Keyword) == 0
        crimenum -= assaultnum
    elseif Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(1) as Keyword) == -1
        if LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(1) as Keyword) == 0
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) - 7*assaultnum)
            AdjustLoyaltySilent(Holding, -3*assaultnum)
            crimenum -= assaultnum
        endif
    endif

    if Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(2) as Keyword) == 0
        crimenum -= murdernum
    elseif Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(2) as Keyword) == -1
        if LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(2) as Keyword) == 0
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) - 25*murdernum)
            AdjustLoyaltySilent(Holding, -10*murdernum)
            crimenum -= murdernum
        endif
    endif

    if crimenum < 0
        crimenum = 0
    endif

    debug.trace("final crimenum for " + Holding + " = " + crimenum)

    return crimenum
EndFunction

Function AdjustLoyaltySilent(Location Holding, int amount)

    Holding.SetKeywordData(LoyaltyCheck.Loyalty, Holding.GetKeywordData(LoyaltyCheck.Loyalty) + amount)
    If Holding.GetKeywordData(LoyaltyCheck.Loyalty) < 0
        Holding.SetKeywordData(LoyaltyCheck.Loyalty, 0)
    ElseIf Holding.GetKeywordData(LoyaltyCheck.Loyalty) > 100
        Holding.SetKeywordData(LoyaltyCheck.Loyalty, 100)
    EndIf

EndFunction

int Function CalculatePrisonerNum(int prisonernum, Location Holding)
    int theftnum = 0
    int assaultnum = 0
    int murdernum = 0
    int totalcrimenum = 0

    debug.trace("Initial prisoner num for " + holdingnum + " = " + prisonernum)
    debug.trace("EntireFaction Theft = " + LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(0) as Keyword))
    debug.trace("EntireFaction Assault = " + LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(1) as Keyword))
    debug.trace("EntireFaction Murder = " + LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(2) as Keyword))

    if Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(0) as Keyword) != 0 && Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(0) as Keyword) != -1
        debug.trace("Theft is not legal and is not decided by court in " + holdingnum)
        theftnum = 6
        debug.trace("theftnum for holding " + holdingnum + " = " + theftnum)
    elseif Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(0) as Keyword) == -1 
        debug.trace("Theft is decided by court in " + holdingnum)
        if LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(0) as Keyword) != 0 && LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(0) as Keyword) != -1
            debug.trace("Theft is not legal and not decided by court in entire faction")
            theftnum = 6
            debug.trace("theftnum for holding " + holdingnum + " = " + theftnum)
        endif
    endif

    if Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(1) as Keyword) != 0 && Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(1) as Keyword) != -1
        assaultnum = 3
        debug.trace("assaultnum for holding " + holdingnum + " = " + assaultnum)
    elseif Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(1) as Keyword) == -1 
        if LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(1) as Keyword) != 0 && LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(1) as Keyword) != -1
            assaultnum = 3
            debug.trace("assaultnum for holding " + holdingnum + " = " + assaultnum)
        endif
    endif

    if Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(2) as Keyword) != 0 && Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(2) as Keyword) != -1
        murdernum = 1
        debug.trace("murdernum for holding " + holdingnum + " = " + murdernum)
    elseif Holding.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(2) as Keyword) == -1 
        if LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(2) as Keyword) != 0 && LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(2) as Keyword) != -1
            murdernum = 1
            debug.trace("murdernum for holding " + holdingnum + " = " + murdernum)
        endif
    endif

    debug.trace("theftnum for holding " + holdingnum + " = " + theftnum)
    debug.trace("assaultnum for holding " + holdingnum + " = " + assaultnum)
    debug.trace("murdernum for holding " + holdingnum + " = " + murdernum)
    float theftnumpercentage = (theftnum as float)/10
    debug.trace("theftnumpercentage for holding " + holdingnum + " = " + theftnumpercentage)
    float assaultnumpercentage = (assaultnum as float)/10
    debug.trace("assaultnumpercentage for holding " + holdingnum + " = " + assaultnumpercentage)
    float murdernumpercentage = (murdernum as float)/10
    debug.trace("murdernumpercentage for holding " + holdingnum + " = " + murdernumpercentage)

    int theftnumtrue = math.ceiling(theftnumpercentage*prisonernum)
    int assaultnumtrue = math.ceiling(assaultnumpercentage*prisonernum)
    int murdernumtrue = math.ceiling(murdernumpercentage*prisonernum)

    CalculateHarshness(Holding, 0, theftnumtrue)
    CalculateHarshness(Holding, 1, assaultnumtrue)
    CalculateHarshness(Holding, 2, murdernumtrue)

    int newprisonernum = prisonernum - math.ceiling(theftnumpercentage*prisonernum)- math.ceiling(assaultnumpercentage*prisonernum) - math.ceiling(murdernumpercentage*prisonernum)

    if newprisonernum < 0
        newprisonernum = 0
    endif

    debug.trace("Final prisoner num for " + holdingnum + " = " + newprisonernum)
    return newprisonernum
EndFunction

Function CalculateHarshness(Location Holding, int crimenum, int modifier)
    int punishmentnum = LoyaltyCheck.EntireFaction.GetKeywordData(LoyaltyCheck.CrimeKeywords.GetAt(crimenum) as Keyword) as int
    int loyaltychange = 0
    if crimenum == 0
        if punishmentnum == 1
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) - 0)
            AdjustLoyaltySilent(Holding, 2*modifier)
            loyaltychange = 2*modifier
        elseif punishmentnum == 2
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) + 2*modifier)
            AdjustLoyaltySilent(Holding, -2*modifier)
            loyaltychange = -2*modifier
        elseif punishmentnum == 3
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) + 15*modifier)
            AdjustLoyaltySilent(Holding, -7*modifier)
            loyaltychange = -7*modifier
        elseif punishmentnum == 4
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) + 25*modifier)
            AdjustLoyaltySilent(Holding, -10*modifier)
            loyaltychange = -10*modifier
        endif
        debug.trace("Adjusting Loyalty from thefts by " + loyaltychange)
    elseif crimenum == 1
        if punishmentnum == 1
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) - 2*modifier)
            AdjustLoyaltySilent(Holding, 1*modifier)
        elseif punishmentnum == 2
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) + 2*modifier)
            AdjustLoyaltySilent(Holding, 2*modifier)
        elseif punishmentnum == 3
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) + 7*modifier)
            AdjustLoyaltySilent(Holding, -5*modifier)
        elseif punishmentnum == 4
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) + 12*modifier)
            AdjustLoyaltySilent(Holding, -7*modifier)
        endif
    elseif crimenum == 2
        if punishmentnum == 1
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) - 12*modifier)
            AdjustLoyaltySilent(Holding, -5*modifier)
        elseif punishmentnum == 2
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) - 12*modifier)
            AdjustLoyaltySilent(Holding, -5*modifier)
        elseif punishmentnum == 3
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) - 3*modifier)
            AdjustLoyaltySilent(Holding, 2*modifier)
        elseif punishmentnum == 4
            Holding.SetKeywordData(LoyaltyCheck.Harshness, Holding.GetKeywordData(LoyaltyCheck.Harshness) + 0)
            AdjustLoyaltySilent(Holding, 5*modifier)
        endif
    endif
EndFunction

Event OnUpdate()
    if AllowUpdate == true
        AllowUpdate = false
        debug.trace("Check Loyalties Allowed by Holding " + holdingnum)
        CheckLoyalties(holdingnum)
    else
        debug.trace("Check Loyalties NOT Allowed by Holding " + holdingnum)
    endif
EndEvent