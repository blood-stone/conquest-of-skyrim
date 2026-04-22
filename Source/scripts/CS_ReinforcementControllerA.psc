Scriptname CS_ReinforcementControllerA extends Quest  


CS_AttackFortCampScript Property AttackFortCampScript Auto

ReferenceAlias[] Property DefenderSpawn Auto
ReferenceAlias[] Property Defenders Auto
FormList Property DefenderSpawnFort Auto

ReferenceAlias[] Property AttackerSpawn Auto
ReferenceAlias[] Property Attackers Auto
FormList Property AttackTroops Auto
FormList Property AttackerMarkers Auto

bool Property Respawning Auto

Function RespawnAliases()
    if !Respawning
        Respawning = true
        debug.trace("Respawning Aliases...")
        int i = 0
        while i < Defenders.Length
            TryToRespawnDefender(Defenders[i])
            TryToRespawnAttacker(Attackers[i])
            i += 1
        endwhile
        debug.trace("Respawn complete")
        Respawning = false
    endif
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
        
        if !TroopAlias.GetActorRef().IsWeaponDrawn() || !TroopAlias.GetActorRef().GetEquippedWeapon()
            
            TroopAlias.GetActorRef().StopCombat()
            TroopAlias.GetActorRef().DrawWeapon()
            
        endif
        
        if TroopAlias.GetActorRef().IsDead()
            ActorBase TroopBase = TroopAlias.GetActorRef().GetActorBase()
            ObjectReference SpawnPoint
            if AttackFortCampScript.type == "Fort"
                SpawnPoint = DefenderSpawnFort.GetAt(utility.randomint(0, DefenderSpawnFort.GetSize() - 1)) as ObjectReference
            else
                SpawnPoint = DefenderSpawn[utility.randomint(0, DefenderSpawn.Length - 1)].GetRef()
            endif
            Actor Soldier = SpawnPoint.PlaceAtMe(TroopBase) as Actor
            TroopAlias.ForceRefTo(Soldier)
        endif
    endif
EndFunction

Function TryToRespawnAttacker(ReferenceAlias TroopAlias)

    if TroopAlias.GetActorRef()
        
        if !TroopAlias.GetActorRef().IsWeaponDrawn() || !TroopAlias.GetActorRef().GetEquippedWeapon()
            
            TroopAlias.GetActorRef().StopCombat()
            TroopAlias.GetActorRef().DrawWeapon()
            
        endif

        if !TroopAlias.GetActorRef().IsDead() && !TroopAlias.GetActorRef().Is3DLoaded()
           
                    Actor Troop = TroopAlias.GetActorRef()
                    ObjectReference SpawnPoint
                    int randomspawn
                    if AttackFortCampScript.type == "Fort"
                        if TroopAlias.GetActorRef().IsInFaction(AttackFortCampScript.AttackSpawn1Faction)
                            randomspawn = utility.randomint(0, 2)
                            Troop.AddToFaction(AttackFortCampScript.AttackSpawn1Faction)
                            elseif TroopAlias.GetActorRef().IsInFaction(AttackFortCampScript.AttackSpawn2Faction)
                            randomspawn = utility.randomint(3, 5)
                            Troop.AddToFaction(AttackFortCampScript.AttackSpawn2Faction)
                        else
                            int randomnum = utility.randomint(0, 1)
                            if randomnum == 0
                                randomspawn = utility.randomint(0, 2)
                            else
                                randomspawn = utility.randomint(3, 5)
                            endif
                        endif
                        SpawnPoint = AttackerMarkers.GetAt(randomspawn) as ObjectReference
    
                    elseif AttackFortCampScript.type == "Camp"
                        randomspawn = utility.randomint(0, AttackFortCampScript.AttackerMarkers1.Length - 1)
                        SpawnPoint = AttackFortCampScript.AttackerMarkers1[randomspawn].GetRef()
                    endif
                    Troop.enable()
                    Troop.MoveTo(SpawnPoint)
                    Troop.EvaluatePackage()     

        elseif TroopAlias.GetActorRef().IsDead() && AttackFortCampScript.TroopsRemainingAttackers > 0
                   
            Actor DeadTroop = TroopAlias.GetActorRef()       
                    
            if AttackFortCampScript.CS_BattleSpeed.GetValueInt() > 1
                int i = 0
                while i < AttackFortCampScript.CS_BattleSpeed.GetValueInt() - 1
                    KillRandomTroopFromList(TroopAlias)
                    i += 1
                endwhile
            endif
    
            int index = 0
            bool foundtroop = false
            ;while index < AttackTroops.GetSize() && foundtroop == false
                Actor Troop = GetTroopFromList(TroopAlias.GetActorRef())
                ;if Troop.IsDisabled() == 1
    
                    ObjectReference SpawnPoint
                    int randomspawn
                    if AttackFortCampScript.type == "Fort"
                        if TroopAlias.GetActorRef().IsInFaction(AttackFortCampScript.AttackSpawn1Faction)
                            randomspawn = utility.randomint(0, 2)
                            Troop.AddToFaction(AttackFortCampScript.AttackSpawn1Faction)
                        elseif TroopAlias.GetActorRef().IsInFaction(AttackFortCampScript.AttackSpawn2Faction)
                            randomspawn = utility.randomint(3, 5)
                            Troop.AddToFaction(AttackFortCampScript.AttackSpawn2Faction)
                        else
                            int randomnum = utility.randomint(0, 1)
                            if randomnum == 0
                                randomspawn = utility.randomint(0, 2)
                            else
                                randomspawn = utility.randomint(3, 5)
                            endif
                        endif
                        SpawnPoint = AttackerMarkers.GetAt(randomspawn) as ObjectReference

                    elseif AttackFortCampScript.type == "Camp"
                        randomspawn = utility.randomint(0, AttackFortCampScript.AttackerMarkers1.Length - 1)
                        SpawnPoint = AttackFortCampScript.AttackerMarkers1[randomspawn].GetRef()
                    endif
                    Troop.enable()
                    TroopAlias.ForceRefTo(Troop)
                    AttackTroops.RemoveAddedForm(Troop)
                    RemoveTroopFromList(Troop)
                    Troop.reset()
                    Troop.MoveTo(SpawnPoint)
                    Troop.EvaluatePackage()
                    foundtroop = true
                    if !Troop.Is3DLoaded()
                        Troop.reset()
                        Troop.MoveTo(SpawnPoint)
                    endif
                ;endif
                ;index += 1
            ;endwhile
            
            if !Game.GetPlayer().HasLOS(DeadTroop)
                DeadTroop.delete()
            endif

        endif

    endif
