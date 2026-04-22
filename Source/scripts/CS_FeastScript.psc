Scriptname CS_FeastScript extends Quest conditional

ObjectReference Property EventPlan Auto

int Property citynum Auto

float Property FeastDay Auto
float Property EndDateTime Auto
float Property SpeechTime Auto

bool Property HasBard Auto

GlobalVariable Property GameDaysPassed Auto

LocationAlias Property City Auto

ReferenceAlias[] Property Guests Auto
ReferenceAlias Property CityManagementActivator Auto
ReferenceAlias Property Jarl Auto
ReferenceAlias Property PalaceEntranceMarker Auto
ReferenceAlias Property SandboxMarker Auto
ReferenceAlias Property Bard Auto
ReferenceAlias Property BardMarker Auto
ReferenceAlias Property Bard1Marker Auto
ReferenceAlias Property Bard2Marker Auto
ReferenceAlias Property CitizenSpeech Auto

FormList Property GuestList Auto
FormList Property CS_NobilityCities Auto
FormList Property CS_AllAttackPalaces Auto

Faction Property CS_FeastGuestTalkedToFaction Auto

Potion Property FoodBeefCooked Auto

MiscObject Property Gold001 Auto

ActorBase Property CS_Bard Auto

int Property PlayerJarl Auto conditional
int Property FoodType Auto conditional
int Property EntertainmentType Auto conditional
int Property Decorations Auto conditional
int Property Speech Auto

int Property BardsSpawned Auto

BardSongsScript Property BardSongs Auto
CS_BardBandScript Property CS_BardBand Auto
FavorDialogueScript Property DialogueFavorGeneric Auto
CS_InfluenceHoldUpdaterScript Property InfluenceHold Auto
CS_EconomyUpdaterNewScript Property EconomyUpdater Auto
CS_CityEventPlanningScript Property CS_CityManagement Auto

Function SetUp()
    ObjectReference FactionManagementActivator = (CityManagementActivator.GetRef() as CS_CityManagementOwnership).FactionOwnerActivator
    if (FactionManagementActivator as CS_FactionManagementOwnership).Leader == Game.GetPlayer()
        PlayerJarl = 1
    else
        PlayerJarl = 0
    endif
    
    RegisterForUpdateGameTime(0.25)
EndFunction

Function MoveGuestsToPalace()
    int i = 0
    while i < Guests.Length
        if Guests[i].GetActorRef()
            (Guests[i] as CS_PalaceEventFeastGuestScript).GoToState("MoveToSpawn")
            (Guests[i] as CS_PalaceEventFeastGuestScript).RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
    
    if !Jarl.GetRef().IsNearPlayer()
        Jarl.GetActorRef().MoveTo(PalaceEntranceMarker.GetRef())
    endif
EndFunction

Function SpawnBand()
    BardsSpawned = 1
    CS_BardBand.Start()
    CS_BardBand.SpawnBardsAtStage(BardMarker.GetRef(), Bard1Marker.GetRef(), Bard2Marker.GetRef())
    CS_BardBand.PlaySongs(1)
EndFunction

Function SpawnBard()
    BardsSpawned = 1
    Bard.ForceRefTo(BardMarker.GetRef().PlaceActorAtMe(CS_Bard))
    BardSongs.PlaySong(Bard.GetRef(), Instrument = "Instrumental")
EndFunction

Function BardStopPlaying()
    if EntertainmentType == 2
        CS_BardBand.StopPlaying()
    endif
EndFunction

Function BardResumePlaying()
    if EntertainmentType == 2
        CS_BardBand.PlaySongs(1)
    endif
EndFunction

bool Function FindCitizenSpeech()
    debug.trace("Searching for CitizenSpeech...")
    int i = 0
    while i < Guests.Length
        if Guests[i].GetActorRef() && Guests[i].GetRef().GetDistance(SandboxMarker.GetRef()) < 2000
            CitizenSpeech.ForceRefTo(Guests[i].GetActorRef())
            debug.trace("Found CitizenSpeech!")
            return true
        endif
        i += 1
    endwhile
    debug.trace("Did not find CitizenSpeech")
    return false
EndFunction

Function GuestsWatchPlayerGiveSpeech()
    int i = 0
    while i < Guests.Length
        if (Guests[i] as CS_CityEventCitizenScript).GetActorRef()
            (Guests[i] as CS_CityEventCitizenScript).GoToState("WatchPlayerGiveSpeech")
            (Guests[i] as CS_CityEventCitizenScript).RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
EndFunction

Function GuestsStopWatchPlayerGiveSpeech()
    int i = 0
    while i < Guests.Length
        if (Guests[i] as CS_CityEventCitizenScript).GetActorRef()
            (Guests[i] as CS_CityEventCitizenScript).GoToState("StopWatchPlayerGiveSpeech")
            (Guests[i] as CS_CityEventCitizenScript).RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
EndFunction

Function AddGuestsToAliases()
    GuestList = CS_NobilityCities.GetAt(citynum) as FormList
    int i = 0
    while i < Guests.Length
        if GuestList.GetAt(i) as Actor
            Guests[i].ForceRefTo(GuestList.GetAt(i) as Actor)
        endif
        i += 1
    endwhile
