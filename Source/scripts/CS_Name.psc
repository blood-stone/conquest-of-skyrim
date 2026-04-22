Scriptname CS_Name extends ObjectReference  

string Property NameString Auto
string Property NamePrefixString Auto

Location Property NameLoc Auto
Location Property NamePrefixLoc Auto

Function SetNewName()
    string newname = ((self as Form) as UILIB_1).ShowTextInput("Enter name: ")
    if newname != ""
        NameString = newname
    endif
    
    string newnameprefix = ((self as Form) as UILIB_1).ShowTextInput("Enter name prefix: ")
    if newnameprefix != ""
        NamePrefixString = newnameprefix
    endif
    
    NameLoc.SetName(NameString)
    NamePrefixLoc.SetName(NamePrefixString)
EndFunction

Function UpdateName()
    NameLoc.SetName(NameString)
    NamePrefixLoc.SetName(NamePrefixString)
EndFunction

Event OnUpdate()
    
    UpdateName()
    
EndEvent