Scriptname CS_AttackCampFortDefenderDeath extends ReferenceAlias

Event OnDying(Actor akKiller)
	(GetOwningQuest() as CS_AttackFortCampTroopDeathDefender).TroopDeathDefender(self)
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if GetOwningQuest().GetStage() < 10
		if akTarget == Game.GetPlayer()
			if aeCombatState == 1 || aeCombatState == 2
				GetOwningQuest().SetStage(10)
			endif
		endif
	endif
EndEvent