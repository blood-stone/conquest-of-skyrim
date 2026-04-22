Scriptname CS_ReinforcementControllerDCity extends Quest  

CS_DefendCityScript Property DefendCityScript Auto

ReferenceAlias[] Property Defenders Auto
FormList Property DefenderSpawn Auto
FormList Property DefenseTroops Auto

ReferenceAlias[] Property Attackers Auto
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

Function KillRandomTroopFromList()
    Actor Troop = GetTroopFromList()
    if Troop
        debug.trace("Killing " + Troop)
        (Troop as CS_UpgradeTroopOnAttach).FlaggedForDeath = true
        DefenseTroops.RemoveAddedForm(Troop)
    endif
EndFunction

Function TryToRespawnAttacker(ReferenceAlias TroopAlias)

    if TroopAlias.GetActorRef()
        
        if !TroopAlias.GetActorRef().IsWeaponDrawn()
            
            TroopAlias.GetActorRef().StopCombat()
            
        endif
        
        if TroopAlias.GetActorRef().IsDead()
            ActorBase TroopBase = TroopAlias.GetActorRef().GetActorBase()
            ObjectReference SpawnPoint = AttackerSpawn.GetAt(utility.randomint(0, AttackerSpawn.GetSize() - 1)) as ObjectReference
            Actor Soldier = SpawnPoint.PlaceAtMe(TroopBase) as Actor
            TroopAlias.ForceRefTo(Soldier)
        endif
    endif
EndFunction

Function TryToRespawnDefender(ReferenceAlias TroopAlias)
    if TroopAlias.GetActorRef()
        
        if !TroopAlias.GetActorRef().IsWeaponDrawn()
            
            TroopAlias.GetActorRef().StopCombat()
            
        endif
    
        if TroopAlias.GetActorRef().IsDead() && DefenseTroops.GetSize() > 0
            
            if DefendCityScript.CS_BattleSpeed.GetValueInt() > 1
                int i = 0
                while i < DefendCityScript.CS_BattleSpeed.GetValueInt() - 1
                    KillRandomTroopFromList()
                    i += 1
                endwhile
            endif
    
            int index = 0
            bool foundtroop = false
            while index < DefenseTroops.GetSize() && foundtroop == false
                Actor Troop = DefenseTroops.GetAt(index) as Actor
                if Troop
                    if Troop.IsDisabled() == 1
                        int randomspawn = utility.randomint(0, DefenderSpawn.GetSize() - 1)
                        ObjectReference SpawnPoint = DefenderSpawn.GetAt(randomspawn) as ObjectReference
                        Troop.enable()
                        TroopAlias.ForceRefTo(Troop)
                        DefenseTroops.RemoveAddedForm(Troop)
                        Troop.reset()
                        Troop.MoveTo(SpawnPoint)
                        Troop.EvaluatePackage()
                        foundtroop = true
                    endif
                endif
                index += 1
            endwhile
    
        endif

    endif
EndFunction

Actor Function GetTroopFromList()
    Actor NewTroop

    int i = 0
    bool foundtroop = false
    while i < DefenseTroops.GetSize() && !foundtroop
        if (DefenseTroops.GetAt(i) as Actor).IsDisabled() && !(DefenseTroops.GetAt(i) as Actor).IsDead()
            NewTroop = DefenseTroops.GetAt(i) as Actor
            foundtroop = true
        endif
        i += 1
    endwhile
    
    return NewTroop
EndFunction

Event OnUpdate()
    RespawnAliases()
EndEvent