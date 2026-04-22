Scriptname CS_CoupScript extends Quest conditional

LocationAlias Property City Auto
LocationAlias Property CityCS Auto

ReferenceAlias Property Jarl Auto
ReferenceAlias Property JarlMarker Auto
ReferenceAlias Property Arrester Auto
ReferenceAlias[] Property Citizens Auto
ReferenceAlias[] Property CitizenMarkers Auto
ReferenceAlias[] Property Guards Auto
ReferenceAlias[] Property GuardMarkers Auto

ActorBase[] Property HoldGuardsImp Auto
ActorBase[] Property HoldGuardsSons Auto

Keyword Property CWOwner Auto
Keyword Property LoyaltyPlayer Auto
Keyword Property LoyaltyJarl Auto
Keyword Property SpyNetworkProgress Auto
Keyword Property SpyNetworkMission Auto

FormList Property CS_AllHolds Auto
FormList Property AllLocations Auto
FormList Property AllLocationsCS Auto

Faction Property CoupGuardFaction Auto
Faction Property CoupCitizenFaction Auto

Scene Property CrowdCheer Auto
Scene Property CrowdChanting Auto
Scene Property CrowdCheerPlayer Auto
Scene Property GuardArrest Auto
Scene Property GuardBetrayJarl Auto
Scene Property GuardDiscuss Auto

bool Property JarlPrisoner Auto conditional

int Property holdnum Auto
int Property maxcitizens Auto conditional

float Property CoupDay Auto

GlobalVariable Property GameDaysPassed Auto

Light Property Torch01 Auto

CS_RecruitJarl Property JarlScript Auto
CS_TransferOwnershipScript Property TransferCity Auto
CS_PlayerSurrenderScript Property PlayerSurrender Auto
CS_PrisonScript Property PrisonScript Auto
CS_InfluenceHoldUpdaterScript Property InfluenceHold Auto
CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto

Function SetUp()
    holdnum = CS_AllHolds.Find(City.GetLocation())
    Jarl.ForceRefTo(JarlScript.JarlAliases[holdnum].GetActorRef())
    CityCS.ForceLocationTo(AllLocationsCS.GetAt(holdnum) as Location)
    InfluenceHold = CS_EconomyUpdaterNew.InfluenceHoldUpdaters[holdnum]
    maxcitizens = math.floor(InfluenceHold.InfluenceCommoner/8)
    CoupDay = math.floor(GameDaysPassed.GetValue() + 1) + (1/3)
    RegisterForUpdateGameTime(1)
EndFunction

Function MoveActorsToLocations()
    if !Game.GetPlayer().HasLOS(Jarl.GetActorRef())
        Jarl.GetActorRef().MoveTo(JarlMarker.GetRef())
    endif
    
    int i = 0
    while i < Citizens.Length
        if i < maxcitizens
            if Citizens[i].GetActorRef()
                if !Game.GetPlayer().HasLOS(Citizens[i].GetActorRef())
                    Citizens[i].TryToMoveTo(CitizenMarkers[i].GetRef())
                endif
                Citizens[i].GetActorRef().EquipItem(Torch01, true)
                Citizens[i].GetActorRef().IgnoreFriendlyHits(true)
            endif
        else
            Citizens[i].Clear()
        endif
        i += 1
    endwhile
    
    i = 0
    while i < Guards.Length
        if City.GetLocation().GetKeywordData(CWOwner) == 1
            Actor NewGuard = GuardMarkers[i].GetRef().PlaceActorAtMe(HoldGuardsImp[holdnum])
            Guards[i].ForceRefTo(NewGuard)
        elseif City.GetLocation().GetKeywordData(CWOwner) == 2
            Actor NewGuard = GuardMarkers[i].GetRef().PlaceActorAtMe(HoldGuardsSons[holdnum])
            Guards[i].ForceRefTo(NewGuard)
        endif
        Guards[i].GetActorRef().IgnoreFriendlyHits(true)
        i += 1
    endwhile
EndFunction

Function ReturnActorsToNormal()
    CoupGuardFaction.SetAlly(CoupCitizenFaction)
    int i = 0
    while i < Citizens.Length
        if Citizens[i].GetActorRef()
            Citizens[i].GetActorRef().IgnoreFriendlyHits(false)
            Citizens[i].GetActorRef().UnEquipItem(Torch01)
            Citizens[i].GetActorRef().RemoveItem(Torch01)
        endif
        i += 1
    endwhile
