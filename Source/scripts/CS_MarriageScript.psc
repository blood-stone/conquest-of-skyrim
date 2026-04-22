Scriptname CS_MarriageScript extends Quest  

Faction Property MarriageAskedFaction Auto
Faction Property PotentialMarriageFaction Auto
Faction Property CS_JarlFaction Auto
Faction Property MarriagePalaceFaction Auto
Faction Property CS_GovernmentDefaultOutfitFaction Auto
Faction Property CS_GovernmentCustomOutfitFaction Auto
Faction Property CS_SpouseInteractFaction Auto
Faction Property CS_MarriageAskedFaction Auto

ReferenceAlias Property LoveInterest Auto
ReferenceAlias Property NewSpouseAlias Auto
ReferenceAlias Property Sponsor Auto
ReferenceAlias Property AdoptionSpouse Auto
ReferenceAlias Property KingConsort Auto
ReferenceAlias Property QueenConsort Auto
ReferenceAlias Property OriginalSpouse Auto
ReferenceAlias Property KingOrQueen Auto

GlobalVariable Property CS_LoyaltySpouseHold Auto
GlobalVariable Property CS_LoyaltySpouseAddition Auto

FormList Property AllPalaces Auto
FormList Property OwnershipFactions Auto

LocationAlias Property Palace Auto

ReferenceAlias[] Property SpouseHouses Auto
ReferenceAlias Property SpouseSettlement Auto

ObjectReference[] Property KingOrQueenRef Auto
ObjectReference Property CS_SpousePositionMarker Auto
ObjectReference Property CS_FactionPlayer Auto

Actor Property SpouseCustomOutfit Auto

Quest Property WeddingQuest Auto
Quest Property BYOHRelationshipAdoption Auto

CS_RecruitJarl Property JarlScript Auto
CS_PublicOpinionScript Property CS_PublicOpinion Auto

Function StartMarriage(Actor NewSpouse)
    NewSpouseAlias.ForceRefTo(NewSpouse)
    NewSpouseAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
    NewSpouseAlias.GetActorRef().AddToFaction(CS_MarriageAskedFaction)
    KingOrQueen.ForceRefTo(KingOrQueenRef[NewSpouse.GetActorBase().GetSex()])
    ;if !Sponsor.GetActorRef().IsInFaction(CS_JarlFaction) && PlayerCapital.GetValue() == -1
    ;   LoveInterest.ForceRefTo(NewSpouse)
    ;   LoveInterest.GetActorRef().AddToFaction(MarriageAskedFaction)
    ;   LoveInterest.GetActorRef().AddToFaction(PotentialMarriageFaction)
    ;   LoveInterest.GetOwningQuest().SetStage(20)
    ;else
    ObjectReference PlayerCapital = (CS_FactionPlayer as CS_FactionManagementOwnership).HQ
    if PlayerCapital && (PlayerCapital as CS_CityManagementOwnership).holdnum >= 0
        Palace.ForceLocationTo(AllPalaces.GetAt((PlayerCapital as CS_CityManagementOwnership).holdnum) as Location)
    else
        
        if Sponsor.GetActorRef().IsInFaction(CS_JarlFaction)
            int jarlnum = -1
            int i = 0
            while i < JarlScript.JarlAliases.Length && jarlnum == -1
                if Sponsor.GetActorRef() == JarlScript.JarlAliases[i].GetActorRef()
                    jarlnum = i
                endif
                i += 1
            endwhile
            Palace.ForceLocationTo(AllPalaces.GetAt(jarlnum) as Location)
        else
            int holdnum = CS_PublicOpinion.GetPersonHold(Sponsor.GetActorRef())
            Palace.ForceLocationTo(AllPalaces.GetAt(holdnum) as Location)
        endif
        
    endif

    WeddingQuest.Start()
        ; endif
EndFunction

Function MakeOriginalSpouseNew()
    if OriginalSpouse.GetActorRef()
        NewSpouseAlias.ForceRefTo(OriginalSpouse.GetActorRef())
        KingOrQueen.ForceRefTo(KingOrQueenRef[NewSpouseAlias.GetActorRef().GetActorBase().GetSex()])
    endif
EndFunction

