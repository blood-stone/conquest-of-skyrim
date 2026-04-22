Scriptname CS_FlagChangerMiscScript extends ObjectReference  

ObjectReference Property PlacedFlag Auto

ReferenceAlias Property BannerAlias Auto

Event OnLoad()
	if !PlacedFlag
		PlacedFlag = PlaceAtMe(BannerAlias.GetRef().GetBaseObject(), abForcePersist = true)
	else
		if PlacedFlag.GetBaseObject() != BannerAlias.GetRef().GetBaseObject()
			PlacedFlag.disable()
			PlacedFlag.delete()
			PlacedFlag = PlaceAtMe(BannerAlias.GetRef().GetBaseObject(), abForcePersist = true)
		endif
	endif
EndEvent