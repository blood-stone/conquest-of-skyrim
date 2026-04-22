Scriptname CS_LoyaltyCheckScript extends Quest  

FormList Property AllLocations Auto
FormList Property AllVanillaLocations Auto
FormList Property AllHoldings Auto
FormList Property Garrisons Auto

LocationAlias Property ProtestCity Auto

ReferenceAlias[] Property Jarls Auto

Keyword Property Loyalty Auto
Keyword Property JarlLoyalty Auto
Keyword Property NoFood Auto
Keyword Property NoGarrison Auto
Keyword Property NoCourt Auto
Keyword Property Parties Auto
Keyword Property ArmiesDefending Auto

GlobalVariable Property CS_LoyaltySpouseAddition Auto
GlobalVariable Property CS_LoyaltySpouseHold Auto

Keyword Property CourtCases Auto

Quest Property ProtestQuest Auto

CS_PublicOpinionScript Property PublicOpinion Auto

bool Property RebelDefendQuestStarted Auto

Function SetInitialKeywords()
    int i = 0
    while i < CrimeKeywords.GetSize()
        EntireFaction.SetKeywordData((CrimeKeywords.GetAt(i) as Keyword), -1)
        int citynum = 0
        while citynum < AllLocations.GetSize()
            (AllLocations.GetAt(citynum) as Location).SetKeywordData((CrimeKeywords.GetAt(i) as Keyword), -1)
            citynum += 1
        endwhile
        i += 1
    endwhile
    i = 0
    while i < MilitaryKeywords.GetSize()
        EntireFaction.SetKeywordData((MilitaryKeywords.GetAt(i) as Keyword), -1)
        int citynum = 0
        while citynum < AllLocations.GetSize()
            (AllLocations.GetAt(citynum) as Location).SetKeywordData((MilitaryKeywords.GetAt(i) as Keyword), -1)
            citynum += 1
        endwhile
        i += 1
    endwhile

EndFunction

Function SetUpInitialJarlLoyalties()

    (AllLocations.GetAt(0) as Location).SetKeywordData(JarlLoyalty, PublicOpinion.GetPublicOpinionOfActor(Jarls[0].GetActorRef(), 0))
    (AllLocations.GetAt(1) as Location).SetKeywordData(JarlLoyalty, PublicOpinion.GetPublicOpinionOfActor(Jarls[1].GetActorRef(), 1))
    (AllLocations.GetAt(2) as Location).SetKeywordData(JarlLoyalty, PublicOpinion.GetPublicOpinionOfActor(Jarls[2].GetActorRef(), 2))
    (AllLocations.GetAt(3) as Location).SetKeywordData(JarlLoyalty, PublicOpinion.GetPublicOpinionOfActor(Jarls[3].GetActorRef(), 3))
    (AllLocations.GetAt(4) as Location).SetKeywordData(JarlLoyalty, PublicOpinion.GetPublicOpinionOfActor(Jarls[4].GetActorRef(), 4))
    (AllLocations.GetAt(5) as Location).SetKeywordData(JarlLoyalty, PublicOpinion.GetPublicOpinionOfActor(Jarls[5].GetActorRef(), 5))
    (AllLocations.GetAt(6) as Location).SetKeywordData(JarlLoyalty, PublicOpinion.GetPublicOpinionOfActor(Jarls[6].GetActorRef(), 6))
    (AllLocations.GetAt(7) as Location).SetKeywordData(JarlLoyalty, PublicOpinion.GetPublicOpinionOfActor(Jarls[7].GetActorRef(), 7))
    (AllLocations.GetAt(8) as Location).SetKeywordData(JarlLoyalty, PublicOpinion.GetPublicOpinionOfActor(Jarls[8].GetActorRef(), 8))

EndFunction

Location Function ConvertVanillaToCS(Location VanillaHolding)
    int holdingnum = AllVanillaLocations.Find(VanillaHolding)
    Location CSLoc = AllLocations.GetAt(holdingnum) as Location
    return CSLoc
