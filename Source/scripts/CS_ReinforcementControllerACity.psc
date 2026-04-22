Scriptname CS_ReinforcementControllerACity extends Quest  

CS_AttackCityScript Property AttackCityScript Auto

FormList Property DefenderSpawn Auto
ReferenceAlias[] Property Defenders Auto

ReferenceAlias[] Property Attackers Auto
FormList Property AttackTroops Auto
FormList Property AttackerSpawn Auto

Function RespawnAliases()
    debug.trace("Respawning Aliases...")
    int i = 0
    while i < Defenders.Length
        TryToRespawnDefender(Defenders[i])
        TryToRespawnAttacker(Attackers[i])
        i += 1
    endwhile
    debug.trace("Respawn complete")
EndFunction

Function KillRandomTroopFromList(ReferenceAlias TroopAlias)
    Actor Troop = GetTroopFromList(TroopAlias.GetActorRef())
    if Troop
        debug.trace("Killing " + Troop)
        (Troop as CS_UpgradeTroopOnAttach).FlaggedForDeath = true
        RemoveTroopFromList(Troop)
    endif
EndFunction

Function TryToRespawnDefender(ReferenceAlias TroopAlias)
    if TroopAlias.GetActorRef()
        
        if !TroopAlias.GetActorRef().IsWeaponDrawn()
            
            TroopAlias.GetActorRef().StopCombat()
            
        endif

        if TroopAlias.GetActorRef().IsDead()
            ActorBase TroopBase = TroopAlias.GetActorRef().GetActorBase()
            ObjectReference SpawnPoint = DefenderSpawn.GetAt(utility.randomint(0, DefenderSpawn.GetSize() - 1)) as ObjectReference
            Actor Soldier = SpawnPoint.PlaceAtMe(TroopBase) as Actor
            TroopAlias.ForceRefTo(Soldier)
        endif

    endif
EndFunction

Function TryToRespawnAttacker(ReferenceAlias TroopAlias)
    if TroopAlias.GetActorRef()
        
        if !TroopAlias.GetActorRef().IsWeaponDrawn()
            
            TroopAlias.GetActorRef().StopCombat()
            
        endif

        if TroopAlias.GetActorRef().IsDead() && AttackCityScript.TroopsRemainingAttackers > 0
            
            if AttackCityScript.CS_BattleSpeed.GetValueInt() > 1
                int i = 0
                while i < AttackCityScript.CS_BattleSpeed.GetValueInt() - 1
                    KillRandomTroopFromList(TroopAlias)
                    i += 1
                endwhile
            endif

            If AttackCityScript.citynum < 5
            ;   int index = 0
            ;   bool foundtroop = false
            ;   while index < AttackTroops.GetSize() && foundtroop == false
                    Actor Troop = GetTroopFromList(TroopAlias.GetActorRef())
                ;   ActorBase TroopBase = Troop.GetActorBase()
                ;   if Troop.IsDisabled() == 1 && (TroopBase != AttackCityScript.RestorationMage || AttackCityScript.HealersDeployed < 2) && (TroopBase != AttackCityScript.AlterationMage || AttackCityScript.BuffersDeployed < 1)
                ;       if TroopBase == AttackCityScript.RestorationMage
                ;           AttackCityScript.HealersDeployed += 1
                ;           debug.notification("Spawning Healer, " + AttackCityScript.HealersDeployed + " Healers Deployed")
                ;       elseif TroopBase == AttackCityScript.AlterationMage
                ;           AttackCityScript.HealersDeployed += 1
                ;           debug.notification("Spawning Buffer, " + AttackCityScript.BuffersDeployed + " Buffers Deployed")
                ;       endif
                        Troop.enable()
                        TroopAlias.ForceRefTo(Troop)
                        AttackTroops.RemoveAddedForm(Troop)
                        RemoveTroopFromList(Troop)
                        ObjectReference SpawnPoint = AttackerSpawn.GetAt(utility.randomint(0, AttackerSpawn.GetSize() - 1)) as ObjectReference
                        TroopAlias.GetActorRef().reset()
                        TroopAlias.GetActorRef().MoveTo(SpawnPoint)
                        ;TroopAlias.GetActorRef().AddToFaction(AttackFaction)
                        TroopAlias.GetActorRef().EvaluatePackage()
                ;       foundtroop = true
                ;   endif
                ;   index += 1
            ;   endwhile
            Else
                ObjectReference SpawnPoint
                if AttackCityScript.citynum != 6 && AttackCityScript.citynum != 7
                    SpawnPoint = AttackerSpawn.GetAt(utility.randomint(0, (AttackerSpawn.GetSize() - 1))) as ObjectReference
                else
                    FormList SpawnList
                    int randomspawn
                    if AttackCityScript.DoubleAttack == true
                        int randomlist = utility.randomint(0, 1)
                        SpawnList = AttackerSpawn.GetAt(randomlist) as FormList
                        randomspawn = utility.randomint(0, SpawnList.GetSize() - 1)
                        SpawnPoint = SpawnList.GetAt(randomspawn) as ObjectReference
                    elseif AttackCityScript.AttackEntrance == 1
                        SpawnList = AttackerSpawn.GetAt(0) as FormList
                        randomspawn = utility.randomint(0, SpawnList.GetSize() - 1)
                        SpawnPoint = SpawnList.GetAt(randomspawn) as ObjectReference
                    elseif AttackCityScript.AttackEntrance == 2
                        SpawnList = AttackerSpawn.GetAt(1) as FormList
                        randomspawn = utility.randomint(0, SpawnList.GetSize() - 1)
                        SpawnPoint = SpawnList.GetAt(randomspawn) as ObjectReference
                    endif
                endif
            ;   int index = 0
            ;   bool foundtroop = false
            ;   while index < AttackTroops.GetSize() && foundtroop == false
                    Actor Troop = GetTroopFromList(TroopAlias.GetActorRef())
                    ;if Troop.IsDisabled() == 1
                        Troop.enable()
                        TroopAlias.ForceRefTo(Troop)
                        AttackTroops.RemoveAddedForm(Troop)
                        RemoveTroopFromList(Troop)
                        TroopAlias.GetActorRef().reset()
                        TroopAlias.GetActorRef().MoveTo(SpawnPoint)
                        ;TroopAlias.GetActorRef().AddToFaction(AttackFaction)
                        TroopAlias.GetActorRef().EvaluatePackage()
                    ;   foundtroop = true
                    ;endif
            ;       index += 1
                ;endwhile
            EndIf
           

        endif

    endif
