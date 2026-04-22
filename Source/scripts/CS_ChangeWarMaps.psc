Scriptname CS_ChangeWarMaps extends Quest  

FormList Property OldMaps  Auto  

FormList Property NewMaps  Auto  

Function ReplaceMaps()
    debug.notification("Replacing Maps...")
    int i = 0
    while i < OldMaps.GetSize()
        (OldMaps.GetAt(i) as ObjectReference).disable()
        (NewMaps.GetAt(i) as ObjectReference).enable()
        i += 1
    endwhile
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
    ReplaceMaps()
EndEvent