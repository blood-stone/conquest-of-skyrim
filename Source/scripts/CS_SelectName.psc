Scriptname CS_SelectName extends Quest  

String NewArmyName

String NewFactionName

CS_XBOXNameScript Property CS_XboxFactionName Auto

Location Property CS_FactionNamePlayer Auto
Location Property CS_FactionArmyNamePlayer Auto

ObjectReference Property FactionActivator Auto

Function ChangeName()
    NewFactionName = ((self as Form) as UILIB_1).ShowTextInput("Enter Faction Name", "");
    If NewFactionName != ""
        CS_FactionNamePlayer.SetName(NewFactionName)
    EndIf
    
    NewArmyName = ((self as Form) as UILIB_1).ShowTextInput("Enter Army Prefix ex. 'Stormcloak' soldier or 'Imperial' archer: ", "");
    If NewArmyName != ""
        CS_FactionArmyNamePlayer.SetName(NewArmyName)
    EndIf
    
    (FactionActivator as CS_FactionManagementDiplomacy).FactionNameString = NewFactionName
    
    ;/
    CS_XboxFactionName.Start()
    CS_XBOXFactionName.CS_XboxKeyboardStart()
        /;
EndFunction

Function UpdateName()
    CS_FactionArmyNamePlayer.SetName(NewArmyName)
    CS_FactionNamePlayer.SetName(NewFactionName)
EndFunction