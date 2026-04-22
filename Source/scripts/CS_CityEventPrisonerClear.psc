Scriptname CS_CityEventPrisonerClear extends ReferenceAlias  

Event OnCellDetach()
	if self == (GetOwningQuest() as CS_CityEventManagerScript).ArrestGuard
		self.clear()
	elseif self == (GetOwningQuest() as CS_CityEventManagerScript).ArrestPrisoner
		self.GetActorRef().delete()
		self.clear()
	endif
EndEvent

Event OnDetachedFromCell()
	if self == (GetOwningQuest() as CS_CityEventManagerScript).ArrestGuard
		self.clear()
	elseif self == (GetOwningQuest() as CS_CityEventManagerScript).ArrestPrisoner
		self.GetActorRef().delete()
		self.clear()
	endif
EndEvent