Scriptname CS_ResearchMenuScript extends Quest  conditional

Message Property MenuStart Auto
Message Property MenuMage Auto
Message Property MenuDwarven Auto

ReferenceAlias[] Property Descriptors Auto

bool Property Upgrading Auto conditional

ObjectReference Property ResearchMaterial Auto
ObjectReference Property NoneObject Auto

CS_TroopEquipmentUpdaterScript Property EquipmentUpdater Auto

;Fetch Quest Variables --------------------------------------

Quest Property FetchQuest Auto
Quest Property FetchQuestDwarven Auto

ReferenceAlias Property QuestItem Auto
ReferenceAlias Property QuestItemDwarven Auto

; Mage Variables ----------------------------------------------

GlobalVariable Property MageDestructionLevel Auto
FormList Property MageDestructionDescriptors Auto

GlobalVariable Property MageRestorationLevel Auto
FormList Property MageRestorationDescriptors Auto

GlobalVariable Property MageConjurationLevel Auto
FormList Property MageConjurationDescriptors Auto

GlobalVariable Property MageAlterationLevel Auto
FormList Property MageAlterationDescriptors Auto

GlobalVariable Property MagesResearched Auto

FormList Property MageLevelGlobals Auto
FormList Property MageResearchTexts Auto
FormList Property MageOutfitNums Auto

; Dwarven Variables -------------------------------------------

GlobalVariable Property DwarvenSpiderLevel Auto
FormList Property DwarvenSpiderDescriptors Auto

GlobalVariable Property DwarvenSphereLevel Auto
FormList Property DwarvenSphereDescriptors Auto

GlobalVariable Property DwarvenBallistaLevel Auto
FormList Property DwarvenBallistaDescriptors Auto

GlobalVariable Property DwarvenResearched Auto

FormList Property DwarvenLevelGlobals Auto
FormList Property DwarvenResearchTexts Auto

ObjectReference Property DwarvenSchematics Auto

Function UpdateGlobals(string Menu)
	if Menu == "Mage"
		Descriptors[0].ForceRefTo(MageDestructionDescriptors.GetAt(MageDestructionLevel.GetValueint()) as ObjectReference)
		Descriptors[1].ForceRefTo(MageRestorationDescriptors.GetAt(MageRestorationLevel.GetValueint()) as ObjectReference)
		Descriptors[2].ForceRefTo(MageConjurationDescriptors.GetAt(MageConjurationLevel.GetValueint()) as ObjectReference)
		Descriptors[3].ForceRefTo(MageAlterationDescriptors.GetAt(MageAlterationLevel.GetValueint()) as ObjectReference)
		UpdateCurrentInstanceGlobal(MageDestructionLevel)
		UpdateCurrentInstanceGlobal(MageRestorationLevel)
		UpdateCurrentInstanceGlobal(MageConjurationLevel)
		UpdateCurrentInstanceGlobal(MageAlterationLevel)
	elseif Menu == "Dwarven"
		Descriptors[0].ForceRefTo(DwarvenSpiderDescriptors.GetAt(DwarvenSpiderLevel.GetValueint()) as ObjectReference)
		Descriptors[1].ForceRefTo(DwarvenSphereDescriptors.GetAt(DwarvenSphereLevel.GetValueint()) as ObjectReference)
		Descriptors[2].ForceRefTo(DwarvenBallistaDescriptors.GetAt(DwarvenBallistaLevel.GetValueint()) as ObjectReference)
		UpdateCurrentInstanceGlobal(DwarvenSpiderLevel)
		UpdateCurrentInstanceGlobal(DwarvenSphereLevel)
		UpdateCurrentInstanceGlobal(DwarvenBallistaLevel)
	endif
	int i = 0
	while i < Descriptors.Length
		if !Descriptors[i].GetRef()
			Descriptors[i].ForceRefTo(NoneObject)
		endif
		i += 1
	endwhile
EndFunction

Function StartMenu(int Response = 0)
	Response = MenuStart.show()
	if Response == 0
		MageMenu()
	elseif Response == 1
		DwarvenMenu()
	endif	
EndFunction

Function MageMenu(int Response = 0)
	UpdateGlobals("Mage")
	Response = MenuMage.show()
	if Response < 4
		if FetchQuest.IsRunning() || FetchQuestDwarven.IsRunning()
			debug.notification("You are already doing a research quest!")
			MageMenu()
		elseif Upgrading
			debug.notification("Your mage is already in the middle of research!")
			MageMenu()
		else
			FetchQuest.Start()
			QuestItem.ForceRefTo(MageResearchTexts.GetAt(Response) as ObjectReference)
			FetchQuest.SetStage(0)
		endif
	elseif Response == 4
		StartMenu()
	endif
EndFunction

Function DwarvenMenu(int Response = 0)
	UpdateGlobals("Dwarven")
	Response = MenuDwarven.show()
	if Response < 4
		if FetchQuest.IsRunning() || FetchQuestDwarven.IsRunning()
			debug.notification("You are already doing a research quest!")
			DwarvenMenu()
		elseif Upgrading
			debug.notification("Your mage is already in the middle of research!")
			DwarvenMenu()
		else
			FetchQuestDwarven.Start()
			QuestItemDwarven.ForceRefTo(DwarvenResearchTexts.GetAt(Response) as ObjectReference)
			FetchQuestDwarven.SetStage(0)
		endif
	elseif Response == 4
		StartMenu()
	endif
EndFunction

Function RegisterForResearch(ObjectReference RM)
	debug.notification("Court Mage Research has started and will be complete in 12 hours!")
	ResearchMaterial = RM
	RegisterForSingleUpdateGameTime(12)
	Upgrading = true
EndFunction

Function UpgradeTopic()
	if MageResearchTexts.Find(ResearchMaterial) >= 0
		int magenum = MageResearchTexts.Find(ResearchMaterial)
		(MageLevelGlobals.GetAt(magenum) as GlobalVariable).Mod(1)
		MagesResearched.SetValue(1)
		if magenum == 0
			EquipmentUpdater.UpdateList(5)
		elseif magenum == 1
			EquipmentUpdater.UpdateList(6)
		elseif magenum == 2
			EquipmentUpdater.UpdateList(7)
		elseif magenum == 3
			EquipmentUpdater.UpdateList(8)
		endif
	elseif DwarvenResearchTexts.Find(ResearchMaterial) >= 0
		(DwarvenLevelGlobals.GetAt(DwarvenResearchTexts.Find(ResearchMaterial)) as GlobalVariable).Mod(1)
		DwarvenResearched.SetValue(1)
	endif
EndFunction

Event OnUpdateGameTime()
	UpgradeTopic()
	Upgrading = false
	debug.notification("Court Mage Research has completed!")
EndEvent