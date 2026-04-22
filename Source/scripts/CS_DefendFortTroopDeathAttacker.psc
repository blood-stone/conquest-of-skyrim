Scriptname CS_DefendFortTroopDeathAttacker extends Quest  

CS_DefendFortScript Property DefendFortScript Auto

; -------------------------- Attacker Properties -----------------------------------

int Property TotalAttackerDeaths Auto

Function TroopDeathAttacker(ReferenceAlias TroopAlias)
    DefendFortScript.TroopsRemainingAttackers -= DefendFortScript.CS_BattleSpeed.GetValueInt()
    TotalAttackerDeaths += DefendFortScript.CS_BattleSpeed.GetValueInt()
    AdjustAttackerPercentRemaining()
EndFunction

Function AdjustAttackerPercentRemaining()
    int PercentRemainingInitial = DefendFortScript.TroopsRemainingAttackersPercent.GetValue() as int
    float NewPercentRemaining = math.floor(100*(DefendFortScript.TroopsRemainingAttackers as float/DefendFortScript.AttackersInitial as float))
    if NewPercentRemaining <= PercentRemainingInitial - 10
        int percentchange = PercentRemainingInitial - NewPercentRemaining as int
        If DefendFortScript.TroopsRemainingAttackers <= 0
            DefendFortScript.TroopsRemainingAttackersPercent.SetValue(0)
            UpdateCurrentInstanceGlobal(DefendFortScript.TroopsRemainingAttackersPercent)
            SetObjectiveCompleted(10)
            DefendFortScript.WinQuest()
        Else
            ModObjectiveGlobal(-percentchange, DefendFortScript.TroopsRemainingAttackersPercent, 10)
        EndIf
    endif
EndFunction