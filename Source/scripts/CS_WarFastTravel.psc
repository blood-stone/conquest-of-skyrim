Scriptname CS_WarFastTravel extends ReferenceAlias  

CS_FactionManagementDiplomacy Property CS_FactionPlayer Auto

FormList Property CS_AllLocations Auto

WorldSpace Property Tamriel Auto

Quest Property CS_AttackCityApproachGates Auto

Keyword Property CS_StoryAttackCityApproachGates Auto;/

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if CS_AllLocations.Find(akNewLoc) >= 0
        ObjectReference CityManagementActivator = (GetOwningQuest() as CS_CityManagementScript).CityManagementActivator
        CS_CityManagementOwnership CityOwnership = CityManagementActivator as CS_CityManagementOwnership
        if CityOwnership.CityClosedToPlayer == 1 && (GetActorRef().GetWorldSpace() == CityOwnership.CityWorldSpace || (CityOwnership.CityWorldSpace == Tamriel && akNewLoc == CityOwnership.VanillaCity))
            CS_AttackCityApproachGates.SetStage(100)
            while CS_AttackCityApproachGates.IsRunning()
                utility.wait(0.1)
            endwhile
            CS_StoryAttackCityApproachGates.SendStoryEvent(CityOwnership.VanillaCity, CityManagementActivator)
            ;Teleport Player to outside city walls and start Attack City Quest
            debug.notification("Player has traveled into exiled city!")
            debug.trace("Player has traveled into exiled city!")
            return
        endif
    endif
EndEvent/;