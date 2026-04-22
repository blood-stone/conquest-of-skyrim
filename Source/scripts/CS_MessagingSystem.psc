Scriptname CS_MessagingSystem extends Quest  

Faction Property GovImperial Auto
Faction Property GovSons Auto

FormList Property AllLocations  Auto  
FormList Property TroopCounts Auto

Quest Property AttackCity Auto
Quest Property AttackMinorCity Auto

ReferenceAlias Property MessagingPerson  Auto  

Keyword Property CS_StoryNegotiation Auto

LocationAlias Property MessagingCity  Auto  
LocationAlias Property CityMajor Auto
LocationAlias Property CityMinor Auto

GlobalVariable Property ResponseType Auto
GlobalVariable Property OfferGlobal Auto
GlobalVariable Property MessageSuccess Auto

Function SelectLeader(int citynum)
    if citynum == 100
        MessagingPerson.ForceRefTo(Tullius)
    elseif citynum == 200
        MessagingPerson.ForceRefTo(Ulfric)
    else
        MessagingPerson.ForceRefTo(Jarls[citynum].GetActorRef())
        MessagingCity.ForceLocationTo(AllLocations.GetAt(citynum) as Location)
    endif
EndFunction

Function SendMessage(int messagetype, int offernum)
    ResponseType.SetValue(messagetype)
    OfferGlobal.SetValue(offernum)
    RegisterForSingleUpdateGameTime(12)
EndFunction

bool Function CalculateMessageSuccess(int offernum)
    int chance = 25
    If MessagingPerson.GetActorRef().GetRelationshipRank(Game.GetPlayer()) > 0
        chance += 25
    ElseIf MessagingPerson.GetActorRef().GetRelationshipRank(Game.GetPlayer()) < 0
        chance -= 25
    EndIf
    If offernum == 1
        If MessagingPerson.GetActorRef().IsInFaction(GovSons) == 1
            chance += 50
        ElseIf MessagingPerson.GetActorRef().IsInFaction(GovImperial) == 1
            chance -= 25
        EndIf
    ElseIf offernum == 2
        int totaltroopcount = 0
        int i = 0
        while i < TroopCounts.GetSize()
            totaltroopcount += (TroopCounts.GetAt(i) as GlobalVariable).GetValue() as int
            i += 1
        endwhile
        If totaltroopcount < 80
            chance -= 25
        Else
            chance += 25
        EndIf
    ElseIf offernum == 3
        If MessagingPerson.GetActorRef().IsInFaction(GovSons) == 1
            chance -= 25
        ElseIf MessagingPerson.GetActorRef().IsInFaction(GovImperial) == 1
            chance += 50
        EndIf
    ElseIf offernum == 4
        int totaltroopcount = 0
        int i = 0
        while i < TroopCounts.GetSize()
            totaltroopcount += (TroopCounts.GetAt(i) as GlobalVariable).GetValue() as int
            i += 1
        endwhile
        If totaltroopcount < 80
            chance -= 25
        Else
            chance += 25
        EndIf
    EndIf
    int rollnum = utility.randomint(0, 100)
    if chance >= rollnum
        return 1
    else
        return 0
    endif
EndFunction

Function GiveCity()
    int i = 0
    while i < Jarls.Length
        if MessagingPerson.GetActorRef() == Jarls[i].GetActorRef()
            if i < 5
                AttackCity.Start()
                CityMajor.ForceLocationTo(MessagingCity.GetLocation())
                AttackCity.SetStage(50)
            else
                AttackMinorCity.Start()
                CityMinor.ForceLocationTo(MessagingCity.GetLocation())
                AttackMinorCity.SetStage(50)
            endif
        endif
        i += 1
    endwhile
EndFunction

Function ClearValues()
    ResponseType.SetValue(0)
    OfferGlobal.SetValue(0)
    MessageSuccess.SetValue(0)
    MessagingPerson.Clear()
    MessagingCity.Clear()
EndFunction

Function StartNegotiationQuest(int factionnum)
    if factionnum == 1
        CS_StoryNegotiation.SendStoryEvent(AllPalaces.GetAt(CapitalNum.GetValue() as int) as Location, akRef1 = Tullius, akRef2 = Rikke)
    elseif factionnum == 2
        CS_StoryNegotiation.SendStoryEvent(AllPalaces.GetAt(CapitalNum.GetValue() as int) as Location, akRef1 = Ulfric, akRef2 = Galmar)
    endif
EndFunction

Function SetUpCapitalPalace()
    Palace.ForceLocationTo(AllPalaces.GetAt(CapitalNum.GetValue() as int) as Location)
EndFunction

Function AssignPeaceAliases(int factionnum)
    If factionnum == 1
        GuestLeader.ForceRefTo(Tullius)
        GuestASIC.ForceRefTo(Rikke)
    ElseIf factionnum == 2
        GuestLeader.ForceRefTo(Ulfric)
        GuestASIC.ForceRefTo(Galmar)
    EndIf
    (GuestLeader.GetOwningQuest() as CS_NegotiationScript).MakeFriends()
EndFunction

Event OnUpdateGameTime()
    if ResponseType.GetValue() == 1
        if CalculateMessageSuccess(OfferGlobal.GetValue() as int) == 1
            MessageSuccess.SetValue(1)
        else
            MessageSuccess.SetValue(-1)
        endif
    endif
    Steward.GetActorRef().EvaluatePackage()
EndEvent    
ReferenceAlias[] Property Jarls  Auto  

ReferenceAlias Property Steward  Auto  

LocationAlias Property Palace  Auto  

FormList Property AllPalaces  Auto  

GlobalVariable Property CapitalNum  Auto  

ReferenceAlias Property GuestLeader  Auto  

ReferenceAlias Property GuestASIC  Auto  

ReferenceAlias Property GuestSteward  Auto  

Actor Property Galmar  Auto  

Actor Property Ulfric  Auto  

Actor Property Tullius  Auto  

Actor Property Rikke  Auto  
