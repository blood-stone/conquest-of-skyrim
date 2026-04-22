Scriptname CS_AttackCityTroopDeathAttacker extends Quest  

; ----------------------------- Global Properties --------------------------------------

CS_AttackCityScript Property AttackCityScript Auto

; ----------------------------- Attacker Properties -----------------------------------

FormList Property AttackTroops Auto
FormList Property AttackerSpawns1 Auto
FormList Property AttackerSpawns2 Auto
FormList Property AttackerSpawns3 Auto
FormList Property AttackerSpawns4 Auto
FormList Property AttackerSpawnsMinor Auto

FormList Property Spawns1 Auto
FormList Property Spawns2 Auto
FormList Property Spawns3 Auto
FormList Property Spawns4 Auto

Faction Property AttackFaction Auto

Function SetUpSpawns()
    int citynum = AttackCityScript.citynum
    Spawns1 = AttackerSpawns1.GetAt(citynum) as FormList
    Spawns2 = AttackerSpawns2.GetAt(citynum) as FormList
    Spawns3 = AttackerSpawns3.GetAt(citynum) as FormList
    Spawns4 = AttackerSpawns4.GetAt(citynum) as FormList
EndFunction

Function TroopDeathPlayer(ReferenceAlias TroopAlias)
    ;AttackTroops.RemoveAddedForm(TroopAlias.GetActorRef())
    if TroopAlias.GetActorRef().GetActorBase() == AttackCityScript.RestorationMage
        AttackCityScript.HealersDeployed -= 1
    elseif TroopAlias.GetActorRef().GetActorBase() == AttackCityScript.AlterationMage
        AttackCityScript.BuffersDeployed -= 1
    endif
    AttackCityScript.TroopsRemainingAttackers -= AttackCityScript.CS_BattleSpeed.GetValueInt()
    AdjustAttackerPercentRemaining()
EndFunction

Function AdjustAttackerPercentRemaining()
    int PercentRemainingInitial = AttackCityScript.TroopsRemainingAttackersPercent.GetValue() as int
    float NewPercentRemaining = math.floor(100*(AttackCityScript.TroopsRemainingAttackers as float/AttackCityScript.AttackersInitial as float))
    if NewPercentRemaining <= PercentRemainingInitial - 10
        int percentchange = PercentRemainingInitial - NewPercentRemaining as int
        If AttackCityScript.TroopsRemainingAttackers <= 0
            AttackCityScript.TroopsRemainingAttackersPercent.SetValue(0)
            UpdateCurrentInstanceGlobal(AttackCityScript.TroopsRemainingAttackersPercent)
            SetObjectiveDisplayed(5)
        Else
            ModObjectiveGlobal(-percentchange, AttackCityScript.TroopsRemainingAttackersPercent, 5) 
        EndIf
    endif
EndFunction