Scriptname CS_TransferOwnershipScript extends Quest  

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

Message Property NewCapitalMessage Auto
Message Property NewJarlMessage Auto
Message Property TransferMessageImp Auto
Message Property TransferMessageSons Auto
Message Property TransferMessagePlayer Auto

Faction Property CitizenFaction Auto

LocationAlias Property HoldingAlias Auto

ObjectReference Property FactionNameBarrel Auto

Keyword Property CWOwner Auto
Keyword Property ArmiesDefending Auto
Keyword Property CS_StoryTransferHoldingCity Auto
Keyword Property CS_StoryTransferHoldingFort Auto

Quest Property WarMapReset Auto

CS_TMScript Property TMPlayer Auto
CS_TMScript Property TMImperial Auto
CS_TMScript Property TMSons Auto
CS_FortCommandersScript Property FortCommandersScript Auto
CS_CommanderMovingScript Property CommanderMoving Auto
CS_GovPositions Property GovPositions Auto
CS_PrisonerQuestScript Property PrisonerScript Auto

Quest Property GovQuest Auto

Function TransferOwnershipCity(int citynum, int newfaction, bool keepjarl=false)
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

        if (AllHoldings.GetAt(citynum) as GlobalVariable).GetValue() == 11
            int guardmarkernum = 0
            while guardmarkernum < (ImpMarkerLists.GetAt(citynum) as FormList).GetSize()
                ((ImpMarkerLists.GetAt(citynum) as FormList).GetAt(guardmarkernum) as ObjectReference).disable()
                guardmarkernum += 1
            endwhile
            
            if citynum < 5
                CityCountImp.Mod(-1)
            elseif citynum >= 5 && citynum < 9
                MinorCityCountImp.Mod(-1)
            endif

            if keepjarl == false
                (GovQuest as CS_RecruitJarl).JarlAliases[citynum].Clear()
                int i = 0
                while i < (GovNPCsImp.GetAt(citynum) as FormList).GetSize()
                    if citynum == 0
                        GovMarkarthImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 1
                        GovRiftenImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 2
                        GovSolitudeImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 3
                        GovWhiterunImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 4
                        GovWindhelmImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 5
                        GovDawnstarImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 6
                        GovFalkreathImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 7
                        GovMorthalImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 8
                        GovWinterholdImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    endif
                    ((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor).AddToFaction(CitizenFaction)
                    i += 1
                endwhile
            endif

            TMImperial.TMData.SetKeywordData(TMImperial.Capital, -1)
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
                CityCountSons.Mod(-1)
            elseif citynum >= 5 && citynum < 9
                MinorCityCountSons.Mod(-1)
            endif

            if keepjarl == false
                (GovQuest as CS_RecruitJarl).JarlAliases[citynum].Clear()
                int i = 0
                while i < (GovNPCsSons.GetAt(citynum) as FormList).GetSize()
                    if citynum == 0
                        GovMarkarthSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 1
                        GovRiftenSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 2
                        GovSolitudeSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 3
                        GovWhiterunSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 4
                        GovWindhelmSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 5
                        GovDawnstarSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 6
                        GovFalkreathSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 7
                        GovMorthalSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 8
                        GovWinterholdSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    endif
                    ((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor).AddToFaction(CitizenFaction)
                    i += 1
                endwhile
            endif

            TMSons.TMData.SetKeywordData(TMSons.Capital, -1)
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

                (GovQuest as CS_RecruitJarl).JarlAliases[citynum].ForceRefTo(GovPositions.JarlsImp[citynum])
                (GovQuest as CS_RecruitJarl).StewardAliases[citynum].ForceRefTo(GovPositions.StewardsImp[citynum])
                (GovQuest as CS_RecruitJarl).HousecarlAliases[citynum].ForceRefTo(GovPositions.HousecarlsImp[citynum])
                NewJarl.ForceRefTo(GovPositions.JarlsImp[citynum])

                int guardmarkernum = 0
                while guardmarkernum < (ImpMarkerLists.GetAt(citynum) as FormList).GetSize()
                    ((ImpMarkerLists.GetAt(citynum) as FormList).GetAt(guardmarkernum) as ObjectReference).enable()
                    guardmarkernum += 1
                endwhile
            
                if citynum < 5
                    CityCountImp.Mod(1)
                elseif citynum >= 5 && citynum < 9
                    MinorCityCountImp.Mod(1)
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

                (GovQuest as CS_RecruitJarl).JarlAliases[citynum].ForceRefTo(GovPositions.JarlsSons[citynum])
                (GovQuest as CS_RecruitJarl).StewardAliases[citynum].ForceRefTo(GovPositions.StewardsSons[citynum])
                (GovQuest as CS_RecruitJarl).HousecarlAliases[citynum].ForceRefTo(GovPositions.HousecarlsSons[citynum])
                NewJarl.ForceRefTo(GovPositions.JarlsSons[citynum])

                int guardmarkernum = 0
                while guardmarkernum < (SonsMarkerLists.GetAt(citynum) as FormList).GetSize()
                    ((SonsMarkerLists.GetAt(citynum) as FormList).GetAt(guardmarkernum) as ObjectReference).enable()
                    guardmarkernum += 1
                endwhile
            
                if citynum < 5
                    CityCountSons.Mod(1)
                elseif citynum >= 5 && citynum < 9
                    MinorCityCountSons.Mod(1)
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
        ;(GovQuest as CS_ChangeBanners).RestoreOldFortBanners(fortnum)

        if newfaction == 11
            (FortMarkersImp.GetAt(fortnum) as ObjectReference).enable()
            FortCountImp.Mod(1)
            TransferMessageImp.show()
            TMImperial.DisplayInvasionObjectives(fortnum)
        elseif newfaction == 12
            (FortMarkersSons.GetAt(fortnum) as ObjectReference).enable()
            FortCountSons.Mod(1)
            TransferMessageSons.show()
            TMSons.DisplayInvasionObjectives(fortnum)
        endif

        (MapMarkersForts.GetAt(fortnum) as ObjectReference).disable()

        TMPlayer.UnBlockadeCommanders(fortnum, false, true)
        PrisonerScript.FreeAllFortPrisoners(fortnum)

    else

        ;(GovQuest as CS_ChangeBanners).ReplaceFortBanners(fortnum)

        if FortLoc.GetKeywordData(CWOwner) == 1
            FortCountImp.Mod(-1)
            (FortMarkersImp.GetAt(fortnum) as ObjectReference).disable()
            FortLoc.SetKeywordData(CWOwner, 69)
            FortCountPlayer.Mod(1)
            TMImperial.CheckAllHoldings()
            TMImperial.DisplayInvasionObjectives(fortnum)
        elseif FortLoc.GetKeywordData(CWOwner) == 2
            FortCountSons.Mod(-1)
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

        ;(MapMarkersForts.GetAt(fortnum) as ObjectReference).enable()
                
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

Function RemoveGovernment(int citynum)

        if (AllHoldings.GetAt(citynum) as GlobalVariable).GetValueInt() == 11
                (GovQuest as CS_RecruitJarl).JarlAliases[citynum].Clear()
                int i = 0
                while i < (GovNPCsImp.GetAt(citynum) as FormList).GetSize()
                    if citynum == 0
                        GovMarkarthImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 1
                        GovRiftenImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 2
                        GovSolitudeImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 3
                        GovWhiterunImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 4
                        GovWindhelmImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 5
                        GovDawnstarImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 6
                        GovFalkreathImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 7
                        GovMorthalImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 8
                        GovWinterholdImp[i].ForceRefTo((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    endif
                    ((GovNPCsImp.GetAt(citynum) as FormList).GetAt(i) as Actor).AddToFaction(CitizenFaction)
                    i += 1
                endwhile

        elseif (AllHoldings.GetAt(citynum) as GlobalVariable).GetValueInt() == 12
                (GovQuest as CS_RecruitJarl).JarlAliases[citynum].Clear()
                int i = 0
                while i < (GovNPCsSons.GetAt(citynum) as FormList).GetSize()
                    if citynum == 0
                        GovMarkarthSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 1
                        GovRiftenSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 2
                        GovSolitudeSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 3
                        GovWhiterunSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 4
                        GovWindhelmSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 5
                        GovDawnstarSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 6
                        GovFalkreathSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 7
                        GovMorthalSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    elseif citynum == 8
                        GovWinterholdSons[i].ForceRefTo((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor)
                    endif
                    ((GovNPCsSons.GetAt(citynum) as FormList).GetAt(i) as Actor).AddToFaction(CitizenFaction)
                    i += 1
                endwhile

        endif
EndFunction
        
Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
    if akKeyword == CS_StoryTransferHoldingCity
        TransferOwnershipCity(aiValue1, aiValue2)
    elseif akKeyword == CS_StoryTransferHoldingFort
        TransferOwnershipFort(aiValue1, aiValue2)
    endif
    
    Stop()
EndEvent