EndFunction

Location Function ConvertCSToVanilla(Location CSHolding)
    int holdingnum = AllLocations.Find(CSHolding)
    Location VanillaLoc = AllVanillaLocations.GetAt(holdingnum) as Location
    return VanillaLoc
EndFunction

Function AdjustLoyalty(Location Holding, int amount, bool novillage = false)
    LoyaltyCity.ForceLocationTo(Holding)
    int holdingnum = AllLocations.Find(Holding)
    int InitialLoyalty = Holding.GetKeywordData(Loyalty) as int
    Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) + amount)
    If Holding.GetKeywordData(Loyalty) < 0
        Holding.SetKeywordData(Loyalty, 0)
    ElseIf Holding.GetKeywordData(Loyalty) > 100
        Holding.SetKeywordData(Loyalty, 100)
    EndIf
    if amount > 0
        if amount <= 3
            LoyaltyIncrease1.show()
        elseif amount > 3 && amount <= 7
            LoyaltyIncrease2.show()
        elseif amount > 7
            LoyaltyIncrease3.show()
        endif
    elseif amount < 0
        if math.abs(amount) <= 3
            LoyaltyDecrease1.show()
        elseif math.abs(amount) > 3 && math.abs(amount) <= 7
            LoyaltyDecrease2.show()
        elseif math.abs(amount) > 7
            LoyaltyDecrease3.show()
        endif
    endif
    EconUpdater.ShowLoyaltyMessage(Holding, InitialLoyalty)

    if holdingnum == 0 && novillage != true

        Holding = (AllLocations.GetAt(11) as Location)
        LoyaltyCity.ForceLocationTo(Holding)
        InitialLoyalty = Holding.GetKeywordData(Loyalty) as int
        Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) + amount)
        If Holding.GetKeywordData(Loyalty) < 0
            Holding.SetKeywordData(Loyalty, 0)
        ElseIf Holding.GetKeywordData(Loyalty) > 100
            Holding.SetKeywordData(Loyalty, 100)
        EndIf
        if amount > 0
            if amount <= 3
                LoyaltyIncrease1.show()
            elseif amount > 3 && amount <= 7
                LoyaltyIncrease2.show()
            elseif amount > 7
                LoyaltyIncrease3.show()
            endif
        elseif amount < 0
            if math.abs(amount) <= 3
                LoyaltyDecrease1.show()
            elseif math.abs(amount) > 3 && math.abs(amount) <= 7
                LoyaltyDecrease2.show()
            elseif math.abs(amount) > 7
                LoyaltyDecrease3.show()
            endif
        endif
        EconUpdater.ShowLoyaltyMessage(Holding, InitialLoyalty)

    elseif holdingnum == 1 && novillage != true

        Holding = (AllLocations.GetAt(10) as Location)
        LoyaltyCity.ForceLocationTo(Holding)
        InitialLoyalty = Holding.GetKeywordData(Loyalty) as int
        Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) + amount)
        If Holding.GetKeywordData(Loyalty) < 0
            Holding.SetKeywordData(Loyalty, 0)
        ElseIf Holding.GetKeywordData(Loyalty) > 100
            Holding.SetKeywordData(Loyalty, 100)
        EndIf
        if amount > 0
            if amount <= 3
                LoyaltyIncrease1.show()
            elseif amount > 3 && amount <= 7
                LoyaltyIncrease2.show()
            elseif amount > 7
                LoyaltyIncrease3.show()
            endif
        elseif amount < 0
            if math.abs(amount) <= 3
                LoyaltyDecrease1.show()
            elseif math.abs(amount) > 3 && math.abs(amount) <= 7
                LoyaltyDecrease2.show()
            elseif math.abs(amount) > 7
                LoyaltyDecrease3.show()
            endif
        endif
        EconUpdater.ShowLoyaltyMessage(Holding, InitialLoyalty)

        Holding = (AllLocations.GetAt(14) as Location)
        LoyaltyCity.ForceLocationTo(Holding)
        InitialLoyalty = Holding.GetKeywordData(Loyalty) as int
        Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) + amount)
        If Holding.GetKeywordData(Loyalty) < 0
            Holding.SetKeywordData(Loyalty, 0)
        ElseIf Holding.GetKeywordData(Loyalty) > 100
            Holding.SetKeywordData(Loyalty, 100)
        EndIf
        if amount > 0
            if amount <= 3
                LoyaltyIncrease1.show()
            elseif amount > 3 && amount <= 7
                LoyaltyIncrease2.show()
            elseif amount > 7
                LoyaltyIncrease3.show()
            endif
        elseif amount < 0
            if math.abs(amount) <= 3
                LoyaltyDecrease1.show()
            elseif math.abs(amount) > 3 && math.abs(amount) <= 7
                LoyaltyDecrease2.show()
            elseif math.abs(amount) > 7
                LoyaltyDecrease3.show()
            endif
        endif
        EconUpdater.ShowLoyaltyMessage(Holding, InitialLoyalty)

    elseif holdingnum == 2 && novillage != true

        Holding = (AllLocations.GetAt(9) as Location)
        LoyaltyCity.ForceLocationTo(Holding)
        InitialLoyalty = Holding.GetKeywordData(Loyalty) as int
        Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) + amount)
        If Holding.GetKeywordData(Loyalty) < 0
            Holding.SetKeywordData(Loyalty, 0)
        ElseIf Holding.GetKeywordData(Loyalty) > 100
            Holding.SetKeywordData(Loyalty, 100)
        EndIf
        if amount > 0
            if amount <= 3
                LoyaltyIncrease1.show()
            elseif amount > 3 && amount <= 7
                LoyaltyIncrease2.show()
            elseif amount > 7
                LoyaltyIncrease3.show()
            endif
        elseif amount < 0
            if math.abs(amount) <= 3
                LoyaltyDecrease1.show()
            elseif math.abs(amount) > 3 && math.abs(amount) <= 7
                LoyaltyDecrease2.show()
            elseif math.abs(amount) > 7
                LoyaltyDecrease3.show()
            endif
        endif
        EconUpdater.ShowLoyaltyMessage(Holding, InitialLoyalty)

    elseif holdingnum == 3 && novillage != true

        Holding = (AllLocations.GetAt(12) as Location)
        LoyaltyCity.ForceLocationTo(Holding)
        InitialLoyalty = Holding.GetKeywordData(Loyalty) as int
        Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) + amount)
        If Holding.GetKeywordData(Loyalty) < 0
            Holding.SetKeywordData(Loyalty, 0)
        ElseIf Holding.GetKeywordData(Loyalty) > 100
            Holding.SetKeywordData(Loyalty, 100)
        EndIf
        if amount > 0
            if amount <= 3
                LoyaltyIncrease1.show()
            elseif amount > 3 && amount <= 7
                LoyaltyIncrease2.show()
            elseif amount > 7
                LoyaltyIncrease3.show()
            endif
        elseif amount < 0
            if math.abs(amount) <= 3
                LoyaltyDecrease1.show()
            elseif math.abs(amount) > 3 && math.abs(amount) <= 7
                LoyaltyDecrease2.show()
            elseif math.abs(amount) > 7
                LoyaltyDecrease3.show()
            endif
        endif
        EconUpdater.ShowLoyaltyMessage(Holding, InitialLoyalty)

        Holding = (AllLocations.GetAt(13) as Location)
        LoyaltyCity.ForceLocationTo(Holding)
        InitialLoyalty = Holding.GetKeywordData(Loyalty) as int
        Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) + amount)
        If Holding.GetKeywordData(Loyalty) < 0
            Holding.SetKeywordData(Loyalty, 0)
        ElseIf Holding.GetKeywordData(Loyalty) > 100
            Holding.SetKeywordData(Loyalty, 100)
        EndIf
        if amount > 0
            if amount <= 3
                LoyaltyIncrease1.show()
            elseif amount > 3 && amount <= 7
                LoyaltyIncrease2.show()
            elseif amount > 7
                LoyaltyIncrease3.show()
            endif
        elseif amount < 0
            if math.abs(amount) <= 3
                LoyaltyDecrease1.show()
            elseif math.abs(amount) > 3 && math.abs(amount) <= 7
                LoyaltyDecrease2.show()
            elseif math.abs(amount) > 7
                LoyaltyDecrease3.show()
            endif
        endif
        EconUpdater.ShowLoyaltyMessage(Holding, InitialLoyalty)

    endif
