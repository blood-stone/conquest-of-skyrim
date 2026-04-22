Scriptname CS_TulliusUlfricHitScript extends ReferenceAlias  

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if GetOwningQuest().GetStage() == 10
		GetActorRef().kill()
	endif
EndEvent

Event OnDying(Actor akKiller)
	GetOwningQuest().SetObjectiveCompleted(10)
	GetOwningQuest().Stop()
EndEvent

Event OnUnload()
	if GetOwningQuest().GetStage() == 11
		GetActorRef().disable()
		GetOwningQuest().Stop()
	endif
EndEvent