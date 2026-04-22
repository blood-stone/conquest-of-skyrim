Scriptname CS_CourtScript extends Quest  

Scene Property StewardForceGreetScene  Auto  

Quest Property ExecutionQuest Auto
Quest Property ExecutionQuestEvent Auto
Quest Property KneelingQuest Auto
Quest Property ThroneQuest Auto
Quest Property CoronationQuest Auto

Quest Property BQ01 Auto
Quest Property BQ02 Auto
Quest Property BQ03 Auto
Quest Property BQ04 Auto

CS_PrisonScript Property PrisonScript Auto

ReferenceAlias Property ChoppingBlock Auto
ReferenceAlias[] Property Thrones Auto
ReferenceAlias Property ThroneSpecific Auto
ReferenceAlias Property NewCitizen Auto
ReferenceAlias Property Citizen Auto
ReferenceAlias Property NewBard Auto
ReferenceAlias Property Bard Auto
ReferenceAlias[] Property CriminalDetach Auto
ReferenceAlias Property PrisonerAlias Auto
ReferenceAlias Property FactionSteward Auto

FormList Property AllLocations Auto
FormList Property AllPalaces Auto
FormList Property AllHoldings Auto
FormList Property AllGuardFormLists Auto
FormList Property AllThrones Auto

Keyword Property JarlManage Auto
Keyword Property CourtDemand Auto
Keyword Property CourtCases Auto
Keyword Property PrisonerNum Auto

FormList Property AllMiscLocations  Auto  
FormList Property AllMiscLocationsVanilla  Auto  
FormList Property PrisonerNums Auto
FormList Property CrimeKeywords Auto

LocationRefType Property Boss  Auto  

Keyword Property PlayerOwner  Auto  
Keyword Property HoldNum Auto
Keyword Property Crime Auto
Keyword Property NumGuards Auto
Keyword Property Harshness Auto

Faction Property CrimeTheft Auto
Faction Property CrimeAssault Auto
Faction Property CrimeMurder Auto
Faction Property CrimeSpeakingOut Auto
Faction Property CrimeWorship Auto
Faction Property CrimeTreason Auto
Faction Property CrimeWeaponPossession Auto

Keyword[] Property LocTypeKeywords Auto

Keyword Property CS_StoryExecution Auto

Location Property EntireFaction Auto

GlobalVariable Property GameDaysPassed Auto
float[] Property CourtResetDay Auto

Armor Property PrisonerCuffs Auto

bool[] Property FoundCase Auto

int Property thronenum Auto

GlobalVariable Property PlayerIsHighKing Auto
GlobalVariable Property CapitalGlobal Auto

Function SetUpThrones()
    int i = 0
    while i < 9
        Thrones[i].ForceRefTo(AllThrones.GetAt(i) as ObjectReference)
        i +=1
    endwhile
EndFunction

