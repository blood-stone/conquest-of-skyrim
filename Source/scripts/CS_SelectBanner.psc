Scriptname CS_SelectBanner extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)
    CS_BannerChange.BannerSelectionMenu(BannerNum, PreviousLoc, PlayerBanners)
EndEvent

FormList Property PlayerBanners  Auto  

Int Property BannerNum  Auto  

ObjectReference Property PreviousLoc  Auto

CS_ChangeBanners Property CS_BannerChange Auto
