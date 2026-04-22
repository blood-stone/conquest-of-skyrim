Scriptname CS_AttackingTroopDeath extends Actor

bool Property DisableActivated Auto

bool Property RegisterForPlayerTeleport Auto

Event OnCellDetach()
    if self.IsDead() == 1
        self.delete()
    endif
    if DisableActivated
        disable()
        DisableActivated = false
    endif
EndEvent

Function MarkForDisable()
    DisableActivated = true
EndFunction

Event OnUpdate()
    if self.IsDead() == 1
        self.delete()
    endif
    
    if RegisterForPlayerTeleport
        Game.GetPlayer().MoveTo(self)
    endif
EndEvent