EndFunction

Actor Function GetTroopFromList(Actor Troop)
    Actor NewTroop

    if Troop.IsInFaction(AttackFortCampScript.CS_ArmyMeleeFaction)
        if AttackFortCampScript.AttackTroopsMelee.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < AttackFortCampScript.AttackTroopsMelee.GetSize() && !foundtroop
                if (AttackFortCampScript.AttackTroopsMelee.GetAt(i) as Actor) && (AttackFortCampScript.AttackTroopsMelee.GetAt(i) as Actor).IsDisabled() && !(AttackFortCampScript.AttackTroopsMelee.GetAt(i) as Actor).IsDead()
                    NewTroop = AttackFortCampScript.AttackTroopsMelee.GetAt(i) as Actor
                    foundtroop = true
                endif
                i += 1
            endwhile
        endif

    elseif Troop.IsInFaction(AttackFortCampScript.CS_ArmyRangedFaction)
        if AttackFortCampScript.AttackTroopsRanged.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < AttackFortCampScript.AttackTroopsRanged.GetSize() && !foundtroop
                if (AttackFortCampScript.AttackTroopsRanged.GetAt(i) as Actor) && (AttackFortCampScript.AttackTroopsRanged.GetAt(i) as Actor).IsDisabled() && !(AttackFortCampScript.AttackTroopsRanged.GetAt(i) as Actor).IsDead()
                    NewTroop = AttackFortCampScript.AttackTroopsRanged.GetAt(i) as Actor
                    foundtroop = true
                endif
                i += 1
            endwhile
        endif

    elseif Troop.IsInFaction(AttackFortCampScript.CS_ArmyHealerFaction)
        if AttackFortCampScript.AttackTroopsHealers.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < AttackFortCampScript.AttackTroopsHealers.GetSize() && !foundtroop
                if (AttackFortCampScript.AttackTroopsHealers.GetAt(i) as Actor) && (AttackFortCampScript.AttackTroopsHealers.GetAt(i) as Actor).IsDisabled() && !(AttackFortCampScript.AttackTroopsHealers.GetAt(i) as Actor).IsDead()
                    NewTroop = AttackFortCampScript.AttackTroopsHealers.GetAt(i) as Actor
                    foundtroop = true
                endif
                i += 1
            endwhile
        endif

    elseif Troop.IsInFaction(AttackFortCampScript.CS_ArmyBufferFaction)
        if AttackFortCampScript.AttackTroopsBuffers.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < AttackFortCampScript.AttackTroopsBuffers.GetSize() && !foundtroop
                if (AttackFortCampScript.AttackTroopsBuffers.GetAt(i) as Actor) && (AttackFortCampScript.AttackTroopsBuffers.GetAt(i) as Actor).IsDisabled() && !(AttackFortCampScript.AttackTroopsBuffers.GetAt(i) as Actor).IsDead()
                    NewTroop = AttackFortCampScript.AttackTroopsBuffers.GetAt(i) as Actor
                    foundtroop = true
                endif
                i += 1
            endwhile
        endif

    endif

    if !NewTroop
        int i = 0
        bool foundtroop = false
        while i < AttackTroops.GetSize() && !foundtroop
            if (AttackTroops.GetAt(i) as Actor).IsDisabled() && !(AttackTroops.GetAt(i) as Actor).IsDead()
                NewTroop = AttackTroops.GetAt(i) as Actor
                foundtroop = true
            endif
            i += 1
        endwhile
    endif

    return NewTroop
EndFunction

Function RemoveTroopFromList(Actor Troop)
    if Troop.IsInFaction(AttackFortCampScript.CS_ArmyMeleeFaction)
        AttackFortCampScript.AttackTroopsMelee.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(AttackFortCampScript.CS_ArmyRangedFaction)
        AttackFortCampScript.AttackTroopsRanged.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(AttackFortCampScript.CS_ArmyHealerFaction)
        AttackFortCampScript.AttackTroopsHealers.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(AttackFortCampScript.CS_ArmyBufferFaction)
        AttackFortCampScript.AttackTroopsBuffers.RemoveAddedForm(Troop)
    endif
EndFunction

Event OnUpdate()
    RespawnAliases()
EndEvent