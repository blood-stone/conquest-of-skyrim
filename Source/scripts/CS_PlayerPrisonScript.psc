Scriptname CS_PlayerPrisonScript extends Quest Conditional

LocationAlias Property City Auto
LocationAlias Property ExecutionCity Auto
LocationAlias Property CityCS Auto

ReferenceAlias Property PlayerChest Auto
ReferenceAlias Property PrisonMarker Auto
ReferenceAlias Property JailGuard Auto
ReferenceAlias Property SpawnMarker Auto
ReferenceAlias Property JailDoor Auto
ReferenceAlias Property Jarl Auto
ReferenceAlias Property JarlThrone Auto
ReferenceAlias Property TrialMarkerSpawn Auto
ReferenceAlias Property ExteriorMarker Auto
ReferenceAlias Property ExecutionGuard Auto
ReferenceAlias Property Executionee Auto
ReferenceAlias Property Spy Auto
ReferenceAlias Property SpyNameChanger Auto

FormList Property AllLocations Auto
FormList Property AllLocationsCS Auto
FormList Property PlayerChests Auto
FormList Property Thrones Auto

Armor Property ClothesPrisonerRags Auto
Armor Property PrisonerCuffs Auto
Armor Property Gag Auto

Keyword Property CWOwner Auto

Scene Property GetPrisonerScene Auto
Scene Property SpyGetPrisonerScene Auto
Scene Property PlayerSleep Auto
Scene Property JarlTrialScene Auto

ActorBase[] Property HoldGuardsImp Auto
ActorBase[] Property HoldGuardsSons Auto

Message Property SleepTrial Auto
Message Property SleepExecution Auto
Message Property SleepFree Auto

GlobalVariable property GameHour auto
GlobalVariable property GameDay auto
GlobalVariable property GameDaysPassed auto
GlobalVariable property GameMonth auto
GlobalVariable property GameYear auto

Idle Property BedIdle Auto

bool Property PlayerSleeping Auto Conditional

CS_RecruitJarl Property JarlScript Auto

float Property TrialTime Auto
float Property ExecutionTime Auto

int Property holdnum Auto
int Property SentenceSeverity Auto Conditional

Function CheckIntoPrison()
    holdnum = AllLocations.Find(City.GetLocation())
    CityCS.ForceLocationTo(AllLocationsCS.GetAt(holdnum) as Location)
    Actor PlayerRef = Game.GetPlayer()
    PlayerChest.ForceRefTo(PlayerChests.GetAt(holdnum) as ObjectReference)
    JailDoor.GetRef().SetLockLevel(255)
    JailDoor.GetRef().Lock()
    JarlThrone.ForceRefTo(Thrones.GetAt(holdnum) as ObjectReference)
    Jarl.ForceRefTo(JarlScript.JarlAliases[holdnum].GetActorRef())
    
    ;debug.sendAnimationEvent(Game.GetPlayer(), "OffsetBoundStandingStart")
    
    PlayerRef.RemoveAllItems(PlayerChest.GetRef(), true, true)
    PlayerRef.AddItem(ClothesPrisonerRags, 1, abSilent=true)
    PlayerRef.EquipItem(ClothesPrisonerRags, abSilent=true)
    debug.SendAnimationEvent(PlayerRef, "IdleForceDefaultState")
    PlayerRef.MoveTo(PrisonMarker.GetRef())
    
    float TrialDay = math.floor(GameDaysPassed.GetValue() + 1)
    TrialTime = TrialDay + ((1 as float)/(3 as float))
    SentenceSeverity = 3
    RegisterForUpdateGameTime(1)
EndFunction

Function ReturnToPrison()
    Actor PlayerRef = Game.GetPlayer()
    PlayerRef.RemoveItem(PrisonerCuffs, abSilent=true)
    PlayerRef.RemoveItem(Gag, abSilent=true)
    debug.SendAnimationEvent(PlayerRef, "IdleForceDefaultState")
    JailDoor.GetRef().Lock()
    
    Game.SetPlayerAIDriven(False)
    Game.ShowFirstPersonGeometry( true )
    Game.EnablePlayerControls()
    PlayerRef.MoveTo(PrisonMarker.GetRef())
    
    JailGuard.GetActorRef().delete()
    
    if SentenceSeverity == 3 || SentenceSeverity == 1
        float ExecutionDay = math.floor(GameDaysPassed.GetValue() + 1)
        ExecutionTime = ExecutionDay + ((1 as float)/(3 as float))
    endif
    RegisterForUpdateGameTime(1)
    SetStage(20)
EndFunction

Function MoveToTrialMarker()
    JailGuard.GetActorRef().MoveTo(TrialMarkerSpawn.GetRef())
    Game.GetPlayer().MoveTo(TrialMarkerSpawn.GetRef())
EndFunction

Function MoveToExteriorMarker()
    JailGuard.GetActorRef().MoveTo(ExteriorMarker.GetRef())
    Game.GetPlayer().MoveTo(ExteriorMarker.GetRef())
EndFunction

Function SkipToTrial()
    if SleepTrial.show() == 0
        Game.ForceThirdPerson()
        Game.DisablePlayerControls(abMovement = false, abLooking = false, abCamSwitch = true, abSneaking = true)
        Game.SetPlayerAIDriven()
        PlayerSleeping = true
        Game.GetPlayer().EvaluatePackage()
        Utility.Wait(8)
        Game.FadeOutGame(true, true, 4, 2)
        Game.FadeOutGame(false, true, 4, 2)
        Utility.Wait(4)
        PlayerSleeping = false
        AdvanceTimeBy(24*(TrialTime - GameDaysPassed.GetValue()))
        Game.GetPlayer().EvaluatePackage()
        SetStage(10)
    endif
