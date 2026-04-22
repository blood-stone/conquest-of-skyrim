Scriptname CS_NegotiationScript extends Quest  

ReferenceAlias Property HostLeaderSeat  Auto  
ReferenceAlias Property GuestLeaderSeat  Auto  
ReferenceAlias Property HostLeader  Auto  
ReferenceAlias Property GuestLeader  Auto  
ReferenceAlias Property HostASIC  Auto  
ReferenceAlias Property HostSteward  Auto  
ReferenceAlias Property GuestASIC  Auto  
ReferenceAlias Property GuestSteward  Auto  

ReferenceAlias Property GuestLeaderStand  Auto  
ReferenceAlias Property GuestASICStand  Auto  

GlobalVariable Property HostProposal Auto
GlobalVariable Property HostOffer Auto
GlobalVariable Property HostOfferExplanation Auto
GlobalVariable Property GuestCounterOffer Auto
GlobalVariable Property GuestOfferExplanation Auto
GlobalVariable Property FinalDecision Auto
GlobalVariable Property TotalTroopCount Auto

Faction Property GovImperial Auto
Faction Property GovSons Auto
Faction Property PlayerArmyFaction Auto
Faction Property PlayerFaction Auto
Faction Property CWSonsFaction Auto
Faction Property CWImperialFaction Auto
Faction Property CWSonsFactionNPC Auto
Faction Property CWImperialFactionNPC Auto

float Property NegotiationDay Auto
GlobalVariable Property GameDaysPassed Auto

GlobalVariable Property TruceImp Auto
GlobalVariable Property TruceSons Auto

GlobalVariable Property Reparations Auto
GlobalVariable Property GuestNum Auto
GlobalVariable Property WarScore Auto
GlobalVariable Property WarScoreNew Auto
GlobalVariable Property WarScoreImp Auto
GlobalVariable Property WarScoreSons Auto

Keyword Property CS_StoryTransferHoldingCity Auto
Keyword Property CS_StoryTransferHoldingFort Auto

CS_TMScript Property TMImp Auto
CS_TMScript Property TMSons Auto

CS_TransferOwnershipScript Property TransferOwnership Auto

Function EvaluateNegotiatingPackages()
    HostLeader.GetActorRef().EvaluatePackage()
    HostASIC.GetActorRef().EvaluatePackage()
    HostSteward.GetActorRef().EvaluatePackage()
    GuestLeader.GetActorRef().EvaluatePackage()
    GuestASIC.GetActorRef().EvaluatePackage()
    GuestSteward.GetActorRef().EvaluatePackage()
EndFunction

Function MoveGuestsToTable()
    If GuestLeader.GetActorRef().IsDisabled() == 1
        GuestLeader.GetActorRef().enable()
    EndIf
    GuestLeader.GetActorRef().MoveTo(GuestLeaderStand.GetReference())
    If GuestASIC.GetActorRef().IsDisabled() == 1
        GuestASIC.GetActorRef().enable()
    EndIf
    GuestASIC.GetActorRef().MoveTo(GuestASICStand.GetReference())
EndFunction

Function MakeFriends()
    If GuestLeader.GetActorRef() == Ulfric
        TMSons.TempTruce()
        GuestLeader.GetActorRef().RemoveFromFaction(CWSonsFaction)
        GuestLeader.GetActorRef().RemoveFromFaction(CWSonsFactionNPC)
        GuestASIC.GetActorRef().RemoveFromFaction(CWSonsFaction)
        GuestASIC.GetActorRef().RemoveFromFaction(CWSonsFactionNPC)
        GuestNum.SetValue(2)
        WarScore.SetValue(WarScoreSons.GetValue())
    ElseIf GuestLeader.GetActorRef() == Tullius
        TMImp.TempTruce()
        GuestLeader.GetActorRef().RemoveFromFaction(CWImperialFaction)
        GuestLeader.GetActorRef().RemoveFromFaction(CWImperialFactionNPC)
        GuestASIC.GetActorRef().RemoveFromFaction(CWImperialFaction)
        GuestASIC.GetActorRef().RemoveFromFaction(CWImperialFactionNPC)
        WarScore.SetValue(WarScoreImp.GetValue())
        GuestNum.SetValue(1)
    EndIf
    CalculateReparations()
