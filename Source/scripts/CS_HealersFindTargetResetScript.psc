Scriptname CS_HealersFindTargetResetScript extends Quest  

Quest Property CS_HealersFindTarget  Auto  


Event OnUpdate()
	debug.trace("Healing Reset triggered")
	CS_HealersFindTarget.Stop()
	Utility.Wait(3)
	CS_HealersFindTarget.Start()
EndEvent