int Function CheckIfThrone(ObjectReference Chair)
    int i = 0
    int isthrone = -1
    while i < Thrones.Length && isthrone == -1
        if Thrones[i].GetReference() == Chair && (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
            if (AllLocations.GetAt(i) as Location).GetKeywordData(JarlManage) == 0
                isthrone = i
            endif
        endif
        i += 1
    endwhile
    return isthrone
EndFunction

Function RevertAllFormLists()
    int i = 0
    while i < BountyLocations.Length
        BountyLocations[i].Revert()
        i += 1
    endwhile
EndFunction

Function RevertFoundCases()
    int i = 0
    while i < FoundCase.Length
        FoundCase[i] = false
        i += 1
    endwhile
EndFunction

Function SetFalseKeywords(Location City)
    int i = 0
    while i < FoundCase.Length
        if FoundCase[i] == false
            City.SetKeywordData(CourtSceneKeywords[i], 0)
        endif
        i += 1
    endwhile
EndFunction

Function StopVanillaQuests()
    if (BQ01 as BQScript).Hold.GetLocation() && (BQ01 as BQScript).Hold.GetLocation().IsChild(CourtCityVanilla.GetLocation()) == 1
        BQ01.CompleteAllObjectives()
        BQ01.stop()
    endif

    if (BQ02 as BQScript).Hold.GetLocation() && (BQ02 as BQScript).Hold.GetLocation().IsChild(CourtCityVanilla.GetLocation()) == 1
        BQ02.CompleteAllObjectives()
        BQ02.stop()
    endif

    if (BQ03 as BQScript).Hold.GetLocation() && (BQ03 as BQScript).Hold.GetLocation().IsChild(CourtCityVanilla.GetLocation()) == 1
        BQ03.CompleteAllObjectives()
        BQ03.stop()
    endif

    if (BQ04 as BQScript).Hold.GetLocation() && (BQ04 as BQScript).Hold.GetLocation().IsChild(CourtCityVanilla.GetLocation()) == 1
        BQ04.CompleteAllObjectives()
        BQ04.stop()
    endif
EndFunction

Function CheckCases(ReferenceAlias Throne)
    if CoronationQuest.GetStage() != 25 && CoronationQuest.GetStage() != 30
        int HoldNumInt = Thrones.Find(Throne)
        thronenum = HoldNumInt
        ThroneSpecific.ForceRefTo(Throne.GetRef())
        Location City = AllLocations.GetAt(HoldNumInt) as Location
        Location CityVanilla = AllVanillaLocations.GetAt(HoldNumInt) as Location
        CourtCity.ForceLocationTo(City)
        CourtCityVanilla.ForceLocationTo(CityVanilla)
        CourtCityPalace.ForceLocationTo(AllPalaces.GetAt(HoldNumInt) as Location)
        if (AllHoldings.GetAt(HoldNumInt) as GlobalVariable).GetValue() == 1
            StopVanillaQuests()
        endif
        if GameDaysPassed.GetValue() >= CourtResetDay[HoldNumInt]
            debug.trace("New cases tomorrow")
            int i = 0
            while i < CourtSceneKeywords.Length
                if City.GetKeywordData(CourtSceneKeywords[i]) == -1
                    City.SetKeywordData(CourtSceneKeywords[i], 0)
                endif
                i += 1
            endwhile
            CourtResetDay[HoldNumInt] = GameDaysPassed.GetValue() + 1
        endif
    endif
EndFunction

Function ClearPrisonerAlias(Actor Prisoner)
    int FoundAlias = 0
    int i = 0
    while i < PrisonScript.PrisonersMarkarth.Length && FoundAlias == 0
        if PrisonScript.PrisonersMarkarth[i].GetActorRef() == Prisoner
            PrisonScript.PrisonersMarkarth[i].Clear()
            (PrisonerNums.GetAt(0) as GlobalVariable).Mod(-1)
            FoundAlias = 1
        elseif PrisonScript.PrisonersRiften[i].GetActorRef() == Prisoner
            PrisonScript.PrisonersRiften[i].Clear()
            (PrisonerNums.GetAt(1) as GlobalVariable).Mod(-1)
            FoundAlias = 1
        elseif PrisonScript.PrisonersSolitude[i].GetActorRef() == Prisoner
            PrisonScript.PrisonersSolitude[i].Clear()
            (PrisonerNums.GetAt(2) as GlobalVariable).Mod(-1)
            FoundAlias = 1
        elseif PrisonScript.PrisonersWhiterun[i].GetActorRef() == Prisoner
            PrisonScript.PrisonersWhiterun[i].Clear()
            (PrisonerNums.GetAt(3) as GlobalVariable).Mod(-1)
            FoundAlias = 1
        elseif PrisonScript.PrisonersWindhelm[i].GetActorRef() == Prisoner
            PrisonScript.PrisonersWindhelm[i].Clear()
            (PrisonerNums.GetAt(4) as GlobalVariable).Mod(-1)
            FoundAlias = 1
        elseif PrisonScript.PrisonersDawnstar[i].GetActorRef() == Prisoner
            PrisonScript.PrisonersDawnstar[i].Clear()
            (PrisonerNums.GetAt(5) as GlobalVariable).Mod(-1)
            FoundAlias = 1
        elseif PrisonScript.PrisonersFalkreath[i].GetActorRef() == Prisoner
            PrisonScript.PrisonersFalkreath[i].Clear()
            (PrisonerNums.GetAt(6) as GlobalVariable).Mod(-1)
            FoundAlias = 1
        elseif PrisonScript.PrisonersMorthal[i].GetActorRef() == Prisoner
            PrisonScript.PrisonersMorthal[i].Clear()
            (PrisonerNums.GetAt(7) as GlobalVariable).Mod(-1)
            FoundAlias = 1
        elseif PrisonScript.PrisonersWinterhold[i].GetActorRef() == Prisoner
            PrisonScript.PrisonersWinterhold[i].Clear()
            (PrisonerNums.GetAt(8) as GlobalVariable).Mod(-1)
            FoundAlias = 1
        endif
        i += 1
    endwhile
EndFunction

Function StewardStart(int citynum)
    if citynum != -1
        if CoronationQuest.GetStage() != 25 && CoronationQuest.GetStage() != 30
            CourtCity.ForceLocationTo(AllLocations.GetAt(citynum) as Location)
            CourtCityVanilla.ForceLocationTo(AllVanillaLocations.GetAt(citynum) as Location)
            CityPrison.ForceLocationTo(PrisonLocations.GetAt(citynum) as Location)
            PrisonMarker.ForceRefTo(AllPrisonMarkers.GetAt(citynum) as ObjectReference)
            ChoppingBlock.ForceRefTo(GovScript.ChoppingBlocks.GetAt(citynum) as ObjectReference)
            if Stewards[citynum].GetActorRef()
                debug.trace("Found city steward")
                Steward.ForceRefTo(Stewards[citynum].GetActorRef())
            elseif !Stewards[citynum].GetActorRef() && CapitalGlobal.GetValueInt() == citynum
                debug.trace("Did not find city Steward but assigning to capital steward")
                Steward.ForceRefTo(FactionSteward.GetActorRef())
            else
                debug.trace("CapitalNum: " + CapitalGlobal.GetValueInt() + " = citynum: " + citynum)
                debug.trace("Did not find city steward and not in capital")
            endif
            if Steward.GetActorRef().Is3DLoaded()
                FindPossibleCases()
                StewardForceGreetScene.ForceStart()
            endif
        endif
    endif
EndFunction

Function StewardStartCourt()
    StewardForceGreetScene.Stop()
    StewardForceGreetNextCaseScene.Stop()
    StewardForceGreetNextCasePrisonerScene.Stop()
    (NewCitizen.GetOwningQuest().Start())
    Citizen.ForceRefTo(NewCitizen.GetActorRef())
    (NewCitizen.GetOwningQuest().Stop())
    if CourtCity.GetLocation().GetKeywordData(CourtDemand) == 0 && (CourtCity.GetLocation().GetKeywordData(LoyaltyScript.NoFood) == 1 || CourtCity.GetLocation().GetKeywordData(LoyaltyScript.NoGarrison) == 1 || CourtCity.GetLocation().GetKeywordData(LoyaltyScript.Parties) == 1)
        PossibleSceneKeywords.RemoveAddedForm(CourtDemand)
        CourtCity.GetLocation().SetKeywordData(CourtCases, PossibleSceneKeywords.GetSize() as int)
        LoyaltyScript.MakeRebellionLeader(Citizen.GetActorRef(), CourtCityVanilla.GetLocation())
        CourtDemandsScene.ForceStart()
    else
        debug.trace("Selecting Court Case")
        SelectCourtCase()
    endif
EndFunction

Function StewardStartPrisonerCourt()
    StewardForceGreetScene.Stop()
    StewardForceGreetNextCaseScene.Stop()
    StewardForceGreetNextCasePrisonerScene.Stop()
    (NewCitizen.GetOwningQuest().Start())
    Citizen.ForceRefTo(NewCitizen.GetActorRef())
    (NewCitizen.GetOwningQuest().Stop())
    Actor Criminal = Citizen.GetActorRef().PlaceAtMe(CriminalActor) as Actor
    ChoosePrisonerCrime(Criminal)
    PrisonerAlias.ForceRefTo(Criminal)
    PrisonerNonUniqueScene.ForceStart()
EndFunction

Function ChoosePrisonerCrime(Actor Criminal)
    Criminal.AddToFaction(PrisonerFaction)
    int crimenum = utility.randomint(0, 100)
    if crimenum <= 60
        if CourtCity.GetLocation().GetKeywordData(CrimeKeywords.GetAt(0) as Keyword) == -1 && EntireFaction.GetKeywordData(CrimeKeywords.GetAt(0) as Keyword) == -1
            Criminal.AddToFaction(CrimeTheft)
            CourtFine.SetValue(5)
        elseif CourtCity.GetLocation().GetKeywordData(CrimeKeywords.GetAt(1) as Keyword) == -1 && EntireFaction.GetKeywordData(CrimeKeywords.GetAt(1) as Keyword) == -1
            Criminal.AddToFaction(CrimeAssault)
            CourtFine.SetValue(40)
        elseif CourtCity.GetLocation().GetKeywordData(CrimeKeywords.GetAt(2) as Keyword) == -1 && EntireFaction.GetKeywordData(CrimeKeywords.GetAt(2) as Keyword) == -1
            Criminal.AddToFaction(CrimeMurder)
            CourtFine.SetValue(1000)
        endif
    elseif crimenum > 60 && crimenum <= 90
        if CourtCity.GetLocation().GetKeywordData(CrimeKeywords.GetAt(1) as Keyword) == -1 && EntireFaction.GetKeywordData(CrimeKeywords.GetAt(1) as Keyword) == -1
            Criminal.AddToFaction(CrimeAssault)
            CourtFine.SetValue(40)
        elseif CourtCity.GetLocation().GetKeywordData(CrimeKeywords.GetAt(0) as Keyword) == -1 && EntireFaction.GetKeywordData(CrimeKeywords.GetAt(0) as Keyword) == -1
            Criminal.AddToFaction(CrimeTheft)
            CourtFine.SetValue(5)
        elseif CourtCity.GetLocation().GetKeywordData(CrimeKeywords.GetAt(2) as Keyword) == -1 && EntireFaction.GetKeywordData(CrimeKeywords.GetAt(2) as Keyword) == -1
            Criminal.AddToFaction(CrimeMurder)
            CourtFine.SetValue(1000)
        endif
    elseif crimenum > 90 && crimenum <= 100
        if CourtCity.GetLocation().GetKeywordData(CrimeKeywords.GetAt(2) as Keyword) == -1 && EntireFaction.GetKeywordData(CrimeKeywords.GetAt(2) as Keyword) == -1
            Criminal.AddToFaction(CrimeMurder)
            CourtFine.SetValue(1000)
        elseif CourtCity.GetLocation().GetKeywordData(CrimeKeywords.GetAt(1) as Keyword) == -1 && EntireFaction.GetKeywordData(CrimeKeywords.GetAt(1) as Keyword) == -1
            Criminal.AddToFaction(CrimeAssault)
            CourtFine.SetValue(40)
        elseif CourtCity.GetLocation().GetKeywordData(CrimeKeywords.GetAt(0) as Keyword) == -1 && EntireFaction.GetKeywordData(CrimeKeywords.GetAt(0) as Keyword) == -1
            Criminal.AddToFaction(CrimeTheft)
            CourtFine.SetValue(5)
        endif
    endif
    UpdateCurrentInstanceGlobal(CourtFine)
EndFunction

Function SelectCourtCase()
    StewardForceGreetScene.Stop()
    StewardForceGreetNextCaseScene.Stop()
    int foundscene = 0
    int i = 0
    while i < CourtSceneKeywords.Length && foundscene == 0
        debug.trace("Checking if pickup available")
        if CourtCity.GetLocation().GetKeywordData(CourtSceneKeywords[i]) == 2
            Actor BountyHunterRef = Citizen.GetActorRef().PlaceAtMe(BountyHunterActor) as Actor
            BountyHunter.ForceRefTo(BountyHunterRef)
            CourtCity.GetLocation().SetKeywordData(CourtSceneKeywords[i], 3)
            PossibleSceneKeywords.RemoveAddedForm(CourtSceneKeywords[i])
            CourtCity.GetLocation().SetKeywordData(CourtCases, PossibleSceneKeywords.GetSize() as int)
            CourtScenesPickup.ForceStart()
            foundscene = 1
        endif
        i += 1
    endwhile
    if foundscene == 0
        debug.trace("Picking random scene")
        int scenekeywordnum = utility.randomint(0, PossibleSceneKeywords.GetSize() - 1)
        int scenenum = CourtSceneKeywords.Find(PossibleSceneKeywords.GetAt(scenekeywordnum) as Keyword)
        if FoundCase[scenenum]
            debug.trace("Random scene found")
            CourtCity.GetLocation().SetKeywordData(CourtSceneKeywords[scenenum], -1)
            PossibleSceneKeywords.RemoveAddedForm(CourtSceneKeywords[scenenum])
            CourtCity.GetLocation().SetKeywordData(CourtCases, PossibleSceneKeywords.GetSize() as int)
            FoundCase[scenenum] = false
            foundscene = 1
            StartCourtScene(scenenum)
        endif
    endif
EndFunction

Function ResetBountyPickup(int casenum)
    CourtCity.GetLocation().SetKeywordData(CourtSceneKeywords[casenum], 0)
EndFunction

Function SelectMission()
    debug.trace("Picking random mission")
    int scenekeywordnum = utility.randomint(0, PossibleSceneKeywords.GetSize() - 1)
    int scenenum = CourtSceneKeywords.Find(PossibleSceneKeywords.GetAt(scenekeywordnum) as Keyword)
    if CourtCity.GetLocation().GetKeywordData(CourtSceneKeywords[scenenum]) != -1 && CourtCity.GetLocation().GetKeywordData(CourtSceneKeywords[scenenum]) != -2
        debug.trace("Random mission found")
        CourtCity.GetLocation().SetKeywordData(CourtSceneKeywords[scenenum], -1)
        PossibleSceneKeywords.RemoveAddedForm(CourtSceneKeywords[scenenum])
        CourtCity.GetLocation().SetKeywordData(CourtCases, PossibleSceneKeywords.GetSize() as int)
        FoundCase[scenenum] = false
        StartCaseQuest(scenenum, 10)
    endif   
EndFunction

Function FindPossibleCases()
    PossibleSceneKeywords.Revert()
    int citynum = AllLocations.Find(CourtCity.GetLocation())
    int possiblecases = 0
    if CourtCity.GetLocation().GetKeywordData(CourtDemand) == 0 && (CourtCity.GetLocation().GetKeywordData(LoyaltyScript.NoFood) == 1 || CourtCity.GetLocation().GetKeywordData(LoyaltyScript.NoGarrison) == 1 || CourtCity.GetLocation().GetKeywordData(LoyaltyScript.Parties) == 1)
        PossibleSceneKeywords.AddForm(CourtDemand)
        possiblecases += 1
    endif
    int i = 0
    while i < CourtScenes.Length
        if (CourtQuests[i].IsRunning() && CourtQuests[i].GetStage() == 0 && CourtCity.GetLocation().GetKeywordData(CourtSceneKeywords[i]) != -1) || CourtCity.GetLocation().GetKeywordData(CourtSceneKeywords[i]) == 2
            PossibleSceneKeywords.AddForm(CourtSceneKeywords[i])
            FoundCase[i] = true
            possiblecases += 1
        endif
        i += 1
    endwhile
    debug.trace("Possible Cases = " + possiblecases)
    CourtCity.GetLocation().SetKeywordData(CourtCases, PossibleSceneKeywords.GetSize() as int)
    int possiblecasescrime = CourtCity.GetLocation().GetKeywordData(PrisonerNum) as int + (PrisonerNums.GetAt(citynum) as GlobalVariable).GetValue() as int
    debug.notification("You have " + PossibleSceneKeywords.GetSize() as int + " petition cases available!")
    debug.notification("You have " + possiblecasescrime + " crime cases available!")
EndFunction

Function FindPossibleMissions()
    PossibleSceneKeywords.Revert()
    int citynum = AllLocations.Find(CourtCity.GetLocation())
    int possiblecases = 0
    int i = 0
    while i < CourtScenes.Length
        if (CourtQuests[i].IsRunning() && CourtQuests[i].GetStage() == 0 && CourtCity.GetLocation().GetKeywordData(CourtSceneKeywords[i]) != -1 && CourtCity.GetLocation().GetKeywordData(CourtSceneKeywords[i]) != 2)
            PossibleSceneKeywords.AddForm(CourtSceneKeywords[i])
            FoundCase[i] = true
            possiblecases += 1
        endif
        i += 1
    endwhile
    CourtCity.GetLocation().SetKeywordData(CourtCases, PossibleSceneKeywords.GetSize() as int)
EndFunction

Function StartCourtScene(int scenenum)
    debug.trace("Starting scene number " + scenenum)
    CourtScenes[scenenum].ForceStart()
EndFunction

Function EndCourtCase()
    Actor CitizenRef = Citizen.GetActorRef()
    Citizen.Clear()
    CitizenRef.EvaluatePackage()
EndFunction

Function PayBountyHunter(int amount)
    Economy.CoinTotalPlayer.Mod(-amount)
    debug.notification(amount + " Gold removed from the Treasury!")
    CoinSound.Play(Game.GetPlayer())
EndFunction

Function AssignCourtQuestLocation(int questnum)
    int i = utility.randomint(0, BountyLocations[questnum].GetSize() - 1)
    CourtQuestLocation.ForceLocationTo(BountyLocations[questnum].GetAt(i) as Location)
EndFunction

Function StartCaseQuest(int questnum, int stage)
    CourtQuests[questnum].SetStage(stage)
EndFunction

Function StewardStartNextCase()
    StewardForceGreetNextCaseScene.ForceStart()
EndFunction

Function StewardStartNextCasePrisoner()
    StewardForceGreetNextCasePrisonerScene.ForceStart()
EndFunction

Function AddPrisonerToDetach(Actor Prisoner)
    int foundalias = 0
    int i = 0
    while i < CriminalDetach.Length && foundalias == 0
        if CriminalDetach[i].GetActorRef() == None
            CriminalDetach[i].ForceRefTo(Prisoner)
            foundalias = 1
        endif
        i += 1
    endwhile
    Prisoner.EvaluatePackage()
EndFunction

Function RemoveFromPrisonNums()
    CourtCity.GetLocation().SetKeywordData(PrisonerNum, CourtCity.GetLocation().GetKeywordData(PrisonerNum) - 1)
EndFunction

Function FreePrisoner(Actor Prisoner)
    RemoveFromPrisonNums()
    Prisoner.RemoveFromFaction(PrisonerFaction)
    AddPrisonerToDetach(Prisoner)
    Prisoner.UnEquipItem(PrisonerCuffs)
    debug.SendAnimationEvent(Prisoner, "IdleForceDefaultState")
    CalculateHarshness(Prisoner, 0)
EndFunction

Function PrisonerPayFine(Actor Prisoner)
    RemoveFromPrisonNums()
    Prisoner.RemoveFromFaction(PrisonerFaction)
    AddPrisonerToDetach(Prisoner)
    Prisoner.UnEquipItem(PrisonerCuffs)
    debug.SendAnimationEvent(Prisoner, "IdleForceDefaultState")
    Economy.CoinTotalPlayer.Mod(CourtFine.GetValue() as int)
    debug.notification(CourtFine.GetValue() as int + " Gold added to the Treasury!")
    CoinSound.Play(Game.GetPlayer())
    CalculateHarshness(Prisoner, 1)
EndFunction

Function PrisonerParade(Actor Prisoner)
    RemoveFromPrisonNums()
    CalculateHarshness(Prisoner, 2)
EndFunction

Function PrisonerSevenDays(Actor Prisoner)
    RemoveFromPrisonNums()
    AddPrisonerToDetach(Prisoner)
    CalculateHarshness(Prisoner, 3)
EndFunction

Function PrisonerLife(Actor Prisoner)
    RemoveFromPrisonNums()
    AddPrisonerToDetach(Prisoner)
    CalculateHarshness(Prisoner, 4)
EndFunction

Function PrisonerExecution(Actor Prisoner)
    RemoveFromPrisonNums()
    CalculateHarshness(Prisoner, 5)
    StartExecution(Prisoner)
EndFunction

Function FindBard()
    NewBard.GetOwningQuest().Start()
    Bard.ForceRefTo(NewBard.GetActorRef())
    NewBard.GetOwningQuest().Stop()
EndFunction

Function StartExecution(Actor Victim)
    if ExecutionQuestEvent.IsRunning() == 1
        ExecutionQuestEvent.stop()
    endif
    ChoppingBlock.GetReference().enable()
    if ExecutionQuest.IsRunning()
        int i = 0
        int FoundAlias = 0
        while i < (ExecutionQuest as CS_ExecutionScript).Executionees.Length && FoundAlias == 0
            if  (ExecutionQuest as CS_ExecutionScript).Executionees[i].GetActorRef() == None
                (ExecutionQuest as CS_ExecutionScript).Executionees[i].ForceRefTo(Victim)
                FoundAlias = 1
                i = (ExecutionQuest as CS_ExecutionScript).Executionees.Length
            endif
            i += 1
        endwhile
        if FoundAlias == 0
            debug.notification("There are too many prisoners getting executed right now!")
        endif
    else
        CS_StoryExecution.SendStoryEventAndWait(akLoc = CourtCityVanilla.GetLocation(), akRef1 = Victim)
        ExecutionQuest.SetObjectiveDisplayed(0)
    endif
EndFunction

Function CalculateHarshness(Actor Prisoner, int punishmentnum)
    if Prisoner.IsInFaction(CrimeTheft)
        if punishmentnum == 0
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) - 5)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), -2)
        elseif punishmentnum == 1
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) - 0)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), 2)
        elseif punishmentnum == 3
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) + 2)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), -2)
        elseif punishmentnum == 4
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) + 15)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), -7)
        elseif punishmentnum == 5
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) + 25)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), -10)
        endif
    elseif Prisoner.IsInFaction(CrimeAssault)
        if punishmentnum == 0
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) - 7)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), -3)
        elseif punishmentnum == 1
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) - 2)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), 1)
        elseif punishmentnum == 3
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) + 2)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), 2)
        elseif punishmentnum == 4
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) + 7)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), -5)
        elseif punishmentnum == 5
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) + 12)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), -7)
        endif
    elseif Prisoner.IsInFaction(CrimeMurder)
        if punishmentnum == 0
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) - 25)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), -10)
        elseif punishmentnum == 1
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) - 12)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), -5)
        elseif punishmentnum == 3
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) - 12)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), -5)
        elseif punishmentnum == 4
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) - 3)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), 2)
        elseif punishmentnum == 5
            CourtCity.GetLocation().SetKeywordData(Harshness, CourtCity.GetLocation().GetKeywordData(Harshness) + 0)
            LoyaltyScript.AdjustLoyalty(CourtCity.GetLocation(), 5)
        endif
    endif