EndFunction

Function UnMakeFriends()
    GuestLeader.GetReference().MoveToMyEditorLocation()
    GuestASIC.GetReference().MoveToMyEditorLocation()
    If GuestLeader.GetActorRef() == Ulfric
        GuestLeader.GetActorRef().AddToFaction(CWSonsFaction)
        GuestLeader.GetActorRef().AddToFaction(CWSonsFactionNPC)
        GuestASIC.GetActorRef().AddToFaction(CWSonsFaction)
        GuestASIC.GetActorRef().AddToFaction(CWSonsFactionNPC)
        TMSons.BreakTruce()
    ElseIf GuestLeader.GetActorRef() == Tullius
        GuestLeader.GetActorRef().AddToFaction(CWImperialFaction)
        GuestLeader.GetActorRef().AddToFaction(CWImperialFactionNPC)
        GuestASIC.GetActorRef().AddToFaction(CWImperialFaction)
        GuestASIC.GetActorRef().AddToFaction(CWImperialFactionNPC)
        TMImp.BreakTruce()
    EndIf
EndFunction

Function CalculateArmySize()
    TotalTroopCount.SetValue(0)
    int i = 0
    while i < TroopCounts.GetSize()
        TotalTroopCount.Mod((TroopCounts.GetAt(i) as GlobalVariable).GetValue())
        i += 1
    endwhile
EndFunction

Function CalculateSuccess(Actor Jarl)
    int chance = 25
    If Jarl.GetRelationshipRank(Game.GetPlayer()) > 0
        chance += 25
    ElseIf Jarl.GetRelationshipRank(Game.GetPlayer()) < 0
        chance -= 25
    EndIf
    If HostOffer.GetValue() == 1
        If Jarl.IsInFaction(GovSons) == 1
            chance += 50
        ElseIf Jarl.IsInFaction(GovImperial) == 1
            chance -= 25
        EndIf
        If HostOfferExplanation.GetValue() == 1
            If TotalTroopCount.GetValue() < 60
                chance -= 25
            ElseIf TotalTroopCount.GetValue() >= 100
                chance += 25
            EndIf
        ElseIf HostOfferExplanation.GetValue() == 2
            If Jarl.IsInFaction(GovSons) == 1
                chance -= 25
            ElseIf Jarl.IsInFaction(GovImperial) == 1
                chance += 25
            EndIf
        ElseIf HostOfferExplanation.GetValue() == 3
            If Jarl.IsInFaction(GovImperial) == 1
                chance -= 25
            EndIf
        EndIf
    ElseIf HostOffer.GetValue() == 2
        chance += 25
        If HostOfferExplanation.GetValue() == 1
            If TotalTroopCount.GetValue() < 60
                chance -= 25
            ElseIf TotalTroopCount.GetValue() >= 100
                chance += 25
            EndIf
        ElseIf HostOfferExplanation.GetValue() == 2
            If Jarl.IsInFaction(GovSons) == 1
                chance -= 25
            ElseIf Jarl.IsInFaction(GovImperial) == 1
                chance += 25
            EndIf
        ElseIf HostOfferExplanation.GetValue() == 3
            If Jarl.IsInFaction(GovSons) == 1
                chance += 25
            ElseIf Jarl.IsInFaction(GovImperial) == 1
                chance -= 25
            EndIf
        EndIf
    ElseIf HostOffer.GetValue() == 3
        If Jarl.IsInFaction(GovSons) == 1
            chance -= 25
        ElseIf Jarl.IsInFaction(GovImperial) == 1
            chance += 50
        EndIf
        If HostOfferExplanation.GetValue() == 1
            If TotalTroopCount.GetValue() < 60
                chance -= 25
            ElseIf TotalTroopCount.GetValue() >= 100
                chance += 25
            EndIf
        ElseIf HostOfferExplanation.GetValue() == 2
            If Jarl.IsInFaction(GovSons) == 1
                chance -= 25
            EndIf
        ElseIf HostOfferExplanation.GetValue() == 3
            If Jarl.IsInFaction(GovSons) == 1
                chance += 25
            ElseIf Jarl.IsInFaction(GovImperial) == 1
                chance -= 25
            EndIf
        EndIf
    ElseIf HostOffer.GetValue() == 5
        If Jarl.GetRelationshipRank(Game.GetPlayer()) < 0
            chance -= 10
        EndIf
    EndIf
    int rollnum = utility.randomint(0, 100)
    if chance >= rollnum
        FinalDecision.SetValue(1)
    else
        FinalDecision.SetValue(0)
    endif
