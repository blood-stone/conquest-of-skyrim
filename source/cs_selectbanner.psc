Scriptname CS_SelectBanner extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)
	(FactionBanner.GetOwningQuest() as CS_ChangeBanners).BannerSelectionMenu(BannerNum, PreviousLoc, PlayerBanners)
EndEvent

FormList Property PlayerBanners  Auto  

ReferenceAlias Property FactionBanner  Auto  

Int Property BannerNum  Auto  

ObjectReference Property PreviousLoc  Auto  

Message Property BannerSelectMenu  Auto  
