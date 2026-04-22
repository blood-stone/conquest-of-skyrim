Scriptname CS_TransferOwnershipScript extends Quest  
;/
FormList Property AllHoldings Auto
FormList Property AllHoldingsFort Auto
FormList Property AllLocations Auto
FormList Property AllLocationsCS Auto
FormList Property AllLocationsFort Auto
FormList Property PlayerMarkers Auto
FormList Property ImpMarkerLists Auto
FormList Property SonsMarkerLists Auto
FormList Property MapMarkerLists Auto
FormList Property FortMarkersImp Auto
FormList Property FortMarkersSons Auto
FormList Property FortMarkersPlayer Auto
FormList Property GovNPCsImp Auto
FormList Property GovNPCsSons Auto
FormList Property CrimeFactions Auto
FormList Property OwnershipFactions Auto
FormList Property BedsToOwn Auto
FormList Property DoorsToUnlock Auto
FormList Property MapMarkersForts Auto
FormList Property CS_DisabledJarls Auto

GlobalVariable Property CityCountImp Auto
GlobalVariable Property MinorCityCountImp Auto
GlobalVariable Property VillageCountImp Auto
GlobalVariable Property FortCountImp Auto
GlobalVariable Property CityCountSons Auto
GlobalVariable Property MinorCityCountSons Auto
GlobalVariable Property VillageCountSons Auto
GlobalVariable Property FortCountSons Auto
GlobalVariable Property CityCountPlayer Auto
GlobalVariable Property MinorCityCountPlayer Auto
GlobalVariable Property VillageCountPlayer Auto
GlobalVariable Property FortCountPlayer Auto

ReferenceAlias Property NewJarl Auto
ReferenceAlias Property FactionName Auto

ReferenceAlias[] Property GovMarkarthImp Auto
ReferenceAlias[] Property GovRiftenImp Auto
ReferenceAlias[] Property GovSolitudeImp Auto
ReferenceAlias[] Property GovWhiterunImp Auto
ReferenceAlias[] Property GovWindhelmImp Auto
ReferenceAlias[] Property GovDawnstarImp Auto
ReferenceAlias[] Property GovFalkreathImp Auto
ReferenceAlias[] Property GovMorthalImp Auto
ReferenceAlias[] Property GovWinterholdImp Auto

ReferenceAlias[] Property GovMarkarthSons Auto
ReferenceAlias[] Property GovRiftenSons Auto
ReferenceAlias[] Property GovSolitudeSons Auto
ReferenceAlias[] Property GovWhiterunSons Auto
ReferenceAlias[] Property GovWindhelmSons Auto
ReferenceAlias[] Property GovDawnstarSons Auto
ReferenceAlias[] Property GovFalkreathSons Auto
ReferenceAlias[] Property GovMorthalSons Auto
ReferenceAlias[] Property GovWinterholdSons Auto

ReferenceAlias[] Property VanillaJarlAliases Auto
ReferenceAlias[] Property VanillaJarlBackupAliases Auto

ReferenceAlias[] Property JarlLoS Auto

Message Property NewCapitalMessage Auto
Message Property NewJarlMessage Auto
Message Property TransferMessageImp Auto
Message Property TransferMessageSons Auto
Message Property TransferMessagePlayer Auto

Faction Property CitizenFaction Auto
Faction Property CS_JarlDeadFaction Auto
Faction Property CS_MarriagePlayerSiblingInLaw Auto
Faction Property CS_MarriagePlayerChildInLaw Auto
Faction Property CS_MarriagePlayerParentInLaw Auto
Faction Property CS_MarriedToPlayerFaction Auto
Faction PRoperty CS_ResetFaction Auto
Faction Property CS_JarlOpinionEconomy Auto
Faction Property CS_JarlOpinionPrivilege Auto
Faction Property CS_JarlOpinionRepresentation Auto
Faction Property CS_JarlOpinionSecurity Auto

LocationAlias Property HoldingAlias Auto

ObjectReference Property FactionNameBarrel Auto

Keyword Property CWOwner Auto
Keyword Property ArmiesDefending Auto
Keyword Property CS_PlayerJarl Auto
Keyword Property CS_StoryTransferHoldingCity Auto
Keyword Property CS_StoryTransferHoldingFort Auto
Keyword Property CS_StoryTransferJarl Auto
Keyword Property CS_StoryGetJarlLoS Auto

ActorBase Property Ulfric Auto