EndFunction

Function SkipToExecution()
    Message ExecutionOrFreeMessage
    if SentenceSeverity == 3
        ExecutionOrFreeMessage = SleepExecution
    elseif SentenceSeverity == 1
        ExecutionOrFreeMessage = SleepFree
    endif
    
    if ExecutionOrFreeMessage.show() == 0
        ;Game.ForceThirdPerson()
        Game.DisablePlayerControls(abMovement = false, abLooking = false, abCamSwitch = true, abSneaking = true)
        Game.SetPlayerAIDriven()
        PlayerSleeping = true
        Game.GetPlayer().EvaluatePackage()
        Utility.Wait(8)
        Game.FadeOutGame(true, true, 4, 2)
        Game.FadeOutGame(false, true, 4, 2)
        Utility.Wait(4)
        PlayerSleeping = false
        AdvanceTimeBy(24*(ExecutionTime - GameDaysPassed.GetValue()))
        Game.GetPlayer().EvaluatePackage()
        if SentenceSeverity == 3
            SetStage(24)
        elseif SentenceSeverity == 1
            SetStage(30)
        endif
    endif
EndFunction

function AdvanceTimeBy(float hours)
    float hour
    int day
    int month

    while hours > 24.0
        AdvanceTimeBy(24.0)
        hours -= 24.0
    endwhile

        if hours <= 0.0
            ;return
        endif

    hour = GameHour.GetValue() + hours
    if hour >= 24.0
        hour -= 24.0
        day = GameDay.GetValue() as int + 1
        GameDaysPassed.mod(1.0)

        month = GameMonth.GetValue() as int
        if (day == 29 && month == 2) || (day == 31 && (month == 4 || month == 6 || month == 9 || month == 11)) || (day == 32 && (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12))
            day = 1
            month += 1

            if month > 12
                month = 1
                GameYear.mod(1.0)
            endif

            GameMonth.SetValue(month as float)
        endif
        GameDay.SetValue(day as float)
    endif
    GameHour.SetValue(hour)
endfunction

Function StartExecution()
    ExecutionCity.ForceLocationTo(City.GetLocation())
    
    Quest ExecutionQuest = Executionee.GetOwningQuest()
    if ExecutionQuest.IsRunning()
        ExecutionQuest.Stop()
        Utility.Wait(1)
    endif
    
    ExecutionQuest.Start()
    Executionee.ForceRefTo(Game.GetPlayer())
    ExecutionGuard.ForceRefTo(JailGuard.GetActorRef())
    ExecutionGuard.GetActorRef().EvaluatePackage()
    Game.GetPlayer().EvaluatePackage()
EndFunction

Function PreparePlayerForMoving()
    debug.sendAnimationEvent(Game.GetPlayer(), "OffsetBoundStandingStart")
    (Game.GetPlayer() as Actor).EquipItem(PrisonerCuffs)
    (Game.GetPlayer() as Actor).EquipItem(Gag)

    Game.ForceThirdPerson()
    Game.DisablePlayerControls(abMovement = false, abLooking = false, abCamSwitch = true, abSneaking = true)
    Game.SetPlayerAIDriven()
    Game.ShowFirstPersonGeometry( false )
    JailGuard.GetActorRef().EvaluatePackage()
    Game.GetPlayer().EvaluatePackage()
    if GetStage() == 25
        StartExecution()
    endif
EndFunction

Function GuardGetPrisoner()
    Actor NewGuard
    if City.GetLocation().GetKeywordData(CWOwner) == 1
        NewGuard = SpawnMarker.GetRef().PlaceActorAtMe(HoldGuardsImp[holdnum])
    elseif City.GetLocation().GetKeywordData(CWOwner) == 2
        NewGuard = SpawnMarker.GetRef().PlaceActorAtMe(HoldGuardsSons[holdnum])
    endif
    
    JailGuard.ForceRefTo(NewGuard)
    GetPrisonerScene.ForceStart()
EndFunction

Function SpyGetPrisoner()
    Actor NewGuard
    if City.GetLocation().GetKeywordData(CWOwner) == 1
        NewGuard = SpawnMarker.GetRef().PlaceActorAtMe(HoldGuardsImp[holdnum])
    elseif City.GetLocation().GetKeywordData(CWOwner) == 2
        NewGuard = SpawnMarker.GetRef().PlaceActorAtMe(HoldGuardsSons[holdnum])
    endif
    
    Spy.ForceRefTo(NewGuard)
    SpyNameChanger.ForceRefTo(NewGuard)
    SpyNameChanger.Clear()
    SpyGetPrisonerScene.ForceStart()
EndFunction

Function FreePlayer()
    Actor PlayerRef = Game.GetPlayer()
    PlayerRef.RemoveItem(PrisonerCuffs, abSilent=true)
    PlayerRef.RemoveItem(Gag, abSilent=true)
    
    Game.SetPlayerAIDriven(False)
    Game.ShowFirstPersonGeometry( true )
    Game.EnablePlayerControls()
    PlayerChest.GetRef().RemoveAllItems(Game.GetPlayer(), true, true)
EndFunction

Event OnUpdate()
    if GetStage() == 12
        JarlTrialScene.ForceStart()
    endif
EndEvent

Event OnUpdateGameTime()
    if GetStage() == 0 && GameDaysPassed.GetValue() >= TrialTime
        SetStage(10)
    elseif GetStage() == 20 && GameDaysPassed.GetValue() >= ExecutionTime
        if SentenceSeverity == 3
            SetStage(24)
        elseif SentenceSeverity == 1
            SetStage(30)
        endif
    endif
EndEvent