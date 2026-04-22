Scriptname CS_PrisonerQuestScript extends Quest  conditional

int Property PlayerPrisonersTroopImp Auto Conditional
int Property PlayerPrisonersTroopSons Auto Conditional
int Property PlayerPrisonersCommanderImp Auto conditional
int Property PlayerPrisonersCommanderSons Auto conditional
int Property PlayerPrisonersCivilian Auto conditional
int Property PlayerPrisonersTotal Auto conditional

FormList Property PlayerPrisonersListTroopImp Auto
FormList Property PlayerPrisonersListTroopSons Auto
FormList Property PlayerPrisonersListCommanderImp Auto
FormList Property PlayerPrisonersListCommanderSons Auto
FormList Property PlayerPrisonersListCivilian Auto
FormList Property FortPrisonersAll Auto
FormList Property PrisonersASICTroopImp Auto
FormList Property PrisonersASICTroopSons Auto
FormList Property PrisonersASICCommanderImp Auto
FormList Property PrisonersASICCommanderSons Auto
FormList Property PrisonersASICCivilian Auto

int[] Property FortPrisonersTroopImp Auto conditional
int[] Property FortPrisonersTroopSons Auto conditional
int[] Property FortPrisonersCommanderImp Auto conditional
int[] Property FortPrisonersCommanderSons Auto conditional
int[] Property FortPrisonersCivilian Auto conditional
int Property FortPrisonersTotal Auto conditional
int Property CityPrisonersTotal Auto conditional
int Property ASICPrisonersTotal Auto conditional

bool Property CivPrisoner01 Auto Conditional
bool Property CivPrisoner02 Auto Conditional
bool Property CivPrisoner03 Auto Conditional
bool Property CivPrisoner04 Auto Conditional
bool Property CivPrisoner05 Auto Conditional
bool Property CivPrisoner06 Auto Conditional
bool Property CivPrisoner07 Auto Conditional
bool Property CivPrisoner08 Auto Conditional
bool Property CivPrisoner09 Auto Conditional
bool Property CivPrisoner10 Auto Conditional
bool Property CivPrisoner11 Auto Conditional
bool Property CivPrisoner12 Auto Conditional
bool Property CivPrisoner13 Auto Conditional
bool Property CivPrisoner14 Auto Conditional
bool Property CivPrisoner15 Auto Conditional
bool Property CivPrisoner16 Auto Conditional
bool Property CivPrisoner17 Auto Conditional
bool Property CivPrisoner18 Auto Conditional
bool Property CivPrisoner19 Auto Conditional
bool Property CivPrisoner20 Auto Conditional

GlobalVariable Property PrisonersTroopImp Auto
GlobalVariable Property PrisonersTroopSons Auto
GlobalVariable Property PrisonersCommandersImp Auto
GlobalVariable Property PrisonersCommandersSons Auto
GlobalVariable Property PrisonersCivilian Auto
GlobalVariable Property PrisonersTotal Auto

Faction Property PrisonerPlayerFaction Auto
Faction Property PrisonerFortFaction Auto
Faction Property PrisonerCityFaction Auto
Faction Property POWFaction Auto
Faction Property PrisonerFaction Auto
Faction Property RetreatFaction Auto
Faction Property PrisonerASICFaction Auto

FormList Property AllLocations Auto
FormList Property AllFortLocations Auto
FormList Property PrisonerFortFactions Auto
FormList Property PrisonerCityFactions Auto

LocationAlias Property PrisonLoc Auto

Location Property YourLoc Auto
Location Property ASICLoc Auto

ObjectReference Property NoneObject Auto
ObjectReference Property RemovalSpot Auto

MiscObject Property Gold001 Auto

ReferenceAlias[] Property AllPrisoners Auto
ReferenceAlias[] Property Civilians Auto
Actor[] Property AllPrisonerActors Auto

ActorBase Property ImperialSoldier Auto
ActorBase Property ImperialArcher Auto
ActorBase Property ImperialCommander Auto

ActorBase Property SonsSoldier Auto
ActorBase Property SonsArcher Auto
ActorBase Property SonsCommander Auto

Message Property PrisonerMenuStart Auto
Message Property PrisonerMenuCityStart Auto
Message Property PrisonerMenuDeliver Auto
Message Property PrisonerMenuDeliverCivilian01 Auto
Message Property PrisonerMenuDeliverCivilian02 Auto
Message Property PrisonerMenuDeliverCivilianCity01 Auto
Message Property PrisonerMenuDeliverCivilianCity02 Auto
Message Property PrisonerMenuTake Auto
Message Property PrisonerMenuTakeCity Auto
Message Property PrisonerMenuTakeCivilian01 Auto
Message Property PrisonerMenuTakeCivilian02 Auto
Message Property PrisonerMenuTakeCivilian03 Auto
Message Property PrisonerMenuTakeCivilian04 Auto
Message Property PrisonerMenuRansom Auto
Message Property PrisonerMenuRansomCivilian01 Auto
Message Property PrisonerMenuRansomCivilian02 Auto
Message Property PrisonerMenuRansomCivilian03 Auto
Message Property PrisonerMenuRansomCivilian04 Auto

Armor Property PrisonerCuffs Auto

ReferenceAlias Property NameClearer Auto

CS_FortCommandersScript Property FortCommanders Auto
CS_EconomyVariableFunctions Property EconomyScript Auto
CS_PrisonScript Property PrisonScript Auto
CS_CourtScript Property CourtScript Auto

int Property holdnum Auto
string Property type Auto