EndFunction

Actor Function GetTroopFromList(Actor Troop)
    Actor NewTroop

    if Troop.IsInFaction(AttackCityScript.CS_ArmyMeleeFaction)
        if AttackCityScript.AttackTroopsMelee.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < AttackCityScript.AttackTroopsMelee.GetSize() && !foundtroop
                if (AttackCityScript.AttackTroopsMelee.GetAt(i) as Actor)
                    if (AttackCityScript.AttackTroopsMelee.GetAt(i) as Actor).IsDisabled() && !(AttackCityScript.AttackTroopsMelee.GetAt(i) as Actor).IsDead()
                        NewTroop = AttackCityScript.AttackTroopsMelee.GetAt(i) as Actor
                        foundtroop = true
                    endif
                endif
                i += 1
            endwhile
        endif

    elseif Troop.IsInFaction(AttackCityScript.CS_ArmyRangedFaction)
        if AttackCityScript.AttackTroopsRanged.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < AttackCityScript.AttackTroopsRanged.GetSize() && !foundtroop
                if (AttackCityScript.AttackTroopsRanged.GetAt(i) as Actor)
                    if (AttackCityScript.AttackTroopsRanged.GetAt(i) as Actor).IsDisabled() && !(AttackCityScript.AttackTroopsRanged.GetAt(i) as Actor).IsDead()
                        NewTroop = AttackCityScript.AttackTroopsRanged.GetAt(i) as Actor
                        foundtroop = true
                    endif
                endif
                i += 1
            endwhile
        endif

    elseif Troop.IsInFaction(AttackCityScript.CS_ArmyHealerFaction)
        if AttackCityScript.AttackTroopsHealers.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < AttackCityScript.AttackTroopsHealers.GetSize() && !foundtroop
                if (AttackCityScript.AttackTroopsHealers.GetAt(i) as Actor)
                    if (AttackCityScript.AttackTroopsHealers.GetAt(i) as Actor).IsDisabled() && !(AttackCityScript.AttackTroopsHealers.GetAt(i) as Actor).IsDead()
                        NewTroop = AttackCityScript.AttackTroopsHealers.GetAt(i) as Actor
                        foundtroop = true
                    endif
                endif
                i += 1
            endwhile
        endif

    elseif Troop.IsInFaction(AttackCityScript.CS_ArmyBufferFaction)
        if AttackCityScript.AttackTroopsBuffers.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < AttackCityScript.AttackTroopsBuffers.GetSize() && !foundtroop
                if (AttackCityScript.AttackTroopsBuffers.GetAt(i) as Actor)
                    if (AttackCityScript.AttackTroopsBuffers.GetAt(i) as Actor).IsDisabled() && !(AttackCityScript.AttackTroopsBuffers.GetAt(i) as Actor).IsDead()
                        NewTroop = AttackCityScript.AttackTroopsBuffers.GetAt(i) as Actor
                        foundtroop = true
                    endif
                endif
                i += 1
            endwhile
        endif

    endif

    if !NewTroop
        int i = 0
        bool foundtroop = false
        while i < AttackTroops.GetSize() && !foundtroop
            if (AttackCityScript.AttackTroops.GetAt(i) as Actor)
                if (AttackTroops.GetAt(i) as Actor).IsDisabled() && !(AttackTroops.GetAt(i) as Actor).IsDead()
                    NewTroop = AttackTroops.GetAt(i) as Actor
                    foundtroop = true
                endif
            endif
            i += 1
        endwhile
    endif

    return NewTroop
EndFunction

Function RemoveTroopFromList(Actor Troop)
    if Troop.IsInFaction(AttackCityScript.CS_ArmyMeleeFaction)
        AttackCityScript.AttackTroopsMelee.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(AttackCityScript.CS_ArmyRangedFaction)
        AttackCityScript.AttackTroopsRanged.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(AttackCityScript.CS_ArmyHealerFaction)
        AttackCityScript.AttackTroopsHealers.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(AttackCityScript.CS_ArmyBufferFaction)
        AttackCityScript.AttackTroopsBuffers.RemoveAddedForm(Troop)
    endif
EndFunction

Event OnUpdate()
    RespawnAliases()
EndEvent