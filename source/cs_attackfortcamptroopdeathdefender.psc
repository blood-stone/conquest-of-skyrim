Scriptname CS_AttackFortCampTroopDeathDefender extends Quest 
 
CS_AttackFortCampScript Property AttackFortCampScript Auto

int Property TotalDefenderDeaths Auto

Function TroopDeathDefender(ReferenceAlias TroopAlias)
    ActorBase TroopBase = TroopAlias.GetActorRef().GetActorBase()
    AttackFortCampScript.TroopsRemainingDefenders -= AttackFortCampScript.CS_BattleSpeed.GetValueInt()
    TotalDefenderDeaths += AttackFortCampScript.CS_BattleSpeed.GetValueInt()
    AdjustDefenderPercentRemaining()

    if self != AttackFortCampScript.AttackFortQuest

        ObjectReference SpawnPoint = AttackFortCampScript.DefenderMarkersMelee[utility.randomint(0, AttackFortCampScript.DefenderMarkersMelee.Length - 1)].GetRef()
        if TotalDefenderDeaths == 19 || TotalDefenderDeaths == 39 || TotalDefenderDeaths == 59 || TotalDefenderDeaths == 79
            Actor CommanderRef
            if AttackFortCampScript.enemyfactionnum == 11
                CommanderRef = SpawnPoint.PlaceAtMe(AttackFortCampScript.ImperialCommander) as Actor
            elseif AttackFortCampScript.enemyfactionnum == 12
                CommanderRef = SpawnPoint.PlaceAtMe(AttackFortCampScript.StormcloakCommander) as Actor
            endif
            AttackFortCampScript.DefenderCommanders[AttackFortCampScript.DefenderCommandersDeployed].ForceRefTo(CommanderRef)
            AttackFortCampScript.DefenderCommandersDeployed += 1
        endif
    
    endif

EndFunction

Function AdjustDefenderPercentRemaining()
    int PercentRemainingInitial = AttackFortCampScript.TroopsRemainingDefendersPercent.GetValue() as int
    float NewPercentRemaining = math.floor(100*(AttackFortCampScript.TroopsRemainingDefenders as float/AttackFortCampScript.DefendersInitial as float))
    if NewPercentRemaining <= PercentRemainingInitial - 10
        int percentchange = PercentRemainingInitial - NewPercentRemaining as int
        If AttackFortCampScript.TroopsRemainingDefenders <= 0 && AttackFortCampScript.TroopsRemainingDefendersPercent.GetValue() != 0
            AttackFortCampScript.TroopsRemainingDefendersPercent.SetValue(0)
            UpdateCurrentInstanceGlobal(AttackFortCampScript.TroopsRemainingDefendersPercent)
            SetObjectiveCompleted(10)
            SetStage(20)
        Else
            ModObjectiveGlobal(-percentchange, AttackFortCampScript.TroopsRemainingDefendersPercent, 10)
        EndIf
    endif
EndFunction