Function SetUpMenu()
    if PlayerPrisonersTroopImp < 0
        PlayerPrisonersTroopImp = 0
    endif

    if PlayerPrisonersTroopSons < 0
        PlayerPrisonersTroopSons = 0
    endif

    if PlayerPrisonersCommanderImp < 0
        PlayerPrisonersCommanderImp = 0
    endif

    if PlayerPrisonersCommanderSons < 0
        PlayerPrisonersCommanderSons = 0
    endif

    PlayerPrisonersTotal = PlayerPrisonersTroopImp + PlayerPrisonersTroopSons + PlayerPrisonersCommanderImp + PlayerPrisonersCommanderSons + PlayerPrisonersCivilian 
    if type == "Fort"
        PrisonLoc.ForceLocationTo(AllFortLocations.GetAt(holdnum) as Location)

        if FortPrisonersTroopImp[holdnum] < 0
            FortPrisonersTroopImp[holdnum] = 0
        endif   

        if FortPrisonersTroopSons[holdnum] < 0
            FortPrisonersTroopSons[holdnum] = 0
        endif

        if FortPrisonersCommanderImp[holdnum] < 0
            FortPrisonersCommanderImp[holdnum] = 0
        endif

        if FortPrisonersCommanderSons[holdnum] < 0
            FortPrisonersCommanderSons[holdnum] = 0
        endif

        FortPrisonersTotal = FortPrisonersTroopImp[holdnum] + FortPrisonersTroopSons[holdnum] + FortPrisonersCommanderImp[holdnum] + FortPrisonersCommanderSons[holdnum] + FortPrisonersCivilian[holdnum]
        PrisonersTroopImp.SetValue(FortPrisonersTroopImp[holdnum])
        UpdateCurrentInstanceGlobal(PrisonersTroopImp)
        PrisonersTroopSons.SetValue(FortPrisonersTroopSons[holdnum])
        UpdateCurrentInstanceGlobal(PrisonersTroopSons)
        PrisonersCommandersImp.SetValue(FortPrisonersCommanderImp[holdnum])
        UpdateCurrentInstanceGlobal(PrisonersCommandersImp)
        PrisonersCommandersSons.SetValue(FortPrisonersCommanderSons[holdnum])
        UpdateCurrentInstanceGlobal(PrisonersCommandersSons)
        PrisonersCivilian.SetValue(FortPrisonersCivilian[holdnum])
        UpdateCurrentInstanceGlobal(PrisonersCivilian)
        PrisonersTotal.SetValue(FortPrisonersTotal)
        UpdateCurrentInstanceGlobal(PrisonersTotal)
    elseif type == "City"
        PrisonLoc.ForceLocationTo(AllLocations.GetAt(holdnum) as Location)
    elseif type == "ASIC"
        PrisonLoc.ForceLocationTo(ASICLoc)
        ASICPrisonersTotal = PrisonersASICTroopImp.GetSize() + PrisonersASICTroopSons.GetSize() + PrisonersASICCommanderImp.GetSize() + PrisonersASICCommanderSons.GetSize() + PrisonersASICCivilian.GetSize()
        PrisonersTroopImp.SetValue(PrisonersASICTroopImp.GetSize())
        UpdateCurrentInstanceGlobal(PrisonersTroopImp)
        PrisonersTroopSons.SetValue(PrisonersASICTroopSons.GetSize())
        UpdateCurrentInstanceGlobal(PrisonersTroopSons)
        PrisonersCommandersImp.SetValue(PrisonersASICCommanderImp.GetSize())
        UpdateCurrentInstanceGlobal(PrisonersCommandersImp)
        PrisonersCommandersSons.SetValue(PrisonersASICCommanderSons.GetSize())
        UpdateCurrentInstanceGlobal(PrisonersCommandersSons)
        PrisonersCivilian.SetValue(PrisonersASICCivilian.GetSize())
        UpdateCurrentInstanceGlobal(PrisonersCivilian)
        PrisonersTotal.SetValue(ASICPrisonersTotal)
        UpdateCurrentInstanceGlobal(PrisonersTotal)
    endif
EndFunction

Function SetUpPlayerGlobals()
    PrisonersTroopImp.SetValue(PlayerPrisonersTroopImp)
    UpdateCurrentInstanceGlobal(PrisonersTroopImp)
    PrisonersTroopSons.SetValue(PlayerPrisonersTroopSons)
    UpdateCurrentInstanceGlobal(PrisonersTroopSons)
    PrisonersCommandersImp.SetValue(PlayerPrisonersCommanderImp)
    UpdateCurrentInstanceGlobal(PrisonersCommandersImp)
    PrisonersCommandersSons.SetValue(PlayerPrisonersCommanderSons)
    UpdateCurrentInstanceGlobal(PrisonersCommandersSons)
    PrisonersCivilian.SetValue(PlayerPrisonersCivilian)
    UpdateCurrentInstanceGlobal(PrisonersCivilian)
EndFunction

Function SetUpCivilianMenu(string transfertype)
    if transfertype == "Deliver"
        int i = 0
        while i < Civilians.Length
            if (PlayerPrisonersListCivilian.GetAt(i) as Actor)
                Civilians[i].ForceRefTo(PlayerPrisonersListCivilian.GetAt(i) as Actor)
            else
                Civilians[i].ForceRefTo(NoneObject)
            endif
            i += 1
        endwhile
    elseif transfertype == "Take"
        if type == "Fort"
            FormList FortPrisoners = FortPrisonersAll.GetAt(holdnum) as FormList
            int i = 0
            while i < Civilians.Length
                Civilians[i].ForceRefTo(NoneObject)
                i += 1
            endwhile
            i = 0
            int prisonernum = 0
            while prisonernum < FortPrisonersCivilian[holdnum] && i < FortPrisoners.GetSize()
                if !(FortPrisoners.GetAt(i) as Actor).IsInFaction(POWFaction)
                    Civilians[prisonernum].ForceRefTo(FortPrisoners.GetAt(i) as Actor)
                    prisonernum += 1
                endif
                i += 1
            endwhile
        elseif type == "City"
            ReferenceAlias[] PrisonerAliases
            if holdnum == 0
                PrisonerAliases = PrisonScript.PrisonersMarkarth
            elseif holdnum == 1
                PrisonerAliases = PrisonScript.PrisonersRiften
            elseif holdnum == 2
                PrisonerAliases = PrisonScript.PrisonersSolitude
            elseif holdnum == 3
                PrisonerAliases = PrisonScript.PrisonersWhiterun
            elseif holdnum == 4
                PrisonerAliases = PrisonScript.PrisonersWindhelm
            elseif holdnum == 5
                PrisonerAliases = PrisonScript.PrisonersDawnstar
            elseif holdnum == 6
                PrisonerAliases = PrisonScript.PrisonersFalkreath
            elseif holdnum == 7
                PrisonerAliases = PrisonScript.PrisonersMorthal
            elseif holdnum == 8
                PrisonerAliases = PrisonScript.PrisonersWinterhold
            endif

            int i = 0
            while i < Civilians.Length
                Civilians[i].ForceRefTo(NoneObject)
                i += 1
            endwhile

            i = 0
            int numprisoners = 0
            while i < PrisonerAliases.Length
                if PrisonerAliases[i].GetActorRef()
                    Civilians[numprisoners].ForceRefTo(PrisonerAliases[i].GetActorRef())
                    numprisoners += 1
                endif
                i += 1
            endwhile

            CityPrisonersTotal = numprisoners
            PrisonersTotal.SetValue(numprisoners)
            UpdateCurrentInstanceGlobal(PrisonersTotal)

        endif
    endif
EndFunction