EndFunction

Function GiveCityGuest()
    if GuestCity.GetLocation().HasKeyword(LocTypeCity)
        CityMajor.GetOwningQuest().Start()
        CityMajor.ForceLocationTo(GuestCity.GetLocation())
        CityMajor.GetOwningQuest().SetStage(50)
    else
        CityMinor.GetOwningQuest().Start()
        CityMinor.ForceLocationTo(GuestCity.GetLocation())
        CityMinor.GetOwningQuest().SetStage(50)
    endif
EndFunction

Function CalculateNewScore()
    WarScoreNew.SetValue(WarScore.GetValue())
    If AllLocations.Find(FirstConcessionCity.GetLocation()) >= 0
        If AllLocations.Find(FirstConcessionCity.GetLocation()) < 5
            WarScoreNew.Mod(-30)
        ElseIf AllLocations.Find(FirstConcessionCity.GetLocation()) >= 5
            WarScoreNew.Mod(-20)
        EndIf
    EndIf
    If AllLocations.Find(FirstConcessionCounter.GetLocation()) >= 0
        If AllLocations.Find(FirstConcessionCounter.GetLocation()) < 5
            WarScoreNew.Mod(30)
        ElseIf AllLocations.Find(FirstConcessionCounter.GetLocation()) >= 5
            WarScoreNew.Mod(20)
        EndIf
    EndIf
    If AllFortLocations.Find(FirstConcessionCounter.GetLocation()) >= 0
        WarScoreNew.Mod(15)
    EndIf
    If Reparations.GetValue() > 0
        WarScoreNew.Mod(1 - 5*Reparations.GetValue()/1000)
    ElseIf Reparations.GetValue() < 0
        WarScoreNew.Mod(-5*Reparations.GetValue()/1000 - 1)
    EndIf
EndFunction

Function CalculateReparations()
    If WarScore.GetValue() >=12 && WarScore.GetValue() <= 15
        PossibleReparations.SetValue(1000)
    ElseIf WarScore.GetValue() > 15 && WarScore.GetValue() <= 20
        PossibleReparations.SetValue(2000)
    ElseIf WarScore.GetValue() > 20 && WarScore.GetValue() <= 25
        PossibleReparations.SetValue(3000)
    ElseIf WarScore.GetValue() > 25 && WarScore.GetValue() <= 30
        PossibleReparations.SetValue(4000)
    ElseIf WarScore.GetValue() > 30 && WarScore.GetValue() <= 35
        PossibleReparations.SetValue(5000)
    ElseIf WarScore.GetValue() > 35 && WarScore.GetValue() <= 40
        PossibleReparations.SetValue(6000)
    ElseIf WarScore.GetValue() > 40 && WarScore.GetValue() <= 45
        PossibleReparations.SetValue(7000)
    ElseIf WarScore.GetValue() > 45 && WarScore.GetValue() <= 50
        PossibleReparations.SetValue(8000)
    ElseIf WarScore.GetValue() > 50 && WarScore.GetValue() <= 55
        PossibleReparations.SetValue(9000)
    ElseIf WarScore.GetValue() > 55
        PossibleReparations.SetValue(10000)
    EndIf
    UpdateCurrentInstanceGlobal(PossibleReparations)
