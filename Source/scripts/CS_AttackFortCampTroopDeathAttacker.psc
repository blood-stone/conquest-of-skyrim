Scriptname CS_AttackFortCampTroopDeathAttacker extends Quest  

CS_AttackFortCampScript Property AttackFortCampScript Auto

FormList Property AttackerMarkersAll Auto
FormList Property AttackerMarkers Auto

Function SetUpSpawn()
    AttackerMarkers = AttackerMarkersAll.GetAt(AttackFortCampScript.holdnum) as FormList
    ((self as Quest) as CS_ReinforcementControllerA).AttackerMarkers = AttackerMarkers
    ((self as Quest) as CS_ReinforcementControllerA).AttackerSpawn = AttackFortCampScript.AttackerMarkers1
EndFunction

Function TroopDeathPlayer(ReferenceAlias TroopAlias)
    ;AttackFortCampScript.AttackTroops.RemoveAddedForm(TroopAlias.GetActorRef())
    AttackFortCampScript.TroopsRemainingAttackers -= AttackFortCampScript.CS_BattleSpeed.GetValueInt()
    AdjustAttackerPercentRemaining()
EndFunction

Function AdjustAttackerPercentRemaining()
    int PercentRemainingInitial = AttackFortCampScript.TroopsRemainingAttackersPercent.GetValue() as int
    float NewPercentRemaining = math.floor(100*(AttackFortCampScript.TroopsRemainingAttackers as float/AttackFortCampScript.AttackersInitial as float))
    if NewPercentRemaining <= PercentRemainingInitial - 10
        int percentchange = PercentRemainingInitial - NewPercentRemaining as int
        If AttackFortCampScript.TroopsRemainingAttackers <= 0
            AttackFortCampScript.TroopsRemainingAttackersPercent.SetValue(0)
            UpdateCurrentInstanceGlobal(AttackFortCampScript.TroopsRemainingAttackersPercent)
            SetObjectiveDisplayed(11)
        Else
            ModObjectiveGlobal(-percentchange, AttackFortCampScript.TroopsRemainingAttackersPercent, 11) 
        EndIf
    endif
EndFunction
