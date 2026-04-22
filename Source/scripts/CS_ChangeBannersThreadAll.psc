Scriptname CS_ChangeBannersThreadAll extends Quest  

FormList Property CampColorMarkers Auto

Function ReplaceCampColors()
    int FactionColor = ((self as Quest) as CS_ChangeBanners).FactionColor.GetValueInt()
    
    int index = 0
    while index < CampColorMarkers.GetSize()
        if (CampColorMarkers.GetAt(index) as ObjectReference).IsEnabled() == true
            (CampColorMarkers.GetAt(index) as ObjectReference).disable()
            (CampColorMarkers.GetAt(FactionColor) as ObjectReference).enable()
        endif
        index += 1
    endwhile
EndFunction

Event OnUpdate()
    if CampColorMarkers
        ReplaceCampColors()
    endif
EndEvent