EndFunction

Function RegisterForKneeling()
    if PlayerIsHighKing.GetValue() == 1
        RegisterForSingleLOSGain(Steward.GetActorRef(), Game.GetPlayer())
        Steward.GetActorRef().SetLookAt(Game.GetPlayer())
    endif
EndFunction

Function UpdateTo0Point3Point3()
    int i = 0
    bool foundthrone = false
    while i < Thrones.Length && !foundthrone
        if Thrones[i].GetRef().Is3DLoaded()
            foundthrone = true
            CheckCases(Thrones[i])
        endif
        i += 1
    endwhile
EndFunction

int Function GetHoldNum()
    int i = 0
    int holdnumint = -1
    while i < Thrones.Length && holdnumint == -1
        if Thrones[i].GetRef() == ThroneSpecific.GetRef()
            holdnumint = i
        endif
        i += 1
    endwhile

    return holdnumint
EndFunction

Event OnUpdate()
    StewardStart(GetHoldNum())
EndEvent

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
    KneelingQuest.Start()
    Steward.GetActorRef().ClearLookAt()
EndEvent

ReferenceAlias[] Property Stewards  Auto  
ReferenceAlias Property Steward Auto

CS_LoyaltyCheckScript Property LoyaltyScript Auto
CS_EconomyVariableFunctions Property Economy Auto
Quest Property ManageArmy Auto

