Scriptname CS_ReplaceBanner extends ObjectReference  

CS_ChangeBanners Property BannerScript Auto


FormList Property CS_PlayerBannersPlaced Auto

Event OnCellAttach()
	ReplaceSingleCampBanner(self)
EndEvent

Function ReplaceSingleCampBanner(ObjectReference OldBanner)
		ObjectReference NewBanner = OldBanner.PlaceAtMe(BannerScript.NewBannerAlias.GetReference().GetBaseObject(), abForcePersist=true)
		NewBanner.SetScale(1.53)
		OldBanner.delete()
		CS_PlayerBannersPlaced.AddForm(NewBanner)
EndFunction