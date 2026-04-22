Scriptname CS_UpgradeMenuFunctions extends Quest  

CS_UpgradeUpdater1 Property Updater1 Auto
CS_UpgradeUpdater2 Property Updater2 Auto
CS_UpgradeUpdater3 Property Updater3 Auto
CS_UpgradeUpdater4 Property Updater4 Auto

Function MenuStart(int Response=0)
	Response = MenuStart.show()
	If Response < 9
		SetGlobals(Response)
		MenuUpgrade(citynum=Response)
	EndIf
EndFunction

Function MenuStartVillage(int Response=0)
	Response = MenuStartVillage.show()
	If Response < 6
		SetGlobalsVillage(Response + 9)
		MenuUpgradeVillage(villagenum=(Response + 9))
	EndIf
EndFunction

Function SetGlobals(int citynum)
	Location CityLocation = AllLocations.GetAt(citynum) as Location
	UpgradeCity.ForceLocationTo(CityLocation)
	UpdateCurrentInstanceGlobal(Treasury)
	UpdateCurrentInstanceGlobal(Wood)
	ChangeFarms.SetValue(CityLocation.GetKeywordData(FoodChange))
	ChangeLumberMills.SetValue(CityLocation.GetKeywordData(WoodChange))
	ChangeMines.SetValue(CityLocation.GetKeywordData(MetalChange))
	UpdateCurrentInstanceGlobal(ChangeFarms)
	UpdateCurrentInstanceGlobal(ChangeLumberMills)
	UpdateCurrentInstanceGlobal(ChangeMines)
	bool AllGlobalsUpdated = false
	Updater1.Updated = false
	Updater1.citynum = citynum
	Updater2.Updated = false
	Updater2.citynum = citynum
	Updater3.Updated = false
	Updater3.citynum = citynum
	Updater4.Updated = false
	Updater4.citynum = citynum
	RegisterForSingleUpdate(0.1)
	while AllGlobalsUpdated == false
		if Updater1.Updated == true && Updater2.Updated == true && Updater3.Updated == true && Updater4.Updated == true
			AllGlobalsUpdated = true
		endif
	endwhile
EndFunction

Function SetGlobalsVillage(int citynum)
	Location CityLocation = AllLocations.GetAt(citynum) as Location
	UpgradeCity.ForceLocationTo(CityLocation)
	UpdateCurrentInstanceGlobal(Treasury)
	UpdateCurrentInstanceGlobal(Wood)
	ChangeFarms.SetValue(CityLocation.GetKeywordData(FoodChange))
	ChangeLumberMills.SetValue(CityLocation.GetKeywordData(WoodChange))
	ChangeMines.SetValue(CityLocation.GetKeywordData(MetalChange))
	UpdateCurrentInstanceGlobal(ChangeFarms)
	UpdateCurrentInstanceGlobal(ChangeLumberMills)
	UpdateCurrentInstanceGlobal(ChangeMines)
	bool AllGlobalsUpdated = false
	Updater1.Updated = false
	Updater1.citynum = citynum
	Updater2.Updated = false
	Updater2.citynum = citynum
	Updater3.Updated = false
	Updater3.citynum = citynum
	Updater4.Updated = false
	Updater4.citynum = citynum
	RegisterForSingleUpdate(0.1)
	while AllGlobalsUpdated == false
		if Updater1.Updated == true && Updater2.Updated == true && Updater3.Updated == true && Updater4.Updated == true
			AllGlobalsUpdated = true
		endif
	endwhile
EndFunction

Function MenuUpgrade(int Response2=0, int citynum, int steward = 0)
	If (AllowUpgrades.GetAt(citynum) as GlobalVariable).GetValue() == 1
		Response2 = MenuUpgrade.show()
		If Response2 < 4
			MenuUpgradeSpecific(citynum=citynum, specificupgrade=Response2, steward=steward)
		Else
			EconomyUpdater.EconomyMenuCity(citynum, steward=steward)
		EndIf
	Else
		MenuUpgradeInProgress.show()
		EconomyUpdater.EconomyMenuCity(citynum, steward=steward)
	EndIf
endFunction

Function MenuUpgradeSpecific(int Response3=0, int citynum, int specificupgrade, int steward=0)
	if specificupgrade == 0
		Response3 = MenuUpgradeBarracks.show()
	elseif specificupgrade == 1
		Response3 = MenuUpgradeFarms.show()
	elseif specificupgrade == 2
		Response3 = MenuUpgradeMills.show()
	elseif specificupgrade == 3
		Response3 = MenuUpgradeMines.show()
	endif

	If Response3 == 0
		(UpgradeType.GetAt(citynum) as GlobalVariable).SetValue(specificupgrade)
		UpgradeCost.SetValue((UpgradeCosts.GetAt(specificupgrade) as GlobalVariable).GetValue())
		UpgradeCostWood.SetValue((UpgradeCostsWood.GetAt(specificupgrade) as GlobalVariable).GetValue())
		UpgradeTime.SetValue((UpgradeTimes.GetAt(specificupgrade) as GlobalVariable).GetValue())
		If Treasury.GetValue() >= UpgradeCost.GetValue() && Wood.GetValue() >= UpgradeCostWood.GetValue()
			(UpgradeQuests.GetAt(citynum) as Quest).SetStage(1)
			LoyaltyCheck.AdjustLoyalty((AllLocations.GetAt(citynum) as Location), 5, novillage=true)
			MenuUpgrade(citynum = citynum, steward=steward)
		Elseif Treasury.GetValue() < UpgradeCost.GetValue()
			debug.notification("Not enough gold in the Treasury!")
			MenuUpgrade(citynum = citynum, steward=steward)
		Elseif Wood.GetValue() < UpgradeCostWood.GetValue()
			debug.notification("Not enough wood in the Reserves!")
			MenuUpgrade(citynum = citynum, steward=steward)
		EndIf
	Else
		MenuUpgrade(citynum=citynum, steward=steward)
	EndIf
