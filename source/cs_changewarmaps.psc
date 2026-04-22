Scriptname CS_ChangeWarMaps extends Quest  

FormList Property OldMaps  Auto  

FormList Property NewMaps  Auto  

Function ReplaceMaps()
	int i = 0
	while i < OldMaps.GetSize()
		(OldMaps.GetAt(i) as ObjectReference).disable()
		(NewMaps.GetAt(i) as ObjectReference).enable()
		i += 1
	endwhile
EndFunction