LocationAlias Property CourtCity  Auto  
LocationAlias Property CourtCityVanilla  Auto  
LocationAlias Property CourtCityPalace Auto

FormList Property AllVanillaLocations  Auto  

Scene Property CourtDemandsScene Auto

Sound Property CoinSound Auto

Scene[] Property CourtScenes Auto
Scene Property CourtScenesPickup Auto

Keyword[] Property CourtSceneKeywords Auto 

ReferenceAlias Property CitizenLeaving  Auto  

CS_GovScriptFunctions Property GovScript Auto

Quest[] Property CourtQuestsStaging Auto
Quest[] Property CourtQuests Auto

ActorBase Property BountyHunterActor  Auto  

ReferenceAlias Property BountyHunter  Auto  

FormList Property AllHoldLocations  Auto  

FormList Property PossibleSceneKeywords Auto

Faction Property PrisonerFaction Auto

LocationAlias Property CourtQuestLocation  Auto 

Scene Property StewardForceGreetNextCaseScene  Auto  
Scene Property StewardForceGreetNextCasePrisonerScene  Auto  
Scene Property PrisonerNonUniqueScene Auto
Scene Property ThroneWaitScene Auto

FormList[] Property BountyLocations  Auto  

GlobalVariable Property CourtFine  Auto  

FormList Property PrisonLocations  Auto  

LocationAlias Property CityPrison  Auto  

ActorBase Property CriminalActor  Auto  

FormList Property AllPrisonMarkers  Auto  

ReferenceAlias Property PrisonMarker  Auto  
