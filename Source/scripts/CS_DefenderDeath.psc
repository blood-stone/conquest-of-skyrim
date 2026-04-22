Scriptname CS_DefenderDeath extends Actor

Event OnDying(Actor akKiller)
    MarkForDelete()
EndEvent

Event OnLoad()
    If self.IsDead() == 1 || self.IsInFaction(CS_RetreatFaction) == 1
        self.disable()
        self.delete()
    EndIf
EndEvent

Function MarkForDelete()
    RegisterForSingleUpdate(10)
EndFunction

Function MarkForSurrender()
    Surrendering = true
    RegisterForSingleUpdate(0.1)
EndFunction

Function TroopSurrender()
    self.SetGhost()
    self.SetAV("Aggression", 0)
    self.SetAV("Confidence", 0)
    self.SetAV("Assistance", 0)
    self.RemoveFromFaction(EnemyTroopFaction)
    self.RemoveFromFaction(EnemyTroopFactionNPC)
    self.AddToFaction(CS_POWFaction)
    self.StopCombat()
    self.StopCombatAlarm()
    if GetEquippedWeapon()
        self.RemoveItem(GetEquippedWeapon())
    endif
    if GetEquippedWeapon()
        self.RemoveItem(GetEquippedWeapon())
    endif
    if GetEquippedShield()
        self.RemoveItem(GetEquippedShield())
    endif
    if GetEquippedShield()
        self.RemoveItem(GetEquippedShield())
    endif
    self.SetAV("health", 100)
    debug.sendAnimationEvent(self, "IdleSurrender")
    TMScript.PrisonerNumsTroop += 1
    self.EvaluatePackage()
    POWTitle.ForceRefTo(self)
    if GetEquippedWeapon()
        self.RemoveItem(GetEquippedWeapon())
    endif
    if GetEquippedWeapon()
        self.RemoveItem(GetEquippedWeapon())
    endif
    if GetEquippedShield()
        self.RemoveItem(GetEquippedShield())
    endif
    if GetEquippedShield()
        self.RemoveItem(GetEquippedShield())
    endif
EndFunction

Event OnUpdate()
    if self.IsDead() == 1
        self.delete()
    elseif Surrendering == true
        TroopSurrender()
    endif
EndEvent

bool Property Surrendering Auto

CS_TMScript Property TMScript Auto

GlobalVariable Property TroopDeath  Auto  

Quest Property BattleQuest Auto

GlobalVariable Property CS_POWFollowingPlayer Auto

FormList Property CS_POWsFollowingPlayer Auto

Faction Property CS_AttackingVillageFaction  Auto  
Faction Property CS_DefendingVillageFaction  Auto  

ReferenceAlias Property POWTitle Auto

Quest Property DefendingQuest  Auto  

Faction Property EnemyTroopFaction Auto
Faction Property EnemyTroopFactionNPC Auto
Faction Property CS_DefendingMinorCityFaction  Auto  
Faction Property CS_DefendingCityFaction  Auto  
Faction Property CS_RetreatFaction Auto
Faction Property CS_POWFaction Auto
