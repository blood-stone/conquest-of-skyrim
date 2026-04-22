Scriptname CS_CourtBountyHunterDelete extends ReferenceAlias  

Event OnDetachedFromCell()
	self.GetActorRef().delete()
	self.clear()
EndEvent
