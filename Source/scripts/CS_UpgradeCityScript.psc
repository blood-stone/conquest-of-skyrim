Scriptname CS_UpgradeCityScript extends Quest  

LocationAlias Property UpgradeCity  Auto  

Function PayForUpgrade()
	CoinSound.Play(Game.GetPlayer())
	WoodSound.Play(Game.GetPlayer())
	Treasury.SetValue(Treasury.GetValue() - UpgradeCost.GetValue())
	Wood.SetValue(Wood.GetValue() - UpgradeCostWood.GetValue())
	debug.notification((UpgradeCost.GetValue() as int) + " Gold deducted from Treasury!")
	debug.notification((UpgradeCostWood.GetValue() as int) + " Wood deducted from Reserves!")
EndFunction

Function UpgradeCity(int citynum)
	Location CityLoc = AllLocations.GetAt(citynum) as Location
	GlobalVariable UpgradeType = UpgradeTypes.GetAt(citynum) as GlobalVariable
	Keyword Level = Keywords.GetAt(UpgradeType.GetValue() as int) as Keyword
	CityLoc.SetKeywordData(Level, CityLoc.GetKeywordData(Level) + 1)
	AddJobs(CityLoc, UpgradeType.GetValue() as int - 1)
	(AllowUpgrades.GetAt(citynum) as GlobalVariable).SetValue(1)
EndFunction

Function UpgradeVillage(int villagenum)
	Location VillageLoc = AllLocations.GetAt(villagenum) as Location
	GlobalVariable UpgradeType = UpgradeTypes.GetAt(villagenum) as GlobalVariable
	Keyword Level = KeywordsVillage.GetAt(UpgradeType.GetValue() as int) as Keyword
	VillageLoc.SetKeywordData(Level, VillageLoc.GetKeywordData(Level) + 1)
	AddJobs(VillageLoc, UpgradeType.GetValue() as int)
	(AllowUpgrades.GetAt(villagenum) as GlobalVariable).SetValue(1)
EndFunction

Function AddJobs(Location Holding, int jobnum)
	if jobnum == 0
		Holding.SetKeywordData(JobsOpenFood, Holding.GetKeywordData(JobsOpenFood) + Holding.GetKeywordData(FoodChange))
	elseif jobnum == 1
		Holding.SetKeywordData(JobsOpenWood, Holding.GetKeywordData(JobsOpenWood) + Holding.GetKeywordData(WoodChange))
	elseif jobnum == 2
		Holding.SetKeywordData(JobsOpenMetal, Holding.GetKeywordData(JobsOpenMetal) + Holding.GetKeywordData(MetalChange))
	endif
EndFunction

FormList Property UpgradeTypes  Auto  
Formlist Property Keywords  Auto  
Formlist Property KeywordsVillage  Auto  
FormList Property AllowUpgrades  Auto  
FormList Property AllLocations  Auto  

GlobalVariable Property UpgradeCost Auto
GlobalVariable Property UpgradeCostWood Auto
GlobalVariable Property Treasury Auto
GlobalVariable Property Wood Auto

Sound Property CoinSound  Auto  
Sound Property WoodSound  Auto  

Keyword Property JobsOpenFood Auto
Keyword Property JobsOpenWood Auto
Keyword Property JobsOpenMetal Auto
Keyword Property FoodChange Auto
Keyword Property WoodChange Auto
Keyword Property MetalChange Auto

CS_EconomyVariableFunctions Property CS_EconomyUpdater Auto
