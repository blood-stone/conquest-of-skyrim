Scriptname CS_BannerFixScript extends Quest  

ReferenceAlias[] Property Banners Auto
ReferenceAlias Property BannerMisc Auto

Function FixBanners()
    if BannerMisc.GetRef()
        debug.trace("Fixing Misc Banner")
        int loopnum = 0
        while !BannerMisc.GetRef().Is3DLoaded() && loopnum < 10
            Utility.Wait(1)
            loopnum += 1
        endwhile
        (BannerMisc.GetRef() as CS_FlagChangerMiscScript).PlaceBanner()
    endif
    
    int i = 0
    while i < Banners.Length
        TryToFixBanner(Banners[i])
        i += 1
    endwhile
    
    debug.trace("Stopping Banner Quest")
    Stop()
EndFunction

Function TryToFixBanner(ReferenceAlias Banner)
    if Banner.GetRef()
        debug.trace("Fixing Banner")
        int loopnum = 0
        while !Banner.GetRef().Is3DLoaded() && loopnum < 10
            Utility.Wait(1)
            loopnum += 1
        endwhile
        (Banner.GetRef() as CS_FlagChangerScript).PlaceBanner()
    endif
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
    debug.trace("Banner Quest Started")
    FixBanners()
EndEvent