Function PrisonerMenu(string prisontype, int holdingnum, int Response = 0)
    holdnum = holdingnum
    type = prisontype
    SetUpMenu()
    if type == "City"
        SetUpCivilianMenu("Take")
        Response = PrisonerMenuCityStart.show()
        if Response == 0
            DeliverCivilianCityMenu01()
        elseif Response == 1
            TakeCivilianCityMenu()
        endif
    else
        Response = PrisonerMenuStart.show()
        if Response == 0
            DeliverMenu()
        elseif Response == 1
            TakeMenu()
        elseif Response == 2
            RansomMenu()
        endif
    endif
EndFunction

Function DeliverMenu(int Response = 0)
    SetUpPlayerGlobals()
    if type == "Fort"
        PrisonersTotal.SetValue(FortPrisonersTotal)
        UpdateCurrentInstanceGlobal(PrisonersTotal)
    endif
    Response = PrisonerMenuDeliver.show()
    if Response == 0
        int prisonernum = 0
        bool foundprisoner = false
        while prisonernum < PlayerPrisonersListTroopImp.GetSize() && foundprisoner == false
            if PlayerPrisonersListTroopImp.GetAt(prisonernum) as Actor != None
                Actor Prisoner = PlayerPrisonersListTroopImp.GetAt(prisonernum) as Actor
                TransferPrisonerFromParty(Prisoner, "Troop", 11)
                foundprisoner = true
            endif
            prisonernum += 1
        endwhile
        DeliverMenu()
    elseif Response == 1
        int prisonernum = 0
        bool foundprisoner = false
        while prisonernum < PlayerPrisonersListTroopSons.GetSize() && foundprisoner == false
            if PlayerPrisonersListTroopSons.GetAt(prisonernum) as Actor != None
                Actor Prisoner = PlayerPrisonersListTroopSons.GetAt(prisonernum) as Actor
                TransferPrisonerFromParty(Prisoner, "Troop", 12)
                foundprisoner = true
            endif
            prisonernum += 1
        endwhile
        DeliverMenu()
    elseif Response == 2
        int prisonernum = 0
        bool foundprisoner = false
        while prisonernum < PlayerPrisonersListCommanderImp.GetSize() && foundprisoner == false
            if PlayerPrisonersListCommanderImp.GetAt(prisonernum) as Actor != None
                Actor Prisoner = PlayerPrisonersListCommanderImp.GetAt(prisonernum) as Actor
                TransferPrisonerFromParty(Prisoner, "Commander", 11)
                foundprisoner = true
            endif
            prisonernum += 1
        endwhile
        DeliverMenu()
    elseif Response == 3
        int prisonernum = 0
        bool foundprisoner = false
        while prisonernum < PlayerPrisonersListCommanderSons.GetSize() && foundprisoner == false
            if PlayerPrisonersListCommanderSons.GetAt(prisonernum) as Actor != None
                Actor Prisoner = PlayerPrisonersListCommanderSons.GetAt(prisonernum) as Actor
                TransferPrisonerFromParty(Prisoner, "Commander", 12)
                foundprisoner = true
            endif
            prisonernum += 1
        endwhile
        DeliverMenu()
    elseif Response == 4
        SetUpCivilianMenu("Deliver")
        DeliverCivilianMenu01()
    elseif Response == 5
        PrisonerMenu(type, holdnum)
    endif
EndFunction

Function DeliverCivilianMenu01(int Response = 0)
    if type == "Fort"
        PrisonersTotal.SetValue(FortPrisonersTotal)
        UpdateCurrentInstanceGlobal(PrisonersTotal)
    endif
    Response = PrisonerMenuDeliverCivilian01.show()
    if Response <= 4
        if Civilians[Response].GetActorRef() != None
            TransferPrisonerFromParty(Civilians[Response].GetActorRef())
            Civilians[Response].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        DeliverCivilianMenu01()
    elseif Response == 5
        DeliverCivilianMenu02()
    elseif Response == 6
        DeliverMenu()
    endif
EndFunction

Function DeliverCivilianMenu02(int Response = 0)
    if type == "Fort"
        PrisonersTotal.SetValue(FortPrisonersTotal)
        UpdateCurrentInstanceGlobal(PrisonersTotal)
    endif
    Response = PrisonerMenuDeliverCivilian02.show()
    if Response == 0
        DeliverCivilianMenu01()
    elseif Response > 0 && Response <= 5
        if Civilians[Response + 4].GetActorRef() != None
            TransferPrisonerFromParty(Civilians[Response + 4].GetActorRef())
            Civilians[Response + 4].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        DeliverCivilianMenu02()
    elseif Response == 6
        DeliverMenu()
    endif
EndFunction

Function DeliverCivilianCityMenu01(int Response = 0)
    SetUpCivilianMenu("Deliver")
    PrisonersTotal.SetValue(CityPrisonersTotal)
    UpdateCurrentInstanceGlobal(PrisonersTotal)
    Response = PrisonerMenuDeliverCivilianCity01.show()
    if Response <= 4
        if Civilians[Response].GetActorRef() != None
            TransferPrisonerFromParty(Civilians[Response].GetActorRef())
            Civilians[Response].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        DeliverCivilianCityMenu01()
    elseif Response == 5
        DeliverCivilianCityMenu02()
    elseif Response == 6
        PrisonerMenu("City", holdnum)
    endif
EndFunction

Function DeliverCivilianCityMenu02(int Response = 0)
    SetUpCivilianMenu("Deliver")
    PrisonersTotal.SetValue(CityPrisonersTotal)
    UpdateCurrentInstanceGlobal(PrisonersTotal)
    Response = PrisonerMenuDeliverCivilianCity02.show()
    if Response == 0
        DeliverCivilianCityMenu01()
    elseif Response > 0 && Response <= 5
        if Civilians[Response + 4].GetActorRef() != None
            TransferPrisonerFromParty(Civilians[Response + 4].GetActorRef())
            Civilians[Response + 4].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        DeliverCivilianCityMenu02()
    elseif Response == 6
        PrisonerMenu("City", holdnum)
    endif
EndFunction

Function TakeMenu(int Response = 0)
    PrisonersTotal.SetValue(PlayerPrisonersTotal)
    UpdateCurrentInstanceGlobal(PrisonersTotal)
    Response = PrisonerMenuTake.show()
    if Response == 0
        TransferPrisonerToParty(GetPrisonerFromList("Troop", 11), "Troop", 11)
        TakeMenu()
    elseif Response == 1
        TransferPrisonerToParty(GetPrisonerFromList("Troop", 12), "Troop", 12)
        TakeMenu()
    elseif Response == 2
        TransferPrisonerToParty(GetPrisonerFromList("Commander", 11), "Commander", 11)
        TakeMenu()
    elseif Response == 3
        TransferPrisonerToParty(GetPrisonerFromList("Commander", 12), "Commander", 12)
        TakeMenu()
    elseif Response == 4
        SetUpCivilianMenu("Take")
        TakeCivilianMenu01()
    elseif Response == 5
        PrisonerMenu(type, holdnum)
    endif
