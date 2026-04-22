Scriptname CS_AttackCityBatteringRamScript extends ObjectReference  

bool Property Activating Auto

Sound Property ImpactSound Auto

Event OnActivate(ObjectReference akActionRef)

		if Activating == false
			Activating = true
			Utility.Wait(1)
			int instanceID = ImpactSound.Play(GetLinkedRef())
			Sound.SetInstanceVolume(instanceID, 2)
			Game.ShakeCamera(GetLinkedRef())
			GetLinkedRef().DamageObject(2500)
		endif


endEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if (akSource == self) && (asEventName == "Reset")
		Activating = false
	endIf
endEvent