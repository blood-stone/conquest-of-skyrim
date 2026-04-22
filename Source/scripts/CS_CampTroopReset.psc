Scriptname CS_CampTroopReset extends ObjectReference  

FormList Property CampTroopList Auto

Event OnCellAttach()
    int i = 0
    while i < CampTroopList.GetSize()
        (CampTroopList.GetAt(i) as ObjectReference).reset()
        Utility.Wait(0.1)
        (CampTroopList.GetAt(i) as ObjectReference).reset()
        Utility.Wait(0.1)
        (CampTroopList.GetAt(i) as ObjectReference).reset()
        Utility.Wait(0.1)
        i += 1
    endwhile
EndEvent