EndFunction

Function TakeCivilianMenu01(int Response = 0)
    PrisonersTotal.SetValue(PlayerPrisonersTotal)
    UpdateCurrentInstanceGlobal(PrisonersTotal)
    Response = PrisonerMenuTakeCivilian01.show()
    if Response <= 4
        if Civilians[Response].GetActorRef() != None
            TransferPrisonerToParty(Civilians[Response].GetActorRef())
            Civilians[Response].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        TakeCivilianMenu01()
    elseif Response == 5
        TakeCivilianMenu02()
    elseif Response == 6
        TakeMenu()
    endif
EndFunction

Function TakeCivilianMenu02(int Response = 0)
    PrisonersTotal.SetValue(PlayerPrisonersTotal)
    UpdateCurrentInstanceGlobal(PrisonersTotal)
    Response = PrisonerMenuTakeCivilian02.show()
    if Response == 0
        TakeCivilianMenu01()
    elseif Response > 0 && Response <= 5
        if Civilians[Response + 4].GetActorRef() != None
            TransferPrisonerToParty(Civilians[Response + 4].GetActorRef())
            Civilians[Response + 4].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        TakeCivilianMenu02()
    elseif Response == 6
        TakeCivilianMenu03()
    elseif Response == 7
        TakeMenu()
    endif
EndFunction

Function TakeCivilianMenu03(int Response = 0)
    PrisonersTotal.SetValue(PlayerPrisonersTotal)
    UpdateCurrentInstanceGlobal(PrisonersTotal)
    Response = PrisonerMenuTakeCivilian03.show()
    if Response == 0
        TakeCivilianMenu02()
    elseif Response > 0 && Response <= 5
        if Civilians[Response + 9].GetActorRef() != None
            TransferPrisonerToParty(Civilians[Response + 9].GetActorRef())
            Civilians[Response + 9].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        TakeCivilianMenu03()
    elseif Response == 6
        TakeCivilianMenu04()
    elseif Response == 7
        TakeMenu()
    endif
EndFunction

Function TakeCivilianMenu04(int Response = 0)
    PrisonersTotal.SetValue(PlayerPrisonersTotal)
    UpdateCurrentInstanceGlobal(PrisonersTotal)
    Response = PrisonerMenuTakeCivilian04.show()
    if Response == 0
        TakeCivilianMenu03()
    elseif Response > 0 && Response <= 5
        if Civilians[Response + 14].GetActorRef() != None
            TransferPrisonerToParty(Civilians[Response + 14].GetActorRef())
            Civilians[Response + 14].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        TakeCivilianMenu04()
    elseif Response == 6
        TakeMenu()
    endif
EndFunction

Function TakeCivilianCityMenu(int Response = 0)
    PrisonersTotal.SetValue(PlayerPrisonersTotal)
    UpdateCurrentInstanceGlobal(PrisonersTotal)
    Response = PrisonerMenuTakeCity.show()
    if Response <= 5
        if Civilians[Response].GetActorRef() != None
            TransferPrisonerToParty(Civilians[Response].GetActorRef())
            Civilians[Response].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        TakeCivilianCityMenu()
    elseif Response == 6
        PrisonerMenu("City", holdnum)
    endif
EndFunction

Function RansomMenu(int Response = 0, bool ASICMenu = false)
    if ASICMenu
        type = "Player"
        PrisonLoc.ForceLocationTo(YourLoc)
        SetUpPlayerGlobals()
    endif
    Response = PrisonerMenuRansom.show()
    if Response == 0
        RansomPrisoner(GetPrisonerFromList("Troop", 11), "Troop", 11)
        RansomMenu(ASICMenu = ASICMenu)
    elseif Response == 1
        RansomPrisoner(GetPrisonerFromList("Troop", 12), "Troop", 12)
        RansomMenu(ASICMenu = ASICMenu)
    elseif Response == 2
        RansomPrisoner(GetPrisonerFromList("Commander", 11), "Commander", 11)
        RansomMenu(ASICMenu = ASICMenu)
    elseif Response == 3
        RansomPrisoner(GetPrisonerFromList("Commander", 12), "Commander", 12)
        RansomMenu(ASICMenu = ASICMenu)
    elseif Response == 4
        SetUpCivilianMenu("Take")
        RansomCivilianMenu01(ASICMenu = ASICMenu)
    elseif Response == 5; && ASICMenu
        PrisonerMenu(type, holdnum)
    endif
EndFunction

Function RansomCivilianMenu01(int Response = 0, bool ASICMenu)
    Response = PrisonerMenuRansomCivilian01.show()
    if Response <= 4
        if Civilians[Response].GetActorRef() != None
            RansomPrisoner(Civilians[Response].GetActorRef())
            Civilians[Response].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        RansomCivilianMenu01(ASICMenu = ASICMenu)
    elseif Response == 5
        RansomCivilianMenu02(ASICMenu = ASICMenu)
    elseif Response == 6
        RansomMenu(ASICMenu = ASICMenu)
    endif
EndFunction

Function RansomCivilianMenu02(int Response = 0, bool ASICMenu)
    Response = PrisonerMenuRansomCivilian02.show()
    if Response == 0
        RansomCivilianMenu01(ASICMenu = ASICMenu)
    elseif Response > 0 && Response <= 5
        if Civilians[Response + 4].GetActorRef() != None
            RansomPrisoner(Civilians[Response + 4].GetActorRef())
            Civilians[Response + 4].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        RansomCivilianMenu02(ASICMenu = ASICMenu)
    elseif Response == 6
        RansomCivilianMenu03(ASICMenu = ASICMenu)
    elseif Response == 7
        RansomMenu(ASICMenu = ASICMenu)
    endif
EndFunction

Function RansomCivilianMenu03(int Response = 0, bool ASICMenu)
    Response = PrisonerMenuRansomCivilian03.show()
    if Response == 0
        RansomCivilianMenu02(ASICMenu = ASICMenu)
    elseif Response > 0 && Response <= 5
        if Civilians[Response + 9].GetActorRef() != None
            RansomPrisoner(Civilians[Response + 9].GetActorRef())
            Civilians[Response + 9].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        RansomCivilianMenu03(ASICMenu = ASICMenu)
    elseif Response == 6
        RansomCivilianMenu04(ASICMenu = ASICMenu)
    elseif Response == 7
        RansomMenu(ASICMenu = ASICMenu)
    endif
EndFunction