EndFunction

Function CalculateGuestReparations()
    If WarScoreNew.GetValue() <= 10 && WarScoreNew.GetValue() >= 5
        PossibleReparationsGuest.SetValue(1000)
    ElseIf WarScoreNew.GetValue() < 5 && WarScoreNew.GetValue() >= 0
        PossibleReparationsGuest.SetValue(2000)
    ElseIf WarScoreNew.GetValue() < 0 && WarScoreNew.GetValue() >= -5
        PossibleReparationsGuest.SetValue(3000)
    ElseIf WarScoreNew.GetValue() < -5 && WarScoreNew.GetValue() >= -10
        PossibleReparationsGuest.SetValue(4000)
    ElseIf WarScoreNew.GetValue() < -10 && WarScoreNew.GetValue() >= -15
        PossibleReparationsGuest.SetValue(5000)
    ElseIf WarScoreNew.GetValue() < -15 && WarScoreNew.GetValue() >= -20
        PossibleReparationsGuest.SetValue(6000)
    ElseIf WarScoreNew.GetValue() < -20 && WarScoreNew.GetValue() >= -25
        PossibleReparationsGuest.SetValue(7000)
    ElseIf WarScoreNew.GetValue() < -25 && WarScoreNew.GetValue() >= -30
        PossibleReparationsGuest.SetValue(8000)
    ElseIf WarScoreNew.GetValue() < -30 && WarScoreNew.GetValue() >= -35
        PossibleReparationsGuest.SetValue(9000)
    ElseIf WarScoreNew.GetValue() < -35
        PossibleReparationsGuest.SetValue(10000)
    EndIf
    UpdateCurrentInstanceGlobal(PossibleReparationsGuest)
EndFunction

Function ClearVariables()
    Reparations.SetValue(0)
    PossibleReparations.SetValue(0)
    PossibleReparationsGuest.SetValue(0)
    WarScore.SetValue(0)
    WarScoreNew.SetValue(0)
    GuestNum.SetValue(0)
EndFunction

Function StartTerms()
    If FirstConcessionCity.GetLocation() != None
        if FirstConcessionCity.GetLocation().HasKeyword(LocTypeCity) || FirstConcessionCity.GetLocation().HasKeyword(LocTypeTown)
            CS_StoryTransferHoldingCity.SendStoryEvent(aiValue1 = AllLocations.Find(FirstConcessionCity.GetLocation()), aiValue2 = 69)
        else
            CS_StoryTransferHoldingFort.SendStoryEvent(aiValue1 = AllFortLocations.Find(FirstConcessionCity.GetLocation()), aiValue2 = 1)
        endif
    endIf
    If FirstConcessionCounter.GetLocation() != None
        if GuestLeader.GetActorRef() == Ulfric
            if FirstConcessionCounter.GetLocation().HasKeyword(LocTypeCity) || FirstConcessionCounter.GetLocation().HasKeyword(LocTypeTown)
                CS_StoryTransferHoldingCity.SendStoryEvent(aiValue1 = AllLocations.Find(FirstConcessionCounter.GetLocation()), aiValue2 = 12)
            else
                CS_StoryTransferHoldingFort.SendStoryEvent(aiValue1 = AllFortLocations.Find(FirstConcessionCounter.GetLocation()), aiValue2 = 12)
            endif
        elseif GuestLeader.GetActorRef() == Tullius
            if FirstConcessionCounter.GetLocation().HasKeyword(LocTypeCity) || FirstConcessionCounter.GetLocation().HasKeyword(LocTypeTown)
                CS_StoryTransferHoldingCity.SendStoryEvent(aiValue1 = AllLocations.Find(FirstConcessionCounter.GetLocation()), aiValue2 = 11)
            else
                CS_StoryTransferHoldingFort.SendStoryEvent(aiValue1 = AllFortLocations.Find(FirstConcessionCounter.GetLocation()), aiValue2 = 11)
            endif
        endif
    endIf
    If GuestLeader.GetActorRef() == Ulfric
        TMSons.StopWar()
        WarScoreSons.SetValue(0)
        TruceSons.SetValue(GameDaysPassed.GetValue() + 14)
        If Reparations.GetValue() != 0
            (EconomyUpdater as CS_EconomyVariableFunctions).StartReparations(Reparations.GetValue() as int, 2)
        EndIf
    ElseIf GuestLeader.GetActorRef() == Tullius
        TMImp.StopWar()
        WarScoreImp.SetValue(0)
        TruceImp.SetValue(GameDaysPassed.GetValue() + 14)
        If Reparations.GetValue() != 0
            (EconomyUpdater as CS_EconomyVariableFunctions).StartReparations(Reparations.GetValue() as int, 1)
        EndIf
    EndIf
