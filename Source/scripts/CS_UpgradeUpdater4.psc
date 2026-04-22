Scriptname CS_UpgradeUpdater4 extends Quest  

bool Property Updated Auto

int Property citynum Auto
int Property keywordnum Auto

Function UpdateGlobalsCity()
	Location CityLocation = CS_AllUpgradeLocations.GetAt(citynum) as Location
	Keyword UpgradeKeyword = CS_UpgradeKeywords.GetAt(keywordnum) as Keyword
	(CS_UpgradeLevels.GetAt(keywordnum) as GlobalVariable).SetValue(CityLocation.GetKeywordData(UpgradeKeyword))
	(CS_UpgradeCostsGold.GetAt(keywordnum) as GlobalVariable).SetValue((CityLocation.GetKeywordData(UpgradeKeyword) + 1)*5000)
	(CS_UpgradeCostsWood.GetAt(keywordnum) as GlobalVariable).SetValue((CityLocation.GetKeywordData(UpgradeKeyword) + 1)*30)
	(CS_UpgradeTimes.GetAt(keywordnum) as GlobalVariable).SetValue((CityLocation.GetKeywordData(UpgradeKeyword) + 1)*12)
	UpdateCurrentInstanceGlobal(CS_UpgradeLevels.GetAt(keywordnum) as GlobalVariable)
	UpdateCurrentInstanceGlobal(CS_UpgradeCostsGold.GetAt(keywordnum) as GlobalVariable)
	UpdateCurrentInstanceGlobal(CS_UpgradeCostsWood.GetAt(keywordnum) as GlobalVariable)
	UpdateCurrentInstanceGlobal(CS_UpgradeTimes.GetAt(keywordnum) as GlobalVariable)
EndFunction

Function UpdateGlobalsVillage()
	Location CityLocation = CS_AllUpgradeLocations.GetAt(citynum) as Location
	Keyword UpgradeKeyword = CS_UpgradeKeywordsVillage.GetAt(keywordnum) as Keyword
	(CS_UpgradeLevels.GetAt(keywordnum) as GlobalVariable).SetValue(CityLocation.GetKeywordData(UpgradeKeyword))
	(CS_UpgradeCostsGold.GetAt(keywordnum) as GlobalVariable).SetValue((CityLocation.GetKeywordData(UpgradeKeyword) + 1)*3000)
	(CS_UpgradeCostsWood.GetAt(keywordnum) as GlobalVariable).SetValue((CityLocation.GetKeywordData(UpgradeKeyword) + 1)*20)
	(CS_UpgradeTimes.GetAt(keywordnum) as GlobalVariable).SetValue((CityLocation.GetKeywordData(UpgradeKeyword) + 1)*12)
	UpdateCurrentInstanceGlobal(CS_UpgradeLevels.GetAt(keywordnum) as GlobalVariable)
	UpdateCurrentInstanceGlobal(CS_UpgradeCostsGold.GetAt(keywordnum) as GlobalVariable)
	UpdateCurrentInstanceGlobal(CS_UpgradeCostsWood.GetAt(keywordnum) as GlobalVariable)
	UpdateCurrentInstanceGlobal(CS_UpgradeTimes.GetAt(keywordnum) as GlobalVariable)
EndFunction

Event OnUpdate()
	if citynum < 9
		UpdateGlobalsCity()
	else
		if keywordnum < 3
			UpdateGlobalsVillage()
		endif
	endif
	Updated = true
EndEvent


FormList Property CS_AllUpgradeLocations Auto
FormList Property CS_UpgradeKeywords Auto
FormList Property CS_UpgradeKeywordsVillage Auto
FormList Property CS_UpgradeLevels Auto
FormList Property CS_UpgradeCostsGold Auto
FormList Property CS_UpgradeCostsWood Auto
FormList Property CS_UpgradeTimes Auto