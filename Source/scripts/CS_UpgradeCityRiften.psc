;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname CS_UpgradeCityRiften Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
UpgradeCity.ForceLocationTo(CityLocation)
int i = 0
while i < UpgradeLevels.GetSize()
	(UpgradeLevels.GetAt(i) as GlobalVariable).SetValue(CityLocation.GetKeywordData(UpgradeKeywords.GetAt(i) as Keyword) + 1)
	(UpgradeCosts.GetAt(i) as GlobalVariable).SetValue((CityLocation.GetKeywordData(UpgradeKeywords.GetAt(i) as Keyword) + 1)*10000)
	(UpgradeCostsWood.GetAt(i) as GlobalVariable).SetValue((CityLocation.GetKeywordData(UpgradeKeywords.GetAt(i) as Keyword) + 1)*100)
	GetOwningQuest().UpdateCurrentInstanceGlobal(UpgradeLevels.GetAt(i) as GlobalVariable)
	GetOwningQuest().UpdateCurrentInstanceGlobal(UpgradeCosts.GetAt(i) as GlobalVariable)
	GetOwningQuest().UpdateCurrentInstanceGlobal(UpgradeCostsWood.GetAt(i) as GlobalVariable)
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



LocationAlias Property UpgradeCity  Auto  

Location Property CityLocation  Auto  

FormList Property UpgradeLevels  Auto  

FormList Property UpgradeCosts  Auto  

FormList Property UpgradeCostsWood  Auto  

FormList Property UpgradeKeywords  Auto  