Function RansomCivilianMenu04(int Response = 0, bool ASICMenu)
    Response = PrisonerMenuRansomCivilian04.show()
    if Response == 0
        RansomCivilianMenu03(ASICMenu = ASICMenu)
    elseif Response > 0 && Response <= 5
        if Civilians[Response + 14].GetActorRef() != None
            RansomPrisoner(Civilians[Response + 14].GetActorRef())
            Civilians[Response + 14].ForceRefTo(NoneObject)
        else
            debug.notification("No prisoner in this slot!")
        endif
        RansomCivilianMenu04(ASICMenu = ASICMenu)
    elseif Response == 6
        RansomMenu(ASICMenu = ASICMenu)
    endif
EndFunction

Actor Function GetPrisonerFromList(string prisonertype, int factionnum)
    Actor ReturnedTroop
    if type == "Fort"
        FormList FortPrisoners = FortPrisonersAll.GetAt(holdnum) as FormList
        if prisonertype == "Troop"
            if factionnum == 11
                int i = 0
                bool prisonerfound = false
                while i < FortPrisoners.GetSize() && prisonerfound == false
                    if (FortPrisoners.GetAt(i) as Actor).GetActorBase() == ImperialSoldier || (FortPrisoners.GetAt(i) as Actor).GetActorBase() == ImperialArcher
                        prisonerfound = true
                        ReturnedTroop = (FortPrisoners.GetAt(i) as Actor)
                    endif
                    i += 1
                endwhile
            elseif factionnum == 12
                int i = 0
                bool prisonerfound = false
                while i < FortPrisoners.GetSize() && prisonerfound == false
                    if (FortPrisoners.GetAt(i) as Actor).GetActorBase() == SonsSoldier || (FortPrisoners.GetAt(i) as Actor).GetActorBase() == SonsArcher
                        prisonerfound = true
                        ReturnedTroop = (FortPrisoners.GetAt(i) as Actor)
                    endif
                    i += 1
                endwhile
            endif
        elseif prisonertype == "Commander"
            if factionnum == 11
                int i = 0
                bool prisonerfound = false
                while i < FortPrisoners.GetSize() && prisonerfound == false
                    if (FortPrisoners.GetAt(i) as Actor).GetActorBase() == ImperialCommander
                        prisonerfound = true
                        ReturnedTroop = (FortPrisoners.GetAt(i) as Actor)
                    endif
                    i += 1
                endwhile
            elseif factionnum == 12
                int i = 0
                bool prisonerfound = false
                while i < FortPrisoners.GetSize() && prisonerfound == false
                    if (FortPrisoners.GetAt(i) as Actor).GetActorBase() == SonsCommander
                        prisonerfound = true
                        ReturnedTroop = (FortPrisoners.GetAt(i) as Actor)
                    endif
                    i += 1
                endwhile
            endif
        endif
    elseif type == "Player"
        if prisonertype == "Troop"
            if factionnum == 11
                int randomtroopnum = utility.randomint(0, PlayerPrisonersListTroopImp.GetSize() - 1)
                ReturnedTroop = (PlayerPrisonersListTroopImp.GetAt(randomtroopnum) as Actor)
            elseif factionnum == 12
                int randomtroopnum = utility.randomint(0, PlayerPrisonersListTroopSons.GetSize() - 1)
                ReturnedTroop = (PlayerPrisonersListTroopSons.GetAt(randomtroopnum) as Actor)
            endif
        elseif prisonertype == "Commander"
            if factionnum == 11
                int randomtroopnum = utility.randomint(0, PlayerPrisonersListCommanderImp.GetSize() - 1)
                ReturnedTroop = (PlayerPrisonersListCommanderImp.GetAt(randomtroopnum) as Actor)
            elseif factionnum == 12
                int randomtroopnum = utility.randomint(0, PlayerPrisonersListCommanderSons.GetSize() - 1)
                ReturnedTroop = (PlayerPrisonersListCommanderSons.GetAt(randomtroopnum) as Actor)
            endif
        endif
    elseif type == "ASIC"
        if prisonertype == "Troop"
            if factionnum == 11
                int randomtroopnum = utility.randomint(0, PrisonersASICTroopImp.GetSize() - 1)
                ReturnedTroop = (PrisonersASICTroopImp.GetAt(randomtroopnum) as Actor)
            elseif factionnum == 12
                int randomtroopnum = utility.randomint(0, PrisonersASICTroopSons.GetSize() - 1)
                ReturnedTroop = (PrisonersASICTroopSons.GetAt(randomtroopnum) as Actor)
            endif
        elseif prisonertype == "Commander"
            if factionnum == 11
                int randomtroopnum = utility.randomint(0, PrisonersASICCommanderImp.GetSize() - 1)
                ReturnedTroop = (PrisonersASICCommanderImp.GetAt(randomtroopnum) as Actor)
            elseif factionnum == 12
                int randomtroopnum = utility.randomint(0, PrisonersASICCommanderSons.GetSize() - 1)
                ReturnedTroop = (PrisonersASICCommanderSons.GetAt(randomtroopnum) as Actor)
            endif
        endif
    endif

    if ReturnedTroop == None
        debug.trace("Couldn't find " + prisonertype + " of factionnum " + factionnum)
    endif

    return ReturnedTroop
EndFunction

Function ClearPrisonerFactions(Actor Prisoner)
    if Prisoner.IsInFaction(PrisonerPlayerFaction)
        Prisoner.RemoveFromFaction(PrisonerPlayerFaction)
    endif
    
    if Prisoner.IsInFaction(PrisonerFortFaction)
        Prisoner.RemoveFromFaction(PrisonerFortFaction)
        int i = 0
        bool foundfaction = false
        while i < PrisonerFortFactions.GetSize() && foundfaction == false
            if Prisoner.IsInFaction(PrisonerFortFactions.GetAt(i) as Faction)
                (FortPrisonersAll.GetAt(i) as FormList).RemoveAddedForm(Prisoner)
                Prisoner.RemoveFromFaction(PrisonerFortFactions.GetAt(i) as Faction)
                foundfaction = true
            endif
            i += 1
        endwhile
    endif
    
    if Prisoner.IsInFaction(PrisonerCityFaction)
        Prisoner.RemoveFromFaction(PrisonerCityFaction)
        int i = 0
        bool foundfaction = false
        while i < PrisonerCityFactions.GetSize() && foundfaction == false
            if Prisoner.IsInFaction(PrisonerCityFactions.GetAt(i) as Faction)
                Prisoner.RemoveFromFaction(PrisonerCityFactions.GetAt(i) as Faction)
                foundfaction = true
            endif
            i += 1
        endwhile
    endif
    
    if Prisoner.IsInFaction(PrisonerASICFaction)
        Prisoner.RemoveFromFaction(PrisonerASICFaction)
    endif
EndFunction