EndFunction

Function MenuUpgradeVillage(int Response2=0, int villagenum, int steward = 0)
	If (AllowUpgrades.GetAt(villagenum) as GlobalVariable).GetValue() == 1
		Response2 = MenuUpgradeVillage.show()
		If Response2 < 3
			MenuUpgradeVillageSpecific(villagenum=villagenum, specificupgrade=Response2, steward=steward)
		Else
			EconomyUpdater.EconomyMenuVillage(villagenum, steward=steward)
		EndIf
	Else
		MenuUpgradeVillageInProgress.show()
		EconomyUpdater.EconomyMenuVillage(villagenum, steward=steward)
	EndIf
endFunction

Function MenuUpgradeVillageSpecific(int Response3=0, int villagenum, int specificupgrade, int steward=0)
	if specificupgrade == 0
		Response3 = MenuUpgradeVillageFarms.show()
	elseif specificupgrade == 1
		Response3 = MenuUpgradeVillageMills.show()
	elseif specificupgrade == 2
		Response3 = MenuUpgradeVillageMines.show()
	endif

	If Response3 == 0
		(UpgradeType.GetAt(villagenum) as GlobalVariable).SetValue(specificupgrade)
		UpgradeCost.SetValue((UpgradeCosts.GetAt(specificupgrade) as GlobalVariable).GetValue())
		UpgradeCostWood.SetValue((UpgradeCostsWood.GetAt(specificupgrade) as GlobalVariable).GetValue())
		UpgradeTime.SetValue((UpgradeTimes.GetAt(specificupgrade) as GlobalVariable).GetValue())
		If Treasury.GetValue() >= UpgradeCost.GetValue() && Wood.GetValue() >= UpgradeCostWood.GetValue()
			(UpgradeQuests.GetAt(villagenum) as Quest).SetStage(1)
			LoyaltyCheck.AdjustLoyalty((AllLocations.GetAt(villagenum) as Location), 5)
			MenuUpgradeVillage(villagenum = villagenum, steward=steward)
		Elseif Treasury.GetValue() < UpgradeCost.GetValue()
			debug.notification("Not enough gold in the Treasury!")
			MenuUpgradeVillage(villagenum = villagenum, steward=steward)
		Elseif Wood.GetValue() < UpgradeCostWood.GetValue()
			debug.notification("Not enough wood in the Reserves!")
			MenuUpgradeVillage(villagenum = villagenum, steward=steward)
		EndIf
	Else
		MenuUpgradeVillage(villagenum=villagenum, steward=steward)
	EndIf
EndFunction

CS_LoyaltyCheckScript Property LoyaltyCheck Auto

Message Property MenuStart  Auto  

FormList Property AllLocations Auto
FormList Property UpgradeLevels Auto
FormList Property UpgradeKeywords Auto
FormList Property UpgradeCosts Auto
FormList Property UpgradeCostsWood Auto

Message Property MenuUpgrade  Auto
Message Property MenuUpgradeBarracks Auto
Message Property MenuUpgradeFarms Auto
Message Property MenuUpgradeMills Auto
Message Property MenuUpgradeMines Auto

LocationAlias Property UpgradeCity  Auto  

GlobalVariable Property UpgradeCost  Auto  
GlobalVariable Property UpgradeTime  Auto  

FormList Property UpgradeType  Auto  

GlobalVariable Property UpgradeCostWood  Auto  

FormList Property UpgradeQuests  Auto  
FormList Property UpgradeTimes  Auto  
FormList Property AllowUpgrades  Auto  

Message Property MenuUpgradeInProgress  Auto  

GlobalVariable Property Treasury  Auto  
GlobalVariable Property WOOD  Auto  

Message Property MenuUpgradeVillage  Auto  
Message Property MenuUpgradeVillageFarms Auto
Message Property MenuUpgradeVillageMills Auto
Message Property MenuUpgradeVillageMines Auto
Message Property MenuUpgradeVillageInProgress  Auto  
Message Property MenuStartVillage  Auto  

FormList Property UpgradeKeywordsVillage  Auto  

GlobalVariable Property ChangeFarms Auto
GlobalVariable Property ChangeLumberMills Auto
GlobalVariable Property ChangeMines Auto

Keyword Property FoodChange Auto
Keyword Property WoodChange Auto
Keyword Property MetalChange Auto

CS_EconomyVariableFunctions Property EconomyUpdater Auto
