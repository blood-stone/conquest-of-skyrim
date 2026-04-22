Scriptname CS_GuardDeath extends Actor

FormList Property AllLocations Auto
FormList Property AllGuardFormLists Auto

Keyword Property GuardNum Auto

bool Property TempGuard Auto

Event OnDying(Actor akKiller)
	int cityfound = 0
	int i = 0
	while i < AllGuardFormLists.GetSize() && cityfound == 0
		if (AllGuardFormLists.GetAt(i) as FormList).Find(self) >= 0
			(AllLocations.GetAt(i) as Location).SetKeywordData(GuardNum, (AllLocations.GetAt(i) as Location).GetKeywordData(GuardNum) - 1)
			cityfound = 1
		endif
		i += 1
	endwhile
EndEvent

Event OnCellDetach()
	if TempGuard
		self.disable()
		self.delete()
	elseif self.IsDead() == 1
		self.disable()
	endif
EndEvent