Function FreePrisoner(Actor PrisonerPerson, string actortype = "Civilian", int factionnum = 0, string prisontype = "")

    if PrisonerPerson.GetActorBase() == ImperialCommander
        actortype = "Commander"
        factionnum = 11
    elseif PrisonerPerson.GetActorBase() == SonsCommander
        actortype = "Commander"
        factionnum = 12
    elseif PrisonerPerson.GetActorBase() == ImperialSoldier || PrisonerPerson.GetActorBase() == ImperialArcher
        actortype = "Troop"
        factionnum = 11
    elseif PrisonerPerson.GetActorBase() == SonsSoldier || PrisonerPerson.GetActorBase() == SonsArcher
        actortype = "Troop"
        factionnum = 12
    endif

    if PrisonerPerson.IsInFaction(PrisonerPlayerFaction)
        if !PrisonerPerson.IsInFaction(PrisonerASICFaction)
            type = "Player"
        else
            type == "ASIC"
        endif
    elseif PrisonerPerson.IsInFaction(PrisonerFortFaction)
        type = "Fort"
        int i = 0
        bool foundfaction = false
        while i < PrisonerFortFactions.GetSize() && foundfaction == false
            if PrisonerPerson.IsInFaction(PrisonerFortFactions.GetAt(i) as Faction)
                holdnum = i
                foundfaction = true
            endif
            i += 1
        endwhile
    elseif PrisonerPerson.IsInFaction(PrisonerCityFaction)
        type = "City"
        int i = 0
        bool foundfaction = false
        while i < PrisonerCityFactions.GetSize() && foundfaction == false
            if PrisonerPerson.IsInFaction(PrisonerCityFactions.GetAt(i) as Faction)
                holdnum = i
                foundfaction = true
            endif
            i += 1
        endwhile
    endif

    int finalprisonernum = -1

    if PrisonerPerson
        ClearPrisonerFactions(PrisonerPerson)
        PrisonerPerson.RemoveFromFaction(POWFaction)
        PrisonerPerson.SetGhost(false)
        PrisonerPerson.UnequipItem(PrisonerCuffs)
        PrisonerPerson.RemoveItem(PrisonerCuffs)
        NameClearer.ForceRefTo(PrisonerPerson)
        PrisonerPerson.AddToFaction(RetreatFaction)
        int prisonernum = 0
        bool foundprisoner
        while prisonernum < AllPrisoners.Length && !foundprisoner
            if AllPrisoners[prisonernum].GetActorRef() == PrisonerPerson
                foundprisoner = true
                finalprisonernum = prisonernum
            endif
            prisonernum += 1
        endwhile
    endif

    if type == "Fort"
        if actortype == "Troop"
            if factionnum == 11
                PrisonersTroopImp.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersTroopImp)
                FortPrisonersTroopImp[holdnum] = FortPrisonersTroopImp[holdnum] - 1
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    AllPrisoners[finalprisonernum].GetActorRef().disable()
                    AllPrisoners[finalprisonernum].GetActorRef().delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            elseif factionnum == 12
                PrisonersTroopSons.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersTroopSons)
                FortPrisonersTroopSons[holdnum] = FortPrisonersTroopSons[holdnum] - 1
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    (AllPrisoners[finalprisonernum].GetActorRef()).disable()
                    (AllPrisoners[finalprisonernum].GetActorRef()).delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            endif
            
        elseif actortype == "Commander"
            if factionnum == 11
                PrisonersCommandersImp.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersCommandersImp)
                FortPrisonersCommanderImp[holdnum] = FortPrisonersCommanderImp[holdnum] - 1
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    (AllPrisoners[finalprisonernum].GetActorRef()).disable()
                    (AllPrisoners[finalprisonernum].GetActorRef()).delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            elseif factionnum == 12
                PrisonersCommandersSons.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersCommandersSons)
                FortPrisonersCommanderSons[holdnum] = FortPrisonersCommanderSons[holdnum] - 1
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    (AllPrisoners[finalprisonernum].GetActorRef()).disable()
                    (AllPrisoners[finalprisonernum].GetActorRef()).delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            endif
        else
            FortPrisonersCivilian[holdnum] = FortPrisonersCivilian[holdnum] - 1
        endif
    elseif type == "Player"
        if actortype == "Troop"
            if factionnum == 11
                PrisonersTroopImp.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersTroopImp)
                PlayerPrisonersTroopImp = PlayerPrisonersTroopImp - 1
                PlayerPrisonersListTroopImp.RemoveAddedForm(PrisonerPerson)
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    (AllPrisoners[finalprisonernum].GetActorRef()).disable()
                    (AllPrisoners[finalprisonernum].GetActorRef()).delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            elseif factionnum == 12
                PrisonersTroopSons.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersTroopSons)
                PlayerPrisonersTroopSons = PlayerPrisonersTroopSons - 1
                PlayerPrisonersListTroopSons.RemoveAddedForm(PrisonerPerson)
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    (AllPrisoners[finalprisonernum].GetActorRef()).disable()
                    (AllPrisoners[finalprisonernum].GetActorRef()).delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            endif
            
        elseif actortype == "Commander"
            if factionnum == 11
                PrisonersCommandersImp.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersCommandersImp)
                PlayerPrisonersCommanderImp = PlayerPrisonersCommanderImp - 1
                PlayerPrisonersListCommanderImp.RemoveAddedForm(PrisonerPerson)
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    (AllPrisoners[finalprisonernum].GetActorRef()).disable()
                    (AllPrisoners[finalprisonernum].GetActorRef()).delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            elseif factionnum == 12
                PrisonersCommandersSons.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersCommandersSons)
                PlayerPrisonersCommanderSons = PlayerPrisonersCommanderSons - 1
                PlayerPrisonersListCommanderSons.RemoveAddedForm(PrisonerPerson)
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    (AllPrisoners[finalprisonernum].GetActorRef()).disable()
                    (AllPrisoners[finalprisonernum].GetActorRef()).delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            endif
        else
            PlayerPrisonersCivilian = PlayerPrisonersCivilian - 1
        endif
        PlayerPrisonersTotal -= 1
    elseif type == "ASIC"
        if actortype == "Troop"
            if factionnum == 11
                PrisonersTroopImp.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersTroopImp)
                PrisonersASICTroopImp.RemoveAddedForm(PrisonerPerson)
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    (AllPrisoners[finalprisonernum].GetActorRef()).disable()
                    (AllPrisoners[finalprisonernum].GetActorRef()).delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            elseif factionnum == 12
                PrisonersTroopSons.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersTroopSons)
                PrisonersASICTroopSons.RemoveAddedForm(PrisonerPerson)
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    (AllPrisoners[finalprisonernum].GetActorRef()).disable()
                    (AllPrisoners[finalprisonernum].GetActorRef()).delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            endif
            
        elseif actortype == "Commander"
            if factionnum == 11
                PrisonersCommandersImp.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersCommandersImp)
                PrisonersASICCommanderImp.RemoveAddedForm(PrisonerPerson)
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    (AllPrisoners[finalprisonernum].GetActorRef()).disable()
                    (AllPrisoners[finalprisonernum].GetActorRef()).delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            elseif factionnum == 12
                PrisonersCommandersSons.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersCommandersSons)
                PrisonersASICCommanderSons.RemoveAddedForm(PrisonerPerson)
                if !AllPrisoners[finalprisonernum].GetActorRef().Is3DLoaded()
                    (AllPrisoners[finalprisonernum].GetActorRef()).disable()
                    (AllPrisoners[finalprisonernum].GetActorRef()).delete()
                else
                    AllPrisoners[finalprisonernum].GetActorRef().AddToFaction(RetreatFaction)
                endif
            endif
            
        else
            PrisonersASICCivilian.RemoveAddedForm(PrisonerPerson)
        endif
        
        ASICPrisonersTotal -= 1
    endif

    if AllPrisoners[finalprisonernum].GetActorRef()
        AllPrisoners[finalprisonernum].GetActorRef().EvaluatePackage()
        AllPrisoners[finalprisonernum].Clear()
        AllPrisonerActors[finalprisonernum] = None
    endif
