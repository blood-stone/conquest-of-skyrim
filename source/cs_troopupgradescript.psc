Scriptname CS_TroopUpgradeScript extends Quest  

ReferenceAlias Property Troop Auto
ReferenceAlias Property Title Auto
ReferenceAlias Property TitleNext Auto

ReferenceAlias[] Property Perks Auto

FormList Property TitleRefs Auto
FormList Property TroopTitleRefs Auto
FormList Property Levels Auto

GlobalVariable Property Level Auto
GlobalVariable Property LevelNext Auto
GlobalVariable Property CostGold Auto
GlobalVariable Property CostMetal Auto
GlobalVariable Property Treasury Auto
GlobalVariable Property Metal Auto

ObjectReference Property NoneRef Auto
ObjectReference Property DamagePerk Auto
ObjectReference Property DefensePerk Auto

ObjectReference[] Property UnlocksHeavy Auto
ObjectReference[] Property UnlocksLight Auto

Message Property MenuStartMessage Auto
Message Property UpgradeMessage Auto
Message Property UpgradeNotification Auto

Sound Property CoinSound Auto
Sound Property MetalSound Auto

Quest Property GovQuest Auto

CS_EconomyVariableFunctions Property EconomyScript Auto
CS_TroopManageMenuScript Property ManageTroops Auto


Function UpdateAllGlobals()
	int i = 0
	while i < Levels.GetSize()
		UpdateCurrentInstanceGlobal(Levels.GetAt(i) as GlobalVariable)
		i += 1
	endwhile
EndFunction

Function SetUp(int TroopType)
	Level.SetValue((Levels.GetAt(TroopType) as GlobalVariable).GetValueInt())
	LevelNext.SetValue(Level.GetValue() + 1)
	Troop.ForceRefTo(TroopTitleRefs.GetAt(TroopType) as ObjectReference)
	Title.ForceRefTo(TitleRefs.GetAt(Level.GetValueInt() - 1) as ObjectReference)
	TitleNext.ForceRefTo(TitleRefs.GetAt(LevelNext.GetValueInt() - 1) as ObjectReference)
	CostGold.SetValue(5000 + (Level.GetValueInt() - 1)*10000)
	CostMetal.SetValue(50 + (Level.GetValueInt() - 1)*100)

	UpdateCurrentInstanceGlobal(Level)
	UpdateCurrentInstanceGlobal(LevelNext)
	UpdateCurrentInstanceGlobal(CostGold)
	UpdateCurrentInstanceGlobal(CostMetal)
	UpdateCurrentInstanceGlobal(Treasury)
	UpdateCurrentInstanceGlobal(Metal)

	Perks[2].ForceRefTo(NoneRef)
	Perks[3].ForceRefTo(NoneRef)
	Perks[4].ForceRefTo(NoneRef)

	Perks[0].ForceRefTo(DamagePerk)
	Perks[1].ForceRefTo(DefensePerk)
	if TroopType < 2
		Perks[2].ForceRefTo(UnlocksHeavy[LevelNext.GetValueInt()])
	elseif TroopType >= 2 && TroopType < 4
		Perks[2].ForceRefTo(UnlocksLight[LevelNext.GetValueInt()])
	elseif TroopType == 4
		Perks[2].ForceRefTo(UnlocksHeavy[LevelNext.GetValueInt()])
		Perks[3].ForceRefTo(UnlocksLight[LevelNext.GetValueInt()])
	endif

	if Perks[2].GetRef() == None
		Perks[2].ForceRefTo(NoneRef)
	endif
EndFunction


Function MenuStart(int Response = 0)
	UpdateAllGlobals()
	Response = MenuStartMessage.show()
	if Response < 5
		MenuUpgrade(Response)
	endif
EndFunction

Function MenuUpgrade(int TroopType, int Response = 0)
	SetUp(TroopType)
	Response = UpgradeMessage.show()
	if Response == 0
		UpgradeTroop(TroopType)
	else
		MenuStart()
	endif
EndFunction

Function UpgradeTroop(int TroopType)
	if Treasury.GetValue() >= CostGold.GetValue() && Metal.GetValue() >= CostMetal.GetValue()
		Treasury.Mod(-CostGold.GetValue())
		debug.notification(CostGold.GetValueInt() + " Gold has been removed from the treasury!")
		CoinSound.Play(Game.GetPlayer())
		debug.notification(CostMetal.GetValueInt() + " Metal has been removed from the reserves!")
		Metal.Mod(-CostMetal.GetValue())
		MetalSound.Play(Game.GetPlayer())
		(Levels.GetAt(TroopType) as GlobalVariable).Mod(1)
		ManageTroops.TroopPowerLevels[TroopType] = ManageTroops.TroopPowerLevels[TroopType] + 1
		UpgradeNotification.show()

		if GovQuest.GetStage() == 9
			GovQuest.SetStage(10)
		endif

		MenuStart()
	elseif Treasury.GetValue() < CostGold.GetValue() && Metal.GetValue() < CostMetal.GetValue()
		debug.notification("Not enough gold and metal!")
		MenuUpgrade(TroopType)
	elseif Treasury.GetValue() < CostGold.GetValue()
		debug.notification("Not enough gold!")
		MenuUpgrade(TroopType)
	elseif Metal.GetValue() < CostMetal.GetValue()
		debug.notification("Not enough metal!")
		MenuUpgrade(TroopType)
	endif
EndFunction