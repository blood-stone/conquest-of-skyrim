Scriptname CS_ChangeBanners extends Quest  

FormList Property PlacedBanners  Auto  
FormList Property AllLocations Auto
FormList Property CampMarkers Auto
FormList Property CampColors Auto
FormList Property CampColorMarkers Auto

FormList[] Property CityBannerList Auto

ReferenceAlias Property NewBannerAlias  Auto  

GlobalVariable Property FactionColor Auto

Function ReplaceBanners()
    debug.notification("Replacing Banners. This may take awhile...")
    int i = 0
    while i < PlacedBanners.GetSize()
        ObjectReference OldBanner = PlacedBanners.GetAt(i) as ObjectReference
        ObjectReference NewBanner = OldBanner.PlaceAtMe(NewBannerAlias.GetReference().GetBaseObject(), abForcePersist=true)
        PlacedBanners.RemoveAddedForm(OldBanner)
        OldBanner.delete()
        PlacedBanners.AddForm(NewBanner)
        i += 1
    endwhile
EndFunction

Function ReplaceCampColors()
    int i = 0
    while i < CampColors.GetSize()
        if CampMarkers.GetAt(i) as ObjectReference
                CampColorMarkers = CampColors.GetAt(i) as FormList
                int index = 0
                while index < CampColorMarkers.GetSize()
                    if (CampColorMarkers.GetAt(index) as ObjectReference).IsEnabled() == true
                        (CampColorMarkers.GetAt(index) as ObjectReference).disable()
                        (CampColorMarkers.GetAt(FactionColor.GetValueInt()) as ObjectReference).enable()
                    endif
                    index += 1
                endwhile
        endif
        i += 1
    endwhile
EndFunction

Function ReplaceSingleCampBanner(ObjectReference OldBanner)
        ObjectReference NewBanner = OldBanner.PlaceAtMe(NewBannerAlias.GetReference().GetBaseObject(), abForcePersist=true)
        NewBanner.SetScale(1.53)
        OldBanner.delete()
        PlacedBanners.AddForm(NewBanner)
EndFunction

Function ReplaceCityBanners(int citynum)
    int i = 0
    while i < CityBannerList[citynum].GetSize()
        ObjectReference OldBanner = CityBannerList[citynum].GetAt(i) as ObjectReference
        ;ObjectReference NewBanner = OldBanner.PlaceAtMe(NewBannerAlias.GetReference().GetBaseObject(), abForcePersist=true)
        ;if citynum == 0 || (citynum == 2 && OldBanner.IsInInterior() == 1)
            ;NewBanner.MoveTo(OldBanner, afXOffset=3, afZOffset=200)
            ;NewBanner.SetAngle(OldBanner.GetAngleX(), OldBanner.GetAngleY(), OldBanner.GetAngleZ() - 90)
        ;endif
        ;If OldBanner.GetBaseObject() == WhiterunTallBanner.GetBaseObject()
            ;NewBanner.SetAngle(OldBanner.GetAngleX() - 20, OldBanner.GetAngleY(), OldBanner.GetAngleZ())
        ;EndIf
        OldBanner.disable()
        ;PlacedBanners.AddForm(NewBanner)
        i += 1
    endwhile
EndFunction

Function ReplaceFortBanners(int fortnum)
    int i = 0
    while i < FortBannerList[fortnum].GetSize()
        ObjectReference OldBanner = FortBannerList[fortnum].GetAt(i) as ObjectReference
        if OldBanner.IsDisabled() != 1
            ObjectReference NewBanner = OldBanner.PlaceAtMe(NewBannerAlias.GetReference().GetBaseObject(), abForcePersist=true)
            if fortnum == 2
                NewBanner.SetAngle(OldBanner.GetAngleX(), OldBanner.GetAngleY(), OldBanner.GetAngleZ() + 180)
            endif
            OldBanner.disable()
            PlacedBanners.AddForm(NewBanner)
        endif
        i += 1
    endwhile
EndFunction

Function RestoreOldCityBanners(int citynum)
    Location City = AllLocations.GetAt(citynum) as Location
    ;int i = 0
    ;while i < PlacedBanners.GetSize()
        ;ObjectReference PlayerBanner = PlacedBanners.GetAt(i) as ObjectReference
        ;if PlayerBanner.IsInLocation(City) == 1
            ;PlacedBanners.RemoveAddedForm(PlayerBanner)
            ;PlayerBanner.disable()
            ;PlayerBanner.delete()
        ;endif
        ;i += 1
    ;endwhile
    
    int i = 0
    while i < CityBannerList[citynum].GetSize()
        ObjectReference OldBanner = CityBannerList[citynum].GetAt(i) as ObjectReference
        OldBanner.enable()
        i += 1
    endwhile
EndFunction

Function RestoreOldFortBanners(int fortnum)
    Location Fort = AllLocations.GetAt(fortnum) as Location
    ;int i = 0
    ;while i < PlacedBanners.GetSize()
    ;   ObjectReference PlayerBanner = PlacedBanners.GetAt(i) as ObjectReference
    ;   if PlayerBanner.IsInLocation(Fort) == 1
    ;       PlacedBanners.RemoveAddedForm(PlayerBanner)
;           PlayerBanner.disable()
;           PlayerBanner.delete()
    ;   endif
    ;   i += 1
    ;endwhile
    
    int i = 0
    while i < FortBannerList[fortnum].GetSize()
        ObjectReference OldBanner = FortBannerList[fortnum].GetAt(i) as ObjectReference
        OldBanner.enable()
        i += 1
    endwhile
EndFunction

Function BannerSelectionMenu(int NewBannerNum, ObjectReference PreviousLoc, FormList PlayerBanners, int Response = 0)
    Response = BannerSelectMenu.show()
    if Response == 0 
        debug.notification("Banner selected!")
        NewBannerAlias.ForceRefTo(PlayerBanners.GetAt(NewBannerNum) as ObjectReference)
        BannerNum.SetValue(NewBannerNum)
        ColorSelectionMenu()
        ReplaceBanners()
        Game.GetPlayer().MoveTo(PreviousLoc)
        SetObjectiveDisplayed(0)
    endif
EndFunction

Function ColorSelectionMenu(int Response = 0)
    Response = ColorSelectMenu.show()
    if Response < 9
        FactionColor.SetValue(Response)
        ReplaceCampColors()
    elseif Response == 9
        ColorSelectionMenu2()
    endif
EndFunction

Function ColorSelectionMenu2(int Response = 0)
    Response = ColorSelectMenu2.show()
    if Response == 0
        ColorSelectionMenu()
    else
        FactionColor.SetValue(Response + 8)
        ReplaceCampColors()
    endif
EndFunction


Message Property BannerSelectMenu Auto
Message Property ColorSelectMenu Auto
Message Property ColorSelectMenu2 Auto

FormList[] Property FortBannerList  Auto  

ObjectReference Property WhiterunTallBanner  Auto  

GlobalVariable Property BannerNum  Auto  
