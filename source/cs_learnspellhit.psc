Scriptname CS_LearnSpellHit extends ReferenceAlias  

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if akSource as Spell
		debug.notification("Learner hit with " + akSource)
	endif
EndEvent