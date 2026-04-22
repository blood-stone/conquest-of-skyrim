Scriptname CS_WarMapResetScript extends Quest  

ReferenceAlias Property WarMap  Auto  
ReferenceAlias Property WarMapHold Auto

FormList Property WarMaps Auto


Function ResetWarMap(int HoldToReset = -1)

	if HoldToReset != -1

		if WarMapHold.GetRef()

			debug.trace("Resetting hold war map")

			if WarMapHold.GetRef().GetBaseObject() == WarMaps.GetAt(HoldToReset) as Activator
				(WarMapHold.GetRef() as CS_CWMapActivatorHoldScript).ResetFlags()
			endif
		endif

	else

		if WarMapHold.GetRef()

			debug.trace("Resetting hold war map")

			(WarMapHold.GetRef() as CS_CWMapActivatorHoldScript).ResetFlags()

		else
		
			debug.trace("Resetting normal war map")

			(WarMap.GetRef() as CS_CivilWarMapActivatorScript).ResetFlags()

		endif

	endif

	Stop()
EndFunction