Scriptname CS_AttackCityReinforcementsD extends Quest  

ReferenceAlias[] Property DMMarkersMelee Auto
ReferenceAlias[] Property DMMarkersRanged Auto
CS_AttackCityDefenderScript[] Property Troops Auto

FormList Property CS_AttackCityDefenderSpawns Auto
FormList Property CS_AttackCityDefenderSpawnsInterior Auto

FormList Property SpawnPoints2 Auto hidden
FormList Property SpawnPoints3 Auto hidden

int Property TroopCount Auto hidden

int InitialExteriorTroopCount
int Property ExteriorTroopCount Auto hidden
int Property AvailableExteriorTroops Auto hidden
int InitialInteriorTroopCount
int Property InteriorTroopCount Auto hidden
int Property AvailableInteriorTroops Auto hidden

GlobalVariable Property CS_AttackCityRemaining Auto

CS_AttackCityFinalScript Property AttackCityScript Auto

;Function AssignTroops() -- Assigns troops to exterior defenders and interiors defenders, puts all to exterior if minor city
;Function RespawnTroops() -- Spawns all troops, if dead, respawns if troop count allows
;Function RetreatTroops() -- Causes all remaining troops to flee
;Function TroopDeath() -- Lowers troop count
;Function UpdateObjective() -- updates the Defeat city Defenders Objective, sets stage when criteria met.

Function Initialize()
    SpawnPoints2 = CS_AttackCityDefenderSpawns.GetAt(AttackCityScript.citynum) as FormList
    SpawnPoints3 = CS_AttackCityDefenderSpawnsInterior.GetAt(AttackCityScript.citynum) as FormList
    AssignTroops()
    GoToState("Exterior")
EndFunction

Function AssignTroops()
    if AttackCityScript.citynum < 5
        ExteriorTroopCount = math.floor(0.80*TroopCount) as int
        InitialExteriorTroopCount = ExteriorTroopCount
        AvailableExteriorTroops = ExteriorTroopCount + 5 
        InteriorTroopCount = TroopCount - ExteriorTroopCount
        InitialInteriorTroopCount = InteriorTroopCount
        AvailableInteriorTroops = InteriorTroopCount + 5 
    else
        ExteriorTroopCount = TroopCount
        InitialExteriorTroopCount = ExteriorTroopCount
        AvailableExteriorTroops = ExteriorTroopCount + 5
    endif
EndFunction

Function RespawnTroops()
    int i = 0
    while i < Troops.Length
        if !Troops[i].GetActorRef() || Troops[i].GetActorRef().IsDead()
            if GetState() == "Exterior"
                if AvailableExteriorTroops > 0
                    AvailableExteriorTroops -= 1
                    Troops[i].RegisterForSingleUpdate(0.1)
                endif
            elseif GetState() == "Interior"
                if AvailableInteriorTroops > 0
                    AvailableInteriorTroops -= 1
                    Troops[i].RegisterForSingleUpdate(0.1)
                endif
            endif
        endif
        i += 1
    endwhile
EndFunction

Function RetreatTroops()
    int i = 0
    while i < Troops.Length
        if Troops[i].GetActorRef() && !Troops[i].GetActorRef().IsDead()
            (Troops[i].GetActorRef() as CS_TroopScript).GoToState("Retreat")
            (Troops[i].GetActorRef() as CS_TroopScript).RegisterForSingleUpdate(0.1)
            Troops[i].Clear()
        endif
        i += 1
    endwhile
EndFunction

Function TroopDeath()
    if GetState() == "Exterior"
        ExteriorTroopCount -= 1
    else
        InteriorTroopCount -= 1
    endif
    TroopCount -= 1
    UpdateObjective()
EndFunction

Function UpdateObjective()
    
EndFunction

Function SetInteriorSpawns()
    int i = 0
    while i < Troops.Length
        Troops[i].GoToState("Spawn3")
        i += 1
    endwhile
EndFunction

State Exterior
    
    Event OnBeginState()
        CS_AttackCityRemaining.SetValue(100)
        UpdateCurrentInstanceGlobal(CS_AttackCityRemaining)
    EndEvent

    Function UpdateObjective()
        int PercentRemainingInitial = CS_AttackCityRemaining.GetValue() as int
        float NewPercentRemaining = math.floor(100*(ExteriorTroopCount as float/InitialExteriorTroopCount as float))
        if NewPercentRemaining <= PercentRemainingInitial - 10
            int percentchange = PercentRemainingInitial - NewPercentRemaining as int
            ModObjectiveGlobal(-percentchange, CS_AttackCityRemaining, 1)
            If ExteriorTroopCount <= 0 || CS_AttackCityRemaining.GetValue() <= 0
                CS_AttackCityRemaining.SetValue(0)
                UpdateCurrentInstanceGlobal(CS_AttackCityRemaining)
                SetObjectiveCompleted(1)
                RetreatTroops()
                If AttackCityScript.citynum < 5
                    SetInteriorSpawns()
                    GoToState("Interior")
                    SetStage(10)
                Else
                    GoToState("Defeated")
                    SetStage(20)
                EndIf
            EndIf
        endif
    EndFunction
    
EndState

State Interior
    
    Event OnBeginState()
        CS_AttackCityRemaining.SetValue(100)
        UpdateCurrentInstanceGlobal(CS_AttackCityRemaining)
    EndEvent
    
    Function UpdateObjective()
        int PercentRemainingInitial = CS_AttackCityRemaining.GetValue() as int
        float NewPercentRemaining = math.floor(100*(InteriorTroopCount as float/InitialInteriorTroopCount as float))
        if NewPercentRemaining <= PercentRemainingInitial - 10
            int percentchange = PercentRemainingInitial - NewPercentRemaining as int
            ModObjectiveGlobal(-percentchange, CS_AttackCityRemaining, 11)
            If InteriorTroopCount <= 0 || CS_AttackCityRemaining.GetValue() <= 0
                GoToState("Defeated")
                CS_AttackCityRemaining.SetValue(0)
                UpdateCurrentInstanceGlobal(CS_AttackCityRemaining)
                SetObjectiveCompleted(11)
                RetreatTroops()
                SetStage(20)
            EndIf
        endif
    EndFunction
    
EndState

State Defeated
    
    Event OnUpdate()
        ;no more respawning
    EndEvent
    
EndState

Event OnUpdate()
    RespawnTroops()
EndEvent