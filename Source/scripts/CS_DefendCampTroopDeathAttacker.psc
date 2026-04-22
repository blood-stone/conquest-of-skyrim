Scriptname CS_DefendCampTroopDeathAttacker extends Quest  

CS_DefendCampScript Property DefendCampScript Auto

; -------------------------- Attacker Properties -----------------------------------

int Property TotalAttackerDeaths Auto

Function TroopDeathAttacker(ReferenceAlias TroopAlias)
    DefendCampScript.TroopsRemainingAttackers -= DefendCampScript.CS_BattleSpeed.GetValueInt()
    TotalAttackerDeaths += DefendCampScript.CS_BattleSpeed.GetValueInt()
    AdjustAttackerPercentRemaining()
EndFunction

Function AdjustAttackerPercentRemaining()
    int PercentRemainingInitial = DefendCampScript.TroopsRemainingAttackersPercent.GetValue() as int
    float NewPercentRemaining = math.floor(100*(DefendCampScript.TroopsRemainingAttackers as float/DefendCampScript.AttackersInitial as float))
    if NewPercentRemaining <= PercentRemainingInitial - 10
        int percentchange = PercentRemainingInitial - NewPercentRemaining as int
        If DefendCampScript.TroopsRemainingAttackers <= 0
            DefendCampScript.TroopsRemainingAttackersPercent.SetValue(0)
            UpdateCurrentInstanceGlobal(DefendCampScript.TroopsRemainingAttackersPercent)
            SetObjectiveCompleted(10)
            DefendCampScript.WinQuest()
        Else
            ModObjectiveGlobal(-percentchange, DefendCampScript.TroopsRemainingAttackersPercent, 10)
        EndIf
    endif
EndFunction