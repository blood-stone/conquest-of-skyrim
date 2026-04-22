Scriptname CS_NameStoring extends Quest  

String NewName

Function ChangeName()
	NewName = ((GovQuest as Form) as UILIB_1).ShowTextInput("Enter Name", "");
	If NewName != ""
		ChestObject.SetDisplayName(NewName)
	EndIf
EndFunction

Function UpdateName()
	ChestObject.GetBaseObject().SetName(NewName)
EndFunction

ObjectReference Property ChestObject Auto
Quest Property GovQuest Auto