EndFunction

Function ReAddToFactions()
    If GuestLeader.GetActorRef() == Ulfric
        GuestLeader.GetActorRef().AddToFaction(CWSonsFaction)
        GuestLeader.GetActorRef().AddToFaction(CWSonsFactionNPC)
        GuestASIC.GetActorRef().AddToFaction(CWSonsFaction)
        GuestASIC.GetActorRef().AddToFaction(CWSonsFactionNPC)
    ElseIf GuestLeader.GetActorRef() == Tullius
        GuestLeader.GetActorRef().AddToFaction(CWImperialFaction)
        GuestLeader.GetActorRef().AddToFaction(CWImperialFactionNPC)
        GuestASIC.GetActorRef().AddToFaction(CWImperialFaction)
        GuestASIC.GetActorRef().AddToFaction(CWImperialFactionNPC)
    EndIf
EndFunction

Event OnUpdateGameTime()
    If Math.Floor(GameDaysPassed.GetValue()) == NegotiationDay && GetStage() == 0
        SetStage(5)
    ElseIf Math.Floor(GameDaysPassed.GetValue()) > NegotiationDay
        If Game.GetPlayer().IsInLocation(Palace.GetLocation()) == 0
            SetStage(101)
        EndIf
    EndIf
EndEvent

Scene Property HostStartScene  Auto  

Scene Property HostProposal1Scene  Auto  

FormList Property TroopCounts  Auto  

Scene Property HostProposal1ExplanationScene  Auto  

Scene Property HostProposal1FinalDecisionScene  Auto  

Scene Property HostProposal1Explanation2Scene  Auto  

Scene Property HostProposal1Explanation3Scene  Auto  

LocationAlias Property GuestCity  Auto  

LocationAlias Property Palace Auto

LocationAlias Property CityMajor  Auto  

LocationAlias Property CityMinor  Auto  

LocationAlias Property Fort  Auto  

Keyword Property LocTypeCity  Auto  

Keyword Property LocTypeTown  Auto  

Actor Property Tullius  Auto  

Actor Property Ulfric  Auto  

Scene Property PeaceTalkStart  Auto  

FormList Property AllLocations  Auto  

LocationAlias Property FirstConcessionCity  Auto  

Scene Property FirstConcessionPlayerScene  Auto  

Scene Property PeaceStartPlayerScene  Auto  

LocationAlias Property FirstConcessionCounter  Auto  

FormList Property AllFortLocations  Auto  

Scene Property SecondConcessionPlayerScene  Auto  

Scene Property SecondConcessionPlayerStartScene  Auto  

LocationAlias Property LostCityImp  Auto  

LocationAlias Property LostCitySons  Auto  

Quest Property WarQuestImp  Auto  

Quest Property WarQuestSons  Auto  

Scene Property PeaceTalkEnd  Auto  

Quest Property EconomyUpdater  Auto  

GlobalVariable Property PossibleReparations  Auto  

GlobalVariable Property PossibleReparationsGuest  Auto  
