Scriptname CS_SelectName extends Quest  

String NewArmyName

String NewFactionName

Function ChangeName()
	ArmyName.ForceRefTo(ChestObject)
	FactionName.ForceRefTo(FactionNameChestObject)
	NewFactionName = ((self as Form) as UILIB_1).ShowTextInput("Enter Faction Name", "");
	If NewFactionName != ""
		FactionNameChestObject.GetBaseObject().SetName(NewFactionName)
	EndIf
	NewArmyName = ((self as Form) as UILIB_1).ShowTextInput("Enter Army Prefix ex. (Stormcloak) soldier or (Imperial) archer: ", "");
	If NewArmyName != ""
		ChestObject.GetBaseObject().SetName(NewArmyName)
	EndIf
EndFunction

Function UpdateName()
	ChestObject.GetBaseObject().SetName(NewArmyName)
	FactionNameChestObject.GetBaseObject().SetName(NewFactionName)
EndFunction

Function UpdateGuardNames()
	int i = 0
	while i < GuardFormLists.Length
		int index = 0
		while index < GuardFormLists[i].GetSize()
			NameChanger.ForceRefTo(GuardFormLists[i].GetAt(index) as Actor)
			NameChanger.Clear()
			index += 1
		endwhile
		i += 1
	endwhile
	debug.notification("Guard Name Change Complete")
EndFunction

ObjectReference Property ChestObject Auto
ObjectReference Property FactionNameChestObject  Auto  

GlobalVariable Property ChangingName  Auto  

FormList[] Property GuardFormLists Auto

ReferenceAlias Property NameChanger Auto
ReferenceAlias Property FactionName Auto
ReferenceAlias Property ArmyName Auto
Quest Property TroopUpgradeQuest  Auto  

GlobalVariable Property CustomOutfitTroopType  Auto  
