Scriptname CS_ParadeScript extends Quest  

LocationAlias Property City Auto
LocationAlias Property Capital Auto

ReferenceAlias Property PlayerHorse Auto
ReferenceAlias Property Jarl Auto
ReferenceAlias Property ASIC Auto
ReferenceAlias Property Guard Auto
ReferenceAlias Property Guard2 Auto
ReferenceAlias Property Drummer Auto
ReferenceAlias Property Drummer2 Auto
ReferenceAlias Property GovASIC Auto
ReferenceAlias[] Property ParadeCommanders  Auto
ReferenceAlias[] Property Troops Auto

ReferenceAlias Property PlayerHorseMarker Auto
ReferenceAlias Property GuardMarker Auto
ReferenceAlias Property GuardMarker2 Auto
ReferenceAlias Property DrummerMarker Auto
ReferenceAlias Property DrummerMarker2 Auto
ReferenceAlias[] Property CommanderMarkers  Auto
ReferenceAlias[] Property TroopElementMarkers Auto  

float Property ParadeDay Auto
GlobalVariable Property GameDaysPassed Auto

FormList Property GarrisonFactions Auto
FormList Property AllLocations Auto
FormList Property ParadeTroops Auto

ActorBase Property PlayerGuard Auto

Armor Property Drums Auto

Sound Property DrumsSound Auto

ObjectReference Property ASICHorse Auto
ObjectReference Property JarlHorse Auto
ObjectReference Property TempPlayerHorse Auto

Keyword Property CS_StoryParade Auto

Quest Property GovQuest Auto

int Property ExtraColumnSetUpNum=3 Auto

int Property SoundInstance Auto

CS_PatrolHoldScript Property TroopManage Auto
CS_UpgradeTroopsMenu Property UpgradeTroops Auto
CS_LoyaltyCheckScript Property LoyaltyScript Auto

Function AssignCommanders()
    int citynum = AllLocations.Find(City.GetLocation())
    Faction GarrisonFaction = GarrisonFactions.GetAt(citynum) as Faction
    int parade_troop_num = 0
    int i = 0
    while i < TroopManage.Commanders.Length
        if TroopManage.Commanders[i].GetActorRef().IsInFaction(GarrisonFaction) == 1
            Actor Commander = TroopManage.Commanders[i].GetActorRef()
            int index = 0
            int AliasFound = 0
            while index < ParadeCommanders.Length && AliasFound == 0
                if ParadeCommanders[index].GetActorRef() == None
                    ParadeCommanders[index].ForceRefTo(TroopManage.Commanders[i].GetActorRef())
                    TroopManage.ArmyScripts[i].SpawnNewUnspawnedTroops(Commander)
                    AliasFound = 1
                endif
                index += 1
            endwhile
            TroopManage.DisableAllTroops(Commander)
            int troopnum = 0
            Actor[] ArmyTroops = TroopManage.GetArmyTroops(Commander)
            while troopnum < ArmyTroops.Length  && parade_troop_num < 16
                if ArmyTroops[troopnum]
                    Troops[parade_troop_num].ForceRefTo(ArmyTroops[troopnum])
                    Troops[parade_troop_num].GetActorRef().enable()
                    parade_troop_num += 1
                endif
                troopnum += 1
            endwhile
        endif
        i += 1
    endwhile
    If (GovQuest as CS_RecruitJarl).JarlAliases[citynum].GetActorRef() != None && (GovQuest as CS_RecruitJarl).JarlAliases[citynum].GetActorRef() != Game.GetPlayer()
        JarlHorse = JarlMarker.GetReference().PlaceAtMe(ParadeHorse) as ObjectReference
        JarlHorse.SetActorOwner((GovQuest as CS_RecruitJarl).JarlAliases[citynum].GetActorRef().GetActorBase())
        JarlHorse.BlockActivation()
        Jarl.ForceRefTo((GovQuest as CS_RecruitJarl).JarlAliases[citynum].GetActorRef())
    EndIf
    If City.GetLocation() == Capital.GetLocation()
        ASICHorse = ASICMarker.GetReference().PlaceAtMe(ParadeHorse) as ObjectReference
        ASICHorse.SetActorOwner(GovASIC.GetActorRef().GetActorBase())
        ASICHorse.BlockActivation()
        ASIC.ForceRefTo(GovASIC.GetActorRef())
    EndIf
    MoveGuardToMarker()
