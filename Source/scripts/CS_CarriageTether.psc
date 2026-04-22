Scriptname CS_CarriageTether extends ReferenceAlias  

ReferenceAlias Property Horse  Auto  

Event OnCellLoad()
	; Temp for testing
	if TestCartOn.GetValue() == 1
		self.GetReference().enable()
	endif

	if self.GetReference().isEnabled() == 0
		return
	endif

	; move horse to "tether" marker (if they exist)
	if Horse.GetReference() && self.GetReference().GetLinkedRef()
		Horse.GetReference().Moveto(self.GetReference().GetLinkedRef())
		Horse.GetActorRef().SetRestrained(true)
	endif
	self.GetReference().TetherToHorse(Horse.GetReference())
	if StopMotionFlag
		self.GetReference().SetMotionType(self.GetReference().Motion_Keyframed)
	else
		self.GetReference().SetMotionType(self.GetReference().Motion_Dynamic)
	endif
EndEvent

bool Property StopMotionFlag  Auto  
{set to true to put cart into an immobile state}

GlobalVariable property TestCartOn auto
{ if true, enable me}