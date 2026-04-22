Scriptname CS_DefendCampTroopDeathDefender extends Quest  

; ----------------------------- Global Properties --------------------------------------

CS_DefendCampScript Property DefendCampScript Auto

Function TroopDeathPlayer(ReferenceAlias TroopAlias)
    ;DefendCampScript.DefenseTroops.RemoveAddedForm(TroopAlias.GetActorRef())
    DefendCampScript.TroopsRemainingDefenders -= DefendCampScript.CS_BattleSpeed.GetValueInt()
    AdjustDefenderPercentRemaining()
EndFunction

Function AdjustDefenderPercentRemaining()
    int PercentRemainingInitial = DefendCampScript.TroopsRemainingDefendersPercent.GetValue() as int
    float NewPercentRemaining = math.floor(100*(DefendCampScript.TroopsRemainingDefenders as float/DefendCampScript.DefendersInitial as float))
    if NewPercentRemaining <= PercentRemainingInitial - 10
        int percentchange = PercentRemainingInitial - NewPercentRemaining as int
        If DefendCampScript.TroopsRemainingDefenders <= 0
            DefendCampScript.TroopsRemainingDefendersPercent.SetValue(0)
            UpdateCurrentInstanceGlobal(DefendCampScript.TroopsRemainingDefendersPercent)
            SetObjectiveDisplayed(5)
        Else
            ModObjectiveGlobal(-percentchange, DefendCampScript.TroopsRemainingDefendersPercent, 5) 
        EndIf
    endif
EndFunction
