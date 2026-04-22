Scriptname CS_OwnershipHoldScript extends Quest  

int Property holdnum Auto
int Property factionnum Auto
Location Property VanillaCity Auto

FormList Property GarrisonMarkersImp Auto
FormList Property GarrisonMarkersSons Auto

Keyword Property CWOwner Auto

Actor[] Property initialLineOfSuccessionImp Auto
Actor[] Property initialLineOfSuccessionSons Auto

Actor[] Property LineOfSuccession Auto

ReferenceAlias Property Jarl Auto
ReferenceAlias Property Steward Auto
ReferenceAlias Property HouseCarl Auto
ReferenceAlias Property CourtMage Auto

CS_GovPositions Property CS_GovernmentsReferenceQuest Auto

Function SetUp()
    SetUpSetFaction()
    SetUpSetGovernment()
EndFunction

Function SetUpSetFaction()
    ObjectReference GarrisonMarkerImp = GarrisonMarkersImp.GetAt(holdnum) as ObjectReference
    ObjectReference GarrisonMarkerSons = GarrisonMarkersSons.GetAt(holdnum) as ObjectReference
    
    if VanillaCity.GetKeywordData(CWOwner) == 1 || GarrisonMarkerImp.IsEnabled()
        VanillaCity.SetKeywordData(CWOwner, 1)
        factionnum = 11
        LineOfSuccession = initialLineOfSuccessionImp
    elseif VanillaCity.GetKeywordData(CWOwner) == 2 || GarrisonMarkerSons.IsEnabled()
        VanillaCity.SetKeywordData(CWOwner, 2)
        factionnum = 12
        LineOfSuccession = initialLineOfSuccessionSons
    endif
EndFunction

Function SetUpSetGovernment()
    Jarl.ForceRefTo(ReplaceWithDuplicate(LineOfSuccession[0]))
    
    if factionnum == 11
        if CS_GovernmentsReferenceQuest.StewardsImp[holdnum]
            Steward.ForceRefTo(ReplaceWithDuplicate(CS_GovernmentsReferenceQuest.StewardsImp[holdnum]))
        endif
        
        if CS_GovernmentsReferenceQuest.HouseCarlsImp[holdnum]
            HouseCarl.ForceRefTo(ReplaceWithDuplicate(CS_GovernmentsReferenceQuest.HouseCarlsImp[holdnum]))
        endif
    elseif factionnum == 12
        if CS_GovernmentsReferenceQuest.StewardsSons[holdnum]
            Steward.ForceRefTo(ReplaceWithDuplicate(CS_GovernmentsReferenceQuest.StewardsSons[holdnum]))
        endif
        
        if CS_GovernmentsReferenceQuest.HouseCarlsSons[holdnum]
            HouseCarl.ForceRefTo(ReplaceWithDuplicate(CS_GovernmentsReferenceQuest.HouseCarlsSons[holdnum]))
        endif
    endif
        
    if CS_GovernmentsReferenceQuest.Wizards[holdnum]
        CourtMage.ForceRefTo(ReplaceWithDuplicate(CS_GovernmentsReferenceQuest.Wizards[holdnum]))
    endif
EndFunction

Actor Function ReplaceWithDuplicate(ObjectReference ReplaceeRef)
    Actor Replacee = ReplaceeRef as Actor
    Actor Replacer = Replacee.PlaceAtMe(Replacee.GetActorBase(), abForcePersist=true) as Actor
    Replacee.disable()
    Replacer.GetActorBase().SetEssential(false)
    Replacer.GetActorBase().SetProtected(true)
    
    return Replacer
EndFunction

Auto State NotSetUp

    Event OnUpdate()
        debug.trace("Starting city " + holdnum + " ownership set up...")
        SetUp()
        debug.trace("City " + holdnum + " ownership SET UP!")
        GoToState("SetUp")
    EndEvent
    
EndState