EndFunction

Function FreeAllFortPrisoners(int fortnum)
    FormList FortPrisoners = FortPrisonersAll.GetAt(fortnum) as FormList
    int i = 0
    while i < FortPrisoners.GetSize()
        Actor Prisoner = FortPrisoners.GetAt(i) as Actor
        ActorBase PrisonerBase = Prisoner.GetActorBase()
        if PrisonerBase == ImperialSoldier || PrisonerBase  == ImperialArcher
            FreePrisoner(Prisoner, "Troop", 11)
        elseif PrisonerBase == SonsSoldier || PrisonerBase == SonsArcher
            FreePrisoner(Prisoner, "Troop", 12)
        elseif PrisonerBase == ImperialCommander
            FreePrisoner(Prisoner, "Commander", 11)
        elseif PrisonerBase == SonsCommander
            FreePrisoner(Prisoner, "Commander", 12)
        else
            FreePrisoner(Prisoner)
        endif
        i += 1
    endwhile
EndFunction

Function RansomPrisoner(Actor Prisoner, string actortype = "Civilian", int factionnum = 0)
    if actortype == "Troop"
        EconomyScript.CoinTotalPlayer.Mod(1000)
        EconomyScript.CoinSound.Play(Game.GetPlayer())
        debug.notification("1000 Gold has been added to the treasury!")
    elseif actortype == "Commander"
        EconomyScript.CoinTotalPlayer.Mod(5000)
        EconomyScript.CoinSound.Play(Game.GetPlayer())
        debug.notification("5000 Gold has been added to the treasury!")
    else
        EconomyScript.CoinTotalPlayer.Mod(500)
        EconomyScript.CoinSound.Play(Game.GetPlayer())
        debug.notification("500 Gold has been added to the treasury!")
    endif
    FreePrisoner(Prisoner, actortype, factionnum)
EndFunction

Function PlayerTakePrisoner(Actor Prisoner, string prisonertype = "Civilian", int factionnum = 0, bool city = false)
    if Prisoner && Prisoner.IsDead() != 1
        Prisoner.RemoveFromAllFactions()
        Prisoner.AddToFaction(PrisonerFaction)
        int i = 0
        bool foundalias = false
        while i < AllPrisoners.Length && foundalias == false
            if AllPrisonerActors[i] == None
                AllPrisoners[i].ForceRefTo(Prisoner)
                AllPrisonerActors[i] = Prisoner
                foundalias = true
            endif
            i += 1
        endwhile
        if !city
            Prisoner.AddToFaction(PrisonerPlayerFaction)
            if prisonertype != "Civilian"
                Prisoner.AddToFaction(PrisonerASICFaction)
                if prisonertype == "Troop"
                    if factionnum == 11
                        PrisonersASICTroopImp.AddForm(Prisoner)
                    elseif factionnum == 12
                        PrisonersASICTroopSons.AddForm(Prisoner)
                    endif
                elseif prisonertype == "Commander"
                    if factionnum == 11
                        PrisonersASICCommanderImp.AddForm(Prisoner)
                    elseif factionnum == 12
                        PrisonersASICCommanderSons.AddForm(Prisoner)
                    endif
                endif
                ASICPrisonersTotal += 1
                ;PrisonersASIC.AddForm(Prisoner)
            else
                PlayerPrisonersCivilian += 1
                PlayerPrisonersListCivilian.AddForm(Prisoner)
            endif
            PlayerPrisonersTotal +=1
        endif
        Prisoner.SetRelationshipRank(Game.GetPlayer(), -1)  
        Prisoner.EquipItem(PrisonerCuffs, true)
        Prisoner.EvaluatePackage()
    endif
EndFunction

