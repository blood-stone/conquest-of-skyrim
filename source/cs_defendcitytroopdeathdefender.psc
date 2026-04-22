Scriptname CS_DefendCityTroopDeathDefender extends Quest  

; ----------------------------- Global Properties --------------------------------------

CS_DefendCityScript Property DefendCityScript Auto

FormList Property SpawnPoints1 Auto
FormList Property SpawnPoints2 Auto

FormList Property Spawns1 Auto
FormList Property Spawns2 Auto

Function SetUpSpawns()
    int citynum = DefendCityScript.holdnum
    Spawns1 = SpawnPoints1.GetAt(citynum) as FormList
    Spawns2 = SpawnPoints2.GetAt(citynum) as FormList
EndFunction

Function TroopDeathPlayer(ReferenceAlias TroopAlias)
    DefendCityScript.Garrison.RemoveAddedForm(TroopAlias.GetActorRef())
    DefendCityScript.TroopsRemainingDefenders -= DefendCityScript.CS_BattleSpeed.GetValueInt()
    AdjustDefenderPercentRemaining()
EndFunction

Function AdjustDefenderPercentRemaining()
    int PercentRemainingInitial = DefendCityScript.TroopsRemainingDefendersPercent.GetValue() as int
    float NewPercentRemaining = math.floor(100*(DefendCityScript.TroopsRemainingDefenders as float/DefendCityScript.DefendersInitial as float))
    if NewPercentRemaining <= PercentRemainingInitial - 10
        int percentchange = PercentRemainingInitial - NewPercentRemaining as int
        If DefendCityScript.TroopsRemainingDefenders <= 0
            DefendCityScript.TroopsRemainingDefendersPercent.SetValue(0)
            UpdateCurrentInstanceGlobal(DefendCityScript.TroopsRemainingDefendersPercent)
            SetObjectiveDisplayed(5)
        Else
            ModObjectiveGlobal(-percentchange, DefendCityScript.TroopsRemainingDefendersPercent, 5) 
        EndIf
    endif
EndFunction
