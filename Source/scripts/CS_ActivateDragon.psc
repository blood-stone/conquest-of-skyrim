Scriptname CS_ActivateDragon extends ReferenceAlias  

Event OnActivate(ObjectReference akActionRef)
	debug.notification("Dragon Activated")
	if self.GetActorRef().IsInFaction((GetOwningQuest() as CS_DragonJoinFactionScript).RidingDragonFaction) == 1
		debug.notification("Player is on mount")
		self.GetActorRef().RemoveFromFaction((GetOwningQuest() as CS_DragonJoinFactionScript).RidingDragonFaction)
		self.GetActorRef().SetAllowFlying(false)
		self.GetActorRef().AllowPCDialogue(true)
		self.clear()
	else
		self.GetActorRef().SetAllowFlying(true)
		self.GetActorRef().AddToFaction((GetOwningQuest() as CS_DragonJoinFactionScript).RidingDragonFaction)
	endif
	(GetOwningQuest() as CS_DragonJoinFactionScript).ReEvaluateDragonPackages()
EndEvent