EndFunction

Function DeleteIfNotArrester(Actor Guard)
    if Guard && Guard != Arrester.GetActorRef()
        Guard.Delete()
    endif
EndFunction

Function StartCoupBattle()
    Game.GetPlayer().DrawWeapon()
    CoupGuardFaction.SetEnemy(CoupCitizenFaction)
    EvaluateAllPackages()
    Jarl.GetActorRef().StartCombat(Game.GetPlayer())
    Guards[0].GetActorRef().StartCombat(Game.GetPlayer())
    RegisterForUpdate(1)
EndFunction

Function EvaluateAllPackages()
    int i = 0
    while i < Guards.Length
        Guards[i].TryToEvaluatePackage()
        i += 1
    endwhile
    
    i = 0
    while i < Citizens.Length
        Citizens[i].TryToEvaluatePackage()
        i += 1
    endwhile
EndFunction

Function StopCoupBattle(bool playerwin = false)
    debug.notification("Stopping Coup Battle")
    CoupGuardFaction.SetAlly(CoupCitizenFaction)
    Jarl.GetActorRef().StopCombat()
    int i = 0
    while i < Guards.Length
        Guards[i].TryToStopCombat()
        i += 1
    endwhile
    
    i = 0
    while i < Citizens.Length
        Citizens[i].TryToStopCombat()
        i += 1
    endwhile
    
    if playerwin == true
        SetStage(100)
    else
        i = 0
        Actor AliveGuard
        while i < Guards.Length && !AliveGuard
            if Guards[i].GetActorRef() && !Guards[i].GetActorRef().IsDead()
                AliveGuard = Guards[i].GetActorRef()
            endif
            i += 1
        endwhile
        if AliveGuard
            ArrestPlayer(AliveGuard)
        else
            SetStage(101)
        endif
    endif
EndFunction

Function GuardsDecideToArrest()
    if InfluenceHold.InfluenceGuards >= 80
        SetStage(31) ; Guards fully betray Jarl
    elseif InfluenceHold.InfluenceGuards >= 60
        SetStage(32) ; Guards discuss betraying Jarl but side with player
    elseif InfluenceHold.InfluenceGuards >= 40
        SetStage(33) ; Guards discuss betraying Jarl but side with Jarl
    else
        SetStage(34) ; Guards fully side with Jarl
    endif
EndFunction

Function ArrestPlayer(Actor GuardArrester)
    PlayerSurrender.StartArrest(GuardArrester, holdnum)
    SetStage(110)
EndFunction

Function ArrestJarl(Actor Guard)
    GuardBetrayJarl.Stop()
    
    int i = 0
    while i < Guards.Length
        if Guards[i].GetActorRef() == Guard
            Guards[i].Clear()
        endif
        i += 1
    endwhile
    
    JarlPrisoner = true
    PrisonScript.ArrestGuard.ForceRefTo(Guard)
    RegisterForSingleUpdate(3)
EndFunction

Function JarlSurrenderCity()
    TransferCity.TakeCity(holdnum, nofaction=true)
    ((self as Quest) as CS_InfluenceChangesScript).SetInfluence(holdnum, "Nobility", 50, true)
    ((self as Quest) as CS_InfluenceChangesScript).SetInfluence(holdnum, "Commoners", 60, true)
    ((self as Quest) as CS_InfluenceChangesScript).SetInfluence(holdnum, "Guards", 50, true)
EndFunction

Event OnUpdateGameTime()
    if GetStage() == 0 && GameDaysPassed.GetValue() >= CoupDay
        SetStage(10)
        if JarlMarker.GetRef().Is3DLoaded()
            CrowdChanting.ForceStart()
        endif
        UnRegisterForUpdateGameTime()
    endif
EndEvent

Event OnUpdate()
    if GetStage() == 40 && !Game.GetPlayer().IsWeaponDrawn()
        UnRegisterForUpdate()
        SetStage(45)
    elseif JarlPrisoner == true
        PrisonScript.SendToPrison(Jarl.GetActorRef(), holdnum)
        SetStage(100)
    endif
EndEvent