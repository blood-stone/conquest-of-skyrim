Scriptname CS_FlagChangerSolitudeScript extends ObjectReference  

ObjectReference Property PlacedFlag Auto

ReferenceAlias Property BannerAlias Auto

Event OnCellAttach()
	if GetLinkedRef().IsEnabled()
		if !PlacedFlag
			PlacedFlag = PlaceAtMe(BannerAlias.GetRef().GetBaseObject(), abForcePersist = true)
			PlacedFlag.MoveTo(self, -6, 24, 110)
			PlacedFlag.SetAngle(GetAngleX(), GetAngleY(), GetAngleZ() - 90)
		else
			if PlacedFlag.GetBaseObject() != BannerAlias.GetRef().GetBaseObject()
				PlacedFlag.disable()
				PlacedFlag.delete()
				PlacedFlag = PlaceAtMe(BannerAlias.GetRef().GetBaseObject(), abForcePersist = true)
				PlacedFlag.MoveTo(self, -6, 24, 110)
				PlacedFlag.SetAngle(GetAngleX(), GetAngleY(), GetAngleZ() - 90)
			endif
		endif
	else
		if PlacedFlag
			PlacedFlag.disable()
			PlacedFlag.delete()
		endif
	endif
EndEvent