EndFunction

Function AdjustLoyaltySilent(Location Holding, int amount)
    int holdingnum = AllLocations.Find(Holding)
    int InitialLoyalty = Holding.GetKeywordData(Loyalty) as int
    Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) + amount)
    If Holding.GetKeywordData(Loyalty) < 0
        Holding.SetKeywordData(Loyalty, 0)
    ElseIf Holding.GetKeywordData(Loyalty) > 100
        Holding.SetKeywordData(Loyalty, 100)
    EndIf
    EconUpdater.ShowLoyaltyMessage(Holding, InitialLoyalty)
EndFunction

Function AdjustLoyaltyAll(int amount, bool[] excludedholdings)

    if amount > 0
        debug.notification("The loyalty of every city has increased!")
    elseif amount < 0
        debug.notification("The loyalty of every city has decreased!")
    endif

    int holdingnum = 0
    while holdingnum < AllLocations.GetSize()   
        If (AllHoldings.GetAt(holdingnum) as GlobalVariable).GetValue() == 1 && excludedholdings[holdingnum] == false
            Location Holding = AllLocations.GetAt(holdingnum) as Location
            int InitialLoyalty = Holding.GetKeywordData(Loyalty) as int
            Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) + amount)
            If Holding.GetKeywordData(Loyalty) < 0
                Holding.SetKeywordData(Loyalty, 0)
            ElseIf Holding.GetKeywordData(Loyalty) > 100
                Holding.SetKeywordData(Loyalty, 100)
            EndIf
            EconUpdater.ShowLoyaltyMessage(Holding, InitialLoyalty)
        EndIf
        holdingnum += 1
    endwhile
