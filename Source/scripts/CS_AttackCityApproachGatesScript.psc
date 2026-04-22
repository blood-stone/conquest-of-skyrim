Scriptname CS_AttackCityApproachGatesScript extends Quest  

ReferenceAlias[] Property GuardMarkers Auto
ReferenceAlias[] Property Guards Auto

ReferenceAlias Property CityManagementActivator Auto
ReferenceAlias Property WarRef Auto
ReferenceAlias Property ExteriorMarker Auto

ObjectReference Property OriginalJarlLocation Auto

Static Property CS_XMarker Auto

Quest Property CS_TroopFormUp Auto

Function SpawnGuards()
    ObjectReference ControllingFaction = (CityManagementActivator.GetRef() as CS_CityManagementOwnership).FactionOwnerActivator
    ActorBase GuardBase = (ControllingFaction as CS_FactionManagementMilitary).GuardTroopType
    
    int i = 0
    while i < Guards.Length
        if GuardMarkers[i].GetRef()
            (Guards[i] as CS_AttackCityApproachGatesGuardScript).GuardBase = GuardBase
            (Guards[i] as CS_AttackCityApproachGatesGuardScript).GuardMarker = GuardMarkers[i].GetRef()
            (Guards[i] as CS_AttackCityApproachGatesGuardScript).GoToState("Spawn")
            Guards[i].RegisterForSingleUpdate(0.01)
        endif
        i += 1
    endwhile
EndFunction

Function MovePlayerToEntrance()
    Actor PlayerRef = Game.GetPlayer()
    if WarRef.GetRef()
        CS_FactionWarMasterScript WarMasterScript = WarRef.GetRef() as CS_FactionWarMasterScript
        WarMasterScript.SetFactionTempAllies()
    endif
    if PlayerRef.GetWorldSpace() == (CityManagementActivator.GetRef() as CS_CityManagementOwnership).CityWorldSpace
        if !ExteriorMarker.GetRef()
            ExteriorMarker.ForceRefTo((CityManagementActivator.GetRef() as CS_CityManagementOwnership).DefensiveExteriorMarker)
        endif
        PlayerRef.MoveTo(ExteriorMarker.GetRef())
    endif
EndFunction

Function DeleteGuards()
    int i = 0
    while i < Guards.Length
        (Guards[i] as CS_AttackCityApproachGatesGuardScript).GoToState("UnSpawn")
        (Guards[i] as CS_AttackCityApproachGatesGuardScript).RegisterForSingleUpdate(0.01)
        while (Guards[i] as CS_AttackCityApproachGatesGuardScript).GetState() != "Clear"
            utility.wait(0.1)
        endwhile
        i += 1
    endwhile
EndFunction

Function ReturnToEnemies()
    if WarRef.GetRef()
        CS_FactionWarMasterScript WarMasterScript = WarRef.GetRef() as CS_FactionWarMasterScript
        WarMasterScript.SetFactionEnemies()
    endif
EndFunction