EndFunction

Function MoveGuardToMarker()
    if Guard.GetRef()
        if Guard.GetRef().GetDistance(GuardMarker.GetRef()) > 200
            Guard.GetRef().MoveTo(GuardMarker.GetRef())
            Guard2.GetRef().MoveTo(GuardMarker2.GetRef())
            Drummer.GetRef().MoveTo(DrummerMarker.GetRef())
            Drummer2.GetRef().MoveTo(DrummerMarker2.GetRef())
        endif
    else
        Actor ParadeGuard = GuardMarker.GetReference().PlaceAtMe(PlayerGuard) as Actor
        Actor ParadeGuard2 = GuardMarker2.GetReference().PlaceAtMe(PlayerGuard) as Actor
        Actor ParadeDrummer = DrummerMarker.GetReference().PlaceAtMe(PlayerGuard) as Actor
        Actor ParadeDrummer2 = DrummerMarker2.GetReference().PlaceAtMe(PlayerGuard) as Actor
        Guard.ForceRefTo(ParadeGuard)
        Guard2.ForceRefTo(ParadeGuard2)
        Drummer.ForceRefTo(ParadeDrummer)
        Drummer2.ForceRefTo(ParadeDrummer2)
        Guard.GetRef().MoveTo(GuardMarker.GetRef())
        Guard2.GetRef().MoveTo(GuardMarker2.GetRef())
        Drummer.GetRef().MoveTo(DrummerMarker.GetRef())
        Drummer2.GetRef().MoveTo(DrummerMarker2.GetRef())
    endif
EndFunction
    
Function DrummerStart()
    if Drummer.GetRef()
        Drummer.GetRef().MoveTo(DrummerMarker.GetRef())
        Drummer.GetActorRef().RemoveItem(Drummer.GetActorRef().GetEquippedShield())
        Drummer.GetActorRef().AddItem(Drums, 1)
        Drummer.GetActorRef().EquipItem(Drums, true)
        Drummer2.GetRef().MoveTo(DrummerMarker2.GetRef())
        Drummer2.GetActorRef().RemoveItem(Drummer2.GetActorRef().GetEquippedShield())
        Drummer2.GetActorRef().AddItem(Drums, 1)
        Drummer2.GetActorRef().EquipItem(Drums, true)
        SoundInstance = DrumsSound.Play(Drummer.GetActorRef())
        Sound.SetInstanceVolume(SoundInstance, 3)
    endif
EndFunction

Function DrummerStop()
    if Drummer.GetRef()
        Sound.StopInstance(SoundInstance)
    endif
EndFunction

Function MoveActorsToParade()
    TempPlayerHorse = PlayerHorseMarker.GetReference().PlaceAtMe(ParadeHorse) as ObjectReference
    TempPlayerHorse.SetActorOwner(Game.GetPlayer().GetActorBase())
    PlayerHorse.ForceRefTo(TempPlayerHorse)
    If Jarl.GetActorRef() != None
        Jarl.GetActorRef().MoveTo(JarlMarker.GetReference())
        JarlHorse.Activate(Jarl.GetActorRef())
    EndIf
    If ASIC.GetActorRef() != None
        ASIC.GetActorRef().MoveTo(ASICMarker.GetReference())
        ASICHorse.Activate(ASIC.GetActorRef())
    EndIf
    int i = 0
    while i < ParadeCommanders.Length
        if ParadeCommanders[i].GetActorRef() != None
            ParadeCommanders[i].GetActorRef().MoveTo(CommanderMarkers[i].GetReference())
        endif
        i += 1
    endwhile
    i = 0
    while i < Troops.Length
        Troops[i].TryToMoveTo(TroopElementMarkers[i].GetRef())
        i += 1
    endwhile
    i = 0
    while i < Citizens.Length
        if Citizens[i].GetActorRef() != None
            Citizens[i].GetActorRef().MoveTo(CitizenMarkers[i].GetReference())
        endif
        i += 1
    endwhile
    MoveGuardToMarker()
    Guard.GetActorRef().AddItem(HoldableBanners.GetAt(BannerNum.GetValue() as int) as Light, 1)
    Guard.GetActorRef().EquipItem(HoldableBanners.GetAt(BannerNum.GetValue() as int) as Light, true)
    Guard2.GetActorRef().AddItem(HoldableBanners.GetAt(BannerNum.GetValue() as int) as Light, 1)
    Guard2.GetActorRef().EquipItem(HoldableBanners.GetAt(BannerNum.GetValue() as int) as Light, true)
    Drummer.GetActorRef().RemoveItem(Drummer.GetActorRef().GetEquippedShield())
    Drummer.GetActorRef().AddItem(Drums, 1)
    Drummer.GetActorRef().EquipItem(Drums, true)
    Drummer2.GetActorRef().RemoveItem(Drummer2.GetActorRef().GetEquippedShield())
    Drummer2.GetActorRef().AddItem(Drums, 1)
    Drummer2.GetActorRef().EquipItem(Drums, true)
