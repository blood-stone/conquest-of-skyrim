Scriptname CS_CityManagementFindBedsScript extends Quest  

ReferenceAlias[] Property Beds Auto

int Function GetNumBeds()
    int numbeds

    int i = 0
    while i < Beds.Length
        if Beds[i].GetRef()
            numbeds += 1
        endif
        i += 1
    endwhile
    
    debug.notification("Checked beds, found " + numbeds)
    
    return numbeds
endFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
    int numbeds = GetNumBeds()
    (akRef1 as CS_CityManagementPopulation).MaxPopulation = numbeds
    Stop()
EndEvent