Scriptname CS_FortPersonnelScript extends Quest  

FormList Property AllFortLocations Auto
FormList Property AllFortGarrisons Auto

ReferenceAlias[] Property FortMarkers Auto
ReferenceAlias[] Property Troops Auto

LocationAlias Property Fort Auto

Function MovePersonnelToFort()
    int fortnum = AllFortLocations.Find(Fort.GetLocation())
    FormList Garrison = AllFortGarrisons.GetAt(fortnum) as FormList
    int i = 0
    while i < Garrison.GetSize()
        Actor Troop = Garrison.GetAt(i) as Actor
        if Troop.IsDisabled() == 1
            Troop.enable()
        endif
        Troops[i].ForceRefTo(Troop)
        if FortMarkers[i].GetRef() != None
            Troop.MoveTo(FortMarkers[i].GetRef())
        else
            Troop.MoveTo(FortMarkers[0].GetRef())
        endif
        Troop.EvaluatePackage()
        i += 1
    endwhile
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
    MovePersonnelToFort()
EndEvent