EndFunction

Function MakeRebellionLeader(Actor Citizen, Location Holding)
    int holdingnum = AllVanillaLocations.Find(Holding)
    if RebellionLeaders[holdingnum].GetActorRef() == None
        RebellionLeaders[holdingnum].ForceRefTo(Citizen)
    endif
EndFunction

Function MakeAliasRebellionLeader(ReferenceAlias NewAlias, Location Holding)
    int holdingnum = AllVanillaLocations.Find(Holding)
    if RebellionLeaders[holdingnum].GetActorRef() != None
        NewAlias.ForceRefTo(RebellionLeaders[holdingnum].GetActorRef())
    endif
EndFunction

Function CheckLoyalties()
    int i = 0
    while i < AllHoldings.GetSize()
        if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
            Location Holding = AllLocations.GetAt(i) as Location
            int InitialLoyalty = Holding.GetKeywordData(Loyalty) as int
            If i < 9
                If (Garrisons.GetAt(i) as FormList).GetSize() < 10
                    Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) - (10 - (Garrisons.GetAt(i) as FormList).GetSize()))
                    Holding.SetKeywordData(NoGarrison, 1)
                Else
                    Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) + (Math.floor((Garrisons.GetAt(i) as FormList).GetSize())/4))
                    Holding.SetKeywordData(NoGarrison, 0)
                EndIf
                If Holding.GetKeywordData(CourtCases) >= 6
                    Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) - 10)
                    Holding.SetKeywordData(CourtCases, 6)
                    Holding.SetKeywordData(NoCourt, 1)
                Else
                    Holding.SetKeywordData(NoCourt, 0)
                EndIf   
            EndIf

            If Holding.GetKeywordData(FoodReserve) < 0
                Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) - math.abs(Holding.GetKeywordData(FoodReserve))/2)
            EndIf

            float GuardPercentage = Holding.GetKeywordData(CS_NumGuards)/((CS_AllGuardFormLists.GetAt(i) as FormList).GetSize())
            float UnemploymentPercentage = Holding.GetKeywordData(CS_CityManagementUnemployment)/Holding.GetKeywordData(CS_Population)
            float LoyaltyPercentage = Holding.GetKeywordData(Loyalty)/100
            float HarshnessPercentage = Holding.GetKeywordData(CS_CityManagementHarshness)/100
            float CrimePercentage = 0.5*(((1 - 0.9*GuardPercentage) + (UnemploymentPercentage) + (1 - 0.9*LoyaltyPercentage))/3 + (1 - HarshnessPercentage))/2
            Holding.SetKeywordData(CS_CityManagementCrime, CrimePercentage*Holding.GetKeywordData(CS_Population))
            Holding.SetKeywordData(CS_PrisonerNum, GuardPercentage*0.8*Holding.GetKeywordData(CS_CityManagementCrime))
            Holding.SetKeywordData(Loyalty, Holding.GetKeywordData(Loyalty) - 0.7*CrimePercentage*Holding.GetKeywordData(Loyalty))

            If Holding.GetKeywordData(Loyalty) > 100
                Holding.SetKeywordData(Loyalty  , 100)
            ElseIf Holding.GetKeywordData(Loyalty) < 0
                Holding.SetKeywordData(Loyalty, 0)
            EndIf       
        
            If i < 9

                Holding.SetKeywordData(CourtDemand, 0)
    
                If Holding.GetKeywordData(Loyalty) >= 0 && Holding.GetKeywordData(Loyalty) < 20
                    if DefendCity.GetOwningQuest().IsRunning() == 0 && RebelDefendQuestStarted == false
                        RebelDefendQuestStarted = true
                        RebelCity.ForceLocationTo(ConvertCSToVanilla(Holding))
                        DefendCity.GetOwningQuest().Start()
                        if RebellionLeaders[i].GetActorRef() != None
                            DefendCityLeader.ForceRefTo(RebellionLeaders[i].GetActorRef())
                        endif
                        RebelLeader.ForceRefTo(DefendCityLeader.GetActorRef())
                        RebelLeader.GetActorRef().AddToFaction(RebelFaction)
                        RebelFaction.SetPlayerEnemy(true)
                        RebelFaction.SetEnemy(PlayerArmyFaction)
                        (DefendCity.GetOwningQuest() as CS_DefendCityRebelScript).AttackerCount.SetValue(40)
                        DefendCity.GetOwningQuest().SetStage(1)
                    endif
                ElseIf Holding.GetKeywordData(Loyalty) >= 20 && Holding.GetKeywordData(Loyalty) < 40
                    If ProtestQuest.IsRunning() == 0 && (Holding.GetKeywordData(NoFood) == 1 || Holding.GetKeywordData(NoGarrison) == 1 || Holding.GetKeywordData(NoCourt) == 1 || Holding.GetKeywordData(Parties) == 1)
                        ProtestCity.ForceLocationTo(ConvertCSToVanilla(Holding))
                        ProtestQuest.Start()
                    EndIf
                EndIf
            EndIf
            EconUpdater.ShowLoyaltyMessage(Holding, InitialLoyalty)
        endif
        i += 1
    endwhile
