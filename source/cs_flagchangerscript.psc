Scriptname CS_FlagChangerScript extends ObjectReference  

ObjectReference Property PlacedFlag Auto

ReferenceAlias Property BannerAlias Auto

Event OnCellAttach()
	if GetLinkedRef().IsEnabled()
		if !PlacedFlag
			PlacedFlag = PlaceAtMe(BannerAlias.GetRef().GetBaseObject(), abForcePersist = true)
		else
			if PlacedFlag.GetBaseObject() != BannerAlias.GetRef().GetBaseObject()
				PlacedFlag.disable()
				PlacedFlag.delete()
				PlacedFlag = PlaceAtMe(BannerAlias.GetRef().GetBaseObject(), abForcePersist = true)
			endif
		endif
	else
		if PlacedFlag
			PlacedFlag.disable()
			PlacedFlag.delete()
		endif
	endif
EndEvent