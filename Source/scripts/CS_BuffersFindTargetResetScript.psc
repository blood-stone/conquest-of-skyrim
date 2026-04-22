Scriptname CS_BuffersFindTargetResetScript extends Quest  

Quest Property CS_BuffersFindTarget  Auto  

Event OnUpdate()
	debug.trace("Buffer Quest Reset Triggered")
	CS_BuffersFindTarget.Stop()
	Utility.Wait(3)
	CS_BuffersFindTarget.Start()
EndEvent