EndFunction

Function StartRebellion()
    if PossibleRebellionCities.GetSize() > 0
        int randomcitynum = utility.randomint(0, PossibleRebellionCities.GetSize() - 1)
        Location Holding = PossibleRebellionCities.GetAt(randomcitynum) as Location
        Location VanillaHolding = ConvertCSToVanilla(Holding)
        int i = AllLocations.Find(Holding)
        if DefendCity.GetOwningQuest().IsRunning() == 0 && DefendCityImp.GetLocation() != VanillaHolding && DefendCitySons.GetLocation() != VanillaHolding
            RebelCity.ForceLocationTo(VanillaHolding)
            DefendCity.GetOwningQuest().Start()
            if RebellionLeaders[i].GetActorRef() != None
                DefendCityLeader.ForceRefTo(RebellionLeaders[i].GetActorRef())
            endif
            RebelLeader.ForceRefTo(DefendCityLeader.GetActorRef())
            RebelLeader.GetActorRef().AddToFaction(RebelFaction)
            RebelFaction.SetPlayerEnemy(true)
            RebelFaction.SetEnemy(PlayerArmyFaction)
            (DefendCity.GetOwningQuest() as CS_DefendCityRebelScript).AttackerCount.SetValue(40)
            DefendCity.GetOwningQuest().SetStage(1)
        endif
    endif
