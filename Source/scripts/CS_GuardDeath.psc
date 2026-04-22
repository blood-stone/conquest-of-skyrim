Scriptname CS_GuardDeath extends Actor
;/
int Property citynum Auto

CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto

bool Property TempGuard Auto

Event OnInIt()
    UpgradeTroop(self)
EndEvent

Event OnCellAttach()
    UpgradeTroop(self)
EndEvent

Event OnAttachedToCell()
    UpgradeTroop(self)
EndEvent

Function UpgradeTroop(Actor Troop)
    debug.trace("Upgrading Guard...")

    Troop.reset(Troop)

    CS_EconomyUpdaterNew.EconomyHoldUpdaters[citynum].NameChanger.ForceRefTo(Troop)
    CS_EconomyUpdaterNew.EconomyHoldUpdaters[citynum].NameChanger.Clear()

    debug.trace("Guard upgraded.")
EndFunction

Event OnCellDetach()
    if TempGuard
        self.disable()
        self.delete()
    elseif self.IsDead() == 1
        self.disable()
    endif
EndEvent/;