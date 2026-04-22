Scriptname CS_RaidVillageScript extends Quest  

LocationAlias Property Village Auto

Location Property VillageCS Auto

ReferenceAlias Property TriggerBox Auto
ReferenceAlias[] Property FoodBarrels Auto
ReferenceAlias[] Property WoodBarrels Auto
ReferenceAlias[] Property MetalBarrels Auto
ReferenceAlias[] Property CoinBarrels Auto

FormList Property AllLocations Auto
FormList Property AllLocationsCS Auto

Keyword Property FoodReserve Auto
Keyword Property WoodReserve Auto
Keyword Property MetalReserve Auto
Keyword Property Treasury Auto

int Property holdnum Auto
int Property FoodInitial Auto
int Property WoodInitial Auto
int Property MetalInitial Auto
int Property CoinInitial Auto

CS_PrisonerQuestScript Property PrisonerScript Auto

Function InitialSetUp()
    holdnum = AllLocations.Find(Village.GetLocation())
    VillageCS = AllLocationsCS.GetAt(holdnum) as Location
    CoinInitial = math.floor(0.75*VillageCS.GetKeywordData(Treasury))
    FoodInitial = math.floor(0.75*VillageCS.GetKeywordData(FoodReserve))
    MetalInitial = math.floor(0.75*VillageCS.GetKeywordData(MetalReserve))
    WoodInitial = math.floor(0.75*VillageCS.GetKeywordData(WoodReserve))
    if CoinInitial >= 1 || FoodInitial >= 1 || MetalInitial >= 1 || WoodInitial >= 1
        EnableResourceBarrels()
    endif
EndFunction

Function EnableResourceBarrels()
    ;Enable Food Barrels
    int maxbarrels = 0
    if FoodInitial == 0
        maxbarrels = 0
    elseif FoodInitial >= 1 && FoodInitial < 10
        maxbarrels = 1
    elseif FoodInitial >= 10
        maxbarrels = 2
    endif
    int i = 0
    while i < maxbarrels
        FoodBarrels[i].GetRef().Enable()
        i += 1
    endwhile

    ;Enable Wood Barrels
    maxbarrels = 0
    if WoodInitial == 0
        maxbarrels = 0
    elseif WoodInitial >= 1 && WoodInitial < 10
        maxbarrels = 1
    elseif WoodInitial >= 10
        maxbarrels = 2
    endif
    i = 0
    while i < maxbarrels
        WoodBarrels[i].GetRef().Enable()
        i += 1
    endwhile

    ;Enable Metal Barrels
    maxbarrels = 0
    if MetalInitial == 0
        maxbarrels = 0
    elseif MetalInitial >= 1 && MetalInitial < 10
        maxbarrels = 1
    elseif MetalInitial >= 10
        maxbarrels = 2
    endif
    i = 0
    while i < maxbarrels
        MetalBarrels[i].GetRef().Enable()
        i += 1
    endwhile

    ;Enable Coin Barrels
    maxbarrels = 0
    if CoinInitial == 0
        maxbarrels = 0
    elseif CoinInitial >= 1 && CoinInitial < 10
        maxbarrels = 1
    elseif CoinInitial >= 10
        maxbarrels = 2
    endif
    i = 0
    while i < maxbarrels
        CoinBarrels[i].GetRef().Enable()
        i += 1
    endwhile
    
    SetObjectiveDisplayed(0, true, true)
EndFunction

Function CheckAllBarrels()
    int i = 0
    bool foundbarrel = false
    while i < FoodBarrels.Length && foundbarrel == false
        if FoodBarrels[i].GetRef().IsEnabled() == true || CoinBarrels[i].GetRef().IsEnabled() == true || MetalBarrels[i].GetRef().IsEnabled() == true || WoodBarrels[i].GetRef().IsEnabled() == true
            foundbarrel = true
        endif
        i += 1
    endwhile

    if foundbarrel == false
        SetObjectiveCompleted(0)
    endif
EndFunction

Function TakePrisoner(Actor Victim)
    Victim.SetRelationshipRank(Game.GetPlayer(), -1)
    PrisonerScript.PlayerTakePrisoner(Victim)
EndFunction