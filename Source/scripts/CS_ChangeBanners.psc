Scriptname CS_ChangeBanners extends Quest  

FormList Property PlacedBanners  Auto
FormList Property CS_PlayerBannersMap Auto
FormList Property AllLocations Auto
FormList Property CampMarkers Auto
FormList Property CampColors Auto
FormList Property CampColorMarkers Auto

FormList[] Property CityBannerList Auto

ReferenceAlias Property NewBannerAlias  Auto  

GlobalVariable Property FactionColor Auto

Quest Property CS_TutorialQuests00FirstSteps Auto

bool Property firsttime Auto

CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto
CS_ChooseTroopRacesScript Property CS_ChooseTroopRaces Auto

ObjectReference Property PlayerFactionActivator Auto

Function ReplaceBanners()
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
    RegisterForSingleUpdate(0.1)
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
        ObjectReference NewBanner = PlayerBanners.GetAt(NewBannerNum) as ObjectReference
        Static MapBanner = CS_PlayerBannersMap.GetAt(NewBannerNum) as Static
        NewBannerAlias.ForceRefTo(NewBanner)
        (PlayerFactionActivator as CS_FactionManagementDiplomacy).FactionBanner = NewBanner.GetBaseObject()
        (PlayerFactionActivator as CS_FactionManagementDiplomacy).MapFlag = MapBanner
        BannerNum.SetValue(NewBannerNum)
        ColorSelectionMenu()
        ;ReplaceBanners()
        if firsttime
            if CS_EconomyUpdaterNew.GetState() == "SettingUp"
                debug.notification("Setting up Economy, please wait...")
                int loopnum = 0
                while CS_EconomyUpdaterNew.GetState() == "SettingUp" && loopnum < 20
                    utility.wait(1)
                    loopnum += 1
                endwhile
            endif
            CS_ChooseTroopRaces.StartMenu(true, true)
            firsttime = false
        endif
        Game.GetPlayer().MoveTo(PreviousLoc)
        CS_TutorialQuests00FirstSteps.Start()
    endif
EndFunction

Function ColorSelectionMenu(int Response = 0)
    Response = ColorSelectMenu.show()
    if Response < 9
        (PlayerFactionActivator as CS_FactionManagementDiplomacy).FactionColor = Response
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
        (PlayerFactionActivator as CS_FactionManagementDiplomacy).FactionColor = (Response + 8)
        ReplaceCampColors()
    endif
EndFunction


Message Property BannerSelectMenu Auto
Message Property ColorSelectMenu Auto
Message Property ColorSelectMenu2 Auto

FormList[] Property FortBannerList  Auto  

ObjectReference Property WhiterunTallBanner  Auto  

Quest Property CS_FactionGovernment Auto

GlobalVariable Property BannerNum  Auto  