EndFunction

Function GiveCitizensFlags()
    int i = 0
    while i < Citizens.Length
        if Citizens[i].GetActorRef() != None
            int flagchance = utility.randomint(0, 4)
            if flagchance == 1
                Citizens[i].GetActorRef().AddItem(HoldableBanners.GetAt(BannerNum.GetValue() as int) as Light, 1)
                Citizens[i].GetActorRef().EquipItem(HoldableBanners.GetAt(BannerNum.GetValue() as int) as Light)
            endif
        endif
        i += 1
    endwhile
EndFunction

Function RemoveCitizensFlags()
    int i = 0
    while i < Citizens.Length
        if Citizens[i].GetActorRef() != None
            if Citizens[i].GetActorRef().IsEquipped(HoldableBanners.GetAt(BannerNum.GetValue() as int) as Light) == 1
                Citizens[i].GetActorRef().UnequipItem(HoldableBanners.GetAt(BannerNum.GetValue() as int) as Light)
                Citizens[i].GetActorRef().RemoveItem(HoldableBanners.GetAt(BannerNum.GetValue() as int) as Light, 1)
            endif
        endif
        i += 1
    endwhile        
EndFunction

Function CitizensApplaud()
    int i = 0
    while i < Citizens.Length
        If Citizens[i].GetActorRef() != None
            int idlenum = utility.randomint(0, 3)
            if idlenum == 0
                Citizens[i].GetActorRef().PlayIdle(CheerIdle)
            elseif idlenum == 1
                Citizens[i].GetActorRef().PlayIdle(CheerIdle2)
            elseif idlenum == 2
                Citizens[i].GetActorRef().PlayIdle(CheerIdle3)
            elseif idlenum == 3
                Citizens[i].GetActorRef().PlayIdle(CheerIdle4)
            endif
        EndIf
        i += 1
    endwhile
EndFunction

Function RefreshAllPackages()
    if ASIC.GetActorRef() && !ASIC.GetActorRef().IsOnMount()
        ASICHorse.Activate(ASIC.GetActorRef())
    endif
    
    if Jarl.GetActorRef() && !Jarl.GetActorRef().IsOnMount()
        JarlHorse.Activate(Jarl.GetActorRef())
    endif
    
    Jarl.TryToEvaluatePackage()
    ASIC.TryToEvaluatePackage()
    Guard.GetActorRef().EvaluatePackage()
    Guard2.GetActorRef().EvaluatePackage()
    Drummer.GetActorRef().EvaluatePackage()
    Drummer2.GetActorRef().EvaluatePackage()
    int i = 0
    while i < ParadeCommanders.Length
        if ParadeCommanders[i].GetActorRef() != None
            ParadeCommanders[i].GetActorRef().EvaluatePackage()
        endif
        i += 1
    endwhile
    i = 0
    while i < Troops.Length
        Troops[i].TryToEvaluatePackage()
        i += 1
    endwhile
EndFunction

Function SetUpColumns()
    Guard2.GetActorRef().ClearKeepOffsetFromActor()
    Guard2.GetActorRef().KeepOffsetFromActor(Guard.GetActorRef(), -120 as Float, 80 as Float, 0 as Float, 0.000000, 0.000000, 0 as Float, 160 as Float, 0 as Float)
    Drummer2.GetActorRef().ClearKeepOffsetFromActor()
    Drummer2.GetActorRef().KeepOffsetFromActor(Drummer.GetActorRef(), -120, 0, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    
    if ASIC.GetActorRef() && ASIC.GetActorRef().IsOnMount()
        ASIC.GetActorRef().ClearKeepOffsetFromActor()
        ASIC.GetActorRef().KeepOffsetFromActor(Game.GetPlayer(), -120, -200, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    if Jarl.GetActorRef() && Jarl.GetActorRef().IsOnMount()
        Jarl.GetActorRef().ClearKeepOffsetFromActor()
        Jarl.GetActorRef().KeepOffsetFromActor(Game.GetPlayer(), 120, -200, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    if ParadeCommanders[3].GetActorRef()
        ParadeCommanders[3].GetActorRef().ClearKeepOffsetFromActor()
        ParadeCommanders[3].GetActorRef().KeepOffsetFromActor(ParadeCommanders[2].GetActorRef(), -120, 0, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    if ParadeCommanders[1].GetActorRef()
        ParadeCommanders[1].GetActorRef().ClearKeepOffsetFromActor()
        ParadeCommanders[1].GetActorRef().KeepOffsetFromActor(ParadeCommanders[0].GetActorRef(), -120, 0, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    if Troops[1].GetActorRef()
        Troops[1].GetActorRef().ClearKeepOffsetFromActor()
        Troops[1].GetActorRef().KeepOffsetFromActor(Troops[0].GetActorRef(), -120, 0, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    if Troops[3].GetActorRef()
        Troops[3].GetActorRef().ClearKeepOffsetFromActor()
        Troops[3].GetActorRef().KeepOffsetFromActor(Troops[2].GetActorRef(), -120, 0, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    if Troops[5].GetActorRef()
        Troops[5].GetActorRef().ClearKeepOffsetFromActor()
        Troops[5].GetActorRef().KeepOffsetFromActor(Troops[4].GetActorRef(), -120, 0, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    if Troops[7].GetActorRef()
        Troops[7].GetActorRef().ClearKeepOffsetFromActor()
        Troops[7].GetActorRef().KeepOffsetFromActor(Troops[6].GetActorRef(), -120, 0, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    if Troops[9].GetActorRef()
        Troops[9].GetActorRef().ClearKeepOffsetFromActor()
        Troops[9].GetActorRef().KeepOffsetFromActor(Troops[8].GetActorRef(), -120, 0, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    if Troops[11].GetActorRef()
        Troops[11].GetActorRef().ClearKeepOffsetFromActor()
        Troops[11].GetActorRef().KeepOffsetFromActor(Troops[10].GetActorRef(), -120, 0, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    if Troops[13].GetActorRef()
        Troops[13].GetActorRef().ClearKeepOffsetFromActor()
        Troops[13].GetActorRef().KeepOffsetFromActor(Troops[12].GetActorRef(), -120, 0, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    if Troops[15].GetActorRef()
        Troops[15].GetActorRef().ClearKeepOffsetFromActor()
        Troops[15].GetActorRef().KeepOffsetFromActor(Troops[14].GetActorRef(), -120, 0, 0, afCatchUpRadius = 160, afFollowRadius = 0 as Float)
    endif
    
    Utility.Wait(0.5)
EndFunction

Function ClearColumns()
    Guard2.GetActorRef().ClearKeepOffsetFromActor()

    Drummer2.GetActorRef().ClearKeepOffsetFromActor()
    
    if ASIC.GetActorRef()
        ASIC.GetActorRef().ClearKeepOffsetFromActor()
    endif
    
    if Jarl.GetActorRef()
        Jarl.GetActorRef().ClearKeepOffsetFromActor()
    endif

    if ParadeCommanders[3].GetActorRef()
        ParadeCommanders[3].GetActorRef().ClearKeepOffsetFromActor()
    endif
    
    if ParadeCommanders[1].GetActorRef()
        ParadeCommanders[1].GetActorRef().ClearKeepOffsetFromActor()
    endif
    
    if Troops[1].GetActorRef()
        Troops[1].GetActorRef().ClearKeepOffsetFromActor()
    endif
    
    if Troops[3].GetActorRef()
        Troops[3].GetActorRef().ClearKeepOffsetFromActor()
    endif
    
    if Troops[5].GetActorRef()
        Troops[5].GetActorRef().ClearKeepOffsetFromActor()
    endif
    
    if Troops[7].GetActorRef()
        Troops[7].GetActorRef().ClearKeepOffsetFromActor()
    endif
    
    if Troops[9].GetActorRef()
        Troops[9].GetActorRef().ClearKeepOffsetFromActor()
    endif
    
    if Troops[11].GetActorRef()
        Troops[11].GetActorRef().ClearKeepOffsetFromActor()
    endif
    
    if Troops[13].GetActorRef()
        Troops[13].GetActorRef().ClearKeepOffsetFromActor()
    endif
    
    if Troops[15].GetActorRef()
        Troops[15].GetActorRef().ClearKeepOffsetFromActor()
    endif    
EndFunction

Function ClearParade()
    ClearColumns()
    CheerAlias.GetOwningQuest().Stop()
    utility.wait(5)
    debug.trace("Deleting Guard")
    Guard.GetActorRef().Delete()
    utility.wait(5)
    Guard2.GetActorRef().Delete()
    utility.wait(5)
    Drummer.GetActorRef().Delete()
    utility.wait(5)
    Drummer2.GetActorRef().Delete()
    utility.wait(5)
    If PlayerHorse.GetRef() != None
        utility.wait(5)
        debug.trace("Deleting Temp Player Horse")
        TempPlayerHorse.Delete()
    EndIf
    debug.trace("Finding ASIC Horse")
    If ASICHorse != None
        utility.wait(5)
        debug.trace("Deleting ASIC Horse")
        ASICHorse.Delete()
    EndIf
    utility.wait(5)
    debug.trace("Finding Jarl Horse")
    If JarlHorse != None
        utility.wait(5)
        debug.trace("Deleting Jarl Horse")
        JarlHorse.Delete()
    EndIf
    utility.wait(5)
    debug.trace("Stopping Quest")
    stop()
EndFunction

Function ClearGhostInIvarstead()
    int citynum = AllLocations.Find(City.GetLocation())
    if citynum == 10
        int i = 0
        while i < Citizens.Length
            if Citizens[i].GetActorRef() == Wyndelius
                Citizens[i].Clear()
            endif
            i += 1
        endwhile
    endif
EndFunction

Function DeleteHorsesAndGuard()
    PlayerHorse.GetRef().Delete()
    ASICHorse.Delete()
    JarlHorse.Delete()
    if Guard.GetActorRef()
        Guard.GetActorRef().Delete()
    endif
    if Guard2.GetActorRef()
        Guard2.GetActorRef().Delete()
    endif
    if Drummer.GetActorRef()
        Drummer.GetActorRef().Delete()
    endif
    if Drummer2.GetActorRef()
        Drummer2.GetActorRef().Delete()
    endif
EndFunction

Event OnUpdate()
    if ExtraColumnSetUpNum == 3
        SetUpColumns()
        ExtraColumnSetUpNum = 0
    endif
    ExtraColumnSetUpNum += 1
    CitizensApplaud()
    CS_StoryParade.SendStoryEvent(aiValue1 = 1)
EndEvent

Event OnUpdateGameTime()
    if GameDaysPassed.GetValue() >= ParadeDay
        If GetStage() < 10
            SetStage(10)
        EndIf
    endif
EndEvent


ActorBase Property ParadeHorse  Auto  

ReferenceAlias Property JarlMarker  Auto  

ReferenceAlias Property ASICMarker  Auto  

ReferenceAlias[] Property Citizens  Auto  
ReferenceAlias[] Property CitizenMarkers  Auto  

Idle Property CheerIdle  Auto  

Idle Property CheerIdle2  Auto  

Idle Property CheerIdle3  Auto  

Idle Property CheerIdle4  Auto  

Light Property EmptyHoldableBanner  Auto  

FormList Property HoldableBanners  Auto  

GlobalVariable Property BannerNum  Auto  

Scene Property CheerScene  Auto  

ReferenceAlias Property CheerAlias  Auto  

Actor Property Wyndelius  Auto  
