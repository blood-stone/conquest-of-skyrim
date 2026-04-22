Scriptname CS_UpdateFactionName  extends ReferenceAlias 

String NewArmyName

String NewFactionName

Event OnPlayerLoadGame()
	((GovQuest as Form) as CS_SelectName).UpdateName()
EndEvent

ObjectReference Property ChestObject Auto
Quest Property GovQuest Auto



GlobalVariable Property ChangingName  Auto  

ObjectReference Property FactionNameChestObject  Auto  
