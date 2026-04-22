Scriptname CS_AttackCityTroopDeathDefender extends Quest  

CS_AttackCityScript Property AttackCityScript Auto

; -------------------------- Defender Properties -----------------------------------

ReferenceAlias Property CityDoor Auto
ReferenceAlias Property DefenderMarker Auto

FormList Property DefenderSpawns1 Auto
FormList Property DefenderSpawns2 Auto
FormList Property DefenderSpawns3 Auto

FormList Property Spawns1 Auto
FormList Property Spawns2 Auto
FormList Property Spawns3 Auto

int Property TotalDefenderDeaths Auto

Function SetUpSpawns()
    int citynum = AttackCityScript.citynum
    Spawns1 = DefenderSpawns1.GetAt(citynum) as FormList
    Spawns2 = DefenderSpawns2.GetAt(citynum) as FormList
    Spawns3 = DefenderSpawns3.GetAt(citynum) as FormList
EndFunction

Function TroopDeathDefender(ReferenceAlias TroopAlias)
    AttackCityScript.TroopsRemainingDefenders -= AttackCityScript.CS_BattleSpeed.GetValueInt()
    TotalDefenderDeaths += AttackCityScript.CS_BattleSpeed.GetValueInt()
    AdjustDefenderPercentRemaining()

    If AttackCityScript.citynum < 5
        If GetStage() < 11
            If TotalDefenderDeaths == 20 || TotalDefenderDeaths == 40 || TotalDefenderDeaths == 60 || TotalDefenderDeaths == 80 || TotalDefenderDeaths == 100
                ObjectReference SpawnPoint = Spawns2.GetAt(utility.randomint(0, Spawns2.GetSize() - 1)) as ObjectReference
                if AttackCityScript.DefenderCommandersDeployed < AttackCityScript.DefenderCommandersInitial - 1
                    if AttackCityScript.enemyfactionnum == 11
                        AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].ForceRefTo(SpawnPoint.PlaceAtMe(AttackCityScript.ImperialCommander) as Actor)
                    elseif AttackCityScript.enemyfactionnum == 12
                        AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].ForceRefTo(SpawnPoint.PlaceAtMe(AttackCityScript.SonsCommander) as Actor)
                    endif
                    AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].GetActorRef().AddToFaction(AttackCityScript.DefendingCityFaction)
                    AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].GetActorRef().EvaluatePackage()
                    AttackCityScript.DefenderCommandersDeployed += 1
                endif       
            EndIf 
        Elseif GetStage() >= 11 && GetStage() < 20
            If TotalDefenderDeaths == 20 || TotalDefenderDeaths == 40 || TotalDefenderDeaths == 60 || TotalDefenderDeaths == 80 || TotalDefenderDeaths == 100
                ObjectReference SpawnPoint2 = Spawns3.GetAt(utility.randomint(0, Spawns3.GetSize() - 1)) as ObjectReference
                if AttackCityScript.DefenderCommandersDeployed < AttackCityScript.DefenderCommandersInitial - 1
                    if AttackCityScript.enemyfactionnum == 11
                        AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].ForceRefTo(SpawnPoint2.PlaceAtMe(AttackCityScript.ImperialCommander) as Actor)
                    elseif AttackCityScript.enemyfactionnum == 12
                        AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].ForceRefTo(SpawnPoint2.PlaceAtMe(AttackCityScript.SonsCommander) as Actor)
                    endif
                    AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].GetActorRef().AddToFaction(AttackCityScript.DefendingCityFaction)
                    AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].GetActorRef().EvaluatePackage()
                    AttackCityScript.DefenderCommandersDeployed += 1
                endif       
            EndIf 
        endIf
    Else
        If GetStage() < 20
            If TotalDefenderDeaths == 20 || TotalDefenderDeaths == 40 || TotalDefenderDeaths == 60 || TotalDefenderDeaths == 80 || TotalDefenderDeaths == 100
                ObjectReference SpawnPoint = Spawns1.GetAt(utility.randomint(0, Spawns1.GetSize() - 1)) as ObjectReference
                if AttackCityScript.DefenderCommandersDeployed < AttackCityScript.DefenderCommandersInitial - 1
                    if AttackCityScript.enemyfactionnum == 11
                        AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].ForceRefTo(SpawnPoint.PlaceAtMe(AttackCityScript.ImperialCommander) as Actor)
                    elseif AttackCityScript.enemyfactionnum == 12
                        AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].ForceRefTo(SpawnPoint.PlaceAtMe(AttackCityScript.SonsCommander) as Actor)
                    endif
                    AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].GetActorRef().AddToFaction(AttackCityScript.DefendingCityFaction)
                    AttackCityScript.DefenderCommanders[AttackCityScript.DefenderCommandersDeployed].GetActorRef().EvaluatePackage()
                    AttackCityScript.DefenderCommandersDeployed += 1
                endif       
            EndIf 
        EndIf
    EndIf
EndFunction

Function AdjustDefenderPercentRemaining()
    int PercentRemainingInitial = AttackCityScript.TroopsRemainingDefendersPercent.GetValue() as int
    float NewPercentRemaining = math.floor(100*(AttackCityScript.TroopsRemainingDefenders as float/AttackCityScript.DefendersInitial as float))
    if NewPercentRemaining <= PercentRemainingInitial - 10
        int percentchange = PercentRemainingInitial - NewPercentRemaining as int
        ModObjectiveGlobal(-percentchange, AttackCityScript.TroopsRemainingDefendersPercent, 10)
        If AttackCityScript.TroopsRemainingDefenders <= 0 || AttackCityScript.TroopsRemainingDefendersPercent.GetValue() <= 0
            AttackCityScript.TroopsRemainingDefendersPercent.SetValue(0)
            UpdateCurrentInstanceGlobal(AttackCityScript.TroopsRemainingDefendersPercent)
            SetObjectiveCompleted(10)
            If GetStage() < 20
                SetStage(20)
            EndIf
        Else
            If AttackCityScript.citynum < 5
                If AttackCityScript.TroopsRemainingDefendersPercent.GetValue() <= 25 && GetStage() < 11
                    SetStage(11)
                EndIf
            EndIf
            If AttackCityScript.TroopsRemainingDefendersPercent.GetValue() <= 75 && GetStage() < 1
                SetStage(1)
            EndIf
        EndIf
    endif
EndFunction