EndFunction

Function StartProtest()
    if PossibleProtestCities.GetSize() > 0
        int randomcitynum = utility.randomint(0, PossibleProtestCities.GetSize() - 1)
        Location Holding = PossibleProtestCities.GetAt(randomcitynum) as Location
        Location VanillaHolding = ConvertCSToVanilla(Holding)
        If ProtestQuest.IsRunning() == 0 && (Holding.GetKeywordData(NoFood) == 1 || Holding.GetKeywordData(NoGarrison) == 1 || Holding.GetKeywordData(NoCourt) == 1 || Holding.GetKeywordData(Parties) == 1)
            ProtestCity.ForceLocationTo(ConvertCSToVanilla(Holding))
            ProtestQuest.Start()
        EndIf
    endif
EndFunction


CS_EconomyVariableFunctions Property EconUpdater Auto

ReferenceAlias[] Property RebellionLeaders  Auto  

Faction Property prisonerFaction  Auto  

Keyword Property CourtDemand  Auto  
Keyword Property CS_NumGuards Auto
Keyword Property CS_CityManagementUnemployment Auto
Keyword Property CS_CityManagementHarshness Auto
Keyword Property CS_CityManagementCrime Auto
Keyword Property CS_Population Auto
Keyword Property CS_PrisonerNum Auto
Keyword Property FoodReserve Auto

FormList Property CS_AllGuardFormLists Auto
FormList Property PossibleRebellionCities Auto
FormList Property PossibleProtestCities Auto

Quest Property RebellionQuest Auto

LocationAlias Property DefendCity  Auto  
LocationAlias Property DefendCityImp Auto
LocationAlias Property DefendCitySons Auto
LocationAlias Property RebelCity Auto
LocationAlias Property RebelCityMessage Auto

Faction Property RebelFaction Auto
Faction Property PlayerArmyFaction Auto
Faction Property PlayerArmyCommanders Auto

ReferenceAlias Property RebelLeader Auto
ReferenceAlias Property DefendCityLeader Auto

Message Property RebellionMessage Auto

Message Property LoyaltyIncrease1 Auto
Message Property LoyaltyIncrease2 Auto
Message Property LoyaltyIncrease3 Auto

Message Property LoyaltyDecrease1 Auto
Message Property LoyaltyDecrease2 Auto
Message Property LoyaltyDecrease3 Auto

Keyword Property CourtCaseBandits  Auto  

FormList Property CrimeKeywords Auto

Location Property EntireFaction Auto

LocationAlias Property LoyaltyCity  Auto  

FormList Property MilitaryKeywords  Auto  

Keyword Property Harshness  Auto  