Function SetUpSpouseHouse()
    ;Bed.ForceRefto(NewSpouseAlias.GetActorRef().GetLinkedRef(apKeyword = SpouseBedKeyword))

    ;If the Adoption system is running, update the spouse refs there.

    if (BYOHRelationshipAdoption.IsRunning())
      AdoptionSpouse.ForceRefTo(NewSpouseAlias.GetActorRef())
    EndIf
    ObjectReference PlayerCapital = (CS_FactionPlayer as CS_FactionManagementOwnership).HQ

    if NewSpouseAlias.GetActorRef().IsInFaction(CS_JarlFaction)
        ;Live at their own palace like usual
    elseif PlayerCapital && (PlayerCapital as CS_CityManagementOwnership).holdnum >= 0
        NewSpouseAlias.GetActorRef().AddToFaction(MarriagePalaceFaction)

        int i = 0
        while i < SpouseHouses.Length
            SpouseHouses[i].Clear()
            i += 1
        endwhile

        if NewSpouseAlias.GetActorRef()
            SpouseHouses[(PlayerCapital as CS_CityManagementOwnership).holdnum].ForceRefTo(NewSpouseAlias.GetActorRef())
        endif

        FormList PalaceOwnershipFactions = OwnershipFactions.GetAt((PlayerCapital as CS_CityManagementOwnership).holdnum) as FormList
        i = 0
        while i < PalaceOwnershipFactions.GetSize()
            NewSpouseAlias.GetActorRef().AddToFaction(PalaceOwnershipFactions.GetAt(i) as Faction)
            i += 1
        endwhile
    elseif PlayerCapital
        SetUpSpouseSettlement(PlayerCapital)
    endif
EndFunction

Function SetUpSpouseSettlement(ObjectReference SettlementActivator)
    CS_CityManagementOwnership OwnershipScript = SettlementActivator as CS_CityManagementOwnership
    if OwnershipScript.HQInteriorMarker
        CS_SpousePositionMarker.MoveTo(OwnershipScript.HQInteriorMarker)
    else
        CS_SpousePositionMarker.MoveTo(OwnershipScript.HQExteriorMarker)
    endif
    
    int i = 0
    while i < SpouseHouses.Length
        SpouseHouses[i].Clear()
        i += 1
    endwhile
    
    SpouseSettlement.ForceRefTo(NewSpouseAlias.GetActorRef())
    NewSpouseAlias.TryToEvaluatePackage()
EndFunction

Function RemoveSpouseFromAllHouses()
    int i = 0
    while i < SpouseHouses.Length
        SpouseHouses[i].Clear()
        i += 1
    endwhile
    
    SpouseSettlement.Clear()
EndFunction

Function AssignSpouseToHold(int holdnum)
    CS_LoyaltySpouseHold.SetValue(holdnum)
    CS_LoyaltySpouseAddition.SetValue(5)
    
    int i = 0
    while i < SpouseHouses.Length
        SpouseHouses[i].Clear()
        i += 1
    endwhile
    SpouseSettlement.Clear()
    
    if NewSpouseAlias.GetActorRef()
        SpouseHouses[holdnum].ForceRefTo(NewSpouseAlias.GetActorRef())
    endif
    
    FormList PalaceOwnershipFactions = OwnershipFactions.GetAt(holdnum) as FormList
    i = 0
    while i < PalaceOwnershipFactions.GetSize()
        NewSpouseAlias.GetActorRef().AddToFaction(PalaceOwnershipFactions.GetAt(i) as Faction)
        i += 1
    endwhile
    
    NewSpouseAlias.TryToAddToFaction(CS_SpouseInteractFaction)
    NewSpouseAlias.GetActorRef().EvaluatePackage()
EndFunction

Function MakeSpouseDefaultOutfit()
    NewSpouseAlias.TryToRemoveFromFaction(CS_GovernmentCustomOutfitFaction)
    NewSpouseAlias.TryToAddToFaction(CS_GovernmentDefaultOutfitFaction)
    (NewSpouseAlias as CS_SpouseEquipClothes).EquipOutfit()
EndFunction

Function MakeSpouseCustomOutfit()
    SpouseCustomOutfit.OpenInventory(true)
    Utility.Wait(1)
    while Utility.IsInMenuMode()
        Utility.WaitMenuMode(1)
    endwhile
    NewSpouseAlias.TryToRemoveFromFaction(CS_GovernmentDefaultOutfitFaction)
    NewSpouseAlias.TryToAddToFaction(CS_GovernmentCustomOutfitFaction)
    (NewSpouseAlias as CS_SpouseEquipClothes).EquipOutfit()
EndFunction

Function MakeSpouseNoOutfit()
    NewSpouseAlias.TryToRemoveFromFaction(CS_GovernmentDefaultOutfitFaction)
    NewSpouseAlias.TryToRemoveFromFaction(CS_GovernmentCustomOutfitFaction)
EndFunction

Function MakeConsort(Actor Spouse)
    if Spouse.GetActorBase().GetSex() == 0
        KingConsort.ForceRefTo(Spouse)
    else
        QueenConsort.ForceRefTo(Spouse)
    endif
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
    if OriginalSpouse.GetActorRef()
        MakeOriginalSpouseNew()
    else
        if akRef2
            debug.trace("Ref2 filled")
            StartMarriage(akRef2 as Actor)
        else
            debug.trace("Ref2 not filled")
            StartMarriage(akRef1 as Actor)
        endif
    endif
EndEvent