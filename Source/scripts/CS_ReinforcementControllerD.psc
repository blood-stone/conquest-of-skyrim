Scriptname CS_ReinforcementControllerD extends Quest  

CS_DefendCampScript Property DefendCampScript Auto
CS_DefendFortScript Property DefendFortScript Auto

ReferenceAlias[] Property DefenderSpawn Auto
ReferenceAlias[] Property Defenders Auto
FormList Property DefenseTroops Auto
FormList Property DefenseTroopsMelee Auto
FormList Property DefenseTroopsRanged Auto
FormList Property DefenseTroopsHealers Auto
FormList Property DefenseTroopsBuffers Auto

ReferenceAlias[] Property AttackerSpawn Auto
ReferenceAlias[] Property Attackers Auto

Faction Property CS_ArmyMeleeFaction Auto
Faction Property CS_ArmyRangedFaction Auto
Faction Property CS_ArmyHealerFaction Auto
Faction Property CS_ArmyBufferFaction Auto


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

Function TryToRespawnAttacker(ReferenceAlias TroopAlias)
    if TroopAlias.GetActorRef()
        
        if !TroopAlias.GetActorRef().IsWeaponDrawn() || !TroopAlias.GetActorRef().GetEquippedWeapon()
            
            TroopAlias.GetActorRef().StopCombat()
            
        endif
        
        if TroopAlias.GetActorRef().IsDead()
            ActorBase TroopBase = TroopAlias.GetActorRef().GetActorBase()
            ObjectReference SpawnPoint = AttackerSpawn[utility.randomint(0, AttackerSpawn.Length - 1)].GetRef()
            Actor Soldier = SpawnPoint.PlaceAtMe(TroopBase) as Actor
            TroopAlias.ForceRefTo(Soldier)
        endif
    endif
EndFunction

Function TryToRespawnDefender(ReferenceAlias TroopAlias)

    if TroopAlias.GetActorRef()
        
        if !TroopAlias.GetActorRef().IsWeaponDrawn() || !TroopAlias.GetActorRef().GetEquippedWeapon()
            
            TroopAlias.GetActorRef().StopCombat()
            
        endif

        if TroopAlias.GetActorRef().IsDead() && ((DefendCampScript && DefendCampScript.TroopsRemainingDefenders > 0) || (DefendFortScript && DefendFortScript.TroopsRemainingDefenders > 0))
            
            if DefendCampScript
            
                Actor DeadTroop = TroopAlias.GetActorRef()
                
                if DefendCampScript.CS_BattleSpeed.GetValueInt() > 1
                    int i = 0
                    while i < DefendCampScript.CS_BattleSpeed.GetValueInt() - 1
                        KillRandomTroopFromList(TroopAlias)
                        i += 1
                    endwhile
                endif

                int index = 0
                bool foundtroop = false
            ;   while index < DefenseTroops.GetSize() && foundtroop == false
                    Actor Troop = GetTroopFromList(TroopAlias.GetActorRef())
            ;       if Troop.IsDisabled() == 1
                        int randomspawn = utility.randomint(0, DefenderSpawn.Length - 1)
                        ObjectReference SpawnPoint = DefenderSpawn[randomspawn].GetRef()
                        Troop.enable()
                        TroopAlias.ForceRefTo(Troop)
                        DefenseTroops.RemoveAddedForm(Troop)
                        RemoveTroopFromList(Troop)
                        Troop.reset()
                        Troop.MoveTo(SpawnPoint)
                        Troop.EvaluatePackage()
                        foundtroop = true
            ;       endif
            ;       index += 1
            ;   endwhile
            
                if !Game.GetPlayer().HasLOS(DeadTroop)
                    DeadTroop.delete()
                endif
                
            endif
                
        endif

    endif
EndFunction

Actor Function GetTroopFromList(Actor Troop)
    Actor NewTroop

    if Troop.IsInFaction(CS_ArmyMeleeFaction)
        if DefenseTroopsMelee.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < DefenseTroopsMelee.GetSize() && !foundtroop
                if (DefenseTroopsMelee.GetAt(i) as Actor)
                    if (DefenseTroopsMelee.GetAt(i) as Actor).IsDisabled() && !(DefenseTroopsMelee.GetAt(i) as Actor).IsDead()
                        NewTroop = DefenseTroopsMelee.GetAt(i) as Actor
                        foundtroop = true
                    endif
                endif
                i += 1
            endwhile
        endif

    elseif Troop.IsInFaction(CS_ArmyRangedFaction)
        if DefenseTroopsRanged.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < DefenseTroopsRanged.GetSize() && !foundtroop
                if (DefenseTroopsRanged.GetAt(i) as Actor)
                    if (DefenseTroopsRanged.GetAt(i) as Actor).IsDisabled() && !(DefenseTroopsRanged.GetAt(i) as Actor).IsDead()
                        NewTroop = DefenseTroopsRanged.GetAt(i) as Actor
                        foundtroop = true
                    endif
                endif
                i += 1
            endwhile
        endif

    elseif Troop.IsInFaction(CS_ArmyHealerFaction)
        if DefenseTroopsHealers.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < DefenseTroopsHealers.GetSize() && !foundtroop
                if (DefenseTroopsHealers.GetAt(i) as Actor)
                    if (DefenseTroopsHealers.GetAt(i) as Actor).IsDisabled() && !(DefenseTroopsHealers.GetAt(i) as Actor).IsDead()
                        NewTroop = DefenseTroopsHealers.GetAt(i) as Actor
                        foundtroop = true
                    endif
                endif
                i += 1
            endwhile
        endif

    elseif Troop.IsInFaction(CS_ArmyBufferFaction)
        if DefenseTroopsBuffers.GetSize() > 0
            int i = 0
            bool foundtroop = false
            while i < DefenseTroopsBuffers.GetSize() && !foundtroop
                if (DefenseTroopsBuffers.GetAt(i) as Actor)
                    if (DefenseTroopsBuffers.GetAt(i) as Actor).IsDisabled() && !(DefenseTroopsBuffers.GetAt(i) as Actor).IsDead()
                        NewTroop = DefenseTroopsBuffers.GetAt(i) as Actor
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
        while i < DefenseTroops.GetSize() && !foundtroop
            if (DefenseTroops.GetAt(i) as Actor)
                if (DefenseTroops.GetAt(i) as Actor).IsDisabled() && !(DefenseTroops.GetAt(i) as Actor).IsDead()
                    NewTroop = DefenseTroops.GetAt(i) as Actor
                    foundtroop = true
                endif
            endif
            i += 1
        endwhile
    endif

    return NewTroop
EndFunction

Function RemoveTroopFromList(Actor Troop)
    if Troop.IsInFaction(CS_ArmyMeleeFaction)
        DefenseTroopsMelee.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(CS_ArmyRangedFaction)
        DefenseTroopsRanged.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(CS_ArmyHealerFaction)
        DefenseTroopsHealers.RemoveAddedForm(Troop)
    elseif Troop.IsInFaction(CS_ArmyBufferFaction)
        DefenseTroopsBuffers.RemoveAddedForm(Troop)
    endif
EndFunction

Event OnUpdate()
    RespawnAliases()
EndEvent