Function TransferPrisonerFromParty(Actor Prisoner, string actortype = "", int factionnum = 0)
    if type == "Fort"
        if actortype == "Troop"
            if factionnum == 11
                PlayerPrisonersTroopImp -= 1
                FortPrisonersTroopImp[holdnum] = FortPrisonersTroopImp[holdnum] + 1
                PlayerPrisonersListTroopImp.RemoveAddedForm(Prisoner)
            elseif factionnum == 12
                PlayerPrisonersTroopSons -= 1
                FortPrisonersTroopSons[holdnum] = FortPrisonersTroopSons[holdnum] + 1
                PlayerPrisonersListTroopSons.RemoveAddedForm(Prisoner)
            endif
        elseif actortype == "Commander"
            if factionnum == 11
                PlayerPrisonersCommanderImp -= 1
                FortPrisonersCommanderImp[holdnum] = FortPrisonersCommanderImp[holdnum] + 1
                PlayerPrisonersListCommanderImp.RemoveAddedForm(Prisoner)
            elseif factionnum == 12
                PlayerPrisonersCommanderSons -= 1
                FortPrisonersCommanderSons[holdnum] = FortPrisonersCommanderSons[holdnum] + 1
                PlayerPrisonersListCommanderSons.RemoveAddedForm(Prisoner)
            endif
        else
            PlayerPrisonersCivilian -= 1
            FortPrisonersCivilian[holdnum] = FortPrisonersCivilian[holdnum] + 1
            PlayerPrisonersListCivilian.RemoveAddedForm(Prisoner)
        endif
        ClearPrisonerFactions(Prisoner)
        Prisoner.AddToFaction(PrisonerFortFaction)
        Prisoner.AddToFaction(PrisonerFortFactions.GetAt(holdnum) as Faction)
        (FortPrisonersAll.GetAt(holdnum) as FormList).AddForm(Prisoner)
        FortPrisonersTotal += 1
    elseif type == "ASIC"
        if actortype == "Troop"
            if factionnum == 11
                PlayerPrisonersTroopImp -= 1
                PlayerPrisonersListTroopImp.RemoveAddedForm(Prisoner)
                PrisonersASICTroopImp.AddForm(Prisoner)
            elseif factionnum == 12
                PlayerPrisonersTroopSons -= 1
                PlayerPrisonersListTroopSons.RemoveAddedForm(Prisoner)
                PrisonersASICTroopSons.AddForm(Prisoner)
            endif
        elseif actortype == "Commander"
            if factionnum == 11
                PlayerPrisonersCommanderImp -= 1
                PlayerPrisonersListCommanderImp.RemoveAddedForm(Prisoner)
                PrisonersASICCommanderImp.AddForm(Prisoner)
            elseif factionnum == 12
                PlayerPrisonersCommanderSons -= 1
                PlayerPrisonersListCommanderSons.RemoveAddedForm(Prisoner)
                PrisonersASICCommanderSons.AddForm(Prisoner)
            endif
        else
            PlayerPrisonersCivilian -= 1
            PlayerPrisonersListCivilian.RemoveAddedForm(Prisoner)
            PrisonersASICCivilian.AddForm(Prisoner)
        endif
        ClearPrisonerFactions(Prisoner)
        ASICPrisonersTotal += 1
        Prisoner.RemoveFromFaction(PrisonerPlayerFaction)
        utility.wait(0.2)
        Prisoner.EvaluatePackage()
        Prisoner.AddToFaction(PrisonerASICFaction)
        Prisoner.AddToFaction(PrisonerPlayerFaction)
        Prisoner.EvaluatePackage()
    elseif type == "City"
        PlayerPrisonersCivilian -= 1
        PlayerPrisonersListCivilian.RemoveAddedForm(Prisoner)
        ClearPrisonerFactions(Prisoner)
        Prisoner.AddToFaction(PrisonerCityFaction)
        Prisoner.AddToFaction(PrisonerCityFactions.GetAt(holdnum) as Faction)
        PrisonScript.SendToPrison(Prisoner, holdnum)
    endif
    PlayerPrisonersTotal -= 1
EndFunction

Function TransferPrisonerToParty(Actor Prisoner, string actortype = "", int factionnum = 0)
    if type == "Fort"
        if actortype == "Troop"
            if factionnum == 11
                PlayerPrisonersTroopImp += 1
                PrisonersTroopImp.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersTroopImp)
                FortPrisonersTroopImp[holdnum] = FortPrisonersTroopImp[holdnum] - 1
                PlayerPrisonersListTroopImp.AddForm(Prisoner)
            elseif factionnum == 12
                PlayerPrisonersTroopSons += 1
                PrisonersTroopSons.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersTroopSons)
                FortPrisonersTroopSons[holdnum] = FortPrisonersTroopSons[holdnum] - 1
                PlayerPrisonersListTroopSons.AddForm(Prisoner)
            endif
        elseif actortype == "Commander"
            if factionnum == 11
                PlayerPrisonersCommanderImp += 1
                PrisonersCommandersImp.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersCommandersImp)
                FortPrisonersCommanderImp[holdnum] = FortPrisonersCommanderImp[holdnum] - 1
                PlayerPrisonersListCommanderImp.AddForm(Prisoner)
            elseif factionnum == 12
                PlayerPrisonersCommanderSons += 1
                PrisonersCommandersSons.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersCommandersSons)
                FortPrisonersCommanderSons[holdnum] = FortPrisonersCommanderSons[holdnum] - 1
                PlayerPrisonersListCommanderSons.AddForm(Prisoner)
            endif
        else
            PlayerPrisonersCivilian += 1
            FortPrisonersCivilian[holdnum] = FortPrisonersCivilian[holdnum] - 1
            PlayerPrisonersListCivilian.AddForm(Prisoner)
        endif
        (FortPrisonersAll.GetAt(holdnum) as FormList).RemoveAddedForm(Prisoner)
        ClearPrisonerFactions(Prisoner)
        Prisoner.AddToFaction(PrisonerPlayerFaction)
    elseif type == "ASIC"
        if actortype == "Troop"
            if factionnum == 11
                PlayerPrisonersTroopImp += 1
                PrisonersTroopImp.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersTroopImp)
                PrisonersASICTroopImp.RemoveAddedForm(Prisoner)
                PlayerPrisonersListTroopImp.AddForm(Prisoner)
            elseif factionnum == 12
                PlayerPrisonersTroopSons += 1
                PrisonersTroopSons.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersTroopSons)
                PrisonersASICTroopSons.RemoveAddedForm(Prisoner)
                PlayerPrisonersListTroopSons.AddForm(Prisoner)
            endif
        elseif actortype == "Commander"
            if factionnum == 11
                PlayerPrisonersCommanderImp += 1
                PrisonersCommandersImp.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersCommandersImp)
                PrisonersASICCommanderImp.RemoveAddedForm(Prisoner)
                PlayerPrisonersListCommanderImp.AddForm(Prisoner)
            elseif factionnum == 12
                PlayerPrisonersCommanderSons += 1
                PrisonersCommandersSons.Mod(-1)
                UpdateCurrentInstanceGlobal(PrisonersCommandersSons)
                PrisonersASICCommanderSons.RemoveAddedForm(Prisoner)
                PlayerPrisonersListCommanderSons.AddForm(Prisoner)
            endif
        else
            PlayerPrisonersCivilian += 1
            PrisonersASICCivilian.RemoveAddedForm(Prisoner)
            PlayerPrisonersListCivilian.AddForm(Prisoner)
        endif
        ClearPrisonerFactions(Prisoner)
        Prisoner.AddToFaction(PrisonerPlayerFaction)
        Prisoner.enable()
        Prisoner.MoveTo(Game.GetPlayer(), 0, -300)
    elseif type == "City"
        CourtScript.ClearPrisonerAlias(Prisoner)
        ClearPrisonerFactions(Prisoner)
        Prisoner.AddToFaction(PrisonerFaction)
        Prisoner.AddToFaction(PrisonerPlayerFaction)
        PlayerPrisonersCivilian += 1
        PlayerPrisonersListCivilian.AddForm(Prisoner)
    endif
    PlayerPrisonersTotal += 1
    Prisoner.EvaluatePackage()
EndFunction

int Function GetFortNum(Actor Commander)
    return FortCommanders.GetFortCommanderNum(Commander)
EndFunction