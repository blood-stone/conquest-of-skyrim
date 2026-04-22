Scriptname CS_ArmyMissionScript extends Quest  

ReferenceAlias Property Commander Auto
ReferenceAlias[] Property TroopSpawnMarkers Auto

ObjectReference TroopRegiment

ReferenceAlias[] Property Troops Auto
;/
Function AssignRegimentToMission(ObjectReference Regiment)
    debug.notification("Regiment Task triggered");/
    (Commander as CS_ArmyMissionCommanderScript).RegimentScript = RegimentScript
    Commander.ForceRefTo(RegimentScript.Commander.GetActorRef())/;
    ;/
    TroopRegiment = Regiment
    CS_ArmyRegimentTroops RegimentTroops = Regiment as CS_ArmyRegimentTroops
    CS_ArmyRegimentOrders RegimentOrders = Regiment as CS_ArmyRegimentOrders
    CS_ArmyRegimentEquipment RegimentEquipment = Regiment as CS_ArmyRegimentEquipment
    RegimentOrders.CurrentMission = self
    
    int i = 0
    while i < 10;RegimentTroops.TroopBases.Length
        CS_ArmyMissionTroopScript TroopScript = Troops[i] as CS_ArmyMissionTroopScript
        TroopScript.TroopNum = i
        TroopScript.TroopRegiment = Regiment
        if RegimentTroops.TroopBases[i]
            TroopScript.TroopType = RegimentTroops.TroopBases[i]
            if RegimentTroops.AliveTroopBases[i] && !RegimentTroops.Troops[i]
                if TroopSpawnMarkers
                    TroopScript.PlacementMarker = TroopSpawnMarkers[i].GetRef()
                endif
                TroopScript.GoToState("Spawn")
                TroopScript.RegisterForSingleUpdate(0.1)
            elseif RegimentTroops.Troops[i]
                Troops[i].ForceRefTo(RegimentTroops.Troops[i])
                debug.trace("Assigning spawned troop " + i)
                RegimentTroops.Troops[i].EvaluatePackage()
                TroopScript.GoToState("Spawned")
            else
                TroopScript.GoToState("Dead")
            endif
        endif
        i += 1
    endwhile
            
EndFunction

Function AssignNewTroop(int TroopNum)
    CS_ArmyRegimentTroops RegimentTroops = TroopRegiment as CS_ArmyRegimentTroops
    CS_ArmyMissionTroopScript TroopScript = Troops[TroopNum] as CS_ArmyMissionTroopScript
    TroopScript.TroopType = RegimentTroops.TroopBases[TroopNum]
    TroopScript.TroopNum = TroopNum
EndFunction

Function SpawnNewTroop(int TroopNum)
    CS_ArmyRegimentTroops RegimentTroops = TroopRegiment as CS_ArmyRegimentTroops
    CS_ArmyRegimentEquipment RegimentEquipment = TroopRegiment as CS_ArmyRegimentEquipment
    CS_ArmyMissionTroopScript TroopScript = Troops[TroopNum] as CS_ArmyMissionTroopScript
    TroopScript.TroopNum = TroopNum
    if TroopSpawnMarkers
        TroopScript.PlacementMarker = TroopSpawnMarkers[TroopNum].GetRef()
    endif
    
    while TroopScript.GetState() == "ForceWait"
        utility.wait(0.1)
    endwhile
    TroopScript.GoToState("Spawn")
    TroopScript.RegisterForSingleUpdate(0.1)
EndFunction

Function UpdateTroopEquipment(int TroopNum)
    CS_ArmyRegimentEquipment RegimentEquipment = TroopRegiment as CS_ArmyRegimentEquipment
    CS_ArmyMissionTroopScript TroopScript = Troops[TroopNum] as CS_ArmyMissionTroopScript
    TroopScript.GoToState("UpdateOutfit")
    TroopScript.RegisterForSingleUpdate(0.1)
EndFunction

Function UpdateAllTroopEquipment()
    CS_ArmyRegimentTroops RegimentTroops = TroopRegiment as CS_ArmyRegimentTroops
    int i = 0
    while i < Troops.Length
        UpdateTroopEquipment(i)
        i += 1
    endwhile
EndFunction

Function DeleteTroop(int TroopNum)
    CS_ArmyRegimentTroops RegimentTroops = TroopRegiment as CS_ArmyRegimentTroops
    CS_ArmyMissionTroopScript TroopScript = Troops[TroopNum] as CS_ArmyMissionTroopScript
    while TroopScript.GetState() == "ForceWait"
        utility.wait(0.1)
    endwhile
    TroopScript.GoToState("DeleteTroop")
    TroopScript.RegisterForSingleUpdate(0.1)
EndFunction

Function DeleteTroops()
    int i = 0
    while i < Troops.Length
        CS_ArmyMissionTroopScript TroopScript = Troops[i] as CS_ArmyMissionTroopScript
        while TroopScript.GetState() == "ForceWait"
            utility.wait(0.1)
        endwhile
        if TroopScript.GetState() == "Spawned"
            TroopScript.GoToState("DeleteTroop")
            TroopScript.RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
    
    i = 0
    while i < Troops.Length
        while (Troops[i] as CS_ArmyMissionTroopScript).GetState() != "Deleted"
            utility.wait(0.1)
        endwhile
        i += 1
    endwhile
EndFunction

Function ClearTroops()
    ;/if Commander
        Commander.Clear()
    endif
    TroopRegiment = None
    
    int i = 0
    while i < Troops.Length
        CS_ArmyMissionTroopScript TroopScript = Troops[i] as CS_ArmyMissionTroopScript
        while TroopScript.GetState() == "ForceWait"
            utility.wait(0.1)
        endwhile
        TroopScript.GoToState("ClearTroop")
        TroopScript.RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
    
    i = 0
    while i < Troops.Length
        while (Troops[i] as CS_ArmyMissionTroopScript).GetState() == "Clearing" || (Troops[i] as CS_ArmyMissionTroopScript).GetState() == "ClearTroop"
            utility.wait(0.1)
        endwhile
        i += 1
    endwhile
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
    if akRef2 as CS_ArmyRegimentOrders
        TroopRegiment = akRef2
        
        AssignRegimentToMission(TroopRegiment)
    endif
EndEvent/;