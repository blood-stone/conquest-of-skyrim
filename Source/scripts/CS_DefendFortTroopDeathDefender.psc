Scriptname CS_DefendFortTroopDeathDefender extends Quest  

; ----------------------------- Global Properties --------------------------------------

CS_DefendFortScript Property DefendFortScript Auto

Function TroopDeathPlayer(ReferenceAlias TroopAlias)
    DefendFortScript.FortGarrison.RemoveAddedForm(TroopAlias.GetActorRef())
    DefendFortScript.TroopsRemainingDefenders -= 1
    AdjustDefenderPercentRemaining()

EndFunction

Function AdjustDefenderPercentRemaining()
    int PercentRemainingInitial = DefendFortScript.TroopsRemainingDefendersPercent.GetValue() as int
    float NewPercentRemaining = math.floor(100*(DefendFortScript.TroopsRemainingDefenders as float/DefendFortScript.DefendersInitial as float))
    if NewPercentRemaining <= PercentRemainingInitial - 10
        int percentchange = PercentRemainingInitial - NewPercentRemaining as int
        If DefendFortScript.TroopsRemainingDefenders <= 0
            DefendFortScript.TroopsRemainingDefendersPercent.SetValue(0)
            UpdateCurrentInstanceGlobal(DefendFortScript.TroopsRemainingDefendersPercent)
            SetObjectiveDisplayed(5)
        Else
            ModObjectiveGlobal(-percentchange, DefendFortScript.TroopsRemainingDefendersPercent, 5) 
        EndIf
    endif
EndFunction