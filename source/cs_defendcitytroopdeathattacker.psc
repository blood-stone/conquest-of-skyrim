Scriptname CS_DefendCityTroopDeathAttacker extends Quest  

CS_DefendCityScript Property DefendCityScript Auto

FormList Property SpawnPoints1 Auto
FormList Property SpawnPoints2 Auto
FormList Property SpawnPoints3 Auto

FormList Property Spawns1 Auto
FormList Property Spawns2 Auto
FormList Property Spawns3 Auto

; -------------------------- Attacker Properties -----------------------------------

int Property TotalAttackerDeaths Auto

Function SetUpSpawns()
    int citynum = DefendCityScript.holdnum
    Spawns1 = SpawnPoints1.GetAt(citynum) as FormList
    Spawns2 = SpawnPoints2.GetAt(citynum) as FormList
    Spawns3 = SpawnPoints3.GetAt(citynum) as FormList
EndFunction

Function TroopDeathAttacker(ReferenceAlias TroopAlias)
    ActorBase TroopBase = TroopAlias.GetActorRef().GetActorBase()
    DefendCityScript.TroopsRemainingAttackers -= DefendCityScript.CS_BattleSpeed.GetValueInt()
    TotalAttackerDeaths += DefendCityScript.CS_BattleSpeed.GetValueInt()
    AdjustAttackerPercentRemaining()

    if TotalAttackerDeaths == 19 || TotalAttackerDeaths == 39 || TotalAttackerDeaths == 59 || TotalAttackerDeaths == 79
        Actor CommanderRef
        ObjectReference SpawnPoint
        if GetStage() == 5
            SpawnPoint = Spawns1.GetAt(utility.randomint(0, Spawns1.GetSize() - 1)) as ObjectReference
        elseif GetStage() == 6 
            SpawnPoint = Spawns2.GetAt(utility.randomint(0, Spawns2.GetSize() - 1)) as ObjectReference
        elseif GetStage() >= 7 && GetStage() < 20
            SpawnPoint = Spawns3.GetAt(utility.randomint(0, Spawns3.GetSize() - 1)) as ObjectReference
        endif
        CommanderRef = SpawnPoint.PlaceAtMe(DefendCityScript.EnemyCommander) as Actor
        DefendCityScript.AttackerCommanders[DefendCityScript.AttackerCommandersDeployed].ForceRefTo(CommanderRef)
        DefendCityScript.AttackerCommandersDeployed += 1
    endif

EndFunction

Function AdjustAttackerPercentRemaining()
    int PercentRemainingInitial = DefendCityScript.TroopsRemainingAttackersPercent.GetValue() as int
    float NewPercentRemaining = math.floor(100*(DefendCityScript.TroopsRemainingAttackers as float/DefendCityScript.AttackersInitial as float))
    if NewPercentRemaining <= PercentRemainingInitial - 10
        int percentchange = PercentRemainingInitial - NewPercentRemaining as int
        If DefendCityScript.TroopsRemainingAttackers <= 0
            DefendCityScript.TroopsRemainingAttackersPercent.SetValue(0)
            UpdateCurrentInstanceGlobal(DefendCityScript.TroopsRemainingAttackersPercent)
            SetObjectiveCompleted(0)
            DefendCityScript.WinQuest()
        Else
            ModObjectiveGlobal(-percentchange, DefendCityScript.TroopsRemainingAttackersPercent, 0)
        EndIf
    endif
EndFunction