Quest Property WarMapReset Auto
Quest Property CS_GetJarlLoS Auto

CS_TMScript Property TMPlayer Auto
CS_TMScript Property TMImperial Auto
CS_TMScript Property TMSons Auto
CS_FortCommandersScript Property FortCommandersScript Auto
CS_CommanderMovingScript Property CommanderMoving Auto
CS_GovPositions Property GovPositions Auto
CS_PrisonerQuestScript Property PrisonerScript Auto
CS_PublicOpinionScript Property CS_PublicOpinion Auto
CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto

Quest Property GovQuest Auto

Function TransferOwnershipCity(int citynum, int newfaction, bool keepjarl=false, bool retainguards=false)
    if !IsRunning()
        Start()
    endif

    Location CityLoc = AllLocations.GetAt(citynum) as Location
    Location CityLocCS = AllLocationsCS.GetAt(citynum) as Location
    CityLocCS.SetKeywordData(ArmiesDefending, 0)
    HoldingAlias.ForceLocationTo(CityLoc)
    
    if newfaction == 69

        (CrimeFactions.GetAt(citynum) as Faction).SetCrimeGold(0)
        (CrimeFactions.GetAt(citynum) as Faction).SetCrimeGoldViolent(0)
        CityLoc.SetKeywordData(CWOwner, 69)
        
        if !keepjarl
            RemoveGovernment(citynum)
        endif

        if (AllHoldings.GetAt(citynum) as GlobalVariable).GetValue() == 11
            int guardmarkernum = 0
            while guardmarkernum < (ImpMarkerLists.GetAt(citynum) as FormList).GetSize()
                ((ImpMarkerLists.GetAt(citynum) as FormList).GetAt(guardmarkernum) as ObjectReference).disable()
                guardmarkernum += 1
            endwhile
            
            if citynum < 5
                TMImperial.CityCount += -1
            elseif citynum >= 5 && citynum < 9
                TMImperial.MinorCityCount += -1
            endif

            TMImperial.Capital = -1
            TMImperial.ChooseRandomCapital()
            (AllHoldings.GetAt(citynum) as GlobalVariable).SetValue(1)
            TMImperial.CheckAllHoldings()
            TMImperial.DisplayInvasionObjectives(citynum)
                    
        elseif (AllHoldings.GetAt(citynum) as GlobalVariable).GetValue() == 12
            int guardmarkernum = 0
            while guardmarkernum < (SonsMarkerLists.GetAt(citynum) as FormList).GetSize()
                ((SonsMarkerLists.GetAt(citynum) as FormList).GetAt(guardmarkernum) as ObjectReference).disable()
                guardmarkernum += 1
            endwhile
            
            if citynum < 5
                TMSons.CityCount += -1
            elseif citynum >= 5 && citynum < 9
                TMSons.MinorCityCount += -1
            endif

            TMSons.Capital = -1
            TMSons.ChooseRandomCapital()
            (AllHoldings.GetAt(citynum) as GlobalVariable).SetValue(1)
            TMSons.CheckAllHoldings()
            TMSons.DisplayInvasionObjectives(citynum)

        endif

        int mapmarkernum = 0
        while mapmarkernum < (MapMarkerLists.GetAt(citynum) as FormList).GetSize()
            ((MapMarkerLists.GetAt(citynum) as FormList).GetAt(mapmarkernum) as ObjectReference).enable()
            mapmarkernum += 1
        endwhile

        int ownershipfactionnum = 0
        while ownershipfactionnum < (OwnershipFactions.GetAt(citynum) as FormList).GetSize()
            Game.GetPlayer().AddToFaction((OwnershipFactions.GetAt(citynum) as FormList).GetAt(ownershipfactionnum) as Faction)
            ownershipfactionnum += 1
        endwhile

        if citynum < 5

            int doornum = 0
            while doornum < (DoorsToUnlock.GetAt(citynum) as FormList).GetSize()
                ObjectReference LockedDoor = (DoorsToUnlock.GetAt(citynum) as FormList).GetAt(doornum) as ObjectReference
                LockedDoor.SetLockLevel(0)
                LockedDoor.Lock(false)
                doornum += 1
            endwhile

        endif

        if citynum < 5
            CityCountPlayer.Mod(1)
        elseif citynum >= 5 && citynum < 9
            MinorCityCountPlayer.Mod(1)
        endif
        (PlayerMarkers.GetAt(citynum) as ObjectReference).enable()

        (GovQuest as CS_ChangeBanners).ReplaceCityBanners(citynum)

        if (CityCountPlayer.GetValue() + MinorCityCountPlayer.GetValue()) == 1
            (GovQuest as CS_GovScriptFunctions).SetUpCapital(citynum)
            NewCapitalMessage.Show()
        endif

        FactionName.ForceRefTo(FactionNameBarrel)

        TransferMessagePlayer.show()

        if citynum == 0
            TransferOwnershipVillage(11, 1)
        elseif citynum == 1
            TransferOwnershipVillage(10, 1)
            TransferOwnershipVillage(14, 1)
        elseif citynum == 2
            TransferOwnershipVillage(9, 1)
        elseif citynum == 3
            TransferOwnershipVillage(12, 1)
            TransferOwnershipVillage(13, 1)
        endif

        if GovQuest.GetStage() == 12
            (GovQuest as CS_GovScriptFunctions).FirstCity.ForceLocationTo(CityLoc)
            GovQuest.SetStage(13)
        elseif GovQuest.GetStage() < 16
            int i = 0
            bool doesnothaveeverything
            while i < AllHoldings.GetSize()
                if (AllHoldings.GetAt(i) as GlobalVariable).GetValueInt() != 1
                    doesnothaveeverything = true
                endif
                i += 1
            endwhile
            if !doesnothaveeverything
                GovQuest.SetStage(16)
            endif
        endif

    else
        
        (AllLocationsCS.GetAt(citynum) as Location).SetKeywordData(CS_PlayerJarl, 0)

        int i = 0
        while i < CommanderMoving.CommandersIncomingCity[citynum].GetSize()
            CommanderMoving.StopCommanderMoving(CommanderMoving.CommandersIncomingCity[citynum].GetAt(i) as Actor)
            i += 1
        endwhile

        if citynum < 5
            CityCountPlayer.Mod(-1)
        elseif citynum >= 5 && citynum < 9
            MinorCityCountPlayer.Mod(-1)
        endif
        (PlayerMarkers.GetAt(citynum) as ObjectReference).disable()

        if newfaction == 11

                (AllHoldings.GetAt(citynum) as GlobalVariable).SetValue(11)
                CityLoc.SetKeywordData(CWOwner, 1)

                i = 0
                while i < (GovNPCsImp.GetAt(citynum) as FormList).GetSize()
                    if citynum == 0
                        GovMarkarthImp[i].Clear()
                    elseif citynum == 1
                        GovRiftenImp[i].Clear()
                    elseif citynum == 2
                        GovSolitudeImp[i].Clear()
                    elseif citynum == 3
                        GovWhiterunImp[i].Clear()
                    elseif citynum == 4
                        GovWindhelmImp[i].Clear()
                    elseif citynum == 5
                        GovDawnstarImp[i].Clear()
                    elseif citynum == 6
                        GovFalkreathImp[i].Clear()
                    elseif citynum == 7
                        GovMorthalImp[i].Clear()
                    elseif citynum == 8
                        GovWinterholdImp[i].Clear()
                    endif
                    ((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor).RemoveFromFaction(CitizenFaction)
                    i += 1
                endwhile

                Actor NextJarl = GetNextJarl(GovPositions.JarlsImp[citynum] as Actor)
                (GovQuest as CS_RecruitJarl).JarlAliases[citynum].ForceRefTo(NextJarl)
                (GovQuest as CS_RecruitJarl).StewardAliases[citynum].ForceRefTo(GovPositions.StewardsImp[citynum])
                (GovQuest as CS_RecruitJarl).HousecarlAliases[citynum].ForceRefTo(GovPositions.HousecarlsImp[citynum])
                CS_EconomyUpdaterNew.EconomyHoldUpdaters[citynum].JarlOpinion = CS_PublicOpinion.GetPublicOpinionOfActor(NextJarl, citynum)
                NewJarl.ForceRefTo(NextJarl)

                int guardmarkernum = 0
                while guardmarkernum < (ImpMarkerLists.GetAt(citynum) as FormList).GetSize()
                    ((ImpMarkerLists.GetAt(citynum) as FormList).GetAt(guardmarkernum) as ObjectReference).enable()
                    guardmarkernum += 1
                endwhile
            
                if citynum < 5
                    TMImperial.CityCount += 1
                elseif citynum >= 5 && citynum < 9
                    TMImperial.MinorCityCount += 1
                endif

            TransferMessageImp.show()

            NewJarlMessage.show()

            TMImperial.ChooseRandomCapital()
            TMImperial.DisplayInvasionObjectives(citynum)

            if citynum == 0
                TransferOwnershipVillage(11, 11)
            elseif citynum == 1
                TransferOwnershipVillage(10, 11)
                TransferOwnershipVillage(14, 11)
            elseif citynum == 2
                TransferOwnershipVillage(9, 11)
            elseif citynum == 3
                TransferOwnershipVillage(12, 11)
                TransferOwnershipVillage(13, 11)
            endif

        elseif newfaction == 12

                (AllHoldings.GetAt(citynum) as GlobalVariable).SetValue(12)
                CityLoc.SetKeywordData(CWOwner, 2)

                i = 0
                while i < (GovNPCsSons.GetAt(citynum) as FormList).GetSize()
                    if citynum == 0
                        GovMarkarthSons[i].Clear()
                    elseif citynum == 1
                        GovRiftenSons[i].Clear()
                    elseif citynum == 2
                        GovSolitudeSons[i].Clear()
                    elseif citynum == 3
                        GovWhiterunSons[i].Clear()
                    elseif citynum == 4
                        GovWindhelmSons[i].Clear()
                    elseif citynum == 5
                        GovDawnstarSons[i].Clear()
                    elseif citynum == 6
                        GovFalkreathSons[i].Clear()
                    elseif citynum == 7
                        GovMorthalSons[i].Clear()
                    elseif citynum == 8
                        GovWinterholdSons[i].Clear()
                    endif
                    ((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor).RemoveFromFaction(CitizenFaction)
                    i += 1
                endwhile

                Actor NextJarl = GetNextJarl(GovPositions.JarlsSons[citynum] as Actor)
                (GovQuest as CS_RecruitJarl).JarlAliases[citynum].ForceRefTo(NextJarl)
                (GovQuest as CS_RecruitJarl).StewardAliases[citynum].ForceRefTo(GovPositions.StewardsSons[citynum])
                (GovQuest as CS_RecruitJarl).HousecarlAliases[citynum].ForceRefTo(GovPositions.HousecarlsSons[citynum])
                NewJarl.ForceRefTo(NextJarl)

                int guardmarkernum = 0
                while guardmarkernum < (SonsMarkerLists.GetAt(citynum) as FormList).GetSize()
                    ((SonsMarkerLists.GetAt(citynum) as FormList).GetAt(guardmarkernum) as ObjectReference).enable()
                    guardmarkernum += 1
                endwhile
            
                if citynum < 5
                    TMSons.CityCount += 1
                elseif citynum >= 5 && citynum < 9
                    TMSons.MinorCityCount += 1
                endif

            TransferMessageSons.show()

            NewJarlMessage.show()

            TMSons.ChooseRandomCapital()
            TMSons.DisplayInvasionObjectives(citynum)

            if citynum == 0
                TransferOwnershipVillage(11, 12)
            elseif citynum == 1
                TransferOwnershipVillage(10, 12)
                TransferOwnershipVillage(14, 12)
            elseif citynum == 2
                TransferOwnershipVillage(9, 12)
            elseif citynum == 3
                TransferOwnershipVillage(12, 12)
                TransferOwnershipVillage(13, 12)
            endif

        endif

        TMPlayer.UnBlockadeCommanders(citynum, true, false)
        (GovQuest as CS_GovScriptFunctions).FindNewCapital(citynum)

    endif

    if WarMapReset.IsRunning()
        WarMapReset.Stop()
    endif

    WarMapReset.Start()
    (WarMapReset as CS_WarMapResetScript).ResetWarMap()
EndFunction

Function TransferOwnershipFort(int fortnum, int newfaction)
    if !IsRunning()
        Start()
    endif

    Location FortLoc = AllLocationsFort.GetAt(fortnum) as Location
    HoldingAlias.ForceLocationTo(FortLoc)
    (AllHoldingsFort.GetAt(fortnum) as GlobalVariable).SetValue(newfaction)

    if newfaction != 1

        (FortMarkersPlayer.GetAt(fortnum) as ObjectReference).disable()

        if CommanderMoving.CommandersIncomingFort[fortnum]
            CommanderMoving.StopCommanderMoving(CommanderMoving.CommandersIncomingFort[fortnum])
        endif

        if FortLoc.GetKeywordData(CWOwner) == 69
            FortCountPlayer.Mod(-1)
        endif

        FortLoc.SetKeywordData(CWOwner, (newfaction - 10))

        if newfaction == 11
            (FortMarkersImp.GetAt(fortnum) as ObjectReference).enable()
            TMImperial.FortCount += 1
            TransferMessageImp.show()
            TMImperial.DisplayInvasionObjectives(fortnum)
        elseif newfaction == 12
            (FortMarkersSons.GetAt(fortnum) as ObjectReference).enable()
            TMSons.FortCount += 1
            TransferMessageSons.show()
            TMSons.DisplayInvasionObjectives(fortnum)
        endif

        (MapMarkersForts.GetAt(fortnum) as ObjectReference).disable()

        TMPlayer.UnBlockadeCommanders(fortnum, false, true)
        PrisonerScript.FreeAllFortPrisoners(fortnum)

    else

        if FortLoc.GetKeywordData(CWOwner) == 1
            TMImperial.FortCount += -1
            (FortMarkersImp.GetAt(fortnum) as ObjectReference).disable()
            FortLoc.SetKeywordData(CWOwner, 69)
            FortCountPlayer.Mod(1)
            TMImperial.CheckAllHoldings()
            TMImperial.DisplayInvasionObjectives(fortnum)
        elseif FortLoc.GetKeywordData(CWOwner) == 2
            TMSons.FortCount += -1
            (FortMarkersSons.GetAt(fortnum) as ObjectReference).disable()
            FortLoc.SetKeywordData(CWOwner, 69)
            FortCountPlayer.Mod(1)
            TMSons.CheckAllHoldings()
            TMSons.DisplayInvasionObjectives(fortnum)
        endif

        (MapMarkersForts.GetAt(fortnum) as ObjectReference).enable()
        (FortMarkersPlayer.GetAt(fortnum) as ObjectReference).enable()

    endif

    if WarMapReset.IsRunning()
        WarMapReset.Stop()
    endif

    WarMapReset.Start()
    (WarMapReset as CS_WarMapResetScript).ResetWarMap(fortnum)

EndFunction

Function TransferOwnershipVillage(int villagenum, int newfaction)
    Location VillageLoc = AllLocations.GetAt(villagenum) as Location
    HoldingAlias.ForceLocationTo(VillageLoc)
    (AllHoldings.GetAt(villagenum) as GlobalVariable).SetValue(newfaction)

    if newfaction != 1

        if VillageLoc.GetKeywordData(CWOwner) == 69
            VillageCountPlayer.Mod(-1)
        endif

        VillageLoc.SetKeywordData(CWOwner, (newfaction - 10))

        if newfaction == 11
            (ImpMarkerLists.GetAt(villagenum) as ObjectReference).enable()
            VillageCountImp.Mod(1)
            TransferMessageImp.show()
        elseif newfaction == 12
            (SonsMarkerLists.GetAt(villagenum) as ObjectReference).enable()
            VillageCountSons.Mod(1)
            TransferMessageSons.show()
        endif

    else

        if VillageLoc.GetKeywordData(CWOwner) == 1
            VillageCountImp.Mod(-1)
            ((ImpMarkerLists.GetAt(villagenum) as FormList).GetAt(0) as ObjectReference).disable()
        elseif VillageLoc.GetKeywordData(CWOwner) == 2
            VillageCountSons.Mod(-1)
            ((SonsMarkerLists.GetAt(villagenum) as FormList).GetAt(0) as ObjectReference).disable()
        endif
                
        (PlayerMarkers.GetAt(villagenum) as ObjectReference).enable()
        VillageLoc.SetKeywordData(CWOwner, 69)
        VillageCountPlayer.Mod(1)

        TransferMessagePlayer.show()

    endif

EndFunction

Function MakeCitizen(Actor Person, int citynum)
    if citynum == 2
        int i = 0
        bool foundalias = false
        while i < GovSolitudeImp.Length && !foundalias
            if !GovSolitudeImp[i].GetActorRef()
                GovSolitudeImp[i].ForceRefTo(Person)
                GovSolitudeImp[i].GetActorRef().EvaluatePackage()
                foundalias = true
            endif
            i += 1
        endwhile
    elseif citynum == 4
        int i = 0
        bool foundalias = false
        while i < GovWindhelmSons.Length && !foundalias
            if !GovWindhelmSons[i].GetActorRef()
                GovWindhelmSons[i].ForceRefTo(Person)
                GovWindhelmSons[i].GetActorRef().EvaluatePackage()
                foundalias = true
            endif
            i += 1
        endwhile
    endif
EndFunction

Function RemoveGovernment(int citynum, bool jarlonly = false)
        
        VanillaJarlAliases[citynum].GetOwningQuest().UnregisterForUpdate()
        VanillaJarlAliases[citynum].Clear()
        VanillaJarlBackupAliases[citynum].Clear()
        
        ReferenceAlias[] Citizens
        if citynum == 0
            Citizens = GovMarkarthImp
        elseif citynum == 1
            Citizens = GovRiftenSons
        elseif citynum == 2
            Citizens = GovSolitudeImp
        elseif citynum == 3
            Citizens = GovWhiterunImp
        elseif citynum == 4
            Citizens = GovWindhelmSons
        elseif citynum == 5
            Citizens = GovDawnstarSons
        elseif citynum == 6
            Citizens = GovFalkreathImp
        elseif citynum == 7
            Citizens = GovMorthalImp
        elseif citynum == 8
            Citizens = GovWinterholdSons
        endif
        
        int i = 0
        while i < Citizens.Length
            if Citizens[i].GetActorRef() && Citizens[i].GetActorRef() != (GovQuest as CS_RecruitJarl).StewardAliases[citynum].GetActorRef() && Citizens[i].GetActorRef() != (GovQuest as CS_RecruitJarl).WizardAliases[citynum].GetActorRef()
                Citizens[i].GetActorRef().AddToFaction(CitizenFaction)
            endif
            i += 1
        endwhile
        
        (GovQuest as CS_RecruitJarl).JarlAliases[citynum].GetActorRef().AddToFaction(CitizenFaction)
        (GovQuest as CS_RecruitJarl).JarlAliases[citynum].Clear()
        (GovQuest as CS_RecruitJarl).HousecarlAliases[citynum].GetActorRef().AddToFaction(CitizenFaction)
        (GovQuest as CS_RecruitJarl).HousecarlAliases[citynum].Clear()
        if !jarlonly
            (GovQuest as CS_RecruitJarl).StewardAliases[citynum].GetActorRef().AddToFaction(CitizenFaction)
            (GovQuest as CS_RecruitJarl).StewardAliases[citynum].Clear()
            (GovQuest as CS_RecruitJarl).WizardAliases[citynum].GetActorRef().AddToFaction(CitizenFaction)
            (GovQuest as CS_RecruitJarl).WizardAliases[citynum].Clear()
        endif
        
EndFunction

        
Function TakeCity(int citynum, bool nofaction = false)
    RemoveGovernment(citynum, nofaction)
    (GovQuest as CS_RecruitJarl).JarlAliases[citynum].ForceRefTo(Game.GetPlayer())
    (AllLocationsCS.GetAt(citynum) as Location).SetKeywordData(CS_PlayerJarl, 1)
    int guardmarkernum = 0
    while guardmarkernum < (ImpMarkerLists.GetAt(citynum) as FormList).GetSize()
        ((ImpMarkerLists.GetAt(citynum) as FormList).GetAt(guardmarkernum) as ObjectReference).disable()
        ((SonsMarkerLists.GetAt(citynum) as FormList).GetAt(guardmarkernum) as ObjectReference).disable()
        guardmarkernum += 1
    endwhile
    
    CS_EconomyUpdaterNew.EconomyHoldUpdaters[citynum].SpawnAllGuards()
EndFunction
        
Actor Function GetNextJarl(Actor BaseJarl)
    CS_GetJarlLoS.Stop()
    ActorBase BaseJarlBase = BaseJarl.GetActorBase()

    Actor NextJarl
    if BaseJarlBase.GetDeadCount() > 0 || BaseJarl.IsInFaction(CS_JarlDeadFaction)
        CS_StoryGetJarlLoS.SendStoryEventAndWait(akRef1 = BaseJarl)
        int i = 0
        while i < JarlLoS.Length && !NextJarl
            if i == 2 && BaseJarl.IsInFaction(CS_MarriagePlayerParentInLaw)
                NextJarl = Game.GetPlayer()
            elseif i == 4 && BaseJarl.IsInFaction(CS_MarriedToPlayerFaction)
                NextJarl = Game.GetPlayer()
            elseif i == 8 && BaseJarl.IsInFaction(CS_MarriagePlayerSiblingInLaw)
                NextJarl = Game.GetPlayer()
            elseif i == 9 && BaseJarl.IsInFaction(CS_MarriagePlayerChildInLaw)
                NextJarl = Game.GetPlayer()
            else
                debug.trace("LoS " + i + " = " + JarlLoS[i].GetActorRef())
                if JarlLoS[i].GetActorRef() && !JarlLoS[i].GetActorRef().IsDead() && !JarlLoS[i].GetActorRef().IsInFaction(CS_JarlDeadFaction) && !JarlLoS[i].GetActorRef().IsDisabled() 
                    NextJarl = JarlLoS[i].GetActorRef()
                endif
            endif
            i += 1
        endwhile
    else
        NextJarl = BaseJarl
    endif
    
    CS_GetJarlLoS.Stop()
    
    Actor NewNextJarl
    
    if NextJarl != Game.GetPlayer()
        NewNextJarl = NextJarl.PlaceAtMe(NextJarl.GetActorBase()) as Actor
        NewNextJarl.GetActorBase().SetEssential(false)
        NewNextJarl.GetActorBase().SetProtected(true)
           
       CS_DisabledJarls.AddForm(NextJarl)
       NextJarl.disable()
    else
        NewNextJarl = Game.GetPlayer()
    endif
    
    if NewNextJarl.GetActorBase() == Ulfric
        TMSons.AssignLeader(NewNextJarl)
    endif
    return NewNextJarl
EndFunction

Function AddToCitizenAlias(Actor GovPerson, int citynum)
    int factionnum = 0
    if citynum == 0 || citynum == 2 || citynum == 3 || citynum == 6 || citynum == 7
        factionnum = 1
    else
        factionnum = 2
    endif
    
    if (AllLocations.GetAt(citynum) as Location).GetKeywordData(CWOwner) == factionnum
    
        ReferenceAlias[] Citizens
        if citynum == 0
            Citizens = GovMarkarthImp
        elseif citynum == 1
            Citizens = GovRiftenSons
        elseif citynum == 2
            Citizens = GovSolitudeImp
        elseif citynum == 3
            Citizens = GovWhiterunImp
        elseif citynum == 4
            Citizens = GovWindhelmSons
        elseif citynum == 5
            Citizens = GovDawnstarSons
        elseif citynum == 6
            Citizens = GovFalkreathImp
        elseif citynum == 7
            Citizens = GovMorthalImp
        elseif citynum == 8
            Citizens = GovWinterholdSons
        endif
        
        int index = 0
        bool foundslot = false
        while index < Citizens.Length && !foundslot
            if !Citizens[index].GetRef()
                Citizens[index].ForceRefTo(GovPerson)
                foundslot = true
            endif
            index += 1
        endwhile
        
    endif
EndFunction

Function ResetAllGovernmentPositions()
    int i = 0
    while i < 9
        ResetAllGovernmentPositionsCity(i)
        i += 1
    endwhile
EndFunction

Function ResetAllGovernmentPositionsCity(int citynum)
    int factionnum = 0
    if citynum == 0 || citynum == 2 || citynum == 3 || citynum == 6 || citynum == 7
        factionnum = 1
    else
        factionnum = 2
    endif
    
    FormList GovNPCs
    if factionnum == 1
        GovNPCs = GovNPCsImp.GetAt(citynum) as FormList
    elseif factionnum == 2
        GovNPCs = GovNPCsSons.GetAt(citynum) as FormList
    endif
    
    ReferenceAlias[] Citizens
    if citynum == 0
        Citizens = GovMarkarthImp
    elseif citynum == 1
        Citizens = GovRiftenSons
    elseif citynum == 2
        Citizens = GovSolitudeImp
    elseif citynum == 3
        Citizens = GovWhiterunImp
    elseif citynum == 4
        Citizens = GovWindhelmSons
    elseif citynum == 5
        Citizens = GovDawnstarSons
    elseif citynum == 6
        Citizens = GovFalkreathImp
    elseif citynum == 7
        Citizens = GovMorthalImp
    elseif citynum == 8
        Citizens = GovWinterholdSons
    endif
    
    int i = 0 
    while i < GovNPCs.GetSize()
        Actor GovPerson = GovNPCs.GetAt(i) as Actor
        if GovPerson.IsEnabled()
            Actor NewGovPerson = GovPerson.PlaceActorAtMe(GovPerson.GetActorBase())
            NewGovPerson.GetActorBase().SetEssential(false)
            NewGovPerson.GetActorBase().SetProtected(true)
            GovPerson.disable()

            int index = 0
            bool foundslot = false
            while index < Citizens.Length && !foundslot
                if !Citizens[index].GetRef()
                    Citizens[index].ForceRefTo(NewGovPerson)
                    if (AllLocations.GetAt(citynum) as Location).GetKeywordData(CWOwner) != factionnum
                        Citizens[index].GetActorRef().AddToFaction(CitizenFaction)
                    endif
                    foundslot = true
                endif
                index += 1
            endwhile
        endif
        i += 1
    endwhile
EndFunction

Actor Function ResetGovPosition(Actor GovPerson, int citynum)
    if citynum == 3
        debug.trace("City 3, Actor " + GovPerson + " being reset...")
    endif
    Actor NewGovPerson
    
    int factionnum = 0
    if citynum == 0 || citynum == 2 || citynum == 3 || citynum == 6 || citynum == 7
        factionnum = 1
        if citynum == 3
            debug.trace("City 3, Faction set as " + factionnum)
        endif
    else
        factionnum = 2
    endif
    
    FormList GovNPCs
    if factionnum == 1
        if citynum == 3
            debug.trace("City 3, GovNPCs set as GovNPCsImp")
        endif
        GovNPCs = GovNPCsImp.GetAt(citynum) as FormList
    elseif factionnum == 2
        GovNPCs = GovNPCsSons.GetAt(citynum) as FormList
    endif
    
    ReferenceAlias[] Citizens
    if citynum == 0
        Citizens = GovMarkarthImp
    elseif citynum == 1
        Citizens = GovRiftenSons
    elseif citynum == 2
        Citizens = GovSolitudeImp
    elseif citynum == 3
        Citizens = GovWhiterunImp
    elseif citynum == 4
        Citizens = GovWindhelmSons
    elseif citynum == 5
        Citizens = GovDawnstarSons
    elseif citynum == 6
        Citizens = GovFalkreathImp
    elseif citynum == 7
        Citizens = GovMorthalImp
    elseif citynum == 8
        Citizens = GovWinterholdSons
    endif
    
    if GovNPCs.HasForm(GovPerson)
        if citynum == 3
            debug.trace("City 3, GovNPCs found " + GovPerson)
        endif
        NewGovPerson = GovPerson.PlaceActorAtMe(GovPerson.GetActorBase())
        NewGovPerson.GetActorBase().SetEssential(false)
        NewGovPerson.GetActorBase().SetProtected(true)
        GovPerson.disable()
        int i = 0
        bool foundslot = false
        while i < Citizens.Length && !foundslot
            if !Citizens[i].GetRef()
                Citizens[i].ForceRefTo(NewGovPerson)
                if (AllLocations.GetAt(citynum) as Location).GetKeywordData(CWOwner) != factionnum
                    Citizens[i].GetActorRef().AddToFaction(CitizenFaction)
                endif
                if citynum == 3
                    debug.trace("City 3, " + NewGovPerson + " forced to CitizensAlias")
                endif
                foundslot = true
            endif
            i += 1
        endwhile
    endif
    
    if NewGovPerson
        if NewGovPerson.GetActorBase() == Ulfric
            TMSons.AssignLeader(NewGovPerson)
        endif
        return NewGovPerson
    else
        return GovPerson
    endif
EndFunction
        
Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
    if akKeyword == CS_StoryTransferHoldingCity
        TransferOwnershipCity(aiValue1, aiValue2)
    elseif akKeyword == CS_StoryTransferHoldingFort
        TransferOwnershipFort(aiValue1, aiValue2)
    elseif akKeyword == CS_StoryTransferJarl
        Actor NextJarl = GetNextJarl(akRef1 as Actor)
        int citynum = (GovQuest as CS_RecruitJarl).FindJarl(akRef1 as Actor)
        if NextJarl
            if NextJarl != Game.GetPlayer()
                (GovQuest as CS_RecruitJarl).JarlAliases[citynum].ForceRefTo(NextJarl)
                NewJarl.ForceRefTo(NextJarl)
                Location CityLoc = AllLocations.GetAt(citynum) as Location
                HoldingAlias.ForceLocationTo(CityLoc)
                VanillaJarlAliases[citynum].GetOwningQuest().UnregisterForUpdate()
                VanillaJarlAliases[citynum].Clear()
                VanillaJarlBackupAliases[citynum].Clear()
                NewJarlMessage.show()
            else
                TransferOwnershipCity(citynum, 69, retainguards = true)
            endif
        endif
    endif
    
    Stop()
EndEvent/;