EndFunction

Function AllCheer()
    int i = 0
    while i < Guests.Length
        if Guests[i].GetActorRef()
            int randomapplaudnum = utility.randomint(0, 3)
            if randomapplaudnum == 0
                debug.sendAnimationEvent(Guests[i].GetActorRef(), "IdleApplaud2")
            elseif randomapplaudnum == 1
                debug.sendAnimationEvent(Guests[i].GetActorRef(), "IdleApplaud3")
            elseif randomapplaudnum == 2
                debug.sendAnimationEvent(Guests[i].GetActorRef(), "IdleApplaud4")
            elseif randomapplaudnum == 3
                debug.sendAnimationEvent(Guests[i].GetActorRef(), "IdleApplaud5")
            endif
        endif
        i += 1
    endwhile
EndFunction

Function SetInfluenceChange(string InfluencingGroup, string InfluencedGroup, int InfluencedGroupAmount)
    (CityManagementActivator.GetRef() as CS_CityManagementPopulation).AdjustInfluence(InfluencingGroup, InfluencedGroup, InfluencedGroupAmount)
EndFunction

Function InteractWithGuest(Actor Guest, int Outcome, string type)
    Guest.AddToFaction(CS_FeastGuestTalkedToFaction)
    if Outcome == 1
        if type == "Flatter"
            (CityManagementActivator.GetRef() as CS_CityManagementPopulation).AdjustInfluence("Player", "Nobility", 3)
            DialogueFavorGeneric.Persuade(Guest)
        elseif type == "Intimidate"
            (CityManagementActivator.GetRef() as CS_CityManagementPopulation).AdjustInfluence("Player", "Nobility", 6)
            DialogueFavorGeneric.Intimidate(Guest)
        elseif type == "Bribe"
            (CityManagementActivator.GetRef() as CS_CityManagementPopulation).AdjustInfluence("Player", "Nobility", 3)
            DialogueFavorGeneric.Persuade(Guest)
            Game.GetPlayer().RemoveItem(Gold001, 1000)
        endif
    elseif Outcome == -1
        if type == "Intimidate"
            (CityManagementActivator.GetRef() as CS_CityManagementPopulation).AdjustInfluence("Player", "Nobility", -3)
        endif
    endif
EndFunction

Function RemoveGuestsFromFaction()
    int i = 0
    while i < Guests.Length
        if Guests[i].GetActorRef()
            Guests[i].GetActorRef().RemoveFromFaction(CS_FeastGuestTalkedToFaction)
        endif
        i += 1
    endwhile
EndFunction

Function CalculateInfluenceChange(string InfluencingGroup, string InfluencedGroup)
    int FoodInfluence = 5*FoodType
    int EntertainmentInfluence = 5*EntertainmentType
    int DecorationsInfluence = 5*Decorations
    
    int TotalInfluenceChange = FoodInfluence + EntertainmentInfluence + DecorationsInfluence
    SetInfluenceChange(InfluencingGroup, InfluencedGroup, TotalInfluenceChange)
EndFunction

Function EveryoneEat()
    Game.GetPlayer().AddItem(FoodBeefCooked, 1)
    int i = 0
    while i < Guests.Length
        if Guests[i].GetActorRef()
            Guests[i].GetActorRef().AddItem(FoodBeefCooked, 1)
        endif
        i += 1
    endwhile
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
    EventPlan = akRef1
    CS_CityEventPlanScript PlanScript = EventPlan as CS_CityEventPlanScript
    if PlanScript.EventType == 0 ;Festival Value
        GoToState("Festival")
    elseif PlanScript.EventType == 1 ;Feast Value
        GoToState("Feast")
    endif
    FoodType = PlanScript.EventValue1
    Decorations = PlanScript.EventValue2
    EntertainmentType = PlanScript.EventValue3
    Speech = PlanScript.EventValue4
    EndDateTime = PlanScript.EndDateTime
    SetStage(0)
EndEvent

State Feast

    Event OnUpdateGameTime()
        if GameDaysPassed.GetValue() >= EndDateTime
            UnRegisterForUpdateGameTime()
            Stop()
        else
            if !City.GetLocation().IsLoaded()
                UnRegisterForUpdateGameTime()
                Stop()
            else
                if GetStage() == 10 && Speech == 1 && GameDaysPassed.GetValue() >= SpeechTime && SandboxMarker.GetRef().Is3DLoaded()
                    SetStage(20)
                endif
            endif
        endif
    EndEvent
    
EndState

State Festival

    Event OnUpdateGameTime()
        ;BardSongs.PlaySong(Bard.GetRef(), Instrument = "Instrumental")
        
        if GameDaysPassed.GetValue() >= EndDateTime
            UnRegisterForUpdateGameTime()
            Stop()
        else
            if !City.GetLocation().IsLoaded()
                UnRegisterForUpdateGameTime()
                Stop()
            else
                if Speech == 1 && GetStage() == 0 && SandboxMarker.GetRef().Is3DLoaded()
                    if FindCitizenSpeech()
                        SetStage(5)
                    endif
                endif
            